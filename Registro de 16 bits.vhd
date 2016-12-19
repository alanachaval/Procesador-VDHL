library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_arith.all;

entity registro_16_bits is
	port(clk, rst, we : in std_logic;
		din : in std_logic_vector (15 downto 0);
		dout : out std_logic_vector (15 downto 0));
end registro_16_bits;

architecture arc_registro_16_bits of registro_16_bits is

begin 

	process (clk,rst)
	begin
		if rst='1' then
			dout <= "0000000000000000";
		elsif (clk'event and clk = '1' and we = '1') then
			dout <= din;
		end if;
	end process;

end arc_registro_16_bits;
