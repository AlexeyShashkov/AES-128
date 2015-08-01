library ieee;
use ieee.std_logic_1164.all;

entity SubBytes is

    port (input  : in  std_logic_vector(0 to 127);
          output : out std_logic_vector(0 to 127));

end SubBytes;

architecture SubBytes_architecture of SubBytes is

    component S_Box
        port (input  : in  std_logic_vector(7 downto 0);
              output : out std_logic_vector(7 downto 0));
    end component;

    signal w : std_logic_vector(0 to 127) := (others => '0');

begin

    generate_for_each_byte: for i in 0 to 15 generate begin

        substitute: S_Box port map (input => input(8*i to 8*i+7),
                                    output => w(8*i to 8*i+7));
    end generate;

    output <= w;

end SubBytes_architecture;
