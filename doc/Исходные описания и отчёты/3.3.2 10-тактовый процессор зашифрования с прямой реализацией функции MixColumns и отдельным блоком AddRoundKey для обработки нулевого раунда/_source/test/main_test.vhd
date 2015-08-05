LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY main_test IS
END main_test;
 
ARCHITECTURE behavior OF main_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Main
    PORT(
         CLK : IN  std_logic;
         RESET : IN  std_logic;
         DATA_WRITE : IN  std_logic;
         INPUT_TEXT : IN  std_logic_vector(0 to 127);
         AVAILABLE : OUT  std_logic;
         OUTPUT_TEXT : OUT  std_logic_vector(0 to 127)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RESET : std_logic := '0';
   signal DATA_WRITE : std_logic := '0';
   signal INPUT_TEXT : std_logic_vector(0 to 127) := (others => '0');

 	--Outputs
   signal AVAILABLE : std_logic;
   signal OUTPUT_TEXT : std_logic_vector(0 to 127);

   -- Clock period definitions
   constant CLK_period : time := 3.656 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Main PORT MAP (
          CLK => CLK,
          RESET => RESET,
          DATA_WRITE => DATA_WRITE,
          INPUT_TEXT => INPUT_TEXT,
          AVAILABLE => AVAILABLE,
          OUTPUT_TEXT => OUTPUT_TEXT
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	
			RESET <= '1';		
			wait for 100 ns;
			RESET <= '0';      
			
			wait for CLK_period*3;
			wait until (CLK'event and CLK = '1');
			wait for CLK_period/30;			
			DATA_WRITE <= '1';	
			INPUT_TEXT <= X"000102030405060708090a0b0c0d0e0f";
			wait for CLK_period;
			DATA_WRITE <= '0';

			wait until AVAILABLE = '1';
			wait for CLK_period*1;
			wait until (CLK'event and CLK = '1');
			wait for CLK_period/30;		
			INPUT_TEXT <= X"00112233445566778899aabbccddeeff";
			DATA_WRITE <= '1';
			
			wait on AVAILABLE;
			wait on AVAILABLE;
			wait until (CLK'event and CLK = '1');
			DATA_WRITE <= '0';
			
			wait for CLK_period*15;
			wait until (CLK'event and CLK = '1');
			wait for CLK_period/30;	
			DATA_WRITE <= '1';
			wait for CLK_period*1;
			DATA_WRITE <= '0';		
			
		wait;
			
   end process;

END;
