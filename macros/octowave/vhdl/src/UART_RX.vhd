library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constants_pkg.all;

entity UART_RX is
  port (
    clock_i      : in std_logic;
    reset_i      : in std_logic;
    serial_i     : in std_logic;
    data_valid_o : out std_logic;
    rx_byte_o    : out std_logic_vector(7 downto 0)
  );
end UART_RX;

architecture behav of UART_RX is
  
  signal state_reg : state_type;
  signal state_next : state_type;
  signal bit_clock_counter_reg : integer range 0 to CLKS_PER_BIT;
  signal bit_clock_counter_next : integer range 0 to CLKS_PER_BIT;
  signal bit_index_reg : integer range 0 to 7;
  signal bit_index_next : integer range 0 to 7;
  signal rx_shift_reg : std_logic_vector(7 downto 0);
  signal rx_shift_next : std_logic_vector(7 downto 0);
  signal data_valid_reg : std_logic;
  signal data_valid_next : std_logic;
  signal rx_output_reg : std_logic_vector(7 downto 0);
  signal rx_output_next : std_logic_vector(7 downto 0);
  signal serial_sync1_reg : std_logic;
  signal serial_sync1_next : std_logic;
  signal serial_sync2_reg : std_logic;
  signal serial_sync2_next : std_logic;

begin

  comb_proc : process(state_reg, bit_clock_counter_reg, bit_index_reg, rx_shift_reg, rx_output_reg, serial_sync1_reg, serial_sync2_reg, serial_i)
  begin
    state_next <= state_reg;
    bit_clock_counter_next <= bit_clock_counter_reg;
    bit_index_next <= bit_index_reg;
    rx_shift_next <= rx_shift_reg;
    data_valid_next <= '0';
    rx_output_next <= rx_output_reg;
    serial_sync1_next <= serial_sync1_reg;
    serial_sync2_next <= serial_sync2_reg;

    serial_sync1_next <= serial_i;
    serial_sync2_next <= serial_sync1_reg;

    case state_reg is

      when IDLE =>
        bit_clock_counter_next <= 0;
        bit_index_next <= 0;
        if serial_sync2_reg = '0' then
          bit_clock_counter_next <= (CLKS_PER_BIT-1)/2;
          state_next <= START_BIT;
        else
          state_next <= IDLE;
        end if;

      when START_BIT =>
        if bit_clock_counter_reg = 0 then
           if serial_sync2_reg = '0' then
              bit_clock_counter_next <= CLKS_PER_BIT-1;
              state_next <= DATA_BITS;
           else
              state_next <= IDLE;
           end if;
        else
           bit_clock_counter_next <= bit_clock_counter_reg - 1;
        end if;

      when DATA_BITS =>
        if bit_clock_counter_reg = 0 then
          bit_clock_counter_next <= CLKS_PER_BIT-1;   
          rx_shift_next <= serial_sync2_reg & rx_shift_reg(7 downto 1);
          if bit_index_reg < 7 then
            bit_index_next <= bit_index_reg + 1;
            state_next <= DATA_BITS;
          else
            bit_index_next <= 0;
            state_next <= STOP_BIT;
          end if;
        else
          bit_clock_counter_next <= bit_clock_counter_reg - 1;
        end if;

      when STOP_BIT =>
        if bit_clock_counter_reg = 0 then
          if serial_sync2_reg = '1' then
            data_valid_next <= '1';
            rx_output_next <= rx_shift_reg;
          end if;
          state_next <= IDLE;
        else
          bit_clock_counter_next <= bit_clock_counter_reg - 1;
        end if;

      when others =>
        state_next <= IDLE;
        bit_clock_counter_next <= 0;
        bit_index_next <= 0;
        rx_shift_next <= (others => '0');
        data_valid_next <= '0';
    end case;
  end process comb_proc;

  reg_proc : process(clock_i, reset_i)
  begin
    if reset_i = '1' then
      state_reg <= IDLE;
      bit_clock_counter_reg <= 0;
      bit_index_reg <= 0;
      rx_shift_reg <= (others => '0');
      data_valid_reg <= '0';
      rx_output_reg <= (others => '0');
      serial_sync1_reg <= '1';
      serial_sync2_reg <= '1';
    elsif rising_edge(clock_i) then
      state_reg <= state_next;
      bit_clock_counter_reg <= bit_clock_counter_next;
      bit_index_reg <= bit_index_next;
      rx_shift_reg <= rx_shift_next;
      data_valid_reg <= data_valid_next;
      rx_output_reg <= rx_output_next;
      serial_sync1_reg <= serial_sync1_next;
      serial_sync2_reg <= serial_sync2_next;
    end if;
  end process reg_proc;

  data_valid_o <= data_valid_reg;
  rx_byte_o <= rx_output_reg;

end behav;