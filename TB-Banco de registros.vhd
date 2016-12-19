library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity test_bench_banco_de_registros is 
end test_bench_banco_de_registros;

architecture arc_test_bench_banco_de_registros of test_bench_banco_de_registros is
	component banco_de_registros
		Port ( clk : in  std_logic;
           rst : in  std_logic;
           we : in  std_logic;
           w_add : in  std_logic_vector (3 downto 0);
           r_add : in  std_logic_vector (3 downto 0);
           din : in  std_logic_vector (7 downto 0);
           dout : out  std_logic_vector (7 downto 0));
	end component;
	component contador_de_programa 
		port (clk, rst: in std_logic; count: buffer std_logic_vector(6 downto 0));

	end component;

	signal clk, rst, we: std_logic := '1';
	signal count: std_logic_vector (6 downto 0);
	signal dout: std_logic_vector (7 downto 0);
	constant clk_period : time := 1 ns;

begin
	
	pc : contador_de_programa port map (clk => clk, rst => rst, count => count);
	uut: banco_de_registros port map (clk => clk, rst => rst, we => we, 
		w_add => count (3 downto 0), r_add => count (3 downto 0), 
		din (6 downto 0) => count, din (7) => clk, dout => dout);       

   clk_process: process
   begin
        clk <= '0';
        wait for clk_period;
        clk <= '1';
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
		wait for 32 ns;
		assert conv_integer(unsigned(dout)) = 128 report "fallo al iniciar" severity failure;
		wait for 32 ns;
		assert conv_integer(unsigned(dout)) = 144 report "fallo al contar" severity failure;
		wait;
	end process;

end arc_test_bench_banco_de_registros;