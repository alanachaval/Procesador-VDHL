library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity contador_de_programa is
	port (clk, rst: in std_logic; count: buffer std_logic_vector(6 downto 0));

end contador_de_programa;

architecture arc_contador_de_programa of contador_de_programa is 

begin
   
   pcount: process (clk, rst)
   begin
		if (rst = '1') then
			for i in 0 to 6 loop
				count(i) <= '0';
			end loop;
      elsif (clk'event and clk='1') then
         count <= count + 1;               
      end if;   
   end process;
  
end arc_contador_de_programa;