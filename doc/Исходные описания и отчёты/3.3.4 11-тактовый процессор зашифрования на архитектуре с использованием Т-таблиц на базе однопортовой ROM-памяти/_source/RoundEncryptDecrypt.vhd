library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RoundEncryptDecrypt is
	port ( ROUND_KEY : in  STD_LOGIC_VECTOR(0 to 127);
			 ROUND_NUMBER : in STD_LOGIC_VECTOR(3 downto 0);
			 INPUT : in STD_LOGIC_VECTOR(0 to 127);
			 FB_INPUT : in STD_LOGIC_VECTOR(0 to 127);
			 INIT_INPUT : in  STD_LOGIC;		 			 
			 OUTPUT : out  STD_LOGIC_VECTOR(0 to 127)
			);
end RoundEncryptDecrypt;

architecture RoundEncryptDecrypt_architecture of RoundEncryptDecrypt is

	component ShiftRows
		Port ( input : in STD_LOGIC_VECTOR(0 to 127);
				 output : out STD_LOGIC_VECTOR(0 to 127)
				);
	end component;
	
	component T_Box_Module
		 port ( input : in  STD_LOGIC_VECTOR (0 to 127);
				  ROUND_NUMBER : in STD_LOGIC_VECTOR(3 downto 0);
				  output : out  STD_LOGIC_VECTOR (0 to 127)
				 );
	end component;
	
	component AddRoundKey
		Port ( input : in  STD_LOGIC_VECTOR(0 to 127);
				 round_key : in  STD_LOGIC_VECTOR(0 to 127);
				 output : out  STD_LOGIC_VECTOR(0 to 127)
				);
	end component;

	signal b0, b1, m1: STD_LOGIC_VECTOR(0 to 127) := (others => '0');
	
begin
			
	en_1: ShiftRows port map (
			input => FB_INPUT,
			output => b0
		);
		

	en_2: T_Box_Module port map (
			input => b0,
			ROUND_NUMBER => ROUND_NUMBER,
			output => b1
		);
		
		
	en_3: process(INIT_INPUT, INPUT, b1)
	begin
	
		case INIT_INPUT is
		
			when '1' => m1 <= INPUT;
			
			when others => m1 <= b1;
			
		end case;
	
	end process;
	
	
	en_4: AddRoundKey port map (
		input => m1,
		round_key => ROUND_KEY,
		output => OUTPUT
	);
	

end RoundEncryptDecrypt_architecture;