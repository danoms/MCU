library ieee, my_lib;

use 	ieee.std_logic_1164.all,
		ieee.numeric_std.all;

use 	my_lib.types.all,
		my_lib.constants.all;

entity arithmetic_logic_unit is
	generic ( reg_width : positive := reg_width_global );
		port
		(
			clk 	: in std_logic;
			rst 	: in std_logic;
			
			alu_a 		: in std_logic_vector(reg_width-1 downto 0);
			alu_b 		: in std_logic_vector(reg_width-1 downto 0);
			operation	: in operation_type;
			
			rd		: out std_logic_vector(reg_width-1 downto 0);
			flags	: out std_logic_vector(flags_width-1 downto 0)
			
--			constant overflow : integer := 3;
--			constant carry 	: positive := 2;
--			constant zero 		: positive := 1;
--			constant negative	: positive := 0;
		);
end entity;

architecture nothing of arithmetic_logic_unit is
	signal rez, rezin 				: std_logic_vector(reg_width_global-1 downto 0);
	signal flag_reg, flag_regin 	: std_logic_vector(flags_width-1 downto 0); 
	signal state : operation_type := add;
begin
	process(clk, rst)
	begin
		if rst then 
			rez 		<= (others => '0');
			flag_reg	<= (others => '0');
		elsif rising_edge(clk) then
			rez 		<= rezin;
			flag_reg <= flag_regin;
		end if;
	end process;
	
	calc_op : process(all)
	begin
	state <= add;
		case state is
			when add 	=> rezin <= std_logic_vector(unsigned(alu_a) + unsigned(alu_b));
			when others => rezin <= std_logic_vector(unsigned(alu_a) - unsigned(alu_b)); 
		end case;
	end process;
	
	set_flags : process(all)
	begin
		flag_regin(overflow) <= '1';
		flag_regin(carry) 	<= '0';
		flag_regin(zero)		<= '0';
		flag_regin(negative)	<= '0';
	end process;
-- outputs
rd 	<= rez;
flags <= flag_reg;
end architecture;