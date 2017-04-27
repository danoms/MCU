--synthesize library my_context;

context mcu_context is
	library ieee;

	use 	ieee.std_logic_1164.all,
			ieee.numeric_std.all;

	use 	my_lib.components.all,
			my_lib.constants.all,
			my_lib.types.all;
	
	
end context;