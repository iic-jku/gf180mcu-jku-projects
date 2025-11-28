-------------------------------------------------------------------------------
--  Entity:      sar_adc_spi_oversampling
--  Description: 8-bit SAR ADC controller with SPI output, oversampling, and
--               comparator synchronization. 
--
--  Features:
--   - Successive Approximation Register (SAR) algorithm
--   - 8-bit DAC control output (parallel)
--   - 2-Flip-Flop synchronizer for asynchronous comparator input
--   - Oversampling and averaging (configurable OSR)
--   - SPI-compatible serial output (MISO + SCLK)
--   - Configurable comparator settling delay
--
--  Generics:
--   - N_BITS      : ADC resolution (default 8 bits)
--   - WAIT_CYCLES : Number of clock cycles to wait for comparator settling
--   - OSR         : Oversampling ratio (number of averaged samples)
--
--  Ports:
--   clk       : System clock input
--   reset_n   : Active-low synchronous reset
--   start     : Start signal for a conversion
--   comp_in   : Comparator input (digital, asynchronous)
--   dac_bits  : Output vector controlling the external DAC (R-2R ladder)
--   spi_miso  : Serial data output (MISO)
--   spi_sclk  : SPI clock output generated internally
--   done      : Conversion complete flag
--
--  Operation:
--   - When 'start' is asserted, the SAR FSM begins a conversion sequence.
--   - The DAC bits are tested from MSB to LSB using the comparator feedback.
--   - After all bits are resolved, the result is accumulated.
--   - Once OSR conversions are done, the average value is computed.
--   - The averaged result is then shifted out via SPI.
--
--  Notes:
--   - This module controls only the *digital* part of a SAR ADC.
--   - The DAC and comparator must be implemented externally (analog domain).
--   - Ideal for ASIC or FPGA with limited pin count.
--
--  Author: Ilir Shala
--  Date  : 2025-11-26
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sar_adc_spi_oversampling is
  generic (
    N_BITS      : positive := 8;  -- Auflösung
    WAIT_CYCLES : natural  := 2;  -- Comparator Settling Time
    OSR         : natural  := 4   -- Oversampling Ratio (z. B. 4 oder 8)
  );
  port (
    clk       : in  std_logic;  								-- System clock
    reset_n   : in  std_logic;  								-- Active-low reset
    start     : in  std_logic; 									-- Start signal (one clock pulse)
    comp_in   : in  std_logic;  								-- Comparator input
    dac_bits  : out std_logic_vector(N_BITS-1 downto 0);  		-- DAC bit outputs
    spi_miso  : out std_logic;  								-- Serial data output (MISO)
    spi_sclk  : out std_logic;  								-- SPI clock output
    done      : out std_logic  									-- Conversion done flag
  );
end entity;

architecture rtl of sar_adc_spi_oversampling is

	-- FSM states
	type state_t is (IDLE, SET_BIT, WAIT_CMP, DECIDE, NEXT_BIT, SHIFT_OUT);
	signal st            : state_t := IDLE;
	
	-- Core registers
	signal result_reg    : unsigned(N_BITS-1 downto 0) := (others => '0');
	signal trial_reg     : unsigned(N_BITS-1 downto 0) := (others => '0');
	signal bit_idx       : integer range 0 to N_BITS-1 := N_BITS-1;
	signal wait_cnt      : integer range 0 to WAIT_CYCLES := 0;
	signal shift_idx     : integer range 0 to N_BITS := 0;
	signal sclk_int      : std_logic := '0';

	-- Comparator synchronizer (2 flip-flops)
	signal comp_meta, comp_sync : std_logic := '0';

	-- Oversampling and accumulation
	signal accum : unsigned(N_BITS+3 downto 0) := (others => '0'); -- etwas größer
	signal osr_cnt : integer range 0 to OSR := 0;

begin
  dac_bits <= std_logic_vector(result_reg or trial_reg);
  spi_sclk <= sclk_int;

  ---------------------------------------------------------------------
  -- Comparator Synchronizer
  -- Two flip-flops are used to safely synchronize the asynchronous
  -- comparator output to the system clock domain.
  ---------------------------------------------------------------------
  
  process(clk)
  begin
    if rising_edge(clk) then
      comp_meta <= comp_in;
      comp_sync <= comp_meta;
    end if;
  end process;

  ---------------------------------------------------------------------
  -- Main SAR FSM
  ---------------------------------------------------------------------
  process(clk, reset_n)
  begin
    if reset_n = '0' then
      st         <= IDLE;
      result_reg <= (others => '0');
      trial_reg  <= (others => '0');
      bit_idx    <= N_BITS-1;
      wait_cnt   <= 0;
      shift_idx  <= 0;
      sclk_int   <= '0';
      spi_miso   <= '0';
      done       <= '0';
      accum      <= (others => '0');
      osr_cnt    <= 0;

    elsif rising_edge(clk) then
      done <= '0';

      case st is
	  
	  
	    -------------------------------------------------------------------
        -- IDLE: Wait for start pulse to begin conversion
        -------------------------------------------------------------------
        when IDLE =>
          if start = '1' then
            result_reg <= (others => '0');
            trial_reg  <= (others => '0');
            bit_idx    <= N_BITS-1;
            wait_cnt   <= 0;
            st         <= SET_BIT;
          end if;

        -------------------------------------------------------------------
        -- SET_BIT: Set the trial bit for the current bit position
        -------------------------------------------------------------------
        when SET_BIT =>
          trial_reg(bit_idx) <= '1';
          wait_cnt <= 0;
          st <= WAIT_CMP;

        -------------------------------------------------------------------
        -- WAIT_CMP: Allow comparator and DAC output to settle
        -------------------------------------------------------------------
        when WAIT_CMP =>
          if wait_cnt = WAIT_CYCLES then
            st <= DECIDE;
          else
            wait_cnt <= wait_cnt + 1;
          end if;

        -------------------------------------------------------------------
        -- DECIDE: Read comparator output and store result
        -------------------------------------------------------------------
        when DECIDE =>
          if comp_sync = '1' then
            result_reg(bit_idx) <= '1';
          else
            result_reg(bit_idx) <= '0';
          end if;
          trial_reg(bit_idx) <= '0';
          st <= NEXT_BIT;

        -------------------------------------------------------------------
        -- NEXT_BIT: Move to next bit or perform oversampling accumulation
        -------------------------------------------------------------------
        when NEXT_BIT =>
          if bit_idx = 0 then
            -- Ergebnis akkumulieren (Oversampling)
            accum <= accum + resize(result_reg, accum'length);
            if osr_cnt = OSR-1 then
              -- Mittelwert bilden
              result_reg <= resize(accum / OSR, result_reg'length);
              accum      <= (others => '0');
              osr_cnt    <= 0;
              shift_idx  <= N_BITS-1;
              sclk_int   <= '0';
              st <= SHIFT_OUT;
            else
              osr_cnt <= osr_cnt + 1;
              bit_idx <= N_BITS-1;
              st <= SET_BIT;
            end if;
          else
            bit_idx <= bit_idx - 1;
            st <= SET_BIT;
          end if;

        -------------------------------------------------------------------
        -- SHIFT_OUT: Serially output the averaged result via SPI
        -------------------------------------------------------------------
        when SHIFT_OUT =>
          sclk_int <= not sclk_int;
          if sclk_int = '1' then
            spi_miso <= std_logic(result_reg(shift_idx));
            if shift_idx = 0 then
              st   <= IDLE;
              done <= '1';
            else
              shift_idx <= shift_idx - 1;
            end if;
          end if;
      end case;
    end if;
  end process;
end architecture;

