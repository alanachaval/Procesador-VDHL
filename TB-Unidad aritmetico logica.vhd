library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity test_bench_unidad_aritmetico_logica is 
end test_bench_unidad_aritmetico_logica;	

architecture arc_test_bench_unidad_aritmetico_logica of test_bench_unidad_aritmetico_logica is

	component unidad_aritmetico_logica
		Port(op : in std_logic_vector (2 downto 0);
			a, b : in std_logic_vector (7 downto 0);
			s : out std_logic_vector (7 downto 0));
	end component;

	signal a, b, s: std_logic_vector (7 downto 0);
	signal op: std_logic_vector (2 downto 0);

begin 

	uut: unidad_aritmetico_logica port map(op => op, a => a, b => b, s => s);

	assert_process: process
	begin
		a <= "00000001";
		b <= "00000011";
		op <= "000";
		wait for 1 ns;
		assert s = "00000001" report "fallo op 000" severity failure;
		op <= "001";
		wait for 1 ns;
		assert s = "00000010" report "fallo op 001" severity failure;
		op <= "010";
		wait for 1 ns;
		assert s = "00000100" report "fallo op 010" severity failure;
		op <= "011";
		wait for 1 ns;
		assert s = "11111110" report "fallo op 011" severity failure;
		op <= "100";
		wait for 1 ns;
		assert s = "00000001" report "fallo op 100" severity failure;
		op <= "101";
		wait for 1 ns;
		assert s = "00000011" report "fallo op 101" severity failure;
		op <= "110";
		wait for 1 ns;
		assert s = "00000010" report "fallo op 110" severity failure;
		op <= "111";
		wait for 1 ns;
		assert s = "00000000" report "fallo op 111" severity failure;
		wait;
	end process;

end arc_test_bench_unidad_aritmetico_logica;




















