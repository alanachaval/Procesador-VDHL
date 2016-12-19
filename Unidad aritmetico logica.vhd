library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_arith.all;

entity unidad_aritmetico_logica is
	Port(op : in std_logic_vector (2 downto 0);
		a, b : in std_logic_vector (7 downto 0);
		s : out std_logic_vector (7 downto 0));
end unidad_aritmetico_logica;

architecture arc_unidad_aritmetico_logica of unidad_aritmetico_logica is

begin

	process(a, b, op)
	begin
		case op is
			when "001" => s(7 downto 1) <= a (6 downto 0); s(0) <= '0';
			when "010" => s(7 downto 0) <= signed(a) + signed(b);
			when "011" => s(7 downto 0) <= signed(a) - signed(b);
			when "100" => s <= a and b;
			when "101" => s <= a or b;
			when "110" => s <= a xor b;
			when "111" => s(6 downto 0) <= a (7 downto 1); s(7) <= '0';
			when others => s <= a;
		end case;
	end process;

end arc_unidad_aritmetico_logica;