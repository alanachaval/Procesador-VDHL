
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;

entity banco_de_registros is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           we : in  STD_LOGIC;
           w_add : in  STD_LOGIC_VECTOR (3 downto 0);
           r_add : in  STD_LOGIC_VECTOR (3 downto 0);
           din : in  STD_LOGIC_VECTOR (7 downto 0);
           dout : out  STD_LOGIC_VECTOR (7 downto 0));
end banco_de_registros;

architecture arc_banco_de_registros of banco_de_registros is

  constant reg_tam : INTEGER := 16;
  type mem is array(reg_tam-1 downto 0) of STD_LOGIC_VECTOR(7 downto 0);
  signal reg: mem;
  
begin 

  process (clk,rst)
  begin
    if rst= '1' then
      for i in 0 to reg_tam-1 loop
        reg(i) <= (others => '0');
      end loop; 
    elsif (clk'event and clk = '1') then
      if (we = '1') then
        reg(conv_integer(unsigned(w_add))) <= din;
      end if;
    end if; 
  end process; 

dout <= reg(conv_integer(unsigned(r_add))); 


end arc_banco_de_registros;