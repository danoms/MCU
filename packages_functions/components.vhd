--synthesize library my_lib;

library ieee, my_lib;

use ieee.std_logic_1164.all;

use 	my_lib.constants.all,
		my_lib.types.all;

	package components is 
		--memory elements
		component programming_logic is 
		generic 
		( 
			REG_WIDTH 				: positive := REG_WIDTH_GLOBAL;
			FLASH_REG_WIDTH		: positive := FLASH_REG_WIDTH_GLOBAL
		);
		port
		(
		-- inputs
			clk						: in std_logic;
			rst						: in std_logic;
			en							: in std_logic;
			
			data_in					: in std_logic;	-- serial data in
				
		-- outputs
			ack						: out std_logic; 	-- acknowledge bit
			write_clk				: out std_logic;
			data_out					: out std_logic_vector(FLASH_REG_WIDTH-1 downto 0) -- programm data to flash
		);	
	end component;
	
	component program_flash is
	generic 
	( 
		reg_width 				: positive := reg_width_global;
		program_flash_depth	: positive := program_flash_depth_global
	);
	port
	(
	-- inputs
		clk 						: in std_logic;
		rst 						: in std_logic;
		clear_memory			: in std_logic;
		
		clk_write				: in std_logic;
		write_en					: in std_logic;
		read_en 					: in std_logic;
		
		programming_data		: in std_logic_vector(reg_width-1 downto 0);
		
		program_counter 		: in std_logic_vector(reg_width-1 downto 0);
	
	-- outputs
		instruction_out 		: out std_logic_vector(reg_width-1 downto 0) := (others => '0')
	);
	end component;
	
	component sram is
		generic ( reg_width : positive := reg_width_global );
		port
		(
		-- inputs
			clk			: in std_logic;
			rst 			: in std_logic;
		
			sram_bus 	: in sram_bus_type;
			data_in		: in std_logic_vector(REG_WIDTH-1 downto 0);
		-- outputs
--			data_inout 	: inout std_logic_vector(REG_WIDTH-1 downto 0)
			data_out		: out std_logic_vector(REG_WIDTH-1 downto 0)
		
		);
	end component;

	--logic elements
	component instruction_decoder is
		generic ( reg_width : positive := reg_width_global );
		port
		(
			instruction_in : in std_logic_vector(reg_width-1 downto 0);
			
--			gpr_bus : out gpr_bus_type;
--			
--			sram_bus : out sram_bus_type;
			
			ctl_lines 	: out control_line_type;
			rd 			: out std_logic_vector(reg_width-1 downto 0)
			
--			operation	: out operation_type
		);
	end component;
	
	component general_purpose_register is
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
	end component;
	
	component arithmetic_logic_unit is
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
		);
	end component;
	
	
	
end package;