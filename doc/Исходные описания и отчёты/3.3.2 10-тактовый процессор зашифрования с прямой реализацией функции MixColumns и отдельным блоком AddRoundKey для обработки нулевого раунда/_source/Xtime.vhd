library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Xtime is
    Port ( input : in  STD_LOGIC_VECTOR (7 downto 0);
           output : out  STD_LOGIC_VECTOR (7 downto 0)
			 );
end Xtime;

architecture Xtime_architecture of Xtime is

	signal l_shift_input: STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
	signal cond_x1b_xor: STD_LOGIC_VECTOR (7 downto 0) := (others => '0');

begin

	l_shift_input <= input(6 downto 0) & '0';

	select_output: process(input, l_shift_input)	
	begin
	
		if input(7) = '0' then
		
			cond_x1b_xor <= l_shift_input;
			
		else
		
			cond_x1b_xor <= l_shift_input xor X"1B";
			
		end if;
	
	end process;

	output <= cond_x1b_xor;

end Xtime_architecture;