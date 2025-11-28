library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.constants_pkg.ALL;

entity phase_accumulator is
  port (
    clock_i : in std_logic;
    reset_i : in std_logic; 
    phase_increment_i : in unsigned(PHASE_INCREMENT_WIDTH-1 downto 0);
    phase_sync_strobe_i : in std_logic;
    phase_set_strobe_i  : in std_logic;
    phase_value_i       : in unsigned(PHASE_WIDTH-1 downto 0);       
    phase_o : out unsigned(PHASE_WIDTH-1 downto 0) 
  );
end entity;

architecture behav of phase_accumulator is
    signal phase_increment_reg  : unsigned(PHASE_INCREMENT_WIDTH-1 downto 0);
    signal phase_increment_next : unsigned(PHASE_INCREMENT_WIDTH-1 downto 0);
    signal phase_reg  : unsigned(PHASE_WIDTH-1 downto 0);
    signal phase_next : unsigned(PHASE_WIDTH-1 downto 0);
    
    begin
         comb_proc: process(phase_increment_i, phase_reg, phase_increment_reg, phase_sync_strobe_i, phase_set_strobe_i, phase_value_i)
            variable sum : unsigned(PHASE_WIDTH downto 0);
            
            begin
                phase_increment_next <= phase_increment_reg;
                phase_next <= phase_reg;
                 
                phase_increment_next <= phase_increment_i;  
                              
                if phase_sync_strobe_i = '1' then
                    phase_next <= (others => '0');
                elsif phase_set_strobe_i = '1' then
                    phase_next <= phase_value_i;
                else
                    sum := ('0' & phase_reg) + ('0' & phase_increment_reg);
                    phase_next <= sum(PHASE_WIDTH-1 downto 0);
                end if;
        end process;
        
        reg_proc: process(clock_i, reset_i)
        
            begin 
                if reset_i = '1' then
                    phase_increment_reg  <= (others => '0');
                    phase_reg <= (others => '0');
                elsif rising_edge(clock_i) then
                        phase_increment_reg <= phase_increment_next;
                        phase_reg <= phase_next;
                end if; 
         end process;  
                
         phase_o <= phase_reg;        
end architecture;