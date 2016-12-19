library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity test_bench_multiplexor_3_a_1_de_8_bits is 
end test_bench_multiplexor_3_a_1_de_8_bits;

architecture arc_test_bench_multiplexor_3_a_1_de_8_bits of test_bench_multiplexor_3_a_1_de_8_bits is

	component multiplexor_3_a_1_de_8_bits is
	   port (a,b,c: in std_logic_vector(7 downto 0);
	         sel : in std_logic_vector(1 downto 0);
	         y: out std_logic_vector(7 downto 0));              
	end component;

	signal a, b, c, y: std_logic_vector(7 downto 0);
	signal sel: std_logic_vector(1 downto 0);

begin
	
	uut: multiplexor_3_a_1_de_8_bits port map (
						a => a, b => b, c => c,
						sel => sel, y => y);

	assert_process: process
	begin
		a <= "00000000";
		b <= "00000001";
		c <= "00000010";
		sel <= "00";
		wait for 1 ns;
		assert y = a report "fallo de entrada" severity failure;		
		sel <= "01";
		wait for 1 ns;
		assert y = b report "fallo de entrada" severity failure;		
		sel <= "10";
		wait for 1 ns;
		assert y = c report "fallo de entrada" severity failure;		
		c <= "00100000";
		wait for 1 ns;
		assert y = c report "induce memoria" severity failure;		
		wait;
	end process;

end arc_test_bench_multiplexor_3_a_1_de_8_bits;