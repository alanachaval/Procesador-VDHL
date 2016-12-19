library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity test_bench_decodificador is 
end test_bench_decodificador;

architecture arc_test_bench_decodificador of test_bench_decodificador is

	component decodificador is
		port (input : in std_logic_vector (7 downto 0);
				out_we, reg_we, reg_a_we : out std_logic;
				bus_sel : out std_logic_vector (1 downto 0);
				alu_op : out std_logic_vector (2 downto 0));
	end component;

	signal input : std_logic_vector (7 downto 0);
	signal output : std_logic_vector (7 downto 0);

begin

	uut: decodificador port map (input => input,
				reg_a_we => output (2), out_we => output (1), reg_we => output (0),
				bus_sel => output (7 downto 6), alu_op => output (5 downto 3));

	assert_process: process
	begin
		input <= x"01";
		wait for 1 ns;
		assert output = x"81" report "fallo op x01" severity failure;
		input <= x"02";
		wait for 1 ns;
		assert output = x"02" report "fallo op x02" severity failure;
		input <= x"03";
		wait for 1 ns;
		assert output = x"05" report "fallo op x03" severity failure;
		input <= x"04";
		wait for 1 ns;
		assert output = x"04" report "fallo op x04" severity failure;
		input <= x"05";
		wait for 1 ns;
		assert output = x"44" report "fallo op x05" severity failure;
		input <= x"10";
		wait for 1 ns;
		assert output = x"11" report "fallo op x10" severity failure;
		input <= x"11";
		wait for 1 ns;
		assert output = x"19" report "fallo op x11" severity failure;		
		input <= x"12";
		wait for 1 ns;
		assert output = x"21" report "fallo op x12" severity failure;
		input <= x"13";
		wait for 1 ns;
		assert output = x"29" report "fallo op x13" severity failure;
		input <= x"14";
		wait for 1 ns;
		assert output = x"31" report "fallo op x14" severity failure;
		input <= x"20";
		wait for 1 ns;
		assert output = x"09" report "fallo op x20" severity failure;
		input <= x"21";
		wait for 1 ns;
		assert output = x"39" report "fallo op x21" severity failure;
		wait;
	end process;

end arc_test_bench_decodificador;


	
