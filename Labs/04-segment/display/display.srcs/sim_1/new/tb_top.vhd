library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_top is
--  Port ( );
end tb_top;

architecture Behavioral of tb_top is
    signal s_hex    : std_logic_vector(3 downto 0);
    signal s_LED    : std_logic_vector(7 downto 0);
    signal s_CA       : std_logic;
    signal s_CB       : std_logic;
    signal s_CC       : std_logic;
    signal s_CD       : std_logic;
    signal s_CE       : std_logic;
    signal s_CF       : std_logic;
    signal s_CG       : std_logic;
    signal s_AN       : std_logic_vector(7 downto 0);
    
begin
-- contect architecture to testbench
uut_top    : entity work.top
    port map(
        SW => s_hex,
        LED => s_LED,
        CA => s_CA,
        CB => s_CB,
        CC => s_CC,
        CD => s_CD,
        CE => s_CE,
        CF => s_CF,
        CG => s_CG,
        AN => s_AN
        );
tb_stimuls: process begin
    report "Stimulus process started" severity note;
    s_hex <= "0000";    -- 0
    wait for 100 ns;
    s_hex <= "0001";    -- 1
    wait for 100 ns;
    s_hex <= "0010";    -- 2
    wait for 100 ns;
    s_hex <= "0011";    -- 3
    wait for 100 ns;
    s_hex <= "0100";    -- 4
    wait for 100 ns;
    s_hex <= "0101";    -- 5
    wait for 100 ns;
    s_hex <= "0110";    -- 6
    wait for 100 ns;
    s_hex <= "0111";    -- 7
    wait for 100 ns;
    s_hex <= "1000";    -- 8
    wait for 100 ns;
    s_hex <= "1001";    -- 9
    wait for 100 ns;
    s_hex <= "1010";    -- A
    wait for 100 ns;
    s_hex <= "1011";    -- B
    wait for 100 ns;
    s_hex <= "1100";    -- C
    wait for 100 ns;
    s_hex <= "1101";    -- D
    wait for 100 ns ;
    s_hex <= "1110";    -- E
    wait for 100 ns ;
    s_hex <= "1111";    -- F
    wait for 100 ns ;
    report "Stimulus process ended" severity note;
    wait;
end process tb_stimuls;
end Behavioral;
