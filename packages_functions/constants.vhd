--synthesize library my_lib;

library ieee, my_lib;

use ieee.std_logic_1164.all;

package constants is
	-- alu constants
	constant overflow : integer := 3;
	constant carry 	: integer := 2;
	constant zero 		: integer := 1;
	constant negative	: integer := 0;
	-- mcu global constants
	constant reg_width_global 				: positive := 16;
	constant flags_width 					: positive := 4;
	constant gpr_depth_global				: positive := 4;
	-- memory
		--flash
		constant program_flash_depth_global : positive := 4;
		constant FLASH_REG_WIDTH_GLOBAL		: positive := 16;
	
	-- instructions
		constant GPR_ADDR_REG_WIDTH	: positive := 4;
		constant SRAM_ADDR_REG_WIDTH	: positive := 7;
	--delete?
	constant instruction_reg_width 	: positive := 16;
	constant status_reg_width 			: positive := 16;
end package;