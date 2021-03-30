----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.03.2021 11:44:02
-- Design Name: 
-- Module Name: tb_t_ff_rst - Behavioral
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

entity tb_t_ff_rst is
--  Port ( );
end tb_t_ff_rst;

architecture Behavioral of tb_t_ff_rst is
    signal s_clk        :std_logic;
    signal s_rst        :std_logic;
    signal s_t          :std_logic;
    signal s_q          :std_logic;
    signal s_q_bar      :std_logic;

begin
uut_t_ff_rst : entity work.t_ff_rst
    port map(
        t       => s_t,
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
        wait for 5ns;
        s_clk <= '1';
        wait for 5ns;
    end process p_clk_gen;
--------------------------------------------------------------------
    -- Reset generation process
-------------------------------------------------------------------- 
    p_reset: process
    begin
        s_rst <= '0';
        wait for 24 ns;
        s_rst <= '1';
        wait for 5ns;
    end process p_reset;
--------------------------------------------------------------------
    -- Stimulus
-------------------------------------------------------------------- 
    p_stimulus: process
    begin
        s_t <= '0';
        wait for 25ns;
        s_t <= '1';
        wait for 35ns;
        s_t <= '0';
        wait for 15ns;
        s_t <= '1';
        wait for 15ns;
        s_t <= '0';
        wait for 75ns;
        s_t <= '1';
        wait for 9ns;
    end process p_stimulus;
    
    p_check : process
        begin
        wait until (rising_edge(s_clk) and s_rst = '1');
        wait for 0.4ns;
        assert (s_q = '0') and (s_q_bar = '1')
        report "Reset fault" severity error;
        
        wait until (rising_edge(s_clk) and s_rst = '0' and s_t = '0' and s_q = '0');
        wait for 0.4ns;  
        assert (s_q = '0') and (s_q_bar = '1')
        report "Hold fault (Q High)" severity error;
        
        wait until (rising_edge(s_clk) and s_rst = '0' and s_t = '0' and s_q = '1');
        wait for 0.4ns;  
        assert (s_q = '1') and (s_q_bar = '0')
        report "Hold fault (Q Low)" severity error;
        
        wait until (rising_edge(s_clk) and s_rst = '0' and s_t = '1' and s_q = '0');
        wait for 0.4ns;  
        assert (s_q = '1') and (s_q_bar = '0')
        report "Invert fault (Q Low)" severity error;
        
        wait until (rising_edge(s_clk) and s_rst = '0' and s_t = '1' and s_q = '1');
        wait for 0.4ns;  
        assert (s_q = '0') and (s_q_bar = '1')
        report "Invert fault (Q High)" severity error;
        
        wait until (not(rising_edge(s_clk)) and (rising_edge(s_rst) or falling_edge(s_rst)) and (rising_edge(s_t) or falling_edge(s_t)) and s_q = '0');
        wait for 0.4ns; 
        assert (s_q = '0') and (s_q_bar = '1')
        report "clock/sync fault (async change when Q HIGH)" severity error;
        
        wait until (not(rising_edge(s_clk)) and (rising_edge(s_rst) or falling_edge(s_rst)) and (rising_edge(s_t) or falling_edge(s_t)) and s_q = '1');
        wait for 0.4ns; 
        assert (s_q = '1') and (s_q_bar = '0')
        report "clock/sync fault (async change when Q HIGH)" severity error;
        report "Test complete" severity note;
          
        end process p_check;

end Behavioral;
