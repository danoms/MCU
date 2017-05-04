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
		Rd 		: in BYTE_U;
		Rd_16		: in HALF_WORD_U;
		
	-- outputs
		alu_a 	: out BYTE_U;
		alu_b 	: out BYTE_U;
		
		alu_ab	: out HALF_WORD_U
	);
end entity;

architecture nothing of general_purpose_register is
	signal gpr_registers_reg, gpr_registers_next : BYTE_U_ARRAY(reg_depth-1 downto 0)
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