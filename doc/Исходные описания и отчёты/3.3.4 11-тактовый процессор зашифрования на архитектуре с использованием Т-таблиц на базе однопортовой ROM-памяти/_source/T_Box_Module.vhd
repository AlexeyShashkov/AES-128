library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity T_Box_Module is
    port ( input : in  STD_LOGIC_VECTOR (0 to 127);
			  ROUND_NUMBER : in STD_LOGIC_VECTOR(3 downto 0);
           output : out  STD_LOGIC_VECTOR (0 to 127)
			 );
end T_Box_Module;

architecture T_Box_Module_architecture of T_Box_Module is

	component T_Box
		 port ( input : in  STD_LOGIC_VECTOR (7 downto 0);
				  output : out  STD_LOGIC_VECTOR (23 downto 0)
				 );
	end component;
	
	signal s_tbox_0, s_tbox_1, s_tbox_2, s_tbox_3 : STD_LOGIC_VECTOR(23 downto 0) := (others => '0');
	signal s_tbox_4, s_tbox_5, s_tbox_6, s_tbox_7 : STD_LOGIC_VECTOR(23 downto 0) := (others => '0');
	signal s_tbox_8, s_tbox_9, s_tbox_10, s_tbox_11 : STD_LOGIC_VECTOR(23 downto 0) := (others => '0');
	signal s_tbox_12, s_tbox_13, s_tbox_14, s_tbox_15 : STD_LOGIC_VECTOR(23 downto 0) := (others => '0');

begin

---- 1st column: ----------------------------------------------------------------------------------------------------------------

	tbox_0: T_Box port map (
	
				input => input(0 to 7),
				output => s_tbox_0
			);

	tbox_1: T_Box port map (
	
				input => input(8 to 15),
				output => s_tbox_1
			);
			
	tbox_2: T_Box port map (
	
				input => input(16 to 23),
				output => s_tbox_2
			);
			
	tbox_3: T_Box port map (
	
				input => input(24 to 31),
				output => s_tbox_3
			);

	output_select_0: process(ROUND_NUMBER, s_tbox_0, s_tbox_1, s_tbox_2, s_tbox_3)
	begin
	
		case ROUND_NUMBER is
		
			when "1010" => 
			
				output(0 to 7) <= s_tbox_0(15 downto 8);	
		
				output(8 to 15) <= s_tbox_1(15 downto 8);	
		
				output(16 to 23) <= s_tbox_2(15 downto 8);
		
				output(24 to 31) <= s_tbox_3(15 downto 8);
			
			when others =>
			
				output(0 to 7) <= s_tbox_0(23 downto 16) xor s_tbox_1(7 downto 0) xor s_tbox_2(15 downto 8) xor s_tbox_3(15 downto 8);	
		
				output(8 to 15) <= s_tbox_0(15 downto 8) xor s_tbox_1(23 downto 16) xor s_tbox_2(7 downto 0) xor s_tbox_3(15 downto 8);	
		
				output(16 to 23) <= s_tbox_0(15 downto 8) xor s_tbox_1(15 downto 8) xor s_tbox_2(23 downto 16) xor s_tbox_3(7 downto 0);
		
				output(24 to 31) <= s_tbox_0(7 downto 0) xor s_tbox_1(15 downto 8) xor s_tbox_2(15 downto 8) xor s_tbox_3(23 downto 16);

		end case;
	
	end process;
	
---- 2nd column: -------------------------------------------------------------------------------------------------------------------

	tbox_4: T_Box port map (
	
				input => input(32 to 39),
				output => s_tbox_4
			);

	tbox_5: T_Box port map (
	
				input => input(40 to 47),
				output => s_tbox_5
			);
			
	tbox_6: T_Box port map (
	
				input => input(48 to 55),
				output => s_tbox_6
			);
			
	tbox_7: T_Box port map (
	
				input => input(56 to 63),
				output => s_tbox_7
			);

	output_select_1: process(ROUND_NUMBER, s_tbox_4, s_tbox_5, s_tbox_6, s_tbox_7)
	begin
	
		case ROUND_NUMBER is
		
			when "1010" => 
			
				output(32 to 39) <= s_tbox_4(15 downto 8);	
		
				output(40 to 47) <= s_tbox_5(15 downto 8);	
		
				output(48 to 55) <= s_tbox_6(15 downto 8);
		
				output(56 to 63) <= s_tbox_7(15 downto 8);
			
			when others =>
			
				output(32 to 39) <= s_tbox_4(23 downto 16) xor s_tbox_5(7 downto 0) xor s_tbox_6(15 downto 8) xor s_tbox_7(15 downto 8);	
				
				output(40 to 47) <= s_tbox_4(15 downto 8) xor s_tbox_5(23 downto 16) xor s_tbox_6(7 downto 0) xor s_tbox_7(15 downto 8);	
				
				output(48 to 55) <= s_tbox_4(15 downto 8) xor s_tbox_5(15 downto 8) xor s_tbox_6(23 downto 16) xor s_tbox_7(7 downto 0);
				
				output(56 to 63) <= s_tbox_4(7 downto 0) xor s_tbox_5(15 downto 8) xor s_tbox_6(15 downto 8) xor s_tbox_7(23 downto 16);

		end case;
	
	end process;
	
---- 3rd column: -------------------------------------------------------------------------------------------------------------------

	tbox_8: T_Box port map (
	
				input => input(64 to 71),
				output => s_tbox_8
			);

	tbox_9: T_Box port map (
	
				input => input(72 to 79),
				output => s_tbox_9
			);
			
	tbox_10: T_Box port map (
	
				input => input(80 to 87),
				output => s_tbox_10
			);
			
	tbox_11: T_Box port map (
	
				input => input(88 to 95),
				output => s_tbox_11
			);

	output_select_2: process(ROUND_NUMBER, s_tbox_8, s_tbox_9, s_tbox_10, s_tbox_11)
	begin
	
		case ROUND_NUMBER is
		
			when "1010" => 
			
				output(64 to 71) <= s_tbox_8(15 downto 8);	
		
				output(72 to 79) <= s_tbox_9(15 downto 8);	
		
				output(80 to 87) <= s_tbox_10(15 downto 8);
		
				output(88 to 95) <= s_tbox_11(15 downto 8);
			
			when others =>
			
				output(64 to 71) <= s_tbox_8(23 downto 16) xor s_tbox_9(7 downto 0) xor s_tbox_10(15 downto 8) xor s_tbox_11(15 downto 8);	
				
				output(72 to 79) <= s_tbox_8(15 downto 8) xor s_tbox_9(23 downto 16) xor s_tbox_10(7 downto 0) xor s_tbox_11(15 downto 8);	
				
				output(80 to 87) <= s_tbox_8(15 downto 8) xor s_tbox_9(15 downto 8) xor s_tbox_10(23 downto 16) xor s_tbox_11(7 downto 0);
				
				output(88 to 95) <= s_tbox_8(7 downto 0) xor s_tbox_9(15 downto 8) xor s_tbox_10(15 downto 8) xor s_tbox_11(23 downto 16);

		end case;
	
	end process;
	
---- 4th column: ---------------------------------------------------------------------------------------------------------------------

	tbox_12: T_Box port map (
	
				input => input(96 to 103),
				output => s_tbox_12
			);

	tbox_13: T_Box port map (
	
				input => input(104 to 111),
				output => s_tbox_13
			);
			
	tbox_14: T_Box port map (
	
				input => input(112 to 119),
				output => s_tbox_14
			);
			
	tbox_15: T_Box port map (
	
				input => input(120 to 127),
				output => s_tbox_15
			);

	output_select_3: process(ROUND_NUMBER, s_tbox_12, s_tbox_13, s_tbox_14, s_tbox_15)
	begin
	
		case ROUND_NUMBER is
		
			when "1010" => 
			
				output(96 to 103) <= s_tbox_12(15 downto 8);	
		
				output(104 to 111) <= s_tbox_13(15 downto 8);	
		
				output(112 to 119) <= s_tbox_14(15 downto 8);
		
				output(120 to 127) <= s_tbox_15(15 downto 8);
			
			when others =>
			
				output(96 to 103) <= s_tbox_12(23 downto 16) xor s_tbox_13(7 downto 0) xor s_tbox_14(15 downto 8) xor s_tbox_15(15 downto 8);	
				
				output(104 to 111) <= s_tbox_12(15 downto 8) xor s_tbox_13(23 downto 16) xor s_tbox_14(7 downto 0) xor s_tbox_15(15 downto 8);	
				
				output(112 to 119) <= s_tbox_12(15 downto 8) xor s_tbox_13(15 downto 8) xor s_tbox_14(23 downto 16) xor s_tbox_15(7 downto 0);
				
				output(120 to 127) <= s_tbox_12(7 downto 0) xor s_tbox_13(15 downto 8) xor s_tbox_14(15 downto 8) xor s_tbox_15(23 downto 16);

		end case;
	
	end process;
	
-------------------------------------------------------------------------------------------------------------------------------------------

end T_Box_Module_architecture;

