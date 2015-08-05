library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RoundEncryptDecrypt is
	port ( CLK : in std_logic;
			 ENABLE : in std_logic;
			 ROUND_KEY : in  STD_LOGIC_VECTOR(0 to 127);
			 ROUND_KEY_10 : in  STD_LOGIC_VECTOR(0 to 127);
			 INPUT : in STD_LOGIC_VECTOR(0 to 127);
			 INIT_INPUT : in  STD_LOGIC;		 			 
			 OUTPUT : out  STD_LOGIC_VECTOR(0 to 127)
			);
end RoundEncryptDecrypt;

architecture RoundEncryptDecrypt_architecture of RoundEncryptDecrypt is

	component SubBytes
		Port ( input : in STD_LOGIC_VECTOR(0 to 127);
				 output : out STD_LOGIC_VECTOR(0 to 127)
				);
	end component;
	
	component ShiftRows
		Port ( input : in STD_LOGIC_VECTOR(0 to 127);
				 output : out STD_LOGIC_VECTOR(0 to 127)
				);
	end component;
	
	component MixColumns
		Port ( input : in STD_LOGIC_VECTOR(0 to 127);
				 output : out STD_LOGIC_VECTOR(0 to 127)
				);
	end component;
	
	component AddRoundKey
		Port ( input : in  STD_LOGIC_VECTOR(0 to 127);
				 round_key : in  STD_LOGIC_VECTOR(0 to 127);
				 output : out  STD_LOGIC_VECTOR(0 to 127)
				);
	end component;

	signal a0, b0, b1, b2: STD_LOGIC_VECTOR(0 to 127) := (others => '0');
	signal m1, m2: STD_LOGIC_VECTOR(0 to 127) := (others => '0');
	
begin

	en_0: process(INIT_INPUT, INPUT, m1)
	begin
	
		case INIT_INPUT is
		
			when '1' => m2 <= INPUT;
			
			when others => m2 <= m1;
			
		end case;
	
	end process;


	en_1: AddRoundKey port map (
		input => m2,
		round_key => ROUND_KEY,
		output => a0
	);
		
	en_2: SubBytes port map (
			input => a0,
			output => b0
		);
		
	en_3: ShiftRows port map (
			input => b0,
			output => b1
		);
		
	en_4: MixColumns port map (
			input => b1,
			output => b2
		);

	en_5: AddRoundKey port map (
		input => b1,
		round_key => ROUND_KEY_10,
		output => OUTPUT
	);
		

    en_6: process (CLK)
    begin
	 
        if (CLK'event and CLK='1') then
				
					if ENABLE = '1' then
					
							m1 <= b2;
							
					end if;
				
        end if;
		  
    end process;


end RoundEncryptDecrypt_architecture;