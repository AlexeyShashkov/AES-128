library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Rcon_zero_row is
    Port ( input : STD_LOGIC_VECTOR (3 downto 0);
           output : out  STD_LOGIC_VECTOR (7 downto 0)
			 );
end Rcon_zero_row;

architecture Rcon_zero_row_architecture of Rcon_zero_row is

begin

	substitute: process(input)	
	begin
	
			case input is

					when "0000" => output <= X"01";
					when "0001" => output <= X"02";
					when "0010" => output <= X"04";
					when "0011" => output <= X"08";
					when "0100" => output <= X"10";
					when "0101" => output <= X"20";
					when "0110" => output <= X"40";
					when "0111" => output <= X"80";
					when "1000" => output <= X"1B";
					when "1001" => output <= X"36";
				
					when others => output <= X"01";
				
			end case;
		
	end process;

end Rcon_zero_row_architecture;