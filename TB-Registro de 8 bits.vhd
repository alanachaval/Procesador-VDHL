library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity test_bench_registro_8_bits is 
end test_bench_registro_8_bits;

architecture arc_test_bench_registro_8_bits of test_bench_registro_8_bits is
	

	component registro_8_bits is
		Port(clk, rst, we : in std_logic;
			din : in std_logic_vector (7 downto 0);
			dout : out std_logic_vector (7 downto 0));
	end component;

	signal clk, rst, we: std_logic := '1';
	signal din, dout: std_logic_vector (7 downto 0);
	constant clk_period : time := 1 ns;

begin 

	uut: registro_8_bits port map(clk => clk, rst => rst, we => we,
		din => din, dout => dout);

	clk_process: process
	begin
		clk <= '1';
		wait for clk_period;
		clk <= '0';
		wait for clk_period;
	end process;

	reset_process: process
	begin
		rst <= '1';
		wait for 1 ns;
		rst <= '0';
		wait;
	end process;

	assert_process: process
	begin
		din <= "00000000";
		wait for 2 ns;
		assert conv_integer(unsigned(dout)) = 0 report "fallo al reiniciar" severity failure;
		wait for 3 ns;
		assert conv_integer(unsigned(dout)) = 0 report "fallo al mantener" severity failure;
		din <= "00011000";
		assert conv_integer(unsigned(dout)) = 0 report "fallo al mantener" severity failure;
		wait for 2 ns;
		assert conv_integer(unsigned(dout)) = 24 report "fallo al cambiar" severity failure;
		din <= "00011011";
		we <= '0';
		wait for 4 ns;
		assert conv_integer(unsigned(dout)) = 24 report "fallo al mantener" severity failure;
		wait;
	end process;

end arc_test_bench_registro_8_bits;
