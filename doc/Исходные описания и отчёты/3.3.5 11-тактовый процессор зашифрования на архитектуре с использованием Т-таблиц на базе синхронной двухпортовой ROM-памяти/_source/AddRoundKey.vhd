library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AddRoundKey is
    Port ( input : in  STD_LOGIC_VECTOR(0 to 127);
			  round_key : in  STD_LOGIC_VECTOR(0 to 127);
           output : out  STD_LOGIC_VECTOR(0 to 127)
			 );
end AddRoundKey;

architecture AddRoundKey_architecture of AddRoundKey is

begin

	output <= input xor round_key;

end AddRoundKey_architecture;