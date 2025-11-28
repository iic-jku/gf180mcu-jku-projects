library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.constants_pkg.ALL;
use work.lut_pkg.ALL;

entity phase_to_amplitude is
  port (
    clock_i : in std_logic;
    reset_i : in std_logic; 
    phase_i : in unsigned(PHASE_WIDTH-1 downto 0);
    amplitude_o : out unsigned(AMPLITUDE_WIDTH-1 downto 0) 
  );
end entity;

architecture behav of phase_to_amplitude is
    signal phase_reg       : unsigned(PHASE_WIDTH-1 downto 0);
    signal phase_next      : unsigned(PHASE_WIDTH-1 downto 0);
    signal address_reg     : unsigned(ADDRESS_WIDTH-1 downto 0);
    signal address_next    : unsigned(ADDRESS_WIDTH-1 downto 0);
    signal amplitude_reg   : unsigned(AMPLITUDE_WIDTH-1 downto 0);
    signal amplitude_next  : unsigned(AMPLITUDE_WIDTH-1 downto 0);
begin
    comb_proc: process(phase_reg, address_reg, amplitude_reg, phase_i)    
        variable quadrant             : unsigned(1 downto 0);
        variable lut_address_raw      : unsigned(QUARTER_ADDRESS_WIDTH-1 downto 0);
        variable lut_address_mirrored : unsigned(QUARTER_ADDRESS_WIDTH-1 downto 0);
        variable lut_address          : unsigned(QUARTER_ADDRESS_WIDTH-1 downto 0);
        variable lut_val              : unsigned(AMPLITUDE_WIDTH-1 downto 0);

    begin
        phase_next     <= phase_reg;
        address_next   <= address_reg;
        amplitude_next <= amplitude_reg;  
                
        phase_next   <= phase_i;        
        address_next <= phase_reg(PHASE_WIDTH-1 downto PHASE_WIDTH-ADDRESS_WIDTH);

        quadrant := address_reg(ADDRESS_WIDTH-1 downto ADDRESS_WIDTH-2);
        
        if quadrant(0) = '0' then
            lut_address := address_reg(QUARTER_ADDRESS_WIDTH-1 downto 0);
        else
            lut_address := not address_reg(QUARTER_ADDRESS_WIDTH-1 downto 0);
        end if;
        
        lut_val := SINE_FS(to_integer(lut_address));
        
         if quadrant(1) = '0' then
            amplitude_next <= lut_val;
        else
            amplitude_next <= (not lut_val) + 1;
        end if;
    end process;
        
    reg_proc: process(clock_i, reset_i)
    begin 
        if reset_i = '1' then
            phase_reg      <= (others => '0');
            address_reg    <= (others => '0');
            amplitude_reg  <= (others => '0');
        elsif rising_edge(clock_i) then
            phase_reg      <= phase_next;
            address_reg    <= address_next;
            amplitude_reg  <= amplitude_next;
        end if; 
    end process;  
                
    amplitude_o <= amplitude_reg;   
end architecture;
