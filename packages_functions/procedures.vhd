--synthesize library my_lib
library ieee, my_lib;

use 	ieee.std_logic_1164.all,
		my_lib.types.all;

package procedures is
	-- Id: A.1
	procedure push (	signal SP 		: in word16;
							signal data		: in word8;
							signal memory	: out std_logic_vector);
	-- pushes data to stack, pointed by stack pointer
	
	
end procedure;

package body procedures is
	procedure push (	SP 		: in word16;
							data		: in word8;
							memory	: out reg_array_type) is
	begin
		memory(SP)	<= data;
	end procedure;
end package body;