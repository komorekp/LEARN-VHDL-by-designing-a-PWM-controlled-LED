----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.07.2017 15:00:46
-- Design Name: 
-- Module Name: Main - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Main is
  Port (
        clk : in std_logic;
        rst : in std_logic;
        pwm : in std_logic_vector(6 downto 0);
        data_out : out std_logic_vector(1 downto 0)
  );
end Main;

architecture Behavioral of Main is

signal sqr_wave : std_logic_vector(1 downto 0):= (others=>'0');
signal count_sqr : integer range 0 to 100 :=0;
signal N : integer range 0 to 100 := 50; --Duty cycle
signal count_delay : integer range 0 to 100:=0;
signal clk10Mhz : std_logic :='0';
signal clk50Mhz : std_logic :='0';

component clk_wiz_0
port
 (-- Clock in ports
  clk_in1           : in     std_logic;
  -- Clock out ports
  clk_out1          : out    std_logic;
  clk_out2          : out    std_logic;
  -- Status and control signals
  reset             : in     std_logic
 );
end component;

begin

your_instance_name : clk_wiz_0
   port map ( 
   -- Clock in ports
   clk_in1 => clk,
  -- Clock out ports  
   clk_out1 => clk10Mhz,
   clk_out2 => clk50Mhz,
  -- Status and control signals                
   reset => rst             
 );
 
data_out <= sqr_wave;

process(clk50Mhz, rst)
begin
if(rst='1') then

    sqr_wave <= (others=>'0');
    count_sqr <= 0;
    N <= 0;   
    
    else
    if(rising_edge(clk50Mhz)) then
       
        count_sqr<= count_sqr + 1;
        
        if(count_sqr>=0 and count_sqr<N) then
            sqr_wave <= (others=>'1');
        elsif(count_sqr>=N and count_sqr<= 99) then
            sqr_wave <= (others=>'0');
        end if;
        
        if(count_sqr=99) then
            N <= to_integer(unsigned(pwm));
            count_sqr<=0;
        end if;
    end if;
end if;
end process;

end Behavioral;
