----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.07.2017 15:30:27
-- Design Name: 
-- Module Name: testbench - Behavioral
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

entity testbench is
--  Port ( );
end testbench;

architecture Behavioral of testbench is

component Main
  Port (
        clk : in std_logic;
          rst : in std_logic;
          pwm : in std_logic_vector(6 downto 0);
          data_out : out std_logic_vector(1 downto 0)
  );
end component;

signal clk : std_logic :='0';
signal rst : std_logic :='0';
signal data_out : std_logic_vector(1 downto 0):=(others=>'0');
signal pwm : std_logic_vector(6 downto 0):=(others=>'0');


begin

uut: Main
port map(
    clk => clk,
    rst => rst,
    pwm => pwm,
    data_out => data_out
    );


clk_100mhz: process
begin
    clk<='1';
    wait for 5ns;
    clk<='0';
    wait for 5ns;
end process;

process
begin
    --rst<='1';
    wait for 100ns;
    pwm<="0010100"; --Decimal 20
--    wait for 2000ns;
--    pwm<="0100100"; --Decimal 68
--    wait for 2000ns;
--    pwm<="0000000"; --Decimal 1
--    wait for 2000ns;
end process;

end Behavioral;
