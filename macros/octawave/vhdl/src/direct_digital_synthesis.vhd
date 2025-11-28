library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.constants_pkg.ALL;

entity direct_digital_synthesis is
  port (
    clock_i : in std_logic;
    reset_i : in std_logic; 
    phase_increment_i : in unsigned(PHASE_INCREMENT_WIDTH-1 downto 0);
    phase_sync_strobe_i : in std_logic;
    phase_set_strobe_i  : in std_logic;
    phase_value_i       : in unsigned(PHASE_WIDTH-1 downto 0);    
    sample_o : out unsigned(AMPLITUDE_WIDTH-1 downto 0) 
  );
end entity;

architecture behav of direct_digital_synthesis is
  signal phase : unsigned(PHASE_INCREMENT_WIDTH-1 downto 0);
  signal amplitude : unsigned(AMPLITUDE_WIDTH-1 downto 0);
  
  begin
         
    phase_accumulator_instance: entity work.phase_accumulator
        port map (
            clock_i => clock_i,
            reset_i => reset_i,
            phase_increment_i => phase_increment_i,
            phase_sync_strobe_i  => phase_sync_strobe_i,
            phase_set_strobe_i => phase_set_strobe_i,
            phase_value_i => phase_value_i,
            phase_o => phase
         );
    
    phase_to_amplitude_instance: entity work.phase_to_amplitude
        port map (
            clock_i => clock_i,
            reset_i => reset_i,
            phase_i => phase,
            amplitude_o => sample_o
        );
end architecture;