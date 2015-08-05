library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity T_Box_Module is
    port ( CLK : IN  std_logic;
			  input : in  STD_LOGIC_VECTOR (0 to 127);
			  ROUND_NUMBER : in STD_LOGIC_VECTOR(3 downto 0);
           output : out  STD_LOGIC_VECTOR (0 to 127)
			 );
end T_Box_Module;

architecture T_Box_Module_architecture of T_Box_Module is

	component T_Box_2_port
		 port ( CLK : IN  std_logic;
				  input_zeros : in  STD_LOGIC_VECTOR (23 downto 0);
			     ENA_1 : IN  std_logic;
			     WEA_0 : IN  std_logic;
				  input1 : in  STD_LOGIC_VECTOR (7 downto 0);
				  input2 : in  STD_LOGIC_VECTOR (7 downto 0);
				  output1 : out  STD_LOGIC_VECTOR (23 downto 0);
				  output2 : out  STD_LOGIC_VECTOR (23 downto 0)
				 );
	end component;
	
	signal s_tbox_0, s_tbox_1, s_tbox_2, s_tbox_3 : STD_LOGIC_VECTOR(23 downto 0) := (others => '0');
	signal s_tbox_4, s_tbox_5, s_tbox_6, s_tbox_7 : STD_LOGIC_VECTOR(23 downto 0) := (others => '0');
	signal s_tbox_8, s_tbox_9, s_tbox_10, s_tbox_11 : STD_LOGIC_VECTOR(23 downto 0) := (others => '0');
	signal s_tbox_12, s_tbox_13, s_tbox_14, s_tbox_15 : STD_LOGIC_VECTOR(23 downto 0) := (others => '0');

begin

---- 1st column: ----------------------------------------------------------------------------------------------------------------

	tbox_2_port_0: T_Box_2_port port map (
	
				input_zeros => X"000000",
			   ENA_1 => '1',
			   WEA_0 =>  '0',
				
				CLK => CLK,
				input1 => input(0 to 7),
				input2 => input(8 to 15),
				output1 => s_tbox_0,
				output2 => s_tbox_1
			);

	tbox_2_port_1: T_Box_2_port port map (

				input_zeros => X"000000",
			   ENA_1 => '1',
			   WEA_0 =>  '0',
				
				CLK => CLK,
				input1 => input(16 to 23),
				input2 => input(24 to 31),
				output1 => s_tbox_2,
				output2 => s_tbox_3
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

	tbox_2_port_2: T_Box_2_port port map (

				input_zeros => X"000000",
			   ENA_1 => '1',
			   WEA_0 =>  '0',
		
				CLK => CLK,
				input1 => input(32 to 39),
				input2 => input(40 to 47),
				output1 => s_tbox_4,
				output2 => s_tbox_5
			);

	tbox_2_port_3: T_Box_2_port port map (

				input_zeros => X"000000",
			   ENA_1 => '1',
			   WEA_0 =>  '0',
		
				CLK => CLK,
				input1 => input(48 to 55),
				input2 => input(56 to 63),
				output1 => s_tbox_6,
				output2 => s_tbox_7
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

	tbox_2_port_4: T_Box_2_port port map (

				input_zeros => X"000000",
			   ENA_1 => '1',
			   WEA_0 =>  '0',
		
				CLK => CLK,
				input1 => input(64 to 71),
				input2 => input(72 to 79),
				output1 => s_tbox_8,
				output2 => s_tbox_9
			);

	tbox_2_port_5: T_Box_2_port port map (

				input_zeros => X"000000",
			   ENA_1 => '1',
			   WEA_0 =>  '0',
		
				CLK => CLK,
				input1 => input(80 to 87),
				input2 => input(88 to 95),
				output1 => s_tbox_10,
				output2 => s_tbox_11
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

	tbox_2_port_6: T_Box_2_port port map (

				input_zeros => X"000000",
			   ENA_1 => '1',
			   WEA_0 =>  '0',
		
				CLK => CLK,
				input1 => input(96 to 103),
				input2 => input(104 to 111),
				output1 => s_tbox_12,
				output2 => s_tbox_13
			);

	tbox_2_port_7: T_Box_2_port port map (

				input_zeros => X"000000",
			   ENA_1 => '1',
			   WEA_0 =>  '0',
		
				CLK => CLK,
				input1 => input(112 to 119),
				input2 => input(120 to 127),
				output1 => s_tbox_14,
				output2 => s_tbox_15
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

