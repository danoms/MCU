library ieee, my_lib;

use 	ieee.std_logic_1164.all,
		ieee.numeric_std.all;

use 	my_lib.types.all,
		my_lib.constants.all;
		
entity program_flash is
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
end entity;

architecture simple of program_flash is
	
	signal memory_reg, memory_next	: reg_array_type(0 to 2**program_flash_depth)(reg_width-1 downto 0)	:= (others => (others => '0'));
	
	signal counter	: unsigned(program_flash_depth downto 0);-- := (others => '0');
--	alias PC is program_count;
	signal PC	: std_logic_vector(reg_width-1 downto 0) := (others => '0');
	
begin
	
	update_reg :
		process(clk, rst, clear_memory)
		begin
			if clear_memory then
				memory_reg		<= (others => (others => '0'));
			elsif rising_edge(clk) then
				memory_reg 		<= memory_next;
			end if;
		end process;
	
	programming_flash :
		process(clk_write, rst, write_en, clear_memory)
--			signal counter	: unsigned(program_flash_depth-1 downto 0);-- := (others => '0');
		begin
			if rst then
				counter 	<= (others => '0');
				
			elsif rising_edge(clk_write) and write_en = '1' then
				memory_next(to_integer(counter)) 	<= programming_data;
				counter 										<= counter + 1;
			end if;
		end process;
		
	reading_flash : 
		process(clk, rst, read_en)
		begin
			if rising_edge(clk) and read_en = '0' then
				PC	<= program_counter;
			end if;
		end process;

instruction_out <= memory_reg(to_integer(unsigned(PC)));
end architecture;