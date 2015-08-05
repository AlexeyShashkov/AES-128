library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RoundEncryptDecrypt is
	port ( ROUND_KEY : in  STD_LOGIC_VECTOR(0 to 127);
			 ROUND_NUMBER : in STD_LOGIC_VECTOR(3 downto 0);
			 INPUT : in STD_LOGIC_VECTOR(0 to 127);
			 FB_INPUT : in STD_LOGIC_VECTOR(0 to 127);
			 INIT_INPUT : in  STD_LOGIC;
			 ENCR_DECR : in  STD_LOGIC;			 			 
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
	
	component InvSubBytes
		Port ( input : in STD_LOGIC_VECTOR(0 to 127);
				 output : out STD_LOGIC_VECTOR(0 to 127)
				);
	end component;
	
	component InvShiftRows
		Port ( input : in STD_LOGIC_VECTOR(0 to 127);
				 output : out STD_LOGIC_VECTOR(0 to 127)
				);
	end component;
	
	component InvMixColumns
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

	signal b0, b1, b2, b3: STD_LOGIC_VECTOR(0 to 127) := (others => '0');
	signal d0, d1, d2, d3: STD_LOGIC_VECTOR(0 to 127) := (others => '0');
	signal m1, m2, m3: STD_LOGIC_VECTOR(0 to 127) := (others => '0');
	
	signal tmp: STD_LOGIC;
	
begin
		
	en_1: SubBytes port map (
			input => FB_INPUT,
			output => b0
		);
		
	en_2: ShiftRows port map (
			input => b0,
			output => b1
		);
		
	en_3: MixColumns port map (
			input => b1,
			output => b2
		);
		

	en_4: process(ROUND_NUMBER, b1, b2)
	begin
	
		case ROUND_NUMBER is
		
			when "0000" => m1 <= b1;
			
			when others => m1 <= b2;
			
		end case;
	
	end process;
	
	
	en_5: process(INIT_INPUT, INPUT, m1)
	begin
	
		case INIT_INPUT is
		
			when '1' => m2 <= INPUT;
			
			when others => m2 <= m1;
			
		end case;
	
	end process;
	
	
	en_6: AddRoundKey port map (
		input => m2,
		round_key => ROUND_KEY,
		output => b3
	);



	de_1: InvShiftRows port map (
			input => FB_INPUT,
			output => d0
		);
	
	de_2: InvSubBytes port map (
			input => d0,
			output => d1
		);

	de_3: AddRoundKey port map (
			input => d1,
			round_key => ROUND_KEY,
			output => d2
		);	
	
	de_4: InvMixColumns port map (
			input => d2,
			output => d3
		);	


	de_5: process(ROUND_NUMBER, d2, d3)
	begin
	
		case ROUND_NUMBER is
		
			when "0000" => m3 <= d2;
			
			when others => m3 <= d3;
			
		end case;
	
	end process;

	
	tmp_sel: process(ENCR_DECR, ROUND_NUMBER)
	begin

		if (ROUND_NUMBER = "0001") or (ENCR_DECR = '1')  then	
		
				tmp <= '1';
				
		else	
		
				tmp <= '0';
				
		end if;
	
	end process;


	select_output: process(tmp, b3, m3)
	begin

		if tmp = '1'  then	
		
				OUTPUT <= b3;
				
		else	
		
				OUTPUT <= m3;
				
		end if;
	
	end process;	

end RoundEncryptDecrypt_architecture;