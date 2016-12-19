library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity memoria_de_instrucciones is 
		port (addr : in  std_logic_vector (6 downto 0);
			output : out  std_logic_vector (15 downto 0));
end memoria_de_instrucciones; 


architecture arc_memoria_de_instrucciones of memoria_de_instrucciones is
begin
  process (addr)
    begin
      case addr is 
      	when "0000000" => output <= x"0103";
      	when "0000001" => output <= x"0430";
      	when "0000010" => output <= x"1034";
      	when "0000011" => output <= x"1145";
      	when "0000100" => output <= x"1346";
      	when "0000101" => output <= x"1207";
      	when "0000110" => output <= x"034E";
      	when "0000111" => output <= x"0230";
      	when "0001000" => output <= x"0240";
      	when "0001001" => output <= x"0250";
      	when "0001010" => output <= x"0260";
      	when "0001011" => output <= x"0270";
      	when "0001100" => output <= x"0280";
      	when "0001101" => output <= x"02D0";
      	when "0001110" => output <= x"02E0";
      	when others => output <= x"0000";
      end case;
  end process;
end arc_memoria_de_instrucciones;
