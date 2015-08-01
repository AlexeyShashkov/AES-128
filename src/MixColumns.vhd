library ieee;
use ieee.std_logic_1164.all;

entity MixColumns is

    port (input  : in  std_logic_vector(0 to 127);
          output : out std_logic_vector(0 to 127));

end MixColumns;

architecture MixColumns_architecture of MixColumns is

    component Xtime
        port (input : in  std_logic_vector(7 downto 0);
              output : out  std_logic_vector(7 downto 0));
    end component;

    signal xtm, w: std_logic_vector(0 to 127) := (others => '0');

begin

    generate_xtm: for i in 0 to 15 generate begin

        for_each_byte: Xtime port map (input => input(8*i to 8*i+7),
                                       output => xtm(8*i to 8*i+7));
    end generate;

    generate_new_s_0_c: for i in 0 to 3 generate begin

        w(32*i to 32*i+7) <= xtm(32*i to 32*i+7) xor
                             xtm(32*i+8 to 32*i+15) xor
                             input(32*i+8 to 32*i+15) xor
                             input(32*i+16 to 32*i+23) xor
                             input(32*i+24 to 32*i+31);
    end generate;

    generate_new_s_1_c: for i in 0 to 3 generate begin

        w(32*i+8 to 32*i+15) <= xtm(32*i+8 to 32*i+15) xor
                                xtm(32*i+16 to 32*i+23) xor
                                input(32*i to 32*i+7) xor
                                input(32*i+16 to 32*i+23) xor
                                input(32*i+24 to 32*i+31);
    end generate;

    generate_new_s_2_c: for i in 0 to 3 generate begin

        w(32*i+16 to 32*i+23) <= xtm(32*i+16 to 32*i+23) xor
                                 xtm(32*i+24 to 32*i+31) xor
                                 input(32*i to 32*i+7) xor
                                 input(32*i+8 to 32*i+15) xor
                                 input(32*i+24 to 32*i+31);
    end generate;

    generate_new_s_3_c: for i in 0 to 3 generate begin

        w(32*i+24 to 32*i+31) <= xtm(32*i to 32*i+7) xor
                                 xtm(32*i+24 to 32*i+31) xor
                                 input(32*i to 32*i+7) xor
                                 input(32*i+8 to 32*i+15) xor
                                 input(32*i+16 to 32*i+23);
    end generate;

    output <= w;

end MixColumns_architecture;
