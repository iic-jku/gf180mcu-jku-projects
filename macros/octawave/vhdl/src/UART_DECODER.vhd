library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.constants_pkg.ALL;

entity UART_DECODER is
  port (
    clock_i : in std_logic;
    reset_i : in std_logic;
    rx_data_i : in std_logic_vector(7 downto 0);
    rx_valid_i : in std_logic;
    tx_busy_i : in std_logic;
    phase_increment_o : out phase_inc_array;
    phase_value_o : out phase_val_array;
    phase_sync_strobe_o : out std_logic_vector(7 downto 0);
    phase_set_strobe_o : out std_logic_vector(7 downto 0);
    tx_data_o : out std_logic_vector(7 downto 0);
    tx_valid_o : out std_logic
  );
end UART_DECODER;

architecture behav of UART_DECODER is

  signal rx_data_in_reg : std_logic_vector(7 downto 0);
  signal rx_valid_in_reg : std_logic;

  type rx_state_type is (RX_IDLE, RX_ADDR, RX_INST, RX_D1, RX_D2, RX_D3, RX_D4, RX_STOP);
  signal rx_state_reg : rx_state_type;
  signal rx_state_next : rx_state_type;
  
  signal address_reg : std_logic_vector(7 downto 0);
  signal address_next : std_logic_vector(7 downto 0);
  signal instruction_reg : std_logic_vector(7 downto 0);
  signal instruction_next : std_logic_vector(7 downto 0);
  signal data1_reg : std_logic_vector(7 downto 0);
  signal data1_next : std_logic_vector(7 downto 0);
  signal data2_reg : std_logic_vector(7 downto 0);
  signal data2_next : std_logic_vector(7 downto 0);
  signal data3_reg : std_logic_vector(7 downto 0);
  signal data3_next : std_logic_vector(7 downto 0);
  signal data4_reg : std_logic_vector(7 downto 0);
  signal data4_next : std_logic_vector(7 downto 0);

  signal phase_inc_regs : phase_inc_array;
  signal phase_inc_next : phase_inc_array;
  signal phase_val_regs : phase_val_array;
  signal phase_val_next : phase_val_array;
  
  signal sync_strobe_reg : std_logic_vector(7 downto 0);
  signal sync_strobe_next : std_logic_vector(7 downto 0);
  signal set_strobe_reg : std_logic_vector(7 downto 0);
  signal set_strobe_next : std_logic_vector(7 downto 0);

  type tx_state_type is (TX_IDLE, TX_INST, TX_D1, TX_D2, TX_D3, TX_D4);
  signal tx_state_reg : tx_state_type;
  signal tx_state_next : tx_state_type;
  signal tx_data_reg : std_logic_vector(7 downto 0);
  signal tx_data_next : std_logic_vector(7 downto 0);
  signal tx_valid_reg : std_logic;
  signal tx_valid_next : std_logic;
  signal tx_busy_prev_reg : std_logic;
  signal tx_start_reg : std_logic;
  signal tx_start_next : std_logic;
  
  constant START_BYTE : std_logic_vector(7 downto 0) := X"AA";
  constant STOP_BYTE : std_logic_vector(7 downto 0) := X"55";

begin

  comb_proc : process(rx_state_reg, address_reg, instruction_reg, data1_reg, data2_reg, data3_reg, data4_reg, phase_inc_regs, phase_val_regs, sync_strobe_reg, set_strobe_reg, tx_state_reg, tx_data_reg, tx_valid_reg, tx_busy_prev_reg, tx_start_reg, rx_data_in_reg, rx_valid_in_reg, tx_busy_i)
    variable tx_done : std_logic;
    variable addr_int : integer range 0 to 255;
    variable channel_idx : integer range 0 to 7;
    variable combined_data : unsigned(31 downto 0);
  begin
    rx_state_next <= rx_state_reg;
    address_next <= address_reg;
    instruction_next <= instruction_reg;
    data1_next <= data1_reg;
    data2_next <= data2_reg;
    data3_next <= data3_reg;
    data4_next <= data4_reg;
    
    phase_inc_next <= phase_inc_regs;
    phase_val_next <= phase_val_regs;
    sync_strobe_next <= (others => '0');
    set_strobe_next <= (others => '0');
    
    tx_state_next <= tx_state_reg;
    tx_data_next <= tx_data_reg;
    tx_valid_next <= '0';
    tx_start_next <= tx_start_reg;

    tx_done := '0';
    if (tx_busy_prev_reg = '1') and (tx_busy_i = '0') then
      tx_done := '1';
    end if;

    if rx_valid_in_reg = '1' then
      case rx_state_reg is
        when RX_IDLE =>
          if rx_data_in_reg = START_BYTE then
            rx_state_next <= RX_ADDR;
          end if;
        when RX_ADDR =>
          address_next <= rx_data_in_reg;
          rx_state_next <= RX_INST;
        when RX_INST =>
          instruction_next <= rx_data_in_reg;
          rx_state_next <= RX_D1;
        when RX_D1 =>
          data1_next <= rx_data_in_reg;
          rx_state_next <= RX_D2;
        when RX_D2 =>
          data2_next <= rx_data_in_reg;
          rx_state_next <= RX_D3;
        when RX_D3 =>
          data3_next <= rx_data_in_reg;
          rx_state_next <= RX_D4;
        when RX_D4 =>
          data4_next <= rx_data_in_reg;
          rx_state_next <= RX_STOP;
        when RX_STOP =>
          if rx_data_in_reg = STOP_BYTE then
             
             if address_reg = X"00" and instruction_reg = X"00" then
                tx_start_next <= '1';
             end if;
             
             addr_int := to_integer(unsigned(address_reg));
             
             if (addr_int >= 1) and (addr_int <= 8) then
                channel_idx := addr_int - 1;
                combined_data := unsigned(data1_reg & data2_reg & data3_reg & data4_reg);
                
                case instruction_reg is
                    when X"00" =>
                        phase_inc_next(channel_idx) <= resize(combined_data, PHASE_INCREMENT_WIDTH);
                    when X"01" =>
                        sync_strobe_next(channel_idx) <= '1';
                    when X"02" =>
                        phase_val_next(channel_idx) <= resize(combined_data, PHASE_WIDTH);
                        set_strobe_next(channel_idx) <= '1';
                    when others =>
                        null;
                end case;
             end if;
          end if;
          rx_state_next <= RX_IDLE;
        when others =>
          rx_state_next <= RX_IDLE;
      end case;
    end if;

    case tx_state_reg is
      when TX_IDLE =>
        if (tx_start_reg = '1') and (tx_busy_i = '0') then
          tx_data_next <= address_reg;
          tx_valid_next <= '1';
          tx_state_next <= TX_INST;
          tx_start_next <= '0';
        end if;
      when TX_INST =>
        if tx_done = '1' then
          tx_data_next <= instruction_reg;
          tx_valid_next <= '1';
          tx_state_next <= TX_D1;
        end if;
      when TX_D1 =>
        if tx_done = '1' then
          tx_data_next <= data1_reg;
          tx_valid_next <= '1';
          tx_state_next <= TX_D2;
        end if;
      when TX_D2 =>
        if tx_done = '1' then
          tx_data_next <= data2_reg;
          tx_valid_next <= '1';
          tx_state_next <= TX_D3;
        end if;
      when TX_D3 =>
        if tx_done = '1' then
          tx_data_next <= data3_reg;
          tx_valid_next <= '1';
          tx_state_next <= TX_D4;
        end if;
      when TX_D4 =>
        if tx_done = '1' then
          tx_data_next <= data4_reg;
          tx_valid_next <= '1';
          tx_state_next <= TX_IDLE;
        end if;
      when others =>
        tx_state_next <= TX_IDLE;
    end case;
  end process comb_proc;

  reg_proc : process(clock_i, reset_i)
  begin
    if reset_i = '1' then
      rx_data_in_reg <= (others => '0');
      rx_valid_in_reg <= '0';
      rx_state_reg <= RX_IDLE;
      address_reg <= (others => '0');
      instruction_reg <= (others => '0');
      data1_reg <= (others => '0');
      data2_reg <= (others => '0');
      data3_reg <= (others => '0');
      data4_reg <= (others => '0');
      phase_inc_regs <= (others => (others => '0'));
      phase_val_regs <= (others => (others => '0'));
      sync_strobe_reg <= (others => '0');
      set_strobe_reg <= (others => '0');
      tx_state_reg <= TX_IDLE;
      tx_data_reg <= (others => '0');
      tx_valid_reg <= '0';
      tx_busy_prev_reg <= '0';
      tx_start_reg <= '0'; 
    elsif rising_edge(clock_i) then
      rx_data_in_reg <= rx_data_i;
      rx_valid_in_reg <= rx_valid_i;
      rx_state_reg <= rx_state_next;
      address_reg <= address_next;
      instruction_reg <= instruction_next;
      data1_reg <= data1_next;
      data2_reg <= data2_next;
      data3_reg <= data3_next;
      data4_reg <= data4_next;
      phase_inc_regs <= phase_inc_next;
      phase_val_regs <= phase_val_next;
      sync_strobe_reg <= sync_strobe_next;
      set_strobe_reg <= set_strobe_next;
      tx_state_reg <= tx_state_next;
      tx_data_reg <= tx_data_next;
      tx_valid_reg <= tx_valid_next;
      tx_busy_prev_reg <= tx_busy_i;
      tx_start_reg <= tx_start_next;
    end if;
  end process reg_proc;

  phase_increment_o <= phase_inc_regs;
  phase_value_o <= phase_val_regs;
  phase_sync_strobe_o <= sync_strobe_reg;
  phase_set_strobe_o <= set_strobe_reg;
  tx_data_o <= tx_data_reg;
  tx_valid_o <= tx_valid_reg;

end behav;