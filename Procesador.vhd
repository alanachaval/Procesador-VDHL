library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity procesador is
    Port ( clk : in  std_logic;
           rst : in  std_logic;
           input : in  std_logic_vector (7 downto 0);
           output : out  std_logic_vector (7 downto 0));
end procesador;

architecture arc_procesador of procesador is

component banco_de_registros 
    port(clk : in  std_logic;
         rst : in  std_logic;
         we : in  std_logic;
         w_add : in  std_logic_vector (3 downto 0);
         r_add : in  std_logic_vector (3 downto 0);
         din : in  std_logic_vector (7 downto 0);
         dout : out  std_logic_vector (7 downto 0));
end component;

component unidad_aritmetico_logica port ( op : in  std_logic_vector(2 downto 0);
         a,b : in  std_logic_vector (7 downto 0);
         s : out  std_logic_vector (7 downto 0));
end component;

component memoria_de_instrucciones port (addr : in  std_logic_vector (6 downto 0);
			output : out  std_logic_vector (15 downto 0));
end component; 

component decodificador port (input : in std_logic_vector (7 downto 0);
			out_we, reg_we, reg_a_we : out std_logic;
			bus_sel : out std_logic_vector (1 downto 0);
			alu_op : out std_logic_vector (2 downto 0));
end component; 

component registro_8_bits is
	port(clk, rst, we : in std_logic;
		din : in std_logic_vector (7 downto 0);
		dout : out std_logic_vector (7 downto 0));
end component;

component registro_16_bits is
	port(clk, rst, we : in std_logic;
		din : in std_logic_vector (15 downto 0);
		dout : out std_logic_vector (15 downto 0));
end component;

component contador_de_programa is
	port (clk, rst: in std_logic;
		count: buffer std_logic_vector(6 downto 0));
end component;

component multiplexor_3_a_1_de_8_bits is
   port (a,b,c: in std_logic_vector(7 downto 0);
         sel : in std_logic_vector(1 downto 0);
         y: out std_logic_vector(7 downto 0));              
end component;

-- contador_de_programa a memoria_de_instrucciones
	signal cp_output : std_logic_vector(6 downto 0);
-- memoria_de_instrucciones a registro_de_instruccion
	signal mi_output : std_logic_vector(15 downto 0);
-- registro_de_instruccion a varios
	signal ri_output : std_logic_vector(15 downto 0);
-- multiplexor_3_a_1_de_8_bits a unidad_aritmetico_logica, registro_acumulador
	signal mux_output : std_logic_vector(7 downto 0);
-- registro_acumulador a unidad_aritmetico_logica
	signal ra_output : std_logic_vector(7 downto 0);
-- unidad_aritmetico_logica a registro_de_salida, banco_de_registros
	signal alu_output : std_logic_vector(7 downto 0);
-- banco_de_registros a multiplexor_3_a_1_de_8_bits
	signal br_out : std_logic_vector(7 downto 0);
-- decodificador a varios (en este caso el nombre indica la llegada)
	signal out_we, reg_we, reg_a_we: std_logic;
	signal bus_sel : std_logic_vector (1 downto 0);
	signal alu_op : std_logic_vector (2 downto 0);

begin

cp : contador_de_programa port map (clk => clk, rst => rst, 
								count => cp_output);

mi : memoria_de_instrucciones port map (addr => cp_output,
								output => mi_output);

br :  banco_de_registros port map (clk => clk, rst => rst, we => reg_we, 
								w_add => ri_output(3 downto 0), r_add => ri_output(7 downto 4), 
								din => alu_output, dout => br_out);

alu : unidad_aritmetico_logica port map (op => alu_op, 
								a => mux_output, b => ra_output, s => alu_output);

dec : decodificador port map (input => ri_output(15 downto 8), 
								out_we => out_we, reg_we => reg_we, reg_a_we => reg_a_we,
								bus_sel => bus_sel, alu_op => alu_op);

mux : multiplexor_3_a_1_de_8_bits port map (a => br_out, b => ri_output(15 downto 8), c => input,
        						sel => bus_sel, y => mux_output);

ra : registro_8_bits port map (clk => clk, rst => rst, we => reg_a_we,
								din => mux_output, dout => ra_output);

rs : registro_8_bits port map (clk => clk, rst => rst, we => out_we,
								din => alu_output, dout => output);

di : registro_16_bits port map (clk => clk, rst => rst, we => '1',
								din => mi_output, dout => ri_output);

end arc_procesador;