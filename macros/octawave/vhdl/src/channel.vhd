library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.constants_pkg.ALL;

entity channel is
  port (
    clock_i : in std_logic;
    reset_i : in std_logic; 
    phase_increment_i : in unsigned(PHASE_INCREMENT_WIDTH-1 downto 0);
    phase_sync_strobe_i : in std_logic;
    phase_set_strobe_i  : in std_logic;
    phase_value_i : in unsigned(PHASE_WIDTH-1 downto 0);   
    wave_o : out std_logic
  );
end entity;

architecture behav of channel is
  signal sample : unsigned(AMPLITUDE_WIDTH-1 downto 0);
  
  begin
    direct_digital_synthesis_instance: entity work.direct_digital_synthesis
        port map (
            clock_i => clock_i,
            reset_i => reset_i,
            phase_increment_i => phase_increment_i,
            phase_sync_strobe_i  => phase_sync_strobe_i,
            phase_set_strobe_i => phase_set_strobe_i,
            phase_value_i => phase_value_i,
            sample_o => sample
         );
         
     sigma_delta_modulator_instance: entity work.sigma_delta_modulator
        port map (
            clock_i => clock_i,
            reset_i => reset_i,
            sample_i => sample,
            bit_o => wave_o
         );

end architecture;