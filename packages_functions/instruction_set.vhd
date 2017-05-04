library ieee, my_lib;

use 	ieee.std_logic_1164.all,
		ieee.numeric_std.all,
		my_lib.types.all,
		my_lib.constants.all;

package instruction_set is 

------------------------------------------------------------------------------------
------------------------Arithmetic and logic instructions---------------------------
------------------------------------------------------------------------------------
	
	-- A : 1.0
	procedure ADD  ( 	signal Rd, Rr	: in BYTE_U;
							signal SREG_i	: in BYTE;
							
							signal R 		: out BYTE_U;
							signal SREG_o	: out BYTE );
	
	-- A : 2.0
	procedure ADC  (	signal Rd, Rr	: in BYTE_U;
							signal SREG_i	: in BYTE;
							
							signal R			: out BYTE_U;
							signal SREG_o	: out BYTE	);
								
	-- A : 3.0
	procedure ADIW	  (	signal Rd				: in HALF_WORD_U;
								signal immediate		: in K6;
								signal SREG_i			: in BYTE;
								
								signal R 				: out BYTE_U;
								signal SREG_o			: out BYTE );
								
	-- A : 4.0
	procedure SUB  (	signal Rd, Rr	: in BYTE_U;
							signal SREG_i	: in BYTE;
							
							signal R			: out BYTE_U;
							signal SREG_o	: out BYTE	);
								
	-- A : 5.0
	procedure SUBI  (	signal Rd				: in BYTE_U;
							signal immediate		: in K8;
							signal SREG_i			: in BYTE;
							
							signal R 				: out BYTE_U;
							signal SREG_o			: out BYTE );
								
	-- A : 6.0
	procedure SBC  (	signal Rd, Rr	: in BYTE_U;
							signal SREG_i	: in BYTE;
							
							signal R			: out BYTE_U;
							signal SREG_o	: out BYTE	);
								
	-- A : 7.0
	procedure SBCI  (	signal Rd				: in BYTE_U;
							signal immediate		: in K8;
							signal SREG_i			: in BYTE;
							
							signal R 				: out BYTE_U;
							signal SREG_o			: out BYTE );
								
	-- A : 8.0
	procedure SBIW  (	signal Rd				: in HALF_WORD_U;
							signal immediate		: in K6;
							signal SREG_i			: in BYTE;
							
							signal R 				: out BYTE_U;
							signal SREG_o			: out BYTE );
								
	-- A : 9.0
	procedure ANDD  (	signal Rd, Rr	: in BYTE_U;
							signal SREG_i	: in BYTE;
							
							signal R			: out BYTE_U;
							signal SREG_o	: out BYTE	);
								
	-- A : 10.0
	procedure ANDI  (	signal Rd				: in BYTE_U;
							signal immediate		: in K8;
							signal SREG_i			: in BYTE;
							
							signal R 				: out BYTE_U;
							signal SREG_o			: out BYTE );
								
	-- A : 11.0
	procedure ORR  (	signal Rd, Rr		: in BYTE_U;
							signal SREG_i		: in BYTE;
							
							signal R				: out BYTE_U;
							signal SREG_o		: out BYTE	);
								
	-- A : 12.0
	procedure ORI  (	signal Rd				: in BYTE_U;
							signal immediate		: in K8;
							signal SREG_i			: in BYTE;
							
							signal R 				: out BYTE_U;
							signal SREG_o			: out BYTE );
	
	-- A : 13.0
	procedure EOR  (	signal Rd, Rr		: in BYTE_U;
							signal SREG_i		: in BYTE;
							
							signal R				: out BYTE_U;
							signal SREG_o		: out BYTE	);
								
	-- A : 14.0
	procedure COM  (	signal Rd			: in BYTE_U;
							signal SREG_i		: in BYTE;
							
							signal R				: out BYTE_U;
							signal SREG_o		: out BYTE	);
	
	-- A : 15.0
	procedure NEG  (	signal Rd			: in BYTE_U;
							signal SREG_i		: in BYTE;
							
							signal R				: out BYTE_U;
							signal SREG_o		: out BYTE	);
	
	-- A : 16.0
	procedure SBR  (	signal Rd				: in BYTE_U;
							signal immediate		: in K8;
							signal SREG_i			: in BYTE;
							
							signal R 				: out BYTE_U;
							signal SREG_o			: out BYTE );
	
	-- A : 17.0
	procedure CBR  (	signal Rd				: in BYTE_U;
							signal immediate		: in K8;
							signal SREG_i			: in BYTE;
							
							signal R 				: out BYTE_U;
							signal SREG_o			: out BYTE );
	
	-- A : 18.0
	procedure INC  (	signal Rd				: in BYTE_U;
							signal SREG_i			: in BYTE;
							
							signal R 				: out BYTE_U;
							signal SREG_o			: out BYTE );
	
	-- A : 19.0
	procedure DEC  (	signal Rd				: in BYTE_U;
							signal SREG_i			: in BYTE;
							
							signal R 				: out BYTE_U;
							signal SREG_o			: out BYTE );
	
	-- A : 20.0
	procedure TST  (	signal Rd				: in BYTE_U;
							signal SREG_i			: in BYTE;
							
							signal R 				: out BYTE_U;
							signal SREG_o			: out BYTE );
								
	-- A : 21.0 
	procedure CLR  (	signal Rd				: in BYTE_U;
							signal SREG_i			: in BYTE;
							
							signal R 				: out BYTE_U;
							signal SREG_o			: out BYTE );
								
	-- A : 22.0
	procedure SER  (	signal Rd				: in BYTE_U;
							signal SREG_i			: in BYTE;
							
							signal R 				: out BYTE_U;
							signal SREG_o			: out BYTE );
	
	-- A : 23.0
	procedure MUL (	signal Rd, Rr		: in BYTE_U;
							signal SREG_i		: in BYTE;
							
							signal R				: out BYTE_U;
							signal SREG_o		: out BYTE	);
							
--	-- A : 24.0
--	procedure MULS (	signal Rd, Rr		: in BYTE_U;
--							signal SREG_i		: in BYTE;
--							
--							signal R				: out BYTE_U;
--							signal SREG_o		: out BYTE	);
--							
--	-- A : 25.0
--	procedure MULSU (	signal Rd, Rr		: in BYTE_U;
--							signal SREG_i		: in BYTE;
--							
--							signal R				: out BYTE_U;
--							signal SREG_o		: out BYTE	);
--							
--	-- A : 26.0
--	procedure FMUL (	signal Rd, Rr	: in BYTE;
--							signal R	: out BYTE );
--							
--	-- A : 27.0
--	procedure FMULS (	signal Rd, Rr	: in BYTE;
--							signal R	: out WORD16 );
--							
--	-- A : 28.0
--	procedure FMULSU ( 	signal Rd, Rr	: in BYTE; 
--								signal R 	: out WORD16 );
--								
--	-- A : 29.0
--	procedure DES (	signal K 	: in BYTE );

------------------------------------------------------------------------------------
------------------------Branch instructions-----------------------------------------
------------------------------------------------------------------------------------

--	-- B : 1.0
--	procedure RJMP (	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--	
--	-- B : 2.0
--	procedure IJMP ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- B : 3.0
--	procedure EIJMP ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- B : 4.0
--	procedure RCALL ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- B : 5.0
--	procedure ICALL ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--	
--	-- B : 6.0
--	procedure EICALL ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--	
--	-- B : 7.0
--	procedure CALL ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- B : 8.0
--	procedure RET ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- B : 9.0
--	procedure RETI ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- B : 10.0
--	procedure CPSE ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- B : 11.0
--	procedure CP ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- B : 12.0
--	procedure CPC ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- B : 13.0
--	procedure CPI ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- B : 14.0
--	procedure SBRC ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- B : 15.0
--	procedure SBRS ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- B : 16.0
--	procedure SBIC ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- B : 17.0
--	procedure SBIS ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- B : 18.0
--	procedure BRBS ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- B : 19.0
--	procedure BRBC ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- B : 18.0
--	procedure BREQ ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- B : 19.0
--	procedure BRNE (	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--	
--	-- B : 20.0
--	procedure BRCS ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- B : 21.0
--	procedure BRCC ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- B : 22.0
--	procedure BRSH ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- B : 23.0
--	procedure BRLO ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--	
--	-- B : 24.0
--	procedure BRMI ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--	
--	-- B : 25.0
--	procedure BRPL ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- B : 26.0
--	procedure BRGE ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- B : 27.0
--	procedure BRLT ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- B : 28.0
--	procedure BRHS ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- B : 29.0
--	procedure BRHC ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- B : 30.0
--	procedure BRTS ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- B : 31.0
--	procedure BRTC ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- B : 32.0
--	procedure BRVS ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- B : 33.0
--	procedure BRVC ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- B : 34.0
--	procedure BRIE ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- B : 35.0
--	procedure BRID ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);

------------------------------------------------------------------------------------
------------------------Data transfer instructions----------------------------------
------------------------------------------------------------------------------------
	
--	-- C : 1.0
--	procedure MOV (	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--	
--	-- C : 2.0
--	procedure MOVW ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- C : 3.0
--	procedure LDI ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- C : 4.0
--	procedure LD ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- C : 5.0
--	procedure LDS ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--	
--	-- C : 6.0
--	procedure LDD ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--	
--	-- C : 7.0
--	procedure STS ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- C : 8.0
--	procedure ST ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- C : 9.0
--	procedure STDD ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- C : 10.0
--	procedure LPM ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- C : 11.0
--	procedure ELPM ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- C : 12.0
--	procedure SPM ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- C : 13.0
--	procedure INN ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- C : 14.0
--	procedure OUTT ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- C : 15.0
--	procedure PUSH ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- C : 16.0
--	procedure POP ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- C : 17.0
--	procedure XCH ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- C : 18.0
--	procedure LAS ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- C : 19.0
--	procedure LAC ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- C : 18.0
--	procedure LAT ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
							
------------------------------------------------------------------------------------
------------------------Bit and Bit-test instructions-------------------------------
------------------------------------------------------------------------------------

--	-- D : 1.0
--	procedure LSL (	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--	
--	-- D : 2.0
--	procedure LSR ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- D : 3.0
--	procedure ROLL ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- D : 4.0
--	procedure RORR ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- D : 5.0
--	procedure ASR ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--	
--	-- D : 6.0
--	procedure SWAP ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--	
--	-- D : 7.0
--	procedure SBI ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- D : 8.0
--	procedure CBI ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- D : 9.0
--	procedure BST ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- D : 10.0
--	procedure BLD ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- D : 11.0
--	procedure BSET ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- D : 12.0
--	procedure BCLR ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- D : 13.0
--	procedure SEC ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- D : 14.0
--	procedure CLC ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- D : 15.0
--	procedure SEN ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	--D : 16.0
--	procedure CLN ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- D : 17.0
--	procedure SEZ ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- D : 18.0
--	procedure CLZ ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- D : 19.0
--	procedure SEI ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- D : 18.0
--	procedure CLI ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- D : 19.0
--	procedure SES (	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--	
--	-- D : 20.0
--	procedure CLS ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- D : 21.0
--	procedure SEV ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- D : 22.0
--	procedure CLV ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- D : 23.0
--	procedure SET ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--	
--	-- D : 24.0
--	procedure CLT ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--	
--	-- D : 25.0
--	procedure SEH ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	--D : 26.0
--	procedure CLH ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);

------------------------------------------------------------------------------------
------------------------MCU control instructions-------------------------------
------------------------------------------------------------------------------------

--	-- E : 1.0
--	procedure BREAK (	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--	
--	-- E : 2.0
--	procedure NOP ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);
--							
--	-- E : 3.0
--	procedure SLEEP ( 	signal Rd, Rr	: in BYTE_U;
--								signal SREG_i	: in BYTE;
--								
--								signal R			: out BYTE_U;
--								signal SREG_o	: out BYTE	);
--							
--	-- E : 4.0
--	procedure WDR ( 	signal Rd, Rr	: in BYTE_U;
--							signal SREG_i	: in BYTE;
--							
--							signal R			: out BYTE_U;
--							signal SREG_o	: out BYTE	);	
--							
end instruction_set;


package body instruction_set is
	
	-- Arithmetic and logic instructions
	
	-- A : 1.0
	procedure ADD  ( 	signal Rd, Rr	: in BYTE_U;
							signal SREG_i	: in BYTE;
							
							signal R 		: out BYTE_U;
							signal SREG_o	: out BYTE ) is

		variable tmp_SREG_o 	: BYTE;
		variable tmp_R 		: BYTE_U;
		
	begin
	-- result
		tmp_R 			:= Rd + Rr;
		
	--set flags	
		tmp_SREG_o(H)	:= (Rd(3)and Rr(3))or(Rr(3)and not(Rr(3)))or(not(tmp_R(3))and Rd(3));
		tmp_SREG_o(S)	:= tmp_R(7) xor ((Rd(7)and Rr(7)and not(tmp_R(7)))or(not(Rd(7))and not(Rr(7))and tmp_R(7)));
		tmp_SREG_o(V)	:= (Rd(7)and Rr(7)and not(tmp_R(7)))or(not(Rd(7))and not(Rr(7))and tmp_R(7));
		tmp_SREG_o(N)	:= tmp_R(7);
		tmp_SREG_o(Z)	:= not(tmp_R(7))and not(tmp_R(6))and not(tmp_R(5))and not(tmp_R(4)) and 
								not(tmp_R(3))and not(tmp_R(2))and not(tmp_R(1))and not(tmp_R(0));
		tmp_SREG_o(C)	:= (Rd(7)and Rr(7))or(Rr(7)and not(tmp_R(7)))or(not tmp_R(7)and Rd(7));
		tmp_SREG_o(T)	:= SREG_i(T);
		tmp_SREG_o(I)	:= SREG_i(I);
	
	-- out
		R			<= tmp_R;
		SREG_o	<= tmp_SREG_o; 
	end procedure;
	
	-- A : 2.0
	procedure ADC  (	signal Rd, Rr	: in BYTE_U;
							signal SREG_i	: in BYTE;
							
							signal R			: out BYTE_U;
							signal SREG_o	: out BYTE ) is
							
		variable tmp_SREG_o 	: BYTE 	:= SREG_i;
		variable tmp_R 		: BYTE_U;
		
	begin
	-- result
		tmp_R 			:= Rd + Rr + ("" & SREG_i(C));
		
	--set flags	
		tmp_SREG_o(H)	:= (Rd(3)and Rr(3))or(Rr(3)and not(Rr(3)))or(not(tmp_R(3))and Rd(3));
		tmp_SREG_o(S)	:= tmp_R(7) xor ((Rd(7)and Rr(7)and not(tmp_R(7)))or(not(Rd(7))and not(Rr(7))and tmp_R(7)));
		tmp_SREG_o(V)	:= (Rd(7)and Rr(7)and not(tmp_R(7)))or(not(Rd(7))and not(Rr(7))and tmp_R(7));
		tmp_SREG_o(N)	:= tmp_R(7);
		tmp_SREG_o(Z)	:= not(tmp_R(7))and not(tmp_R(6))and not(tmp_R(5))and not(tmp_R(4)) and 
								not(tmp_R(3))and not(tmp_R(2))and not(tmp_R(1))and not(tmp_R(0));
		tmp_SREG_o(C)	:= (Rd(7)and Rr(7))or(Rr(7)and not(tmp_R(7)))or(not tmp_R(7)and Rd(7));
	
	-- out
		R			<= tmp_R;
		SREG_o	<= tmp_SREG_o; 
	end procedure;
	
	-- A : 3.0
	procedure ADIW	  (	signal Rd				: in HALF_WORD_U;
								signal immediate		: in K6;
								signal SREG_i			: in BYTE;
								
								signal R 				: out HALF_WORD_U;
								signal SREG_o			: out BYTE ) is
								
		variable tmp_SREG_o 	: BYTE 	:= SREG_i;
		variable tmp_R 		: HALF_WORD_U;
		
		variable Rdh 	: BYTE_U := Rd(15 downto 8);
		variable Rdl 	: BYTE_U	:= Rd(7 downto 0);
		
	begin
	-- result
		tmp_R 			:= Rd + immediate;
		
	--set flags	
		tmp_SREG_o(S)	:= tmp_R(15) xor (not(Rdh(7))and(tmp_R(15)));
		tmp_SREG_o(V)	:= not(Rdh(7))and(tmp_R(15));
		tmp_SREG_o(N)	:= tmp_R(15);
		tmp_SREG_o(Z)	:= not(tmp_R(15))and not(tmp_R(14))and not(tmp_R(13))and not(tmp_R(12)) and 
								not(tmp_R(11))and not(tmp_R(10))and not(tmp_R(9))and not(tmp_R(8)) and
								not(tmp_R(7))and not(tmp_R(6))and not(tmp_R(5))and not(tmp_R(4)) and 
								not(tmp_R(3))and not(tmp_R(2))and not(tmp_R(1))and not(tmp_R(0));
		tmp_SREG_o(C)	:= not(tmp_R(15)) and Rdh(7);
	
	-- out
		R			<= tmp_R;
		SREG_o	<= tmp_SREG_o; 
	end procedure;
	
	-- A : 4.0
	procedure SUB  (	signal Rd, Rr	: in BYTE_U;
							signal SREG_i	: in BYTE;
							
							signal R			: out BYTE_U;
							signal SREG_o	: out BYTE	) is
							
		variable tmp_SREG_o 	: BYTE 	:= SREG_i;
		variable tmp_R 		: BYTE_U;
		
	begin
	-- result
		tmp_R 			:= Rd - Rr;
		
	--!!! set flags	
		tmp_SREG_o(H)	:= (Rd(3)and Rr(3))or(Rr(3)and not(Rr(3)))or(not(tmp_R(3))and Rd(3));
		tmp_SREG_o(S)	:= tmp_R(7) xor ((Rd(7)and Rr(7)and not(tmp_R(7)))or(not(Rd(7))and not(Rr(7))and tmp_R(7)));
		tmp_SREG_o(V)	:= (Rd(7)and Rr(7)and not(tmp_R(7)))or(not(Rd(7))and not(Rr(7))and tmp_R(7));
		tmp_SREG_o(N)	:= tmp_R(7);
		tmp_SREG_o(Z)	:= not(tmp_R(7))and not(tmp_R(6))and not(tmp_R(5))and not(tmp_R(4)) and 
								not(tmp_R(3))and not(tmp_R(2))and not(tmp_R(1))and not(tmp_R(0));
		tmp_SREG_o(C)	:= (Rd(7)and Rr(7))or(Rr(7)and not(tmp_R(7)))or(not tmp_R(7)and Rd(7));
	
	-- out
		R			<= tmp_R;
		SREG_o	<= tmp_SREG_o; 
	end procedure;
	

	-- A : 5.0
	procedure SUBI  (	signal Rd				: in BYTE_U;
							signal immediate		: in K8;
							signal SREG_i			: in BYTE;
							
							signal R 				: out BYTE_U;
							signal SREG_o			: out BYTE ) is
						
		variable tmp_SREG_o 	: BYTE 	:= SREG_i;
		variable tmp_R 		: BYTE_U;
		
	begin
	-- result
		tmp_R 			:= Rd - immediate;
		
	--  !!! set flags	
--		tmp_SREG_o(H)	:= (Rd(3)and Rr(3))or(Rr(3)and not(Rr(3)))or(not(tmp_R(3))and Rd(3));
--		tmp_SREG_o(S)	:= tmp_R(7) xor ((Rd(7)and Rr(7)and not(tmp_R(7)))or(not(Rd(7))and not(Rr(7))and tmp_R(7)));
--		tmp_SREG_o(V)	:= (Rd(7)and Rr(7)and not(tmp_R(7)))or(not(Rd(7))and not(Rr(7))and tmp_R(7));
--		tmp_SREG_o(N)	:= tmp_R(7);
--		tmp_SREG_o(Z)	:= not(tmp_R(7))and not(tmp_R(6))and not(tmp_R(5))and not(tmp_R(4)) and 
--								not(tmp_R(3))and not(tmp_R(2))and not(tmp_R(1))and not(tmp_R(0));
--		tmp_SREG_o(C)	:= (Rd(7)and Rr(7))or(Rr(7)and not(tmp_R(7)))or(not tmp_R(7)and Rd(7));
	
	-- out
		R			<= tmp_R;
		SREG_o	<= tmp_SREG_o; 
	end procedure;
	
	-- A : 6.0
	procedure SBC  (	signal Rd, Rr	: in BYTE_U;
							signal SREG_i	: in BYTE;
							
							signal R			: out BYTE_U;
							signal SREG_o	: out BYTE	) is
							
		variable tmp_SREG_o 	: BYTE 	:= SREG_i;
		variable tmp_R 		: BYTE_U;
		
	begin
	-- result
		tmp_R 			:= Rd - Rr - ("" & SREG_i(C));
		
	--set flags	
		tmp_SREG_o(H)	:= (Rd(3)and Rr(3))or(Rr(3)and not(Rr(3)))or(not(tmp_R(3))and Rd(3));
		tmp_SREG_o(S)	:= tmp_R(7) xor ((Rd(7)and Rr(7)and not(tmp_R(7)))or(not(Rd(7))and not(Rr(7))and tmp_R(7)));
		tmp_SREG_o(V)	:= (Rd(7)and Rr(7)and not(tmp_R(7)))or(not(Rd(7))and not(Rr(7))and tmp_R(7));
		tmp_SREG_o(N)	:= tmp_R(7);
		tmp_SREG_o(Z)	:= not(tmp_R(7))and not(tmp_R(6))and not(tmp_R(5))and not(tmp_R(4)) and 
								not(tmp_R(3))and not(tmp_R(2))and not(tmp_R(1))and not(tmp_R(0));
		tmp_SREG_o(C)	:= (Rd(7)and Rr(7))or(Rr(7)and not(tmp_R(7)))or(not tmp_R(7)and Rd(7));
	
	-- out
		R			<= tmp_R;
		SREG_o	<= tmp_SREG_o; 
	end procedure;
	
	
	-- A : 7.0
	procedure SBCI  (	signal Rd				: in BYTE_U;
							signal immediate		: in K8;
							signal SREG_i			: in BYTE;
							
							signal R 				: out BYTE_U;
							signal SREG_o			: out BYTE ) is
	
		variable tmp_SREG_o 	: BYTE 	:= SREG_i;
		variable tmp_R 		: BYTE_U;
		
	begin
	-- result
		tmp_R 			:= Rd - immediate - ("" & SREG_i(C));
		
	--!!! set flags	
--		tmp_SREG_o(H)	:= (Rd(3)and Rr(3))or(Rr(3)and not(Rr(3)))or(not(tmp_R(3))and Rd(3));
--		tmp_SREG_o(S)	:= tmp_R(7) xor ((Rd(7)and Rr(7)and not(tmp_R(7)))or(not(Rd(7))and not(Rr(7))and tmp_R(7)));
--		tmp_SREG_o(V)	:= (Rd(7)and Rr(7)and not(tmp_R(7)))or(not(Rd(7))and not(Rr(7))and tmp_R(7));
--		tmp_SREG_o(N)	:= tmp_R(7);
--		tmp_SREG_o(Z)	:= not(tmp_R(7))and not(tmp_R(6))and not(tmp_R(5))and not(tmp_R(4)) and 
--								not(tmp_R(3))and not(tmp_R(2))and not(tmp_R(1))and not(tmp_R(0));
--		tmp_SREG_o(C)	:= (Rd(7)and Rr(7))or(Rr(7)and not(tmp_R(7)))or(not tmp_R(7)and Rd(7));
	
	-- out
		R			<= tmp_R;
		SREG_o	<= tmp_SREG_o; 
	end procedure;
	
	-- A : 8.0
	procedure SBIW  (	signal Rd				: in HALF_WORD_U;
							signal immediate		: in K6;
							signal SREG_i			: in BYTE;
							
							signal R 				: out HALF_WORD_U;
							signal SREG_o			: out BYTE ) is
								
		variable tmp_SREG_o 	: BYTE 	:= SREG_i;
		variable tmp_R 		: HALF_WORD_U;
		
		variable Rdh 	: BYTE_U := Rd(15 downto 8);
		variable Rdl 	: BYTE_U	:= Rd(7 downto 0);
		
	begin
	-- result
		tmp_R 			:= Rd - immediate;
		
	-- !!! set flags	
		tmp_SREG_o(S)	:= tmp_R(15) xor (not(Rdh(7))and(tmp_R(15)));
		tmp_SREG_o(V)	:= not(Rdh(7))and(tmp_R(15));
		tmp_SREG_o(N)	:= tmp_R(15);
		tmp_SREG_o(Z)	:= not(tmp_R(15))and not(tmp_R(14))and not(tmp_R(13))and not(tmp_R(12)) and 
								not(tmp_R(11))and not(tmp_R(10))and not(tmp_R(9))and not(tmp_R(8)) and
								not(tmp_R(7))and not(tmp_R(6))and not(tmp_R(5))and not(tmp_R(4)) and 
								not(tmp_R(3))and not(tmp_R(2))and not(tmp_R(1))and not(tmp_R(0));
		tmp_SREG_o(C)	:= not(tmp_R(15)) and Rdh(7);
	
	-- out
		R			<= tmp_R;
		SREG_o	<= tmp_SREG_o; 
	end procedure;
	
	-- A : 9.0
	procedure ANDD  (	signal Rd, Rr	: in BYTE_U;
							signal SREG_i	: in BYTE;
							
							signal R			: out BYTE_U;
							signal SREG_o	: out BYTE	) is
							
		variable tmp_SREG_o 	: BYTE 	:= SREG_i;
		variable tmp_R 		: BYTE_U;
		
	begin
	-- result
		tmp_R 			:= Rd and Rr;
		
	-- !!! set flags	
		tmp_SREG_o(H)	:= (Rd(3)and Rr(3))or(Rr(3)and not(Rr(3)))or(not(tmp_R(3))and Rd(3));
		tmp_SREG_o(S)	:= tmp_R(7) xor ((Rd(7)and Rr(7)and not(tmp_R(7)))or(not(Rd(7))and not(Rr(7))and tmp_R(7)));
		tmp_SREG_o(V)	:= (Rd(7)and Rr(7)and not(tmp_R(7)))or(not(Rd(7))and not(Rr(7))and tmp_R(7));
		tmp_SREG_o(N)	:= tmp_R(7);
		tmp_SREG_o(Z)	:= not(tmp_R(7))and not(tmp_R(6))and not(tmp_R(5))and not(tmp_R(4)) and 
								not(tmp_R(3))and not(tmp_R(2))and not(tmp_R(1))and not(tmp_R(0));
		tmp_SREG_o(C)	:= (Rd(7)and Rr(7))or(Rr(7)and not(tmp_R(7)))or(not tmp_R(7)and Rd(7));
	
	-- out
		R			<= tmp_R;
		SREG_o	<= tmp_SREG_o; 
	end procedure;
	
	-- A : 10.0
	procedure ANDI  (	signal Rd				: in BYTE_U;
							signal immediate		: in K8;
							signal SREG_i			: in BYTE;
							
							signal R 				: out BYTE_U;
							signal SREG_o			: out BYTE ) is
							
		variable tmp_SREG_o 	: BYTE 	:= SREG_i;
		variable tmp_R 		: BYTE_U;
		
	begin
	-- result
		tmp_R 			:= Rd and immediate;
		
	--set flags	
--		tmp_SREG_o(S)	:= tmp_R(15) xor (not(Rdh(7))and(tmp_R(15)));
--		tmp_SREG_o(V)	:= not(Rdh(7))and(tmp_R(15));
--		tmp_SREG_o(N)	:= tmp_R(15);
--		tmp_SREG_o(Z)	:= not(tmp_R(15))and not(tmp_R(14))and not(tmp_R(13))and not(tmp_R(12)) and 
--								not(tmp_R(11))and not(tmp_R(10))and not(tmp_R(9))and not(tmp_R(8)) and
--								not(tmp_R(7))and not(tmp_R(6))and not(tmp_R(5))and not(tmp_R(4)) and 
--								not(tmp_R(3))and not(tmp_R(2))and not(tmp_R(1))and not(tmp_R(0));
--		tmp_SREG_o(C)	:= not(tmp_R(15)) and Rdh(7);
	
	-- out
		R			<= tmp_R;
		SREG_o	<= tmp_SREG_o; 
	end procedure;
	
	-- A : 11.0
	procedure ORR  (	signal Rd, Rr	: in BYTE_U;
							signal SREG_i	: in BYTE;
							
							signal R			: out BYTE_U;
							signal SREG_o	: out BYTE	) is
							
		variable tmp_SREG_o 	: BYTE 	:= SREG_i;
		variable tmp_R 		: BYTE_U;
		
	begin
	-- result
		tmp_R 			:= Rd or Rr;
		
	-- !!! set flags	
		tmp_SREG_o(H)	:= (Rd(3)and Rr(3))or(Rr(3)and not(Rr(3)))or(not(tmp_R(3))and Rd(3));
		tmp_SREG_o(S)	:= tmp_R(7) xor ((Rd(7)and Rr(7)and not(tmp_R(7)))or(not(Rd(7))and not(Rr(7))and tmp_R(7)));
		tmp_SREG_o(V)	:= (Rd(7)and Rr(7)and not(tmp_R(7)))or(not(Rd(7))and not(Rr(7))and tmp_R(7));
		tmp_SREG_o(N)	:= tmp_R(7);
		tmp_SREG_o(Z)	:= not(tmp_R(7))and not(tmp_R(6))and not(tmp_R(5))and not(tmp_R(4)) and 
								not(tmp_R(3))and not(tmp_R(2))and not(tmp_R(1))and not(tmp_R(0));
		tmp_SREG_o(C)	:= (Rd(7)and Rr(7))or(Rr(7)and not(tmp_R(7)))or(not tmp_R(7)and Rd(7));
	
	-- out
		R			<= tmp_R;
		SREG_o	<= tmp_SREG_o; 
	end procedure;						
	
	-- A : 12.0
	procedure ORI  (	signal Rd				: in BYTE_U;
							signal immediate		: in K8;
							signal SREG_i			: in BYTE;
							
							signal R 				: out BYTE_U;
							signal SREG_o			: out BYTE ) is
	
		variable tmp_SREG_o 	: BYTE 	:= SREG_i;
		variable tmp_R 		: BYTE_U;
		
	begin
	-- result
		tmp_R 			:= Rd or immediate;
		
	--set flags	
--		tmp_SREG_o(S)	:= tmp_R(15) xor (not(Rdh(7))and(tmp_R(15)));
--		tmp_SREG_o(V)	:= not(Rdh(7))and(tmp_R(15));
--		tmp_SREG_o(N)	:= tmp_R(15);
--		tmp_SREG_o(Z)	:= not(tmp_R(15))and not(tmp_R(14))and not(tmp_R(13))and not(tmp_R(12)) and 
--								not(tmp_R(11))and not(tmp_R(10))and not(tmp_R(9))and not(tmp_R(8)) and
--								not(tmp_R(7))and not(tmp_R(6))and not(tmp_R(5))and not(tmp_R(4)) and 
--								not(tmp_R(3))and not(tmp_R(2))and not(tmp_R(1))and not(tmp_R(0));
--		tmp_SREG_o(C)	:= not(tmp_R(15)) and Rdh(7);
	
	-- out
		R			<= tmp_R;
		SREG_o	<= tmp_SREG_o; 
	end procedure;
	
	-- A : 13.0
	procedure EOR  (	signal Rd, Rr		: in BYTE_U;
							signal SREG_i		: in BYTE;
							
							signal R				: out BYTE_U;
							signal SREG_o		: out BYTE	) is
							
							
		variable tmp_SREG_o 	: BYTE 	:= SREG_i;
		variable tmp_R 		: BYTE_U;
		
	begin
	-- result
		tmp_R 			:= Rd xor Rr;
		
	-- !!! set flags	
		tmp_SREG_o(H)	:= (Rd(3)and Rr(3))or(Rr(3)and not(Rr(3)))or(not(tmp_R(3))and Rd(3));
		tmp_SREG_o(S)	:= tmp_R(7) xor ((Rd(7)and Rr(7)and not(tmp_R(7)))or(not(Rd(7))and not(Rr(7))and tmp_R(7)));
		tmp_SREG_o(V)	:= (Rd(7)and Rr(7)and not(tmp_R(7)))or(not(Rd(7))and not(Rr(7))and tmp_R(7));
		tmp_SREG_o(N)	:= tmp_R(7);
		tmp_SREG_o(Z)	:= not(tmp_R(7))and not(tmp_R(6))and not(tmp_R(5))and not(tmp_R(4)) and 
								not(tmp_R(3))and not(tmp_R(2))and not(tmp_R(1))and not(tmp_R(0));
		tmp_SREG_o(C)	:= (Rd(7)and Rr(7))or(Rr(7)and not(tmp_R(7)))or(not tmp_R(7)and Rd(7));
	
	-- out
		R			<= tmp_R;
		SREG_o	<= tmp_SREG_o; 
	end procedure;			
	
	-- A : 14.0
	procedure COM  (	signal Rd			: in BYTE_U;
							signal SREG_i		: in BYTE;
							
							signal R				: out BYTE_U;
							signal SREG_o		: out BYTE	) is
							
		variable tmp_SREG_o 	: BYTE 	:= SREG_i;
		variable tmp_R 		: BYTE_U;
		
	begin
	-- result
		tmp_R 			:= X"FF" - Rd;
		
	-- !!! set flags	
--		tmp_SREG_o(H)	:= (Rd(3)and Rr(3))or(Rr(3)and not(Rr(3)))or(not(tmp_R(3))and Rd(3));
--		tmp_SREG_o(S)	:= tmp_R(7) xor ((Rd(7)and Rr(7)and not(tmp_R(7)))or(not(Rd(7))and not(Rr(7))and tmp_R(7)));
--		tmp_SREG_o(V)	:= (Rd(7)and Rr(7)and not(tmp_R(7)))or(not(Rd(7))and not(Rr(7))and tmp_R(7));
--		tmp_SREG_o(N)	:= tmp_R(7);
--		tmp_SREG_o(Z)	:= not(tmp_R(7))and not(tmp_R(6))and not(tmp_R(5))and not(tmp_R(4)) and 
--								not(tmp_R(3))and not(tmp_R(2))and not(tmp_R(1))and not(tmp_R(0));
--		tmp_SREG_o(C)	:= (Rd(7)and Rr(7))or(Rr(7)and not(tmp_R(7)))or(not tmp_R(7)and Rd(7));
	
	-- out
		R			<= tmp_R;
		SREG_o	<= tmp_SREG_o; 
	end procedure;	
	
		-- A : 15.0
	procedure NEG  (	signal Rd			: in BYTE_U;
							signal SREG_i		: in BYTE;
							
							signal R				: out BYTE_U;
							signal SREG_o		: out BYTE	) is				
							
		variable tmp_SREG_o 	: BYTE 	:= SREG_i;
		variable tmp_R 		: BYTE_U;
		
	begin
	-- result
		tmp_R 			:= X"00" - Rd;
		
	-- !!! set flags	
--		tmp_SREG_o(H)	:= (Rd(3)and Rr(3))or(Rr(3)and not(Rr(3)))or(not(tmp_R(3))and Rd(3));
--		tmp_SREG_o(S)	:= tmp_R(7) xor ((Rd(7)and Rr(7)and not(tmp_R(7)))or(not(Rd(7))and not(Rr(7))and tmp_R(7)));
--		tmp_SREG_o(V)	:= (Rd(7)and Rr(7)and not(tmp_R(7)))or(not(Rd(7))and not(Rr(7))and tmp_R(7));
--		tmp_SREG_o(N)	:= tmp_R(7);
--		tmp_SREG_o(Z)	:= not(tmp_R(7))and not(tmp_R(6))and not(tmp_R(5))and not(tmp_R(4)) and 
--								not(tmp_R(3))and not(tmp_R(2))and not(tmp_R(1))and not(tmp_R(0));
--		tmp_SREG_o(C)	:= (Rd(7)and Rr(7))or(Rr(7)and not(tmp_R(7)))or(not tmp_R(7)and Rd(7));
	
	-- out
		R			<= tmp_R;
		SREG_o	<= tmp_SREG_o; 
	end procedure;	
	
		-- A : 16.0
	procedure SBR  (	signal Rd				: in BYTE_U;
							signal immediate		: in K8;
							signal SREG_i			: in BYTE;
							
							signal R 				: out BYTE_U;
							signal SREG_o			: out BYTE ) is
							
							
		variable tmp_SREG_o 	: BYTE 	:= SREG_i;
		variable tmp_R 		: BYTE_U;
		
	begin
	-- result
		tmp_R 			:= Rd or immediate;
		
	-- !!! set flags	
--		tmp_SREG_o(H)	:= (Rd(3)and Rr(3))or(Rr(3)and not(Rr(3)))or(not(tmp_R(3))and Rd(3));
--		tmp_SREG_o(S)	:= tmp_R(7) xor ((Rd(7)and Rr(7)and not(tmp_R(7)))or(not(Rd(7))and not(Rr(7))and tmp_R(7)));
--		tmp_SREG_o(V)	:= (Rd(7)and Rr(7)and not(tmp_R(7)))or(not(Rd(7))and not(Rr(7))and tmp_R(7));
--		tmp_SREG_o(N)	:= tmp_R(7);
--		tmp_SREG_o(Z)	:= not(tmp_R(7))and not(tmp_R(6))and not(tmp_R(5))and not(tmp_R(4)) and 
--								not(tmp_R(3))and not(tmp_R(2))and not(tmp_R(1))and not(tmp_R(0));
--		tmp_SREG_o(C)	:= (Rd(7)and Rr(7))or(Rr(7)and not(tmp_R(7)))or(not tmp_R(7)and Rd(7));
	
	-- out
		R			<= tmp_R;
		SREG_o	<= tmp_SREG_o; 
	end procedure;	
	
	-- A : 17.0
	procedure CBR  (	signal Rd				: in BYTE_U;
							signal immediate		: in K8;
							signal SREG_i			: in BYTE;
							
							signal R 				: out BYTE_U;
							signal SREG_o			: out BYTE ) is
							
		variable tmp_SREG_o 	: BYTE 	:= SREG_i;
		variable tmp_R 		: BYTE_U;
		
	begin
	-- result
		tmp_R 			:= Rd and (x"FF" - immediate);
		
	-- !!! set flags	
--		tmp_SREG_o(H)	:= (Rd(3)and Rr(3))or(Rr(3)and not(Rr(3)))or(not(tmp_R(3))and Rd(3));
--		tmp_SREG_o(S)	:= tmp_R(7) xor ((Rd(7)and Rr(7)and not(tmp_R(7)))or(not(Rd(7))and not(Rr(7))and tmp_R(7)));
--		tmp_SREG_o(V)	:= (Rd(7)and Rr(7)and not(tmp_R(7)))or(not(Rd(7))and not(Rr(7))and tmp_R(7));
--		tmp_SREG_o(N)	:= tmp_R(7);
--		tmp_SREG_o(Z)	:= not(tmp_R(7))and not(tmp_R(6))and not(tmp_R(5))and not(tmp_R(4)) and 
--								not(tmp_R(3))and not(tmp_R(2))and not(tmp_R(1))and not(tmp_R(0));
--		tmp_SREG_o(C)	:= (Rd(7)and Rr(7))or(Rr(7)and not(tmp_R(7)))or(not tmp_R(7)and Rd(7));
	
	-- out
		R			<= tmp_R;
		SREG_o	<= tmp_SREG_o; 
	end procedure;	
	
	-- A : 18.0
	procedure INC  (	signal Rd				: in BYTE_U;
							signal SREG_i			: in BYTE;
							
							signal R 				: out BYTE_U;
							signal SREG_o			: out BYTE ) is
							
	
		variable tmp_SREG_o 	: BYTE 	:= SREG_i;
		variable tmp_R 		: BYTE_U;
		
	begin
	-- result
		tmp_R 			:= Rd + 1;
		
	-- !!! set flags	
--		tmp_SREG_o(H)	:= (Rd(3)and Rr(3))or(Rr(3)and not(Rr(3)))or(not(tmp_R(3))and Rd(3));
--		tmp_SREG_o(S)	:= tmp_R(7) xor ((Rd(7)and Rr(7)and not(tmp_R(7)))or(not(Rd(7))and not(Rr(7))and tmp_R(7)));
--		tmp_SREG_o(V)	:= (Rd(7)and Rr(7)and not(tmp_R(7)))or(not(Rd(7))and not(Rr(7))and tmp_R(7));
--		tmp_SREG_o(N)	:= tmp_R(7);
--		tmp_SREG_o(Z)	:= not(tmp_R(7))and not(tmp_R(6))and not(tmp_R(5))and not(tmp_R(4)) and 
--								not(tmp_R(3))and not(tmp_R(2))and not(tmp_R(1))and not(tmp_R(0));
--		tmp_SREG_o(C)	:= (Rd(7)and Rr(7))or(Rr(7)and not(tmp_R(7)))or(not tmp_R(7)and Rd(7));
	
	-- out
		R			<= tmp_R;
		SREG_o	<= tmp_SREG_o; 
	end procedure;	
	
	-- A : 19.0
	procedure DEC  (	signal Rd				: in BYTE_U;
							signal SREG_i			: in BYTE;
							
							signal R 				: out BYTE_U;
							signal SREG_o			: out BYTE ) is
	
		variable tmp_SREG_o 	: BYTE 	:= SREG_i;
		variable tmp_R 		: BYTE_U;
		
	begin
	-- result
		tmp_R 			:= Rd - 1;
		
	-- !!! set flags	
--		tmp_SREG_o(H)	:= (Rd(3)and Rr(3))or(Rr(3)and not(Rr(3)))or(not(tmp_R(3))and Rd(3));
--		tmp_SREG_o(S)	:= tmp_R(7) xor ((Rd(7)and Rr(7)and not(tmp_R(7)))or(not(Rd(7))and not(Rr(7))and tmp_R(7)));
--		tmp_SREG_o(V)	:= (Rd(7)and Rr(7)and not(tmp_R(7)))or(not(Rd(7))and not(Rr(7))and tmp_R(7));
--		tmp_SREG_o(N)	:= tmp_R(7);
--		tmp_SREG_o(Z)	:= not(tmp_R(7))and not(tmp_R(6))and not(tmp_R(5))and not(tmp_R(4)) and 
--								not(tmp_R(3))and not(tmp_R(2))and not(tmp_R(1))and not(tmp_R(0));
--		tmp_SREG_o(C)	:= (Rd(7)and Rr(7))or(Rr(7)and not(tmp_R(7)))or(not tmp_R(7)and Rd(7));
	
	-- out
		R			<= tmp_R;
		SREG_o	<= tmp_SREG_o; 
	end procedure;	
	
	-- A : 20.0
	procedure TST  (	signal Rd				: in BYTE_U;
							signal SREG_i			: in BYTE;
							
							signal R 				: out BYTE_U;
							signal SREG_o			: out BYTE ) is
							
		variable tmp_SREG_o 	: BYTE 	:= SREG_i;
		variable tmp_R 		: BYTE_U;
		
	begin
	-- result
		tmp_R 			:= Rd and Rd;
		
	-- !!! set flags	
--		tmp_SREG_o(H)	:= (Rd(3)and Rr(3))or(Rr(3)and not(Rr(3)))or(not(tmp_R(3))and Rd(3));
--		tmp_SREG_o(S)	:= tmp_R(7) xor ((Rd(7)and Rr(7)and not(tmp_R(7)))or(not(Rd(7))and not(Rr(7))and tmp_R(7)));
--		tmp_SREG_o(V)	:= (Rd(7)and Rr(7)and not(tmp_R(7)))or(not(Rd(7))and not(Rr(7))and tmp_R(7));
--		tmp_SREG_o(N)	:= tmp_R(7);
--		tmp_SREG_o(Z)	:= not(tmp_R(7))and not(tmp_R(6))and not(tmp_R(5))and not(tmp_R(4)) and 
--								not(tmp_R(3))and not(tmp_R(2))and not(tmp_R(1))and not(tmp_R(0));
--		tmp_SREG_o(C)	:= (Rd(7)and Rr(7))or(Rr(7)and not(tmp_R(7)))or(not tmp_R(7)and Rd(7));
	
	-- out
		R			<= tmp_R;
		SREG_o	<= tmp_SREG_o; 
	end procedure;	
	
	-- A : 21.0 
	procedure CLR  (	signal Rd				: in BYTE_U;
							signal SREG_i			: in BYTE;
							
							signal R 				: out BYTE_U;
							signal SREG_o			: out BYTE ) is
							
		variable tmp_SREG_o 	: BYTE 	:= SREG_i;
		variable tmp_R 		: BYTE_U;
		
	begin
	-- result
		tmp_R 			:= Rd xor Rd;
		
	-- !!! set flags	
--		tmp_SREG_o(H)	:= (Rd(3)and Rr(3))or(Rr(3)and not(Rr(3)))or(not(tmp_R(3))and Rd(3));
--		tmp_SREG_o(S)	:= tmp_R(7) xor ((Rd(7)and Rr(7)and not(tmp_R(7)))or(not(Rd(7))and not(Rr(7))and tmp_R(7)));
--		tmp_SREG_o(V)	:= (Rd(7)and Rr(7)and not(tmp_R(7)))or(not(Rd(7))and not(Rr(7))and tmp_R(7));
--		tmp_SREG_o(N)	:= tmp_R(7);
--		tmp_SREG_o(Z)	:= not(tmp_R(7))and not(tmp_R(6))and not(tmp_R(5))and not(tmp_R(4)) and 
--								not(tmp_R(3))and not(tmp_R(2))and not(tmp_R(1))and not(tmp_R(0));
--		tmp_SREG_o(C)	:= (Rd(7)and Rr(7))or(Rr(7)and not(tmp_R(7)))or(not tmp_R(7)and Rd(7));
	
	-- out
		R			<= tmp_R;
		SREG_o	<= tmp_SREG_o; 
	end procedure;	
	
	-- A : 22.0
	procedure SER  (	signal Rd				: in BYTE_U;
							signal SREG_i			: in BYTE;
							
							signal R 				: out BYTE_U;
							signal SREG_o			: out BYTE ) is
							
		variable tmp_SREG_o 	: BYTE 	:= SREG_i;
		variable tmp_R 		: BYTE_U;
		
	begin
	-- result
		tmp_R 			:= X"FF";
		
	-- !!! set flags	
--		tmp_SREG_o(H)	:= (Rd(3)and Rr(3))or(Rr(3)and not(Rr(3)))or(not(tmp_R(3))and Rd(3));
--		tmp_SREG_o(S)	:= tmp_R(7) xor ((Rd(7)and Rr(7)and not(tmp_R(7)))or(not(Rd(7))and not(Rr(7))and tmp_R(7)));
--		tmp_SREG_o(V)	:= (Rd(7)and Rr(7)and not(tmp_R(7)))or(not(Rd(7))and not(Rr(7))and tmp_R(7));
--		tmp_SREG_o(N)	:= tmp_R(7);
--		tmp_SREG_o(Z)	:= not(tmp_R(7))and not(tmp_R(6))and not(tmp_R(5))and not(tmp_R(4)) and 
--								not(tmp_R(3))and not(tmp_R(2))and not(tmp_R(1))and not(tmp_R(0));
--		tmp_SREG_o(C)	:= (Rd(7)and Rr(7))or(Rr(7)and not(tmp_R(7)))or(not tmp_R(7)and Rd(7));
	
	-- out
		R			<= tmp_R;
		SREG_o	<= tmp_SREG_o; 
	end procedure;	
	
	-- A : 23.0
	procedure MUL (	signal Rd, Rr		: in BYTE_U;
							signal SREG_i		: in BYTE;
							
							signal R				: out HALF_WORD_U;
							signal SREG_o		: out BYTE	) is
							
	
		variable tmp_SREG_o 	: BYTE 	:= SREG_i;
		variable tmp_R 		: HALF_WORD_U;
		
	begin
	-- result
		tmp_R 			:= Rd * Rr;
		
	-- !!! set flags	
--		tmp_SREG_o(H)	:= (Rd(3)and Rr(3))or(Rr(3)and not(Rr(3)))or(not(tmp_R(3))and Rd(3));
--		tmp_SREG_o(S)	:= tmp_R(7) xor ((Rd(7)and Rr(7)and not(tmp_R(7)))or(not(Rd(7))and not(Rr(7))and tmp_R(7)));
--		tmp_SREG_o(V)	:= (Rd(7)and Rr(7)and not(tmp_R(7)))or(not(Rd(7))and not(Rr(7))and tmp_R(7));
--		tmp_SREG_o(N)	:= tmp_R(7);
--		tmp_SREG_o(Z)	:= not(tmp_R(7))and not(tmp_R(6))and not(tmp_R(5))and not(tmp_R(4)) and 
--								not(tmp_R(3))and not(tmp_R(2))and not(tmp_R(1))and not(tmp_R(0));
--		tmp_SREG_o(C)	:= (Rd(7)and Rr(7))or(Rr(7)and not(tmp_R(7)))or(not tmp_R(7)and Rd(7));
	
	-- out
		R			<= tmp_R;
		SREG_o	<= tmp_SREG_o; 
	end procedure;	
	
	-- A : 24.0
--	procedure MULS (	signal Rd, Rr		: in BYTE_U;
--							signal SREG_i		: in BYTE;
--							
--							signal R				: out BYTE_U;
--							signal SREG_o		: out BYTE	) is
--	
--		variable tmp_SREG_o 	: BYTE 	:= SREG_i;
--		
--		variable tmp_Rd 		: BYTE_S := to_signed(Rd);
--		variable tmp_Rr 		: BYTE_S	:= to_signed(Rr);
--		variable tmp_R 		: HALF_WORD_S;
--		
--	begin
--	-- result
--		tmp_R 			:= tmp_Rd * tmp_Rr;
--	-- !!! set flags	
--		
----		tmp_SREG_o(H)	:= (Rd(3)and Rr(3))or(Rr(3)and not(Rr(3)))or(not(tmp_R(3))and Rd(3));
----		tmp_SREG_o(S)	:= tmp_R(7) xor ((Rd(7)and Rr(7)and not(tmp_R(7)))or(not(Rd(7))and not(Rr(7))and tmp_R(7)));
----		tmp_SREG_o(V)	:= (Rd(7)and Rr(7)and not(tmp_R(7)))or(not(Rd(7))and not(Rr(7))and tmp_R(7));
----		tmp_SREG_o(N)	:= tmp_R(7);
----		tmp_SREG_o(Z)	:= not(tmp_R(7))and not(tmp_R(6))and not(tmp_R(5))and not(tmp_R(4)) and 
----								not(tmp_R(3))and not(tmp_R(2))and not(tmp_R(1))and not(tmp_R(0));
----		tmp_SREG_o(C)	:= (Rd(7)and Rr(7))or(Rr(7)and not(tmp_R(7)))or(not tmp_R(7)and Rd(7));
--	
--	-- out
--		R			<= to_unsigned(tmp_R);
--		SREG_o	<= tmp_SREG_o;
--	end procedure;
--	
--	-- A : 25.0
--	procedure MULSU (	signal Rd, Rr		: in BYTE_U;
--							signal SREG_i		: in BYTE;
--							
--							signal R				: out BYTE_U;
--							signal SREG_o		: out BYTE	) is
--	
--		variable tmp_SREG_o 	: BYTE 	:= SREG_i;
--		
--		variable tmp_Rd 		: BYTE_S := to_signed(Rd);
----		variable tmp_Rr 		: BYTE_U	:= signed(Rr);
--		variable tmp_R 		: HALF_WORD_S;
--		
--	begin
--	-- result
--		tmp_R 			:= tmp_Rd * Rr;
--	-- !!! set flags	
--		
----		tmp_SREG_o(H)	:= (Rd(3)and Rr(3))or(Rr(3)and not(Rr(3)))or(not(tmp_R(3))and Rd(3));
----		tmp_SREG_o(S)	:= tmp_R(7) xor ((Rd(7)and Rr(7)and not(tmp_R(7)))or(not(Rd(7))and not(Rr(7))and tmp_R(7)));
----		tmp_SREG_o(V)	:= (Rd(7)and Rr(7)and not(tmp_R(7)))or(not(Rd(7))and not(Rr(7))and tmp_R(7));
----		tmp_SREG_o(N)	:= tmp_R(7);
----		tmp_SREG_o(Z)	:= not(tmp_R(7))and not(tmp_R(6))and not(tmp_R(5))and not(tmp_R(4)) and 
----								not(tmp_R(3))and not(tmp_R(2))and not(tmp_R(1))and not(tmp_R(0));
----		tmp_SREG_o(C)	:= (Rd(7)and Rr(7))or(Rr(7)and not(tmp_R(7)))or(not tmp_R(7)and Rd(7));
--	
--	-- out
--		R			<= to_unsigned(tmp_R);
--		SREG_o	<= tmp_SREG_o;
--	end procedure;
end package body;