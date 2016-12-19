library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity test_bench_contador_de_programa is 
end test_bench_contador_de_programa;

architecture arc_test_bench_contador_de_programa of test_bench_contador_de_programa is
	component contador_de_programa
		port (clk, rst: in std_logic; count: buffer std_logic_vector(6 downto 0));

	end component;

	signal clk, rst: std_logic := '0';
	signal count : std_logic_vector(6 downto 0) := ('0','0','0','0','0','0','0');
	constant clk_period : time := 1 ns;

begin

	uut: contador_de_programa port map (clk => clk, rst => rst, count => count);       

   clk_process: process
   begin
        clk <= '0';
        wait for clk_period;
        clk <= '1';
        wait for clk_period;
   end process;

	assert_process: process
	begin
		rst <= '1';
		wait for 1 ns;
		rst <= '0';
		wait for 14 ns;
		assert conv_integer(unsigned(count)) = 7 report "error en contador" severity failure;
		wait for 240 ns;
		assert conv_integer(unsigned(count)) = 127 report "error en contador" severity failure;
		wait for 2 ns;
		assert conv_integer(unsigned(count)) = 0 report "error en contador" severity failure;
		wait for 200 ns;
		rst <= '1';
		wait for 2 ns;
		rst <= '0';
		wait;
	end process;

end arc_test_bench_contador_de_programa;
