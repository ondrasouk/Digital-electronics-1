----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.03.2021 20:40:36
-- Design Name: 
-- Module Name: tb_mux_2bit_4to1 - Behavioral
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

entity tb_mux_2bit_4to1 is
--  Port ( );
end tb_mux_2bit_4to1;

architecture testbench of tb_mux_2bit_4to1 is
    signal s_a      : std_logic_vector(1 downto 0);
    signal s_b      : std_logic_vector(1 downto 0);
    signal s_c      : std_logic_vector(1 downto 0);
    signal s_d      : std_logic_vector(1 downto 0);
    signal s_sel    : std_logic_vector(1 downto 0);
    signal s_f      : std_logic_vector(1 downto 0);
begin
    --connecting testbench
    uut_mux_2bit_4to1   : entity work.mux_2bit_4to1
        port map(
            a_i     => s_a,
            b_i     => s_b,
            c_i     => s_c,
            d_i     => s_d,
            sel_i   => s_sel,
            f_o     => s_f
        );
     --Test signal generating
     p_stimuls : process
     begin
     report "Stimulus process started" severity note;
     --init. signal
        s_a <= "11";
        s_b <= "11";
        s_c <= "11";
        s_d <= "11";
     --1.st combination
        s_sel <= "00";
            s_a <= "01";
            wait for 100 ns;
            s_a <= "10";
            wait for 100 ns;
            s_a <= "11";
     --2.nd combination
        s_sel <= "01";
            s_b <= "01";
            wait for 100 ns;
            s_b <= "10";
            wait for 100 ns;
            s_b <= "11";
     --3.rd combination
        s_sel <= "10";
            s_c <= "01";
            wait for 100 ns;
            s_c <= "10";
            wait for 100 ns;
            s_c <= "11";
     --4.th combination
        s_sel <= "11";
            s_d <= "01";
            wait for 100 ns;
            s_d <= "10";
            wait for 100 ns;
            s_d <= "11";
        report "Stimulus process ended" severity note;
        wait;
     end process p_stimuls;
end architecture testbench;
