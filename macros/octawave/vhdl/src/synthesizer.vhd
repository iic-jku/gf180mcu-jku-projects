library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.constants_pkg.ALL;

entity synthesizer is
    port (
        clock_i : in std_logic;
        reset_i : in std_logic;
        phase_increment_i : in phase_inc_array;
        phase_value_i : in phase_val_array;
        phase_sync_strobe_i : in std_logic_vector(CHANNEL_NUMBER-1 downto 0);
        phase_set_strobe_i : in std_logic_vector(CHANNEL_NUMBER-1 downto 0);
        waves_o : out std_logic_vector(CHANNEL_NUMBER-1 downto 0)
    );
end entity;

architecture behav of synthesizer is
begin
    gen_channels: for i in 0 to CHANNEL_NUMBER-1 generate
        channel_inst: entity work.channel
            port map (
                clock_i => clock_i,
                reset_i => reset_i,
                phase_increment_i => phase_increment_i(i),
                phase_sync_strobe_i => phase_sync_strobe_i(i),
                phase_set_strobe_i => phase_set_strobe_i(i),
                phase_value_i => phase_value_i(i),
                wave_o => waves_o(i)
            );
    end generate gen_channels;
end architecture;