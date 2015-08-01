library ieee;
use ieee.std_logic_1164.all;

entity Xtime is

    port (input  : in  std_logic_vector(7 downto 0);
          output : out std_logic_vector(7 downto 0));

end Xtime;

architecture Xtime_architecture of Xtime is

    signal l_shift_input : std_logic_vector(7 downto 0) := (others => '0');
    signal cond_x1b_xor : std_logic_vector(7 downto 0) := (others => '0');

begin

    l_shift_input <= input(6 downto 0) & '0';

    select_output: process(input, l_shift_input) begin

        if input(7) = '0' then

            cond_x1b_xor <= l_shift_input;

        else

            cond_x1b_xor <= l_shift_input xor X"1B";

        end if;

    end process;

    output <= cond_x1b_xor;

end Xtime_architecture;
