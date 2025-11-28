library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constants_pkg.all;

entity UART_CORE is
  port (
    clock_i : in std_logic;
    reset_i : in std_logic;
    serial_rx_i : in std_logic;
    serial_tx_o : out std_logic;
    rx_data_o : out std_logic_vector(7 downto 0);
    rx_valid_o : out std_logic;
    tx_data_i : in std_logic_vector(7 downto 0);
    tx_valid_i : in std_logic;
    tx_busy_o : out std_logic
  );
end UART_CORE;

architecture behav of UART_CORE is

  signal rx_valid_sig : std_logic;
  signal rx_byte_sig : std_logic_vector(7 downto 0);
  signal tx_data_valid_reg : std_logic;
  signal tx_data_valid_next : std_logic;
  signal tx_byte_reg : std_logic_vector(7 downto 0);
  signal tx_byte_next : std_logic_vector(7 downto 0);
  signal tx_done_sig : std_logic;
  type tx_state_type is (TX_IDLE, TX_WAIT);
  signal tx_state_reg : tx_state_type;
  signal tx_state_next : tx_state_type;
  signal tx_busy_reg : std_logic;
  signal tx_busy_next : std_logic;

begin

  UART_RX_INST : entity work.UART_RX
    port map (
      clock_i => clock_i,
      reset_i => reset_i,
      serial_i => serial_rx_i,
      data_valid_o => rx_valid_sig,
      rx_byte_o => rx_byte_sig
    );

  UART_TX_INST : entity work.UART_TX
    port map (
      clock_i => clock_i,
      reset_i => reset_i,
      tx_data_valid_i => tx_data_valid_reg,
      tx_data_i => tx_byte_reg,
      tx_active_o => open,
      serial_o => serial_tx_o,
      tx_done_o => tx_done_sig
    );

  rx_data_o <= rx_byte_sig;
  rx_valid_o <= rx_valid_sig;

  comb_proc : process(tx_state_reg,
                         tx_valid_i,
                         tx_done_sig,
                         tx_data_i,
                         tx_byte_reg,
                         tx_busy_reg)
  begin
    tx_state_next <= tx_state_reg;
    tx_data_valid_next <= '0';
    tx_byte_next <= tx_byte_reg;
    tx_busy_next <= tx_busy_reg;

    case tx_state_reg is

      when TX_IDLE =>
        tx_busy_next <= '0';
        
        if tx_valid_i = '1' then
          tx_state_next <= TX_WAIT;
          tx_data_valid_next <= '1';
          tx_byte_next <= tx_data_i;
          tx_busy_next <= '1';
        end if;

      when TX_WAIT =>
        tx_busy_next <= '1';

        tx_data_valid_next <= '0';
        if tx_done_sig = '1' then
          tx_state_next <= TX_IDLE;
        else
          tx_state_next <= TX_WAIT;
        end if;

      when others =>
        tx_state_next <= TX_IDLE;
        tx_data_valid_next <= '0';
        tx_byte_next <= (others => '0');
        tx_busy_next <= '1';

    end case;
  end process comb_proc;

  reg_proc : process(clock_i, reset_i)
  begin
    if reset_i = '1' then
      tx_state_reg <= TX_IDLE;
      tx_data_valid_reg <= '0';
      tx_byte_reg <= (others => '0');
      tx_busy_reg <= '0';
    elsif rising_edge(clock_i) then
      tx_state_reg <= tx_state_next;
      tx_data_valid_reg <= tx_data_valid_next;
      tx_byte_reg <= tx_byte_next;
      tx_busy_reg <= tx_busy_next;
    end if;
  end process reg_proc;

  tx_busy_o <= tx_busy_reg;

end behav;