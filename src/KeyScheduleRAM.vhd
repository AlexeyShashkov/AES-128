library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity KeyScheduleRAM is

    port (CLK     : in  std_logic;
          WE      : in  std_logic;
          ADDRESS : in  std_logic_vector(3 downto 0);
          INPUT   : in  std_logic_vector(0 to 127);
          OUTPUT  : out std_logic_vector(0 to 127));

end KeyScheduleRAM;

architecture KeyScheduleRAM_architecture of KeyScheduleRAM is

    type ram_type is array (0 to 15) of std_logic_vector (0 to 127);
    signal RAM : ram_type;

begin

    process (CLK) begin

        if (CLK'event and CLK = '1') then

            if (WE = '1') then

                RAM(conv_integer(ADDRESS)) <= INPUT;

            end if;

                OUTPUT <= RAM(conv_integer(ADDRESS));

        end if;

    end process;

end KeyScheduleRAM_architecture;
