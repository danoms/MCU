library ieee, my_lib;

use 	ieee.std_logic_1164.all,
		ieee.numeric_std.all;

use 	my_lib.types.all,
		my_lib.constants.all,
		my_lib.procedures.all;

entity sram is
	generic ( REG_WIDTH : positive := REG_WIDTH_GLOBAL );
		port
		(
		-- inputs
			clk				: in std_logic;
			rst 				: in std_logic;
		
			sram_bus 		: in sram_bus_type;
			data_in			: in std_logic_vector(REG_WIDTH-1 downto 0);
			stack_pointer	: in std_logic_vector(STACK_POINTER_WIDTH-1 downto 0);
		-- outputs
--			data_inout 		: inout std_logic_vector(REG_WIDTH-1 downto 0)
			data_out			: out std_logic_vector(REG_WIDTH-1 downto 0)
		);
end entity;

architecture nothing of sram is
	signal sram_memory 	: 	reg_array_type(0 to 2**10)(REG_WIDTH-1 downto 0);
	
	procedure write_memory (addr : std_logic_vector(SRAM_ADDR_REG_WIDTH-1 downto 0)) is
	begin
		sram_memory(to_integer(unsigned(addr)))	<= data_in;
	end procedure;
	
	procedure read_memory (addr : std_logic_vector(SRAM_ADDR_REG_WIDTH-1 downto 0)) is
	begin
		data_out 	<= sram_memory(to_integer(unsigned(addr)));
	end procedure;
	
begin

	update_memory : 
		process(all)
		begin
			if rst then
				sram_memory		<= (others => (others => '0'));
			elsif rising_edge(clk) then
					if sram_bus.write_en then
						write_memory(stack_pointer);
						push(stack_pointer, data_in, sram_memory);
						
					elsif sram_bus.read_en then
						read_memory(sram_bus.read_addr);
					end if;
			end if;
		end process;
end architecture;