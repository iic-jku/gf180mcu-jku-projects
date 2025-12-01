library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.math_real.all;

package constants_pkg is

    ---------------------------------------------------------------------------
    -- GENERAL
    ---------------------------------------------------------------------------
    constant CLOCK : integer := 32_000_000;
    constant CHANNEL_COUNT : integer := 8;
    ---------------------------------------------------------------------------
    -- UART
    ---------------------------------------------------------------------------
    constant CLKS_PER_BIT : integer := 278;       
    type state_type is (IDLE, START_BIT, DATA_BITS, STOP_BIT);
    ---------------------------------------------------------------------------
    -- PHASE ACCUMULATOR
    ---------------------------------------------------------------------------
    constant PHASE_INCREMENT_WIDTH : integer := 32;
    type phase_inc_array is array (0 to CHANNEL_COUNT-1) of unsigned(PHASE_INCREMENT_WIDTH-1 downto 0);
    constant PHASE_WIDTH : integer := PHASE_INCREMENT_WIDTH;
    type phase_val_array is array (0 to CHANNEL_COUNT-1) of unsigned(PHASE_WIDTH-1 downto 0);
    ---------------------------------------------------------------------------
    -- PHASE TO AMPLITUDE
    ---------------------------------------------------------------------------
    type amplitude_shift_array is array (0 to CHANNEL_COUNT-1) of std_logic_vector(1 downto 0);
    constant AMPLITUDE_WIDTH : integer := 10;
    constant ADDRESS_WIDTH : integer := AMPLITUDE_WIDTH + 2;
    constant QUARTER_ADDRESS_WIDTH : integer := AMPLITUDE_WIDTH;
    constant BIAS : unsigned(AMPLITUDE_WIDTH-1 downto 0) := to_unsigned(2**(AMPLITUDE_WIDTH-1), AMPLITUDE_WIDTH);
    ---------------------------------------------------------------------------
    -- LOOK UP TABLE
    ---------------------------------------------------------------------------
    subtype LUT_SAMPLE is unsigned(AMPLITUDE_WIDTH-1 downto 0);
    type LUT is array (0 to (2**QUARTER_ADDRESS_WIDTH)-1) of LUT_SAMPLE;
    ---------------------------------------------------------------------------
    -- SIGMA DELTA MODULATOR
    ---------------------------------------------------------------------------
    constant SAMPLE_WIDTH : integer := AMPLITUDE_WIDTH;
    constant STAGE_1_WIDTH : integer := SAMPLE_WIDTH;
    constant STAGE_1_OFFSET : integer := 2**SAMPLE_WIDTH;
    constant STAGE_2_WIDTH : integer := 2; 
    constant CLOCK_DIVIDER_WIDTH : integer := 2; 
  
end constants_pkg;
