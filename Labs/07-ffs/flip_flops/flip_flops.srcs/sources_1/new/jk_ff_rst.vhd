----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.03.2021 11:39:07
-- Design Name: 
-- Module Name: jk_ff_rst - Behavioral
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

entity jk_ff_rst is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           j : in STD_LOGIC;
           k : in STD_LOGIC;
           q : out STD_LOGIC;
           q_bar : out STD_LOGIC);
end jk_ff_rst;

architecture Behavioral of jk_ff_rst is

begin
p_jk_ff_rst: process(clk)
    variable q_local : std_logic;
    begin
        if rising_edge(clk) then
            if (rst = '1') then
                q_local := '0';
            elsif ((j = '1')and(k = '1')) then
                q_local := not q_local;
            elsif (j = '1') then
                q_local := '1';
            elsif (k = '1') then
                q_local := '0';
            end if;
            q <= q_local;
            q_bar <= not q_local;
        end if;
    end process p_jk_ff_rst;

end Behavioral;
