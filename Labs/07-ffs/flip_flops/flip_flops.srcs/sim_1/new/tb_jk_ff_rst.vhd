----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.03.2021 11:44:02
-- Design Name: 
-- Module Name: tb_jk_ff_rst - Behavioral
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

entity tb_jk_ff_rst is
--  Port ( );
end tb_jk_ff_rst;

architecture Behavioral of tb_jk_ff_rst is
    signal s_j          :std_logic;
    signal s_k          :std_logic;
    signal s_clk        :std_logic;
    signal s_rst        :std_logic;
    signal s_q          :std_logic;
    signal s_q_bar      :std_logic;

begin
uut_jk_ff_rst : entity work.jk_ff_rst
    port map(
        j       => s_j,
        k       => s_k,
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
        s_j <= '0';
        s_k <= '0';
        wait for 25ns;
        s_j <= '0';
        s_k <= '1';
        wait for 35ns;
        s_j <= '1';
        s_k <= '0';
        wait for 15ns;
        s_j <= '1';
        s_k <= '1';
        wait for 55ns;
        s_j <= '0';
        s_k <= '0';
        wait for 75ns;
        s_j <= '1';
        s_k <= '0';
        wait for 10ns;
    end process p_stimulus;
    
    p_check : process
        begin
        wait until (rising_edge(s_clk) and s_rst = '1' and s_q = '0');
        wait for 0.4ns;
        assert (s_q = '0') and (s_q_bar = '1')
        report "Reset fault (Q LOW)" severity error;
        
        wait until (rising_edge(s_clk) and s_rst = '1' and s_q = '1');
        wait for 0.4ns;  
        assert (s_q = '0') and (s_q_bar = '1')
        report "Reset fault (Q HIGH)" severity error;
        
        wait until (rising_edge(s_clk) and s_rst = '0' and s_j = '1' and s_k = '0');
        wait for 0.4ns; 
        assert (s_q = '1') and (s_q_bar = '0')
        report "J fault" severity error;
        
        wait until (rising_edge(s_clk) and s_rst = '0' and s_j = '0' and s_k = '1');
        wait for 0.4ns; 
        assert (s_q = '0') and (s_q_bar = '1')
        report "K fault" severity error;
        
        wait until (rising_edge(s_clk) and s_rst = '0' and s_j = '0' and s_k = '0' and s_q = '1');
        wait for 0.4ns; 
        assert (s_q = '1') and (s_q_bar = '0')
        report "Hold fault (Q HIGH)" severity error;
        
        wait until (rising_edge(s_clk) and s_rst = '0' and s_j = '0' and s_k = '0' and s_q = '0');
        wait for 0.4ns; 
        assert (s_q = '0') and (s_q_bar = '1')
        report "Hold fault (Q LOW)" severity error;
        
        wait until (rising_edge(s_clk) and s_rst = '0' and s_j = '1' and s_k = '1' and s_q = '1');
        wait for 0.4ns; 
        assert (s_q = '0') and (s_q_bar = '1')
        report "Hold fault (Q HIGH)" severity error;
        
        wait until (rising_edge(s_clk) and s_rst = '0' and s_j = '1' and s_k = '1' and s_q = '0');
        wait for 0.4ns; 
        assert (s_q = '1') and (s_q_bar = '0')
        report "Hold fault (Q LOW)" severity error;
        
        wait until (not(rising_edge(s_clk)) and (rising_edge(s_rst) or falling_edge(s_rst)) and (rising_edge(s_j) or falling_edge(s_j)) and (rising_edge(s_k) or falling_edge(s_k)) and s_q = '1');
        wait for 0.4ns; 
        assert (s_q = '1') and (s_q_bar = '0')
        report "clock/sync fault (async change when Q HIGH)" severity error;
        
        wait until (not(rising_edge(s_clk)) and (rising_edge(s_rst) or falling_edge(s_rst)) and (rising_edge(s_j) or falling_edge(s_j)) and (rising_edge(s_k) or falling_edge(s_k)) and s_q = '0');
        wait for 0.4ns; 
        assert (s_q = '0') and (s_q_bar = '1')
        report "clock/sync fault (async change when Q LOW)" severity error;
        
        report "Test complete" severity note;
          
        end process p_check;

end Behavioral;
