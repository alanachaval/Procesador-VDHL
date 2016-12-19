library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity test_bench_memoria_de_instrucciones is 
end test_bench_memoria_de_instrucciones;	

architecture arc_test_bench_memoria_de_instrucciones of test_bench_memoria_de_instrucciones is

	component memoria_de_instrucciones
		Port(
		  addr : in std_logic_vector (6 downto 0);
		  output : out std_logic_vector (15 downto 0)
		);
	end component;

	signal addr: std_logic_vector (6 downto 0);
	signal output: std_logic_vector (15 downto 0);

begin 

	uut: memoria_de_instrucciones port map(addr => addr, output => output);

	assert_process: process
	begin
 	  addr <= "0000000";
		wait for 1 ns;
		assert output = x"0103" report "fallo addr x00" severity failure;
		
    addr <= "0000001";
		wait for 1 ns;
		assert output = x"0430" report "fallo addr x01" severity failure;

   	addr <= "0000010";
		wait for 1 ns;
		assert output = x"1034" report "fallo addr x02" severity failure;
   	
    addr <= "0000011";
		wait for 1 ns;
		assert output = x"1145" report "fallo addr x03" severity failure;
		
    addr <= "0000100";
		wait for 1 ns;
		assert output = x"1346" report "fallo addr x04" severity failure;
		
    addr <= "0000101";
		wait for 1 ns;
		assert output = x"1207" report "fallo addr x05" severity failure;
		
		addr <= "0000110";
		wait for 1 ns;
		assert output = x"034E" report "fallo addr x06" severity failure;
		
    addr <= "0000111";
		wait for 1 ns;
		assert output = x"0230" report "fallo addr x07" severity failure;
		
    addr <= "0001000";
		wait for 1 ns;
		assert output = x"0240" report "fallo addr x08" severity failure;
		
    addr <= "0001001";
		wait for 1 ns;
		assert output = x"0250" report "fallo addr x09" severity failure;
		
    addr <= "0001010";
		wait for 1 ns;
		assert output = x"0260" report "fallo addr x0A" severity failure;
		
    addr <= "0001011";
		wait for 1 ns;
		assert output = x"0270" report "fallo addr x0B" severity failure;
		
    addr <= "0001100";
		wait for 1 ns;
		assert output = x"0280" report "fallo addr x0C" severity failure;
		
    addr <= "0001101";
		wait for 1 ns;
		assert output = x"02D0" report "fallo addr x0D" severity failure;
		
		addr <= "0001110";
		wait for 1 ns;
		assert output = x"02E0" report "fallo addr x0E" severity failure;
		
	end process;

end arc_test_bench_memoria_de_instrucciones;






















