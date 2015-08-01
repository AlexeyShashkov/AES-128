library ieee;
use ieee.std_logic_1164.all;

entity MUX_128_2 is

    port (IN_0   : in  std_logic_vector(0 to 127);
          IN_1   : in  std_logic_vector(0 to 127);
          SEL    : in  std_logic;
          OUTPUT : out std_logic_vector(0 to 127));

end MUX_128_2;

architecture MUX_128_2_architecture of MUX_128_2 is

begin

    process(SEL, IN_0, IN_1) begin

        case SEL is

            when '1' => OUTPUT <= IN_1;
            when '0' => OUTPUT <= IN_0;

            when others => OUTPUT <= IN_0;

        end case;

    end process;

end MUX_128_2_architecture;
