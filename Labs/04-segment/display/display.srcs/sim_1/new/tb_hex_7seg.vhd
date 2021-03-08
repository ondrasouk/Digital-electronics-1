----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.03.2021 17:10:05
-- Design Name: 
-- Module Name: tb_hex_7seg - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_hex_7seg is
--  Port ( );
end tb_hex_7seg;

architecture Behavioral of tb_hex_7seg is
signal s_hex    : std_logic_vector(3 downto 0);
signal s_seg    : std_logic_vector(6 downto 0);

begin
-- contect architecture to testbench
uut_hex_7seg    : entity work.hex_7seg 
    port map(
        hex_i => s_hex,
        seg_o => s_seg
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
