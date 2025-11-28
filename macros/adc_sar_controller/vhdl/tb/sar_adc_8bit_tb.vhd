-------------------------------------------------------------------------------
--  Testbench:  sar_adc_8bit_tb
--  Description:
--     Testbench for the SAR ADC with SPI output, oversampling, and 
--     comparator synchronizer (entity: sar_adc_spi_oversampling).
--
--  Purpose:
--     This simulation verifies the functionality of the digital SAR controller
--     and its oversampling behavior by emulating the analog comparator logic.
--
--  Simulation Features:
--     - 25 MHz system clock
--     - Active-low reset
--     - Single conversion trigger ("start" pulse)
--     - Analog input simulated as an integer (vin_level)
--     - Simple noise model (vin_level drifts slightly over time)
--     - Digital comparator emulation (comp_in)
--
--  Expected Behavior:
--     - DAC bits (dac_bits[7:0]) show the SAR search pattern.
--     - comp_in changes according to the simulated analog level.
--     - After several conversions (based on OSR), the averaged value
--       is shifted out via SPI (spi_miso/spi_sclk).
--     - The signal 'done' pulses high at the end of the sequence.
--
--  Author: Ilir Shala
--  Date  : 2025-11-26
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sar_adc_8bit_tb is
end entity;

architecture sim of sar_adc_8bit_tb is

    ----------------------------------------------------------------
    -- Signal Declarations
    ----------------------------------------------------------------
    signal clk, reset_n, start, comp_in : std_logic := '0';
    signal dac_bits  : std_logic_vector(7 downto 0);
    signal spi_miso, spi_sclk, done : std_logic := '0';
    constant Tclk : time := 40 ns; -- 25 MHz

    -- Simulated analog input signal (as integer value)
    signal vin_level : integer := 140; -- Start value (represents analog voltage)

begin
    ----------------------------------------------------------------
    -- DUT (Device Under Test)
    ----------------------------------------------------------------
    uut: entity work.sar_adc_spi_oversampling
        generic map (
            N_BITS      => 8,  -- Resolution: 8 bits
            WAIT_CYCLES => 2,  -- Comparator settling delay
            OSR         => 4   -- 4x oversampling
        )
        port map (
            clk       => clk,
            reset_n   => reset_n,
            start     => start,
            comp_in   => comp_in,
            dac_bits  => dac_bits,
            spi_miso  => spi_miso,
            spi_sclk  => spi_sclk,
            done      => done
        );

    ----------------------------------------------------------------
    -- Clock Generation (25 MHz)
    ----------------------------------------------------------------
    clk <= not clk after Tclk/2;

    ----------------------------------------------------------------
    -- Stimulus Process
    -- Generates reset, start pulses, and triggers multiple conversions
    ----------------------------------------------------------------
    process
    begin
        -- Assert reset
        reset_n <= '0';
        wait for 200 ns;
        reset_n <= '1';
        wait for 500 ns;

        -- Start first conversion
        start <= '1';
        wait for Tclk;
        start <= '0';

        -- Trigger another conversion later to observe repeated behavior
        wait for 100 us;
        start <= '1';
        wait for Tclk;
        start <= '0';
        wait; -- End of testbench stimulus
    end process;

    ----------------------------------------------------------------
    -- Comparator Model (Emulates Analog Behavior)
    -- Adds small "noise" drift to vin_level and generates comp_in
    ----------------------------------------------------------------
process(clk)
    variable dac_val : integer;
    variable tick_cnt : integer := 0;
begin
    if rising_edge(clk) then
        -- einfacher "Rauschgenerator": alle 100 Takte vin_level etwas ändern
        tick_cnt := tick_cnt + 1;
        if tick_cnt = 100 then
            tick_cnt := 0;
            vin_level <= 140 + (vin_level + 1) mod 20; -- läuft 140..159
        end if;

        dac_val := to_integer(unsigned(dac_bits));
        if vin_level > dac_val then
            comp_in <= '1';
        else
            comp_in <= '0';
        end if;
    end if;
end process;


end architecture;
