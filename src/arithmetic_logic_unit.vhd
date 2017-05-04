library ieee, my_lib;

use 	ieee.std_logic_1164.all,
		ieee.numeric_std.all;

use 	my_lib.types.all,
		my_lib.constants.all,
		my_lib.instruction_set.all;

entity arithmetic_logic_unit is
	generic ( reg_width : positive := reg_width_global );
		port
		(
			clk 			: in std_logic;
			rst 			: in std_logic;
			
			alu_a 		: in BYTE_U;
			alu_b 		: in BYTE_U;
			alu_ab		: in HALF_WORD_U;
			
			operation	: in operation_type;
			
			SREG_i		: in BYTE;
			
			Rd				: out BYTE_U;
			Rd_16			: out HALF_WORD_U;
			
			SREG_o		: OUT BYTE
			
--			constant overflow : integer := 3;
--			constant carry 	: positive := 2;
--			constant zero 		: positive := 1;
--			constant negative	: positive := 0;
		);
end entity;

architecture nothing of arithmetic_logic_unit is
	
	signal Rd_reg, Rd_next 				: BYTE_U;
	signal Rd_16_reg, Rd_16_next		: HALF_WORD_U;
	signal SREG_o_reg, SREG_o_next 	: BYTE;
	
	alias immediate6 is alu_b(5 downto 0);
	alias immediate8 is alu_b;
begin
	
register_update :
	process(clk, rst)
	begin
		if rst then 
			Rd_reg 			<= (others => '0');
			Rd_16_reg		<= (others => '0');
			SREG_o_reg		<= (others => '0');
			
		elsif rising_edge(clk) then
			Rd_reg 			<= Rd_next;
			Rd_16_reg		<= Rd_16_next;
			SREG_o_reg 		<= SREG_o_next;
			
		end if;
	end process;
	
do_operation : 
	process(all)
	
		variable tmp : unsigned(15 downto 0); -- for mult
		
	begin	
		Rd_next			<= Rd_reg;
		SREG_o_next		<= SREG_o_reg;
		Rd_16_next		<= Rd_16_reg;
		case operation is
		-- Arithmetic and logic operations
			when ADD		=> 
				ADD(	alu_a, alu_b, SREG_i, 
						Rd_next, SREG_o_next);
			
			when ADC		=> 
				ADC(	alu_a, alu_b, SREG_i, 
						Rd_next, SREG_o_next);
			
			when ADIW 	=>
				ADIW(	alu_ab, immediate6, SREG_i, 
						Rd_16_next, SREG_o_next);
				
			when SUB 	=>
				SUB(	alu_a, alu_b, SREG_i, 
						Rd_next, SREG_o_next);
						
			when SUBI	=> 
				SUBI(	alu_a, immediate8, SREG_i, 
						Rd_next, SREG_o_next);
						
			when SBC		=>
				SBC(	alu_a, alu_b, SREG_i, 
						Rd_next, SREG_o_next);
			
			when SBCI	=>
				SBCI(	alu_a, immediate8, SREG_i, 
						Rd_next, SREG_o_next);
						
			when SBIW 	=>
				SBIW( alu_ab, immediate6, SREG_i, 
						Rd_16_next, SREG_o_next);
						
			when ANDD 	=>
				ANDD( alu_a, alu_b, SREG_i, 
						Rd_next, SREG_o_next);
			
			when ANDI	=>
				ANDI(	alu_a, immediate8, SREG_i, 
						Rd_next, SREG_o_next);
				
			when ORR	=>
				ORR(	alu_a, alu_b, SREG_i, 
						Rd_next, SREG_o_next);
			
			when ORI 	=>
				ORI( 	alu_a, immediate8, SREG_i, 
						Rd_next, SREG_o_next);
						
			when EOR 	=>
				EOR(	alu_a, alu_b, SREG_i, 
						Rd_next, SREG_o_next);
						
			when COM	=>
				COM(	alu_a, SREG_i, 
						Rd_next, SREG_o_next);
				
			when NEG	=>
				NEG(	alu_a, SREG_i, 
						Rd_next, SREG_o_next);
						
			when SBR	=>
				SBR( 	alu_a, immediate8, SREG_i, 
						Rd_next, SREG_o_next);
						
			when CBR	=>
				CBR(	alu_a, immediate8, SREG_i, 
						Rd_next, SREG_o_next);
				
			when INC	=>
				INC(	alu_a, SREG_i,
						Rd_next, SREG_o_next);
					
			when DEC	=>
				DEC( 	alu_a, SREG_i, 
						Rd_next, SREG_o_next);
						
			when TST	=>
				TST( 	alu_a, SREG_i, 
						Rd_next, SREG_o_next);
						
			when CLR 	=>
				CLR( 	alu_a, SREG_i, 
						Rd_next, SREG_o_next);
						
			when SER 	=>
				SER( 	alu_a, SREG_i, 
						Rd_next, SREG_o_next);
						
			when MUL	=>
				MUL( 	alu_a, alu_b, SREG_i, 
						Rd_16_next, SREG_o_next);
						
--			when MULS	=>
--				MULS( alu_a, alu_b, SREG_i, 
--						Rd_16_next, SREG_o_next);	
--				
--			when MULSU	=>
--				MULSU( alu_a, alu_b, SREG_i, 
--						Rd_16_next, SREG_o_next);
						
--			when MUL 	=>
--				tmp 				:= alu_a * alu_b;
--				Rd_next			<= tmp(15 downto 8);
--				SREG_o_next		<= SREG_o_reg;
	
	-- Data transfer instructions
			
			when MOV		=>
				MOV(	alu_a, Rd_next);
			
			when MOVW	=>
				MOVW(	alu_ab, Rd_16_next);
			
			when LDI		=>
				LDI (	immediate8, Rd_next);
			
			when others => 
				Rd_next 			<= alu_a - alu_b; 
				SREG_o_next		<= SREG_o_reg;
				
		end case;
	end process;
	
-- outputs
Rd 		<= Rd_reg;
Rd_16		<= Rd_16_reg;
SREG_o 	<= SREG_o_reg;
end architecture;