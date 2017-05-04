--synthesize library my_lib;

library ieee, my_lib;

use 	ieee.std_logic_1164.all,
		ieee.numeric_std.all;

use my_lib.constants.all;

package types is

-- main MCU types

	-- std_logic_vector
	subtype WORD is std_logic_vector(31 downto 0);
	subtype HALF_WORD is std_logic_vector(15 downto 0);
	subtype BYTE is std_logic_vector(7 downto 0);
	
	-- unsigned
	subtype WORD_U is unsigned(31 downto 0);
	subtype HALF_WORD_U is unsigned(15 downto 0);
	subtype BYTE_U is unsigned(7 downto 0);
	
	-- signed
	subtype WORD_S is unsigned(31 downto 0);
	subtype HALF_WORD_S is signed(15 downto 0);
	subtype BYTE_S is unsigned(7 downto 0);
	
	-- immediate value sizes
		subtype K6 is unsigned(5 downto 0);
		subtype K8 is unsigned(7 downto 0);
	
	-- arrays
	type BYTE_U_ARRAY is array(natural range <>) of BYTE_U;
	
	
	
	
	type operation_type is (ADD, ADC, ADIW, SUB, SUBI, SBC, SBCI, SBIW,
									ANDD, ANDI, ORR, ORI, EOR, COM, NEG, SBR, CBR,
									INC, DEC, TST, CLR, SER, MUL, MULS, MULSU, 		shift_l, shift_r);
								
	
	attribute enum_encoding : string;
--	attribute enum_encoding of operation_type : type is "000 001 010 011 100 101";
	attribute enum_encoding of operation_type : type is "johnson";
	
--	subtype word is std_logic_vector;
	type reg_array_type is array(natural range <>) of BYTE_U;
	
	type reg_type is record
		program_counter 			: std_logic_vector(reg_width_global-1 downto 0);
		stack_pointer				: std_logic_vector(reg_width_global-1 downto 0);
		instruction_register		: std_logic_vector(reg_width_global-1 downto 0);
		return_register			: std_logic_vector(reg_width_global-1 downto 0);
		status_register 			: BYTE;
	end record;
	
	type gpr_bus_type is record
		addr_rd 		: std_logic_vector(GPR_ADDR_REG_WIDTH-1 downto 0);
		addr_rs1		: std_logic_vector(GPR_ADDR_REG_WIDTH-1 downto 0);
		addr_rs2 	: std_logic_vector(GPR_ADDR_REG_WIDTH-1 downto 0);
	end record;
	
	type sram_bus_type is record
		write_en		: std_logic;
		write_addr	: std_logic_vector(SRAM_ADDR_REG_WIDTH-1 downto 0);
		read_en		: std_logic;
		read_addr	: std_logic_vector(SRAM_ADDR_REG_WIDTH-1 downto 0);
	end record;
	
	type alu_bus_type is record
		alu_a 		: std_logic_vector(reg_width_global-1 downto 0);
		alu_b 		: std_logic_vector(reg_width_global-1 downto 0);
		operation	: operation_type;
	end record;
	
	type control_line_type is record
		gpr_ctl		: gpr_bus_type;
		sram_ctl		: sram_bus_type;
		operation	: operation_type;
	end record;
end package;