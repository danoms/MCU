library ieee, my_lib;

use 	ieee.std_logic_1164.all,
		ieee.numeric_std.all;

use 	my_lib.constants.all;

entity programming_logic is 
	generic 
	( 
		REG_WIDTH 				: positive := REG_WIDTH_GLOBAL;
		FLASH_REG_WIDTH		: positive := FLASH_REG_WIDTH_GLOBAL
	);
	port
	(
	-- inputs
		clk				: in std_logic;
		rst				: in std_logic;
		en					: in std_logic;	
		
		data_in			: in std_logic;	-- serial data in
		
	-- outputs
		ack				: out std_logic; 	-- acknowledge bit
		write_clk		: out std_logic;
		data_out			: out std_logic_vector(FLASH_REG_WIDTH-1 downto 0) -- programm data to flash
	);
	 		
end entity;

architecture nothing of programming_logic is
	signal data_buff_reg, data_buff_next							: std_logic_vector(FLASH_REG_WIDTH-1 downto 0) := (others => '0');
	signal ack_reg, ack_next									: std_logic := '0';
	signal counter_reg, counter_next 								: unsigned(3 downto 0);--	:= (others => '0');
	signal write_clk_reg, write_clk_next	: std_logic;
	
	signal data_out_next, data_out_reg	: std_logic_vector(FLASH_REG_WIDTH-1 downto 0) 	:= (others => '0');
	
	type state_type is (idle, receive, send);
	
	signal state_reg, state_next : state_type 	:= idle;
begin
	
	update_registers :
		process(clk, rst, en)
		begin
			if rst then
				data_out_reg 	<= (others => '0');
				ack_reg 			<= '0';
				counter_reg		<= (others => '0');
				state_reg 		<= idle;
				data_buff_reg	<= (others => '0');
				
			elsif rising_edge(clk) and en = '1' then
				state_reg 		<= state_next;
			
				data_out_reg	<= data_out_next;
				ack_reg			<= ack_next;
				write_clk_reg	<= write_clk_next;
				counter_reg		<= counter_next;
				data_buff_reg 	<= data_buff_next;
				
			end if;
		end process;
		
		state_machine : 
			process(all)
			begin
				counter_next		<= counter_reg;
				write_clk_next		<= '0';
				data_out_next		<= data_out_reg;
				state_next			<= state_reg;
				ack_next				<= '0';
				data_buff_next		<= data_buff_reg;
				
				case state_reg is
					when idle =>
						if en = '1' then 
							state_next	<= receive;
						else 
							state_next	<= idle;
						end if;
						
					when receive =>
						counter_next	<= counter_reg + 1;
						if counter_next /= counter_reg then 
							data_buff_next		<= data_buff_reg(FLASH_REG_WIDTH-2 downto 0) & data_in;
							
		
						elsif counter_reg = FLASH_REG_WIDTH-1 then
							counter_next	<= (others => '0');
							ack_next			<= '1';
							state_next		<= send;
						end if;
						
					when send =>
						data_out_next		<= data_buff_reg;
						write_clk_next		<= '1';
						
						state_next			<= idle;
				end case;
			end process;
			
write_clk 	<= write_clk_reg;
ack			<= ack_reg;
data_out 	<= data_out_reg;
end architecture;