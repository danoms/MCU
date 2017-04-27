library ieee, my_lib;

use 	ieee.std_logic_1164.all,
		ieee.numeric_std.all;

use 	my_lib.types.all,
		my_lib.constants.all;

entity instruction_decoder is
	generic ( REG_WIDTH : positive := FLASH_REG_WIDTH_GLOBAL );
		port
		(
			instruction_in : in std_logic_vector(REG_WIDTH-1 downto 0);
			
--			gpr_bus : out gpr_bus_type;
--			
--			sram_bus : out sram_bus_type;
			ctl_lines 	: out control_line_type;
			rd				: out std_logic_vector(REG_WIDTH-1 downto 0)
			
--			operation	: out operation_type
		);
end entity;

architecture nothing of instruction_decoder is
	
	alias addr_rd 	 is instruction_in	(GPR_ADDR_REG_WIDTH-1 		downto 0);
	alias addr_rs1  is instruction_in	(2*GPR_ADDR_REG_WIDTH-1 	downto GPR_ADDR_REG_WIDTH);
	alias addr_rs2  is instruction_in	(3*GPR_ADDR_REG_WIDTH-1 	downto 2*GPR_ADDR_REG_WIDTH);
	alias operation is instruction_in	(14 downto 12);
	
	alias sram_w_en   is instruction_in(15);
	alias sram_r_en   is instruction_in(14);
	alias sram_w_addr is instruction_in(6 downto 0);
	alias sram_r_addr is instruction_in(13 downto 7);
	
 
begin
	
ctl_lines.gpr_ctl		<= (addr_rd, addr_rs1, addr_rs2);
ctl_lines.sram_ctl	<= (sram_w_en, sram_w_addr, Sram_r_en, sram_r_addr);
									
ctl_lines.operation 	<= operation_type'val(to_integer(unsigned(operation)));

end architecture;