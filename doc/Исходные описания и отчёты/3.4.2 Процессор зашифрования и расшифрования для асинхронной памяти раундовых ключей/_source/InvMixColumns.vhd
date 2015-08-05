library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity InvMixColumns is
	Port ( input : in STD_LOGIC_VECTOR(0 to 127);
           output : out STD_LOGIC_VECTOR(0 to 127)
		   );
end InvMixColumns;

architecture InvMixColumns_architecture of InvMixColumns is

	component Xtime_3times
		Port ( input : in  STD_LOGIC_VECTOR (7 downto 0);
				 xt_x1 : out  STD_LOGIC_VECTOR (7 downto 0);
				 xt_x2 : out  STD_LOGIC_VECTOR (7 downto 0);
				 xt_x3 : out  STD_LOGIC_VECTOR (7 downto 0)
				);
	end component;
	
	signal xtm_1, xtm_2, xtm_3, w: STD_LOGIC_VECTOR(0 to 127) := (others => '0');

begin

	generate_xtm_1_to_3:
		for i in 0 to 15 generate
			begin
				for_each_byte: Xtime_3times port map (
										input => input(8*i to 8*i+7),
										xt_x1 => xtm_1(8*i to 8*i+7),
										xt_x2 => xtm_2(8*i to 8*i+7),
										xt_x3	=>	xtm_3(8*i to 8*i+7)							
									);
	end generate;
	
	
	generate_new_s_0_c:
	for i in 0 to 3 generate
		begin
			w(32*i to 32*i+7) <= xtm_1(32*i to 32*i+7) xor xtm_2(32*i to 32*i+7) xor xtm_3(32*i to 32*i+7) xor
		
									   xtm_1(32*i+8 to 32*i+15) xor xtm_3(32*i+8 to 32*i+15) xor input(32*i+8 to 32*i+15) xor
										
										xtm_2(32*i+16 to 32*i+23) xor xtm_3(32*i+16 to 32*i+23) xor input(32*i+16 to 32*i+23) xor
										
										xtm_3(32*i+24 to 32*i+31) xor input(32*i+24 to 32*i+31);
	end generate;
	
	
	generate_new_s_1_c:
	for i in 0 to 3 generate
		begin
			w(32*i+8 to 32*i+15) <= xtm_3(32*i to 32*i+7) xor input(32*i to 32*i+7) xor 
		
											xtm_1(32*i+8 to 32*i+15) xor xtm_2(32*i+8 to 32*i+15) xor xtm_3(32*i+8 to 32*i+15) xor
											
											xtm_1(32*i+16 to 32*i+23) xor xtm_3(32*i+16 to 32*i+23) xor input(32*i+16 to 32*i+23) xor
											
											xtm_2(32*i+24 to 32*i+31) xor xtm_3(32*i+24 to 32*i+31) xor input(32*i+24 to 32*i+31);
	end generate;
	
	
	generate_new_s_2_c:
	for i in 0 to 3 generate
		begin
			w(32*i+16 to 32*i+23) <= xtm_2(32*i to 32*i+7) xor xtm_3(32*i to 32*i+7) xor input(32*i to 32*i+7) xor 
		
											 xtm_3(32*i+8 to 32*i+15) xor input(32*i+8 to 32*i+15) xor
											
											 xtm_1(32*i+16 to 32*i+23) xor xtm_2(32*i+16 to 32*i+23) xor xtm_3(32*i+16 to 32*i+23) xor
											
											 xtm_1(32*i+24 to 32*i+31) xor xtm_3(32*i+24 to 32*i+31) xor input(32*i+24 to 32*i+31);
	end generate;


	generate_new_s_3_c:
	for i in 0 to 3 generate
		begin
			w(32*i+24 to 32*i+31) <= xtm_1(32*i to 32*i+7) xor xtm_3(32*i to 32*i+7) xor input(32*i to 32*i+7) xor 
		
											 xtm_2(32*i+8 to 32*i+15) xor xtm_3(32*i+8 to 32*i+15) xor input(32*i+8 to 32*i+15) xor
											
											 xtm_3(32*i+16 to 32*i+23) xor input(32*i+16 to 32*i+23) xor
											
											 xtm_1(32*i+24 to 32*i+31) xor xtm_2(32*i+24 to 32*i+31) xor xtm_3(32*i+24 to 32*i+31);
	end generate;
	
	output <= w;

end InvMixColumns_architecture;