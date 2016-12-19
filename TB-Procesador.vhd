library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity test_bench_procesador is 
end test_bench_procesador;

architecture arc_test_bench_procesador of test_bench_procesador is
	component procesador 
	  Port ( clk : in  std_logic;
           rst : in  std_logic;
           input : in  std_logic_vector (7 downto 0);
           output : out  std_logic_vector (7 downto 0));
	end component;
 
  signal clk, rst: std_logic := '1';
	signal input, output: std_logic_vector (7 downto 0);
	constant clk_period : time := 1 ns;
  begin
  
  uut: procesador port map (clk => clk, rst => rst, 
		input => input, output => output);       

  
   clk_process: process
   begin
        clk <= '0';
        wait for clk_period;
        clk <= '1';
        wait for clk_period;
   end process;


	reset_process: process
	begin
		rst <= '0';
		wait for 1 ns;
		rst <= '1';
		wait for 1 ns;
		rst <= '0';
		wait;
	end process;

  assert_process: process
  begin
    input <= x"0A";
    wait for 20 ns;
    assert output = x"0A" report "fallo" severity failure;
    wait for 2 ns;
    assert output = x"14" report "fallo" severity failure;
    wait for 2 ns;
    assert output = x"0A" report "fallo" severity failure;
    wait for 2 ns;
    assert output = x"1E" report "fallo" severity failure;
    wait for 2 ns;
    assert output = x"00" report "fallo" severity failure;
    wait for 2 ns;
    assert output = x"00" report "fallo" severity failure;
    wait for 2 ns;
    assert output = x"00" report "fallo" severity failure;
    wait for 2 ns;
    assert output = x"14" report "fallo" severity failure;
    wait;
  end process;

end arc_test_bench_procesador;
