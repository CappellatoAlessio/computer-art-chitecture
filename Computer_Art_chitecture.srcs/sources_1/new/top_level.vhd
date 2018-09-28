----------------------------------------------------------------------------------
-- Company: Politecnico di Torino
-- Engineer: Giuliano Albanese, Alessio Cappellato, Mehdi Khrichfa 
-- 
-- Create Date: 23.05.2018 18:33:51
-- Design Name: Computer Art-chitecture
-- Module Name: top_level - Behavioral
-- Project Name: Computer Architecture 2018
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
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_level is
    Port ( clk : in STD_LOGIC;
           sw : in STD_LOGIC_VECTOR (15 downto 0);
           rst : in STD_LOGIC; 
           red : out STD_LOGIC_VECTOR (3 downto 0);
           green : out STD_LOGIC_VECTOR (3 downto 0);
           blue : out STD_LOGIC_VECTOR (3 downto 0);
           hsync : out STD_LOGIC;
           vsync : out STD_LOGIC;
           sclk : out STD_LOGIC;
           mosi : out STD_LOGIC;
           miso : in STD_LOGIC;
           ss : out STD_LOGIC
           
        );
end top_level;

architecture Behavioral of top_level is
    
    component AccelerometerCtl is
        generic 
        (
           SYSCLK_FREQUENCY_HZ : integer := 100000000;
           SCLK_FREQUENCY_HZ   : integer := 1000000;
           NUM_READS_AVG       : integer := 16;
           UPDATE_FREQUENCY_HZ : integer := 100
        );
        port
        (
         SYSCLK     : in STD_LOGIC; -- System Clock
         RESET      : in STD_LOGIC;
        
         -- Spi interface Signals
         SCLK       : out STD_LOGIC;
         MOSI       : out STD_LOGIC;
         MISO       : in STD_LOGIC;
         SS         : out STD_LOGIC;
        
        -- Accelerometer data signals
         ACCEL_X_OUT    : out STD_LOGIC_VECTOR (8 downto 0);
         ACCEL_Y_OUT    : out STD_LOGIC_VECTOR (8 downto 0)
        
        );
        end component;
        
    COMPONENT logo_rom
          PORT (
            clka : IN STD_LOGIC;
            addra : IN STD_LOGIC_VECTOR(18 DOWNTO 0);
            douta : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
          );
    END COMPONENT;
    
    component VGA_Sync
    Port ( clk : in STD_LOGIC;
           hsync : out STD_LOGIC;
           vsync : out STD_LOGIC;
           video_on : out STD_LOGIC; 
           clr : in STD_LOGIC;
           x : out integer;
           y : out integer          
    );
    end component;
    
    component BRAMRW_wrapper is
      port (
        BRAM_PORTA_0_addr : in STD_LOGIC_VECTOR ( 18 downto 0 );
        BRAM_PORTA_0_clk : in STD_LOGIC;
        BRAM_PORTA_0_din : in STD_LOGIC_VECTOR ( 11 downto 0 );
        BRAM_PORTA_0_dout : out STD_LOGIC_VECTOR ( 11 downto 0 );
        BRAM_PORTA_0_we : in STD_LOGIC_VECTOR ( 0 to 0 );
        BRAM_PORTB_0_addr : in STD_LOGIC_VECTOR ( 18 downto 0 );
        BRAM_PORTB_0_clk : in STD_LOGIC;
        BRAM_PORTB_0_din : in STD_LOGIC_VECTOR ( 11 downto 0 );
        BRAM_PORTB_0_dout : out STD_LOGIC_VECTOR ( 11 downto 0 );
        BRAM_PORTB_0_we : in STD_LOGIC_VECTOR ( 0 to 0 )
      );
    end component;
    
    signal video_on : STD_LOGIC;
    signal x : integer;
    signal y : integer;
    
    
    signal vsync_signal : std_logic;
    signal hsync_signal : std_logic;
            
    
    --dot position
    signal xpos : integer := 315;
    signal ypos : integer := 235;
    
    --bram signals
    signal pixel : std_logic_vector (11 downto 0);
    signal addr : std_logic_vector (18 downto 0) := "0000000000000000000";
    signal we_b : std_logic_vector (0 downto 0) := "0";
    signal input : std_logic_vector (11 downto 0) := "000000000000";
    
    --accellerometer signals
    signal ACCEL_X : STD_LOGIC_VECTOR(8 downto 0);
    signal ACCEL_Y : STD_LOGIC_VECTOR(8 downto 0);
    signal xspeed : integer;
    signal yspeed : integer;
    signal xdir : integer;
    signal ydir : integer;
    signal speedcounter : std_logic_vector (7 downto 0) := "00000000";
    signal not_rst : std_logic;
    
    --Show logo parameters
    signal logo_counter : integer;
    constant show_logo : integer:= 900;
    signal inner_logo_counter : integer:= 0;
    signal showing_logo : std_logic;
    
    --Logo ROM parameters
    signal addrf: std_logic_vector(18 downto 0);
    signal doutf: std_logic_vector(0 downto 0);
    
    
    
    --dot size and speed
    signal size : integer := 10;
    constant speed : integer := 1;
    
    
    
begin

    accel : AccelerometerCtl 
        port map
        (
         SYSCLK     => clk,
         RESET      => not_rst,
        
         SCLK       => sclk,
         MOSI       => mosi,
         MISO       => miso,
         SS         => ss,
        
        -- Accelerometer data signals
         ACCEL_X_OUT    => ACCEL_X,
         ACCEL_Y_OUT    => ACCEL_Y
        
        );
    
    sync : VGA_Sync
        port map(
            clk => clk,
            hsync => hsync_signal,
            vsync => vsync_signal,
            video_on  => video_on,
            clr => '0',
            x => x,
            y => y
        );
    
    BRAMRW : BRAMRW_wrapper
              port map (
                BRAM_PORTA_0_addr => addr,
                BRAM_PORTA_0_clk => clk,
                BRAM_PORTA_0_din => "000000000000",
                BRAM_PORTA_0_dout =>pixel,
                BRAM_PORTA_0_we => "0",
                BRAM_PORTB_0_addr => addr,
                BRAM_PORTB_0_clk => clk,
                BRAM_PORTB_0_din => input,
                BRAM_PORTB_0_we => we_b
              );
   Logo : logo_rom
                PORT MAP (
                  clka => clk,
                  addra => addrf,
                  douta => doutf
                );
                
    not_rst <= NOT rst; 
    vsync <= vsync_signal;
    hsync <= hsync_signal;
        
   
    addr <= std_logic_vector(to_unsigned(y*640+x,19)) when video_on = '1';
    addrf <= addr when showing_logo = '1';
    
    size <= to_integer(unsigned(sw(15 downto 12))) + 1;
        
    process(clk)
    begin
        if rising_edge(clk) then
            red <= "0000";
            green <= "0000";
            blue <= "0000";
            input <= "000000000000";
            we_b <= "0";
            
            if video_on='1' then
                
                if(showing_logo = '1') then
                    if(doutf = "0") then
                        red <= "1111";
                        green <= "1111";
                        blue <= "1111";
                    elsif(doutf = "1") then
                        red <= "0000";
                        green <= "0000";
                        blue <= "0000";
                    end if;
                
                else 
                    red <= pixel (11 downto 8);
                    green <= pixel (7 downto 4);
                    blue <= pixel (3 downto 0);
                    input <= pixel;
                    
                    if((x >= xpos and x<xpos+size) and (y >= ypos and y<ypos+size)) then
                        red <= sw (11 downto 8);
                        green <= sw (7 downto 4);
                        blue <= sw (3 downto 0);
                        input <= sw(11 downto 0);
                        we_b <= "1";
                    end if;
                end if;
            end if;    
        end if;                        
    end process;
    
    xdir <= 1 when ACCEL_X > 255 else -1;
                              
    ydir <= -1 when ACCEL_Y > 255 else 1;
    
    xspeed <=  0 when (ACCEL_X >= 256 and ACCEL_X < 272) or (ACCEL_X >= 240 and ACCEL_X < 256) else
                  1 when (ACCEL_X >= 272 and ACCEL_X < 320) or (ACCEL_X >= 192 and ACCEL_X < 240) else
                  2 when (ACCEL_X >= 320 and ACCEL_X < 352) or (ACCEL_X >= 160 and ACCEL_X < 192) else
                  3 when (ACCEL_X >= 352 and ACCEL_X < 384) or (ACCEL_X >= 128 and ACCEL_X < 160) else
                  4 when (ACCEL_X >= 384 and ACCEL_X < 416) or (ACCEL_X >= 96  and ACCEL_X < 128) else
                  5 when (ACCEL_X >= 416 and ACCEL_X < 448) or (ACCEL_X >= 64  and ACCEL_X < 96)  else
                  6 when (ACCEL_X >= 448 and ACCEL_X < 480) or (ACCEL_X >= 32  and ACCEL_X < 64)  else
                  7 when (ACCEL_X >= 480 and ACCEL_X < 512) or (ACCEL_X >= 0   and ACCEL_X < 32);
               
   --Note: the y direction is inverted
               
    yspeed <=   0 when (ACCEL_Y >= 256 and ACCEL_Y < 272) or (ACCEL_Y >= 240 and ACCEL_Y < 256) else
                   1 when (ACCEL_Y >= 272 and ACCEL_Y < 320) or (ACCEL_Y >= 192 and ACCEL_Y < 240) else
                   2 when (ACCEL_Y >= 320 and ACCEL_Y < 352) or (ACCEL_Y >= 160 and ACCEL_Y < 192) else
                   3 when (ACCEL_Y >= 352 and ACCEL_Y < 384) or (ACCEL_Y >= 128 and ACCEL_Y < 160) else
                   4 when (ACCEL_Y >= 384 and ACCEL_Y < 416) or (ACCEL_Y >= 96  and ACCEL_Y < 128) else
                   5 when (ACCEL_Y >= 416 and ACCEL_Y < 448) or (ACCEL_Y >= 64  and ACCEL_Y < 96)  else
                   6 when (ACCEL_Y >= 448 and ACCEL_Y < 480) or (ACCEL_Y >= 32  and ACCEL_Y < 64)  else
                   7 when (ACCEL_Y >= 480 and ACCEL_Y < 512) or (ACCEL_Y >= 0   and ACCEL_Y < 32);
    
    process(vsync_signal)
    begin
        if(rising_edge(vsync_signal)) then
            speedcounter(6 downto 0) <= speedcounter(6 downto 0) + 1;
        end if;
    end process;
    
    process(speedcounter)
     begin
         if(rising_edge(speedcounter(7-xspeed))) then
     
             xpos <= xpos + xdir*2;
             
             if(xpos+size > 640) then
                 xpos <= 0;
             end if;
             if(xpos < 0) then
                 xpos <= 640-size;
             end if;
           
         end if;
         
         if(rising_edge(speedcounter(7-yspeed))) then
             
             ypos <= ypos + ydir*2;   
             
             if(ypos+size > 480) then
                 ypos <= 0;
             end if;
             if(ypos < 0) then
                 ypos <= 480-size;
             end if;
         end if;
     end process;
     
    showing_logo <= '0' when logo_counter = show_logo else '1';

    process(clk)
     begin   
         if(rising_edge(clk)) then
             if(logo_counter = show_logo) then
                 logo_counter <= logo_counter;
             else
                 if(inner_logo_counter = 1666666) then
                     logo_counter <= logo_counter + 1;
                     inner_logo_counter <= 0;
                 else
                     inner_logo_counter <= inner_logo_counter + 1;
                 end if; 
             end if;
         end if;
     
     end process;
    
    
end Behavioral;
