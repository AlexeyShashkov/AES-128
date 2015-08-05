library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Xtime_3times is
    Port ( input : in  STD_LOGIC_VECTOR (7 downto 0);
           xt_x1 : out  STD_LOGIC_VECTOR (7 downto 0);
			  xt_x2 : out  STD_LOGIC_VECTOR (7 downto 0);
			  xt_x3 : out  STD_LOGIC_VECTOR (7 downto 0)
			 );
end Xtime_3times;

architecture Xtime_3times_architecture of Xtime_3times is

	component Xtime
		Port(
			  input : in  STD_LOGIC_VECTOR(7 downto 0);
			  output : out  STD_LOGIC_VECTOR(7 downto 0)
			  );
	end component;

	signal w1, w2, w3: STD_LOGIC_VECTOR (7 downto 0) := (others => '0');

begin

	serial_1: Xtime port map (
					input => input,
					output => w1
			 );
			 
	serial_2: Xtime port map (
					input => w1,
					output => w2
			 );
			 
	serial_3: Xtime port map (
					input => w2,
					output => w3
			 );
			 
	xt_x1 <= w1;
	xt_x2 <= w2;
	xt_x3 <= w3;	

end Xtime_3times_architecture;