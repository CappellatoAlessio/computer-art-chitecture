----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.05.2018 00:14:12
-- Design Name: 
-- Module Name: AccelArithmetics - Behavioral
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
--use IEEE.STD_LOGIC_ARITH.ALL;
--use ieee.math_real.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_signed.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AccelArithmetics is
generic 
(
   SYSCLK_FREQUENCY_HZ : integer := 100000000;
   ACC_X_Y_MAX         : STD_LOGIC_VECTOR (9 downto 0) := "01" & X"FF"; -- 511 pixels, corresponding to +1g
   ACC_X_Y_MIN         : STD_LOGIC_VECTOR (9 downto 0) := (others => '0') -- corresponding to -1g
);
port
(
 SYSCLK     : in STD_LOGIC; -- System Clock
 RESET      : in STD_LOGIC;
 
 -- Accelerometer data input signals
 ACCEL_X_IN    : in STD_LOGIC_VECTOR (11 downto 0);
 ACCEL_Y_IN    : in STD_LOGIC_VECTOR (11 downto 0);
 ACCEL_Z_IN    : in STD_LOGIC_VECTOR (11 downto 0);
 Data_Ready    : in STD_LOGIC;

 -- Accelerometer data output signals to be sent to the VGA display
 ACCEL_X_OUT    : out STD_LOGIC_VECTOR (8 downto 0);
 ACCEL_Y_OUT    : out STD_LOGIC_VECTOR (8 downto 0)
);
end AccelArithmetics;

architecture Behavioral of AccelArithmetics is
-- convert ACCEL_X and ACCEL_Y data to unsigned and divide by 4 
-- (scaled to 0-1023, with -2g=0, 0g=511, 2g=1023)
-- Then limit to -1g = 0, 0g = 255, 1g = 511

-- Use a Square Root Logicore component to calculate the magnitude

constant SUM_FACTOR : std_logic_vector (12 downto 0) :=  '0' & X"7FF"; --2047
constant LOWER_ACC_BOUNDARY : std_logic_vector (9 downto 0) := "00" & X"FF"; -- 255
constant UPPER_ACC_BOUNDARY : std_logic_vector (9 downto 0) := "10" & X"FF"; -- 767

signal ACCEL_X_SUM : std_logic_vector (12 downto 0) := (others => '0'); -- one more bit to keep the sign extension
signal ACCEL_Y_SUM : std_logic_vector (12 downto 0) := (others => '0');

signal ACCEL_X_SUM_SHIFTED : std_logic_vector (9 downto 0) := (others => '0'); -- Divide the sum by four
signal ACCEL_Y_SUM_SHIFTED : std_logic_vector (9 downto 0) := (others => '0');

signal ACCEL_X_CLIP : std_logic_vector (9 downto 0) := (others => '0');
signal ACCEL_Y_CLIP : std_logic_vector (9 downto 0) := (others => '0');

-- Pipe Data_Ready
signal Data_Ready_0, Data_Ready_1 : std_logic := '0';

begin

-- Add 2047 to the incoming acceleration data
-- Therefore ACCEL_X_SUM and ACCEL_Y_SUM will be scaled to 
-- -2g = 0, -1g = 1023, 0g = 2047, 1g = 3071, 2g = 4095
Accel_Sum: process (SYSCLK, RESET, ACCEL_X_IN, ACCEL_Y_IN, Data_Ready)
begin
   if SYSCLK'EVENT and SYSCLK = '1' then
      if RESET = '1' then 
         ACCEL_X_SUM <= (others => '0');
         ACCEL_Y_SUM <= (others => '0');
      elsif Data_Ready = '1' then
         if ACCEL_X_IN(11) = '1' then -- if negative, keep the sign extension
            ACCEL_X_SUM <= ('1' & ACCEL_X_IN) + SUM_FACTOR;
         else
            ACCEL_X_SUM <= ('0' & ACCEL_X_IN) + SUM_FACTOR;
         end if;
         
         if ACCEL_Y_IN(11) = '1' then -- if negative, keep the sign extension
            ACCEL_Y_SUM <= ('1' & ACCEL_Y_IN) + SUM_FACTOR;
         else
            ACCEL_Y_SUM <= ('0' & ACCEL_Y_IN) + SUM_FACTOR;

         end if;
      end if;
   end if;
end process Accel_Sum;

-- Divide by four ACCEL_X_SUM and ACCEL_Y_SUM, therefore will be scaled to
-- -2g = 0, -1g = 255, 0g = 511, 1g = 767, 2g = 1023
ACCEL_X_SUM_SHIFTED <= ACCEL_X_SUM(11 downto 2);
ACCEL_Y_SUM_SHIFTED <= ACCEL_Y_SUM(11 downto 2);

-- Subtract 255 and limit to -1g = 0, 0g = 255, 1g = 511 
Accel_Clip: process (SYSCLK, RESET, ACCEL_X_SUM, ACCEL_Y_SUM)
begin
   if SYSCLK'EVENT and SYSCLK = '1' then
      if RESET = '1' then 
         ACCEL_X_CLIP <= (others => '0');
         ACCEL_Y_CLIP <= (others => '0');
      else -- If the sum is negative or < 255 (-1g)
            if (ACCEL_X_SUM(12) = '1') or (unsigned(ACCEL_X_SUM_SHIFTED) < unsigned(LOWER_ACC_BOUNDARY)) then  
               ACCEL_X_CLIP <= ACC_X_Y_MIN ; -- Limit to 0
            elsif (unsigned(ACCEL_X_SUM_SHIFTED) >= unsigned(UPPER_ACC_BOUNDARY)) then
               ACCEL_X_CLIP <= ACC_X_Y_MAX; -- Limit to 511
            else
               ACCEL_X_CLIP <= ACCEL_X_SUM_SHIFTED - LOWER_ACC_BOUNDARY; -- subtract 255
            end if;
            -- If the sum is negative or < 255 (-1g)
            if (ACCEL_Y_SUM(12) = '1') or (unsigned(ACCEL_Y_SUM_SHIFTED) < unsigned(LOWER_ACC_BOUNDARY)) then  
                  ACCEL_Y_CLIP <= ACC_X_Y_MIN; -- Limit to 0
            elsif (unsigned(ACCEL_Y_SUM_SHIFTED) >= unsigned(UPPER_ACC_BOUNDARY)) then
                  ACCEL_Y_CLIP <= ACC_X_Y_MAX; -- Limit to 511
            else
                  ACCEL_Y_CLIP <= ACCEL_Y_SUM_SHIFTED - LOWER_ACC_BOUNDARY; -- subtract 255
            end if;
     end if;
   end if;
end process Accel_Clip;
 
-- ACCEL_X_CLIP and ACCEL_Y_CLIP values (0-511) can be represented on 9 bits
ACCEL_X_OUT <= ACCEL_X_CLIP(8 downto 0);
-- Invert ACCEL_Y_CLIP data to display on the screen the box movement 
-- on the Y axis according to the board movement
ACCEL_Y_OUT <= (NOT ACCEL_Y_CLIP(8 downto 0)) + "000000001";
 

end Behavioral;

