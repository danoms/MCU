library ieee, my_lib;

use 	ieee.std_logic_1164.all,
		ieee.numeric_std.all;

use 	my_lib.components.all,
		my_lib.constants.all,
		my_lib.types.all;


entity mcu is 
	generic 
	(
		REG_WIDTH 			: positive 	:= REG_WIDTH_GLOBAL;
		FLASH_REG_WIDTH	: positive	:= FLASH_REG_WIDTH_GLOBAL
	);
	port 
	(
		clk 	: in std_logic;
		rst	: in std_logic
--		en		: in std_logic
	);
end entity;

architecture simple of mcu is 
	signal reg, reg_next 					: reg_type := (others => (others => '0'));
	
	-- data lines
	signal alu_a, alu_b, Rd	 				: BYTE_U; 
	signal alu_ab, 		Rd_16				: HALF_WORD_U;
	
	signal sram_data_in, sram_data_out	: std_logic_vector(REG_WIDTH-1 downto 0);
	
	signal ctl_lines_signal 				: control_line_type;
	
	--signals for programmer
	signal programming_data					: std_logic_vector(FLASH_REG_WIDTH-1 downto 0);
	signal clk_write 							: std_logic;
	constant SPI_data 						: std_logic_vector(FLASH_REG_WIDTH-1 downto 0)		:= x"FB";
	signal SPI_ack 							: std_logic;
	
	signal SREG_o 	: BYTE;
	signal SREG_i	: BYTE;
	
	-- test signals
	signal counter : unsigned(3 downto 0) := (others => '1');
begin		
	
	process (clk, rst)
	begin
		if rst then 
			reg <= (others => (others => '0'));
		elsif rising_edge(clk) then
			counter 	<= counter + 1; -- testy
			
			reg <= reg_next;
			
			if reg.status_register(V) then 
				reg.program_counter <= std_logic_vector(unsigned(reg.program_counter) + 1);
			end if;
		end if;
	end process;
	
	 programmer : 
		component programming_logic  
		port map
		(
		-- inputs
			clk						=> clk,
			rst						=> rst,
			en							=> '1',
			
			data_in					=>	SPI_data(to_integer(counter)),	-- serial data in
				
		-- outputs
			ack						=> SPI_ack, 	-- acknowledge bit
			write_clk				=> clk_write,
			data_out					=> programming_data-- programm data to flash
		);	
	
	
	program_flash_1 : 
		component program_flash 
		port map
		(
		-- inputs
			clk 					=> clk,
			rst 					=> rst,
			clear_memory		=> SPI_ack, -- testy
			
			clk_write			=> clk_write, --sometin from programming logic block
			write_en				=> '0',
			read_en				=> '1',
			
			programming_data	=> programming_data,
			program_counter 	=>	reg.program_counter,
			
		-- outputs	
			instruction_out 	=> reg_next.instruction_register
		);

	instruction_decoder_1 : 
		component instruction_decoder
		port map
		(
		-- inputs
			instruction_in => reg.instruction_register,
		
		-- outputs				
			ctl_lines 	=> ctl_lines_signal,
			Rd				=> Rd
		);
	
	general_purpose_register_1 : 
		component general_purpose_register
		port map
		(
		-- inputs
			clk 		=> clk,
			rst 		=> rst,

--			gpr_bus 	=> gpr_bus_signal,
			gpr_bus	=> ctl_lines_signal.gpr_ctl,
			Rd 		=> Rd,
			Rd_16		=> Rd_16,
			
		-- outputs	
			alu_a 	=> alu_a,
			alu_b 	=> alu_b,
			
			alu_ab	=> alu_ab
		);
		
	arithmetic_logic_unit_1 : 
		component arithmetic_logic_unit
		port map
		(
		-- inputs
			clk 	=> clk,
			rst 	=> rst,
			
			alu_a 		=> alu_a,
			alu_b 		=> alu_b,
			alu_ab		=> alu_ab,
			
			operation	=> ctl_lines_signal.operation,
			
			SREG_i		=> reg.status_register,
			
		-- outputs
			Rd				=> Rd,
			Rd_16			=> Rd_16,
			SREG_o		=> reg_next.status_register
		
		);
	
	sram_1 : 
		component sram
		port map
		(
		-- inputs
			clk			=> clk,
			rst 			=> rst,
		
			sram_bus 	=> ctl_lines_signal.sram_ctl,
			data_in		=> Rd,
		-- input/output
--			data_inout 	=> Rd
			data_out		=> Rd
		);
	
end architecture;