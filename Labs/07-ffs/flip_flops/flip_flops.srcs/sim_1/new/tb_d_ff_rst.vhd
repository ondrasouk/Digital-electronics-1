----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.03.2021 11:44:02
-- Design Name: 
-- Module Name: tb_d_ff_rst - Behavioral
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

entity tb_d_ff_rst is
--  Port ( );
end tb_d_ff_rst;

architecture Behavioral of tb_d_ff_rst is
    signal s_d          :std_logic;
    signal s_clk        :std_logic;
    signal s_rst        :std_logic;
    signal s_q          :std_logic;
    signal s_q_bar      :std_logic;

begin
uut_d_ff_rst : entity work.d_ff_rst
    port map(
        d       => s_d,
        clk     => s_clk,
        rst     => s_rst,
        q       => s_q,
        q_bar   => s_q_bar
    );
--------------------------------------------------------------------
    -- Clock generation process
--------------------------------------------------------------------           
    p_clk_gen: process
    begin
        s_clk <= '0';
        wait for 10ns;
        s_clk <= '1';
        wait for 10ns;
    end process p_clk_gen;
--------------------------------------------------------------------
    -- Reset generation process
-------------------------------------------------------------------- 
    p_reset: process
    begin
        s_rst <= '0';
        wait for 30 ns;
        s_rst <= '1';
        wait for 4ns;
    end process p_reset;
--------------------------------------------------------------------
    -- Stimulus
-------------------------------------------------------------------- 
    p_stimulus: process
    begin
        s_d <= '0';
        wait for 25ns;
        s_d <= '1';
        wait for 35ns;
        s_d <= '0';
        wait for 15ns;
        s_d <= '1';
        wait for 55ns;
        s_d <= '0';
        wait for 75ns;
        s_d <= '1';
        wait for 10ns;
    end process p_stimulus;
    
    p_check : process
        begin
        wait until ((s_d = '0') and rising_edge(s_clk) and (s_rst = '1'));
        wait for 0.4ns;
        assert (s_q = '0') and (s_q_bar = '1')
        report "Reset fault (D LOW)" severity error;
        
        wait until ((s_d = '1') and rising_edge(s_clk) and (s_rst = '1'));
        wait for 0.4ns;  
        assert (s_q = '0') and (s_q_bar = '1')
        report "Reset fault (D HIGH)" severity error;
        
        wait until (rising_edge(s_d) and not(rising_edge(s_clk)) and (s_rst = '0') and (s_q = '0'));
        wait for 0.4ns; 
        assert (s_q = '0') and (s_q_bar = '1')
        report "Hold fault (Hold when CLK is not rising)" severity error;
        
        wait until (falling_edge(s_d) and not(rising_edge(s_clk)) and (s_rst = '0') and (s_q = '1'));
        wait for 0.4ns; 
        assert (s_q = '1') and (s_q_bar = '0')
        report "Hold fault (Hold when CLK is not rising)" severity error;
        
        wait until ((s_d = '1') and rising_edge(s_clk) and (s_rst = '0'));
        wait for 0.4ns; 
        assert (s_q = '1') and (s_q_bar = '0') --transparency check
        report "Data fault" severity error;
        report "Test complete" severity note;
          
        end process p_check;

end Behavioral;
