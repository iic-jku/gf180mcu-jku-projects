library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.constants_pkg.ALL;

entity sigma_delta_modulator is
  port (
    clock_i : in std_logic;
    reset_i : in std_logic; 
    sample_i : in unsigned(SAMPLE_WIDTH-1 downto 0);
    bit_o : out std_logic
  );
end entity;

architecture behav of sigma_delta_modulator is
  signal stage_1_accumulator_1_reg : unsigned(STAGE_1_WIDTH-1 downto 0);
  signal stage_1_accumulator_1_next : unsigned(STAGE_1_WIDTH-1 downto 0);
  signal stage_1_accumulator_2_reg : unsigned(STAGE_1_WIDTH-1 downto 0);
  signal stage_1_accumulator_2_next : unsigned(STAGE_1_WIDTH-1 downto 0);
  signal stage_1_clock_divider_reg : unsigned(CLOCK_DIVIDER_WIDTH-1 downto 0);
  signal stage_1_clock_divider_next : unsigned(CLOCK_DIVIDER_WIDTH-1 downto 0);
  signal stage_1_output_reg : unsigned(STAGE_2_WIDTH-1 downto 0);
  signal stage_1_output_next : unsigned(STAGE_2_WIDTH-1 downto 0);
  signal stage_2_accumulator_reg : unsigned(STAGE_2_WIDTH-1 downto 0);
  signal stage_2_accumulator_next : unsigned(STAGE_2_WIDTH-1 downto 0);
  signal bit_reg : std_logic;
  signal bit_next : std_logic;

begin

  comb_proc : process(sample_i, stage_1_accumulator_1_reg, stage_1_accumulator_2_reg, stage_2_accumulator_reg, stage_1_clock_divider_reg, stage_1_output_reg, bit_reg)

    variable stage_1_input : unsigned(STAGE_1_WIDTH+1 downto 0);
    variable stage_1_accumulator_shift : unsigned(STAGE_1_WIDTH+1 downto 0);
    variable stage_1_bias : unsigned(STAGE_1_WIDTH+1 downto 0);
    variable stage_1_feedback : unsigned(STAGE_1_WIDTH+1 downto 0);
    variable sum_1 : unsigned(STAGE_1_WIDTH+1 downto 0);
    variable sum_2 : unsigned(STAGE_2_WIDTH downto 0);

  begin
    stage_1_accumulator_1_next <= stage_1_accumulator_1_reg;
    stage_1_accumulator_2_next <= stage_1_accumulator_2_reg;
    stage_2_accumulator_next <= stage_2_accumulator_reg;
    stage_1_clock_divider_next <= stage_1_clock_divider_reg;
    stage_1_output_next <= stage_1_output_reg;
    bit_next <= bit_reg;

    if stage_1_clock_divider_reg = "00" then
      stage_1_input := ("00" & sample_i);
      stage_1_accumulator_shift := ('0' & stage_1_accumulator_1_reg & '0');
      stage_1_bias := to_unsigned(STAGE_1_OFFSET, STAGE_1_WIDTH+2);
      stage_1_feedback := ("00" & stage_1_accumulator_2_reg);
      sum_1 := stage_1_input + stage_1_accumulator_shift + stage_1_bias - stage_1_feedback;
      
      stage_1_output_next <= sum_1(STAGE_1_WIDTH+1 downto STAGE_1_WIDTH);
      stage_1_accumulator_1_next <= sum_1(STAGE_1_WIDTH-1 downto 0);
      stage_1_accumulator_2_next <= stage_1_accumulator_1_reg;
    end if;

    stage_1_clock_divider_next <= stage_1_clock_divider_reg + 1;
    sum_2 := ('0' & stage_2_accumulator_reg) + ('0' & stage_1_output_reg);
    bit_next <= sum_2(STAGE_2_WIDTH);
    stage_2_accumulator_next  <= sum_2(STAGE_2_WIDTH-1 downto 0);
  end process;

  reg_proc : process(clock_i, reset_i)
  begin
    if reset_i = '1' then
      stage_1_accumulator_1_reg <= (others => '0');
      stage_1_accumulator_2_reg <= (others => '0');
      stage_2_accumulator_reg <= (others => '0');
      stage_1_clock_divider_reg <= (others => '0');
      stage_1_output_reg <= (others => '0');
      bit_reg <= '0';
    elsif rising_edge(clock_i) then
      stage_1_accumulator_1_reg <= stage_1_accumulator_1_next;
      stage_1_accumulator_2_reg <= stage_1_accumulator_2_next;
      stage_2_accumulator_reg <= stage_2_accumulator_next;
      stage_1_clock_divider_reg <= stage_1_clock_divider_next;
      stage_1_output_reg <= stage_1_output_next;
      bit_reg <= bit_next;
    end if;
  end process;

  bit_o <= bit_reg;

end architecture;
