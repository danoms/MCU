--synthesize library my_lib;

library ieee, my_lib;

use ieee.std_logic_1164.all;

package constants is
-- alu constants
	-- flags for status register
	constant C			: integer := 0; 	-- carry
	constant Z 			: integer := 1; 	-- zero
	constant N			: integer := 2;	-- negative
	constant V			: integer := 3;	-- overflow
	constant S			: integer := 4;	-- sign
	constant H			: integer := 5;	-- half carry
	constant T 			: integer := 6;	-- bit copy
	constant I 			: integer := 7;	-- interrupt
	
	
	
	
	-- mcu global constants
	constant reg_width_global 				: positive := 8;
	constant flags_width 					: positive := 4;
	constant gpr_depth_global				: positive := 4;
	-- memory
		--flash
		constant program_flash_depth_global : positive := 4;
		constant FLASH_REG_WIDTH_GLOBAL		: positive := 8;
	
	-- instructions
		constant GPR_ADDR_REG_WIDTH	: positive := 4;
		constant SRAM_ADDR_REG_WIDTH	: positive := 7;
	--delete?
	constant instruction_reg_width 	: positive := 8;
	constant status_reg_width 			: positive := 8;
end package;