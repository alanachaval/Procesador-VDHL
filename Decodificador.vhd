library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decodificador is
	port (input : in std_logic_vector (7 downto 0);
			out_we, reg_we, reg_a_we : out std_logic;
			bus_sel : out std_logic_vector (1 downto 0);
			alu_op : out std_logic_vector (2 downto 0));
end decodificador;

architecture arc_decodificador of decodificador is

	signal output : std_logic_vector (7 downto 0);

begin

	decode_process: process(input)
	begin
		case input is
			when x"01" => output <= x"81";
			when x"02" => output <= x"02";
			when x"03" => output <= x"05";
			when x"04" => output <= x"04";
			when x"05" => output <= x"44";
			when x"10" => output <= x"11";
			when x"11" => output <= x"19";
			when x"12" => output <= x"21";
			when x"13" => output <= x"29";
			when x"14" => output <= x"31";
			when x"20" => output <= x"09";
			when others => output <= x"39";
		end case;
	end process;

bus_sel <= output (7 downto 6);
alu_op <= output (5 downto 3);
reg_a_we <= output (2);
out_we <= output (1);
reg_we <= output (0);

end arc_decodificador;
