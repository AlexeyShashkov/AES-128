library ieee;
use ieee.std_logic_1164.all;

entity AddRoundKey is

    port (input     : in   std_logic_vector(0 to 127);
          round_key : in   std_logic_vector(0 to 127);
          output    : out  std_logic_vector(0 to 127));

end AddRoundKey;

architecture AddRoundKey_architecture of AddRoundKey is

begin

    output <= input xor round_key;

end AddRoundKey_architecture;
