library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Counter_to_10 is

    port (CLK : in  std_logic;
          CLR : in  std_logic;
          CE  : in  std_logic;
          Q   : out std_logic_vector(3 downto 0));

end Counter_to_10;

architecture Counter_to_10_architecture of Counter_to_10 is

    signal tmp: std_logic_vector(3 downto 0);

begin

    process (CLK, CLR) begin

        if rising_edge(CLK) then

            if (CLR = '1') then

                tmp <= "0000";

            elsif CE = '1' then

                if tmp = "1010" then

                        tmp <= "0000";
                else

                        tmp <= tmp + 1;

                end if;

            end if;

        end if;

    end process;

    Q <= tmp;

end Counter_to_10_architecture;
