library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity KeySchedule is
	Port ( prev_key : in  STD_LOGIC_VECTOR(0 to 127);
			 round_number : in STD_LOGIC_VECTOR (3 downto 0);
          round_key : out  STD_LOGIC_VECTOR(0 to 127)
			);
end KeySchedule;

architecture KeySchedule_architecture of KeySchedule is

	component S_Box
		Port ( input : in  STD_LOGIC_VECTOR(7 downto 0);
				 output : out  STD_LOGIC_VECTOR(7 downto 0)
				);
	end component;
	
	component Rcon_zero_row
		Port ( input : STD_LOGIC_VECTOR (3 downto 0);
				 output : out  STD_LOGIC_VECTOR (7 downto 0)
			   );
	end component;

	signal RotWord: STD_LOGIC_VECTOR(0 to 31) := (others => '0');
	signal SubBts: STD_LOGIC_VECTOR(0 to 31) := (others => '0');
	signal Rcon_column_1st_element: STD_LOGIC_VECTOR(0 to 7) := (others => '0');
	
	signal rk: STD_LOGIC_VECTOR(0 to 127) := (others => '0');
		
begin

	for_Rcon: Rcon_zero_row port map (
	
										input => round_number,
										output => Rcon_column_1st_element
									 );

	RotWord <= prev_key(104 to 127) & prev_key(96 to 103);
	
	generate_for_1st_column:
		for i in 0 to 3 generate
			begin
			
				for_each_byte_in_1st_column: 
					S_Box port map (
					
									input => RotWord(8*i to 8*i+7),
									output => SubBts(8*i to 8*i+7)
								 );
	end generate;	
		  
	rk(0 to 31) <= prev_key(0 to 31) xor 
						SubBts xor
						(Rcon_column_1st_element & X"000000");
								 
	rk(32 to 63) <= prev_key(32 to 63) xor rk(0 to 31);	
	rk(64 to 95) <= prev_key(64 to 95) xor rk(32 to 63);	
	rk(96 to 127) <= prev_key(96 to 127) xor rk(64 to 95);
	
		
	round_key <= rk;

end KeySchedule_architecture;