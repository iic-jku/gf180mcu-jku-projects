library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constants_pkg.all;

entity UART_TX is
  port (
    clock_i : in std_logic;
    reset_i : in std_logic;
    tx_data_valid_i : in std_logic;
    tx_data_i : in std_logic_vector(7 downto 0);
    tx_active_o : out std_logic;
    serial_o : out std_logic;
    tx_done_o : out std_logic
  );
end UART_TX;

architecture behav of UART_TX is

  signal state_reg : state_type;
  signal state_next : state_type;
  signal bit_clock_counter_reg : integer range 0 to CLKS_PER_BIT;
  signal bit_clock_counter_next : integer range 0 to CLKS_PER_BIT;
  signal bit_index_reg : integer range 0 to 7;
  signal bit_index_next : integer range 0 to 7;
  signal tx_shift_reg : std_logic_vector(7 downto 0);
  signal tx_shift_next : std_logic_vector(7 downto 0);
  signal tx_done_reg : std_logic;
  signal tx_done_next : std_logic;
  signal tx_active_reg : std_logic;
  signal tx_active_next : std_logic;
  signal serial_out_reg : std_logic;
  signal serial_out_next : std_logic;

begin

  comb_proc : process(state_reg, bit_clock_counter_reg, bit_index_reg, tx_shift_reg, tx_data_valid_i, tx_data_i, tx_done_reg, tx_active_reg, serial_out_reg)
  begin
    state_next <= state_reg;
    bit_clock_counter_next <= bit_clock_counter_reg;
    bit_index_next <= bit_index_reg;
    tx_shift_next <= tx_shift_reg;
    tx_done_next <= '0';
    tx_active_next <= tx_active_reg;
    serial_out_next <= serial_out_reg;

    case state_reg is

      when IDLE =>
        tx_active_next <= '0';
        serial_out_next <= '1';
        bit_clock_counter_next <= 0;
        bit_index_next <= 0;
        if tx_data_valid_i = '1' then
          tx_shift_next <= tx_data_i;
          state_next <= START_BIT;
          tx_active_next <= '1';
          bit_clock_counter_next <= CLKS_PER_BIT - 1;
        end if;

      when START_BIT =>
        tx_active_next <= '1';
        serial_out_next <= '0';
        if bit_clock_counter_reg = 0 then
          bit_clock_counter_next <= CLKS_PER_BIT - 1;
          state_next <= DATA_BITS;
        else
          bit_clock_counter_next <= bit_clock_counter_reg - 1;
        end if;

      when DATA_BITS =>
        tx_active_next <= '1';
        serial_out_next <= tx_shift_reg(0);
        if bit_clock_counter_reg = 0 then
          bit_clock_counter_next <= CLKS_PER_BIT - 1;         
          tx_shift_next <= '0' & tx_shift_reg(7 downto 1);
          if bit_index_reg < 7 then
            bit_index_next <= bit_index_reg + 1;
          else
            bit_index_next <= 0;
            state_next <= STOP_BIT;
          end if;
        else
          bit_clock_counter_next <= bit_clock_counter_reg - 1;
        end if;

      when STOP_BIT =>
        tx_active_next <= '1';
        serial_out_next <= '1';
        if bit_clock_counter_reg = 0 then
          tx_done_next <= '1';
          tx_active_next <= '0';
          state_next <= IDLE;
        else
          bit_clock_counter_next <= bit_clock_counter_reg - 1;
        end if;

      when others =>
        state_next <= IDLE;
        bit_clock_counter_next <= 0;
        bit_index_next <= 0;
        tx_shift_next <= (others => '0');
        tx_done_next <= '0';
        tx_active_next <= '0';
        serial_out_next <= '1';
    end case;
  end process comb_proc;

  reg_proc : process(clock_i, reset_i)
  begin
    if reset_i = '1' then
      state_reg <= IDLE;
      bit_clock_counter_reg <= 0;
      bit_index_reg <= 0;
      tx_shift_reg <= (others => '0');
      tx_done_reg <= '0';
      tx_active_reg <= '0';
      serial_out_reg <= '1';
    elsif rising_edge(clock_i) then
      state_reg <= state_next;
      bit_clock_counter_reg <= bit_clock_counter_next;
      bit_index_reg <= bit_index_next;
      tx_shift_reg <= tx_shift_next;
      tx_done_reg <= tx_done_next;
      tx_active_reg <= tx_active_next;
      serial_out_reg <= serial_out_next;
    end if;
  end process reg_proc;

  tx_active_o <= tx_active_reg;
  serial_o <= serial_out_reg;
  tx_done_o <= tx_done_reg;

end behav;