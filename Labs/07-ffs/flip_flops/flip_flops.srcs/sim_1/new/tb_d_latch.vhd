----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.03.2021 17:06:51
-- Design Name: 
-- Module Name: tb_d_latch - Behavioral
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

entity tb_d_latch is
--  Port ( );
end tb_d_latch;

architecture Behavioral of tb_d_latch is
    signal s_d         :std_logic;
    signal s_en         :std_logic;
    signal s_arst       :std_logic;
    signal s_q          :std_logic;
    signal s_q_bar      :std_logic;

begin
uut_d_latch : entity work.d_latch
    port map(
        d       => s_d,
        en      => s_en,
        arst    => s_arst,
        q       => s_q,
        q_bar   => s_q_bar
    );
--------------------------------------------------------------------
    -- Enable generation process
--------------------------------------------------------------------
 p_en_gen : process
    begin
        s_en <= '0';
        wait for 22.5ns;      
        s_en <= '1';
        wait for 45ns;
        s_en <= '0';
        wait for 7.5ns;
        s_en <= '1';
        wait for 5ns;
    end process p_en_gen;
-------------------------------------------------------
    -- Reset generation process
--------------------------------------------------------------------
tb_arst : process
    begin
        s_arst <= '0';
        wait for 20 ns;
        s_arst <= '1';
        wait for 4ns;
    end process tb_arst;
--------------------------------------------------------------------
    -- Stimulus
--------------------------------------------------------------------
tb_stimulus : process
    begin
        s_d <= '1';
        wait for 20ns;   
        s_d <= '0';
        wait for 5ns;
        s_d <= '1';
        wait for 5ns;
        s_d <= '0';
        wait for 10ns;
    end process tb_stimulus;
    
tb_check : process
    begin
    wait until ((s_d = '0') and (s_en = '0') and (s_arst = '1'));
    wait for 0.4ns;
    assert (s_q = '0') and (s_q_bar = '1')
    report "Reset fault (D LOW)" severity error;
    
    wait until ((s_d = '1') and (s_en = '0') and (s_arst = '1'));
    wait for 0.4ns;  
    assert (s_q = '0') and (s_q_bar = '1')
    report "Reset fault (D HIGH)" severity error;
    
    wait until (rising_edge(s_d) and (s_en = '0') and (s_arst = '0') and (s_q = '0'));
    wait for 0.4ns; 
    assert (s_q = '0') and (s_q_bar = '1')
    report "Hold fault (Hold when EN is LOW)" severity error;
    
    wait until (falling_edge(s_d) and (s_en = '0') and (s_arst = '0') and (s_q = '1'));
    wait for 0.4ns; 
    assert (s_q = '1') and (s_q_bar = '0')
    report "Hold fault (Hold when EN is LOW)" severity error;
    
    wait until ((s_d = '1') and (s_en = '1') and (s_arst = '0'));
    wait for 0.4ns; 
    assert (s_q = '1') and (s_q_bar = '0') --transparency check
    report "Data fault" severity error;
      
    end process tb_check;

end Behavioral;
