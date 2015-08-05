library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_Inv is
	port ( R : in STD_LOGIC_VECTOR (3 downto 0);
			 SEL : in STD_LOGIC;
			 ENCR_DECR : in STD_LOGIC;			 			 
			 OUTPUT : out STD_LOGIC_VECTOR (3 downto 0)
			);
end MUX_Inv;

architecture MUX_Inv_architecture of MUX_Inv is

begin

    process (SEL, ENCR_DECR, R)
    begin
	  
			if ( ENCR_DECR = '0' and SEL = '1' ) then
			
					case R is

							when "0000" => OUTPUT <= "1010";
							when "0001" => OUTPUT <= "1001";
							when "0010" => OUTPUT <= "1000";
							when "0011" => OUTPUT <= "0111";
							when "0100" => OUTPUT <= "0110";
							when "0101" => OUTPUT <= "0101";
							when "0110" => OUTPUT <= "0100";
							when "0111" => OUTPUT <= "0011";
							when "1000" => OUTPUT <= "0010";
							when "1001" => OUTPUT <= "0001";
							when "1010" => OUTPUT <= "0000";

							when others => OUTPUT <= "1010";
						
					end case;

			else
			
					OUTPUT <= R;
			
			end if;
		  
    end process;

end MUX_Inv_architecture;