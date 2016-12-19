library ieee;
use ieee.std_logic_1164.ALL;


entity multiplexor_3_a_1_de_8_bits is
   port (a,b,c: in std_logic_vector(7 downto 0);
         sel : in std_logic_vector(1 downto 0);
         y: out std_logic_vector(7 downto 0));              
end multiplexor_3_a_1_de_8_bits;

architecture arc_multiplexor_3_a_1_de_8_bits of multiplexor_3_a_1_de_8_bits is 
begin
   process (sel, a, b, c)
   begin
      case sel is 
      	when "00" => y <= a;
      	when "01" => y <= b;
      	when others => y <= c;
      end case;                
   end process;            
end arc_multiplexor_3_a_1_de_8_bits;  




