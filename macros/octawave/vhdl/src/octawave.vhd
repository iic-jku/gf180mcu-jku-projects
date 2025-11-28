library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.constants_pkg.ALL;

entity octawave is
  port (
    clock_i 	: in std_logic;
    reset_n_i 	: in std_logic;
    uart_rx 	: in std_logic;
    uart_tx 	: out std_logic;
    channel_o 	: out std_logic_vector(7 downto 0)
  );
end octawave;

architecture behav of octawave is
  signal reset : std_ulogic;
  signal rx_data : std_logic_vector(7 downto 0);
  signal rx_valid : std_logic;
  signal tx_data : std_logic_vector(7 downto 0);
  signal tx_valid : std_logic;
  signal tx_busy : std_logic;
  signal phase_increment : phase_inc_array;
  signal phase_value : phase_val_array;
  signal phase_sync_strobe : std_logic_vector(7 downto 0);
  signal phase_set_strobe : std_logic_vector(7 downto 0);
  signal waves : std_logic_vector(7 downto 0);

begin
  
  -- Inverting Input Logic
  reset <= not reset_n_i;
	
  UART_CORE_INST : entity work.UART_CORE
    port map (
      clock_i => clock_i,
      reset_i => reset,
      serial_rx_i => uart_rx,
      serial_tx_o => uart_tx,
      rx_data_o => rx_data,
      rx_valid_o => rx_valid,
      tx_data_i => tx_data,
      tx_valid_i => tx_valid,
      tx_busy_o => tx_busy
    );

  UART_DECODER_INST : entity work.UART_DECODER
    port map (
      clock_i => clock_i,
      reset_i => reset,
      rx_data_i => rx_data,
      rx_valid_i => rx_valid,
      tx_busy_i => tx_busy,
      phase_increment_o => phase_increment,
      phase_value_o => phase_value,
      phase_sync_strobe_o => phase_sync_strobe,
      phase_set_strobe_o => phase_set_strobe,
      tx_data_o => tx_data,
      tx_valid_o => tx_valid
    );

  synthesizer_inst : entity work.synthesizer
    port map (
      clock_i => clock_i,
      reset_i => reset,
      phase_increment_i => phase_increment,
      phase_value_i => phase_value,
      phase_sync_strobe_i => phase_sync_strobe,
      phase_set_strobe_i => phase_set_strobe,
      waves_o => waves
    );

  channel_o <= waves;

end behav;