library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ShiftRows is
	Port ( input : in STD_LOGIC_VECTOR(0 to 127);
          output : out STD_LOGIC_VECTOR(0 to 127)
		   );
end ShiftRows;

architecture ShiftRows_architecture of ShiftRows is

begin

	output(0 to 7) <= input(0 to 7);
	output(8 to 15) <= input(40 to 47);
	output(16 to 23) <= input(80 to 87);
	output(24 to 31) <= input(120 to 127);
	
	output(32 to 39) <= input(32 to 39);
	output(40 to 47) <= input(72 to 79);
	output(48 to 55) <= input(112 to 119);
	output(56 to 63) <= input(24 to 31);
	
	output(64 to 71) <= input(64 to 71);
	output(72 to 79) <= input(104 to 111);
	output(80 to 87) <= input(16 to 23);
	output(88 to 95) <= input(56 to 63);
	
	output(96 to 103) <= input(96 to 103);
	output(104 to 111) <= input(8 to 15);
	output(112 to 119) <= input(48 to 55);
	output(120 to 127) <= input(88 to 95);

end ShiftRows_architecture;