library ieee, my_lib;

use 	ieee.std_logic_1164.all,
		ieee.numeric_std.all;

use 	my_lib.types.all,
		my_lib.constants.all;

entity sram is
	generic ( REG_WIDTH : positive := REG_WIDTH_GLOBAL );
		port
		(
		-- inputs
			clk			: in std_logic;
			rst 			: in std_logic;
		
			sram_bus 	: in sram_bus_type;
			data_in		: in BYTE_U;
		-- outputs
--			data_inout 	: inout std_logic_vector(REG_WIDTH-1 downto 0)
			data_out		: out BYTE_U
		);
end entity;

architecture nothing of sram is
	signal sram_memory_reg, sram_memory_next 	: 	BYTE_U_ARRAY(0 to 2**10);
	
	procedure write_memory is
	begin
		sram_memory_next(to_integer(unsigned(sram_bus.write_addr)))	<= data_in;
	end procedure;
	
	procedure read_memory is
	begin
		data_out 	<= sram_memory_reg(to_integer(unsigned(sram_bus.read_addr)));
	end procedure;
	
	
begin
	
update_registers :
	process(clk, rst)
	begin
		if rst then
			sram_memory_reg		<= (others => (others => '0'));
				
		elsif rising_edge(clk) then
			sram_memory_reg		<= sram_memory_next;
			
		end if;
	end process;
	
write_read_process: 
		process(all)
		begin
			
			sram_memory_next	<= sram_memory_reg;
			
			if sram_bus.write_en then
				write_memory;
				data_out		<= sram_memory_reg(to_integer(unsigned(sram_bus.read_addr)));
					
			elsif sram_bus.read_en then
				read_memory;
				
			else 
				read_memory;
				
			end if;
		end process;
		
end architecture;