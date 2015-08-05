library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SubBytes is
	port ( input : in STD_LOGIC_VECTOR(0 to 127);
          output : out STD_LOGIC_VECTOR(0 to 127)
		   );
end SubBytes;

architecture SubBytes_architecture of SubBytes is

	component S_Box
		Port ( input : in  STD_LOGIC_VECTOR(7 downto 0);
			    output : out  STD_LOGIC_VECTOR(7 downto 0)
				);
	end component;
	
	signal w: STD_LOGIC_VECTOR(0 to 127) := (others => '0');

begin

	generate_for_each_byte:
		for i in 0 to 15 generate
			begin
				substitute: S_Box port map (
									input => input(8*i to 8*i+7),
									output => w(8*i to 8*i+7)
								  );
	end generate;

	output <= w;
	
end SubBytes_architecture;