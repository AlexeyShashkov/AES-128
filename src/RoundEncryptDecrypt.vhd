library ieee;
use ieee.std_logic_1164.all;

entity RoundEncryptDecrypt is

    port (ROUND_KEY    : in  std_logic_vector(0 to 127);
          ROUND_NUMBER : in  std_logic_vector(3 downto 0);
          INPUT        : in  std_logic_vector(0 to 127);
          FB_INPUT     : in  std_logic_vector(0 to 127);
          INIT_INPUT   : in  std_logic;
          OUTPUT       : out std_logic_vector(0 to 127));

end RoundEncryptDecrypt;

architecture RoundEncryptDecrypt_architecture of RoundEncryptDecrypt is

    component SubBytes
        port (input  : in  std_logic_vector(0 to 127);
              output : out std_logic_vector(0 to 127));
    end component;

    component ShiftRows
        port (input  : in  std_logic_vector(0 to 127);
              output : out std_logic_vector(0 to 127));
    end component;

    component MixColumns
        port (input  : in  std_logic_vector(0 to 127);
              output : out std_logic_vector(0 to 127));
    end component;

    component AddRoundKey
        port (input     : in  std_logic_vector(0 to 127);
              round_key : in  std_logic_vector(0 to 127);
              output    : out std_logic_vector(0 to 127));
    end component;

    signal b0, b1, b2: std_logic_vector(0 to 127) := (others => '0');
    signal m1, m2: std_logic_vector(0 to 127) := (others => '0');

begin

    en_1: SubBytes port map (input => FB_INPUT,
                             output => b0);

    en_2: ShiftRows port map (input => b0,
                              output => b1);

    en_3: MixColumns port map (input => b1,
                               output => b2);

    en_4: process(ROUND_NUMBER, b1, b2) begin

        case ROUND_NUMBER is

            when "0000" => m1 <= b1;

            when others => m1 <= b2;

        end case;

    end process;

    en_5: process(INIT_INPUT, INPUT, m1) begin

        case INIT_INPUT is

            when '1' => m2 <= INPUT;

            when others => m2 <= m1;

        end case;

    end process;

    en_6: AddRoundKey port map (input => m2,
                                round_key => ROUND_KEY,
                                output => OUTPUT);

end RoundEncryptDecrypt_architecture;
