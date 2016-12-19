library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_arith.all;

entity registro_8_bits is
	port(clk, rst, we : in std_logic;
		din : in std_logic_vector (7 downto 0);
		dout : out std_logic_vector (7 downto 0));
end registro_8_bits;

architecture arc_registro_8_bits of registro_8_bits is

begin 

	process (clk,rst)
	begin
		if rst='1' then
			dout <= "00000000";
		elsif (clk'event and clk = '1' and we = '1') then
			dout <= din;
		end if;
	end process;

end arc_registro_8_bits;