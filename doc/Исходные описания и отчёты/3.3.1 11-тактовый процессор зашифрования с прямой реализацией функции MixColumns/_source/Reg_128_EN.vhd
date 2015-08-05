library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg_128_EN is
    port( CLK : in std_logic;
			 EN : in std_logic;
          D : in std_logic_vector(0 to 127);
          Q : out std_logic_vector(0 to 127)
			);
end Reg_128_EN;

architecture Reg_128_EN_architecture of Reg_128_EN is

	signal tmp: std_logic_vector(0 to 127);

begin

    process (CLK)
    begin
	 
        if (CLK'event and CLK='1') then

            if EN = '1' then
				
					tmp <= D;
				
				end if;
				
        end if;
		  
    end process;
    
    Q <= tmp;

end Reg_128_EN_architecture;