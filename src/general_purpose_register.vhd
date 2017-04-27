library ieee, my_lib;

use 	ieee.std_logic_1164.all,
		ieee.numeric_std.all;

use 	my_lib.types.all,
		my_lib.constants.all;

entity general_purpose_register is
	generic 
	( 	
		reg_width : positive := reg_width_global;
		reg_depth : positive := gpr_depth_global
	);
	port
	(
	-- inputs
		clk 		: in std_logic;
		rst 		: in std_logic;

		gpr_bus 	: in gpr_bus_type;
		rd 		: in std_logic_vector(reg_width-1 downto 0);
	
	-- outputs
		alu_a 	: out std_logic_vector(reg_width-1 downto 0);
		alu_b 	: out std_logic_vector(reg_width-1 downto 0)
	);
end entity;

architecture nothing of general_purpose_register is
	signal gpr_registers_reg, gpr_registers_next : reg_array_type(reg_depth-1 downto 0)(reg_width-1 downto 0)
															:= (others => (others => '0'));

begin
--	update_regs :
--		process(clk, rst)
--		begin
--			if rst then
--				gpr_registers_reg 		<= (others => (others => '0'));
--			elsif rising_edge(clk) then
--				gpr_registers_reg			<= gpr_registers_next;
--			end if;
--		end process;
--
--	update_memory :
--		process(rd)
--		begin
--			gpr_registers_next(to_integer(unsigned(gpr_bus.addr_rd)))	<= rd;
--		end process;

	update_memory :
		process(all)
		begin
			if rst then
				gpr_registers_reg		<= (others => (others => '0'));
			elsif rising_edge(clk) then
				gpr_registers_reg(to_integer(unsigned(gpr_bus.addr_rd))) 	<= rd;
			else
				gpr_registers_reg		<= gpr_registers_reg;
			end if;
		end process;
		
alu_a <= gpr_registers_reg(to_integer(unsigned(gpr_bus.addr_rs1)));
alu_b <= gpr_registers_reg(to_integer(unsigned(gpr_bus.addr_rs2)));


end architecture;