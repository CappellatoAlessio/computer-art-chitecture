--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
--Date        : Thu Jun 14 09:19:31 2018
--Host        : DESKTOP-JVB0SPP running 64-bit major release  (build 9200)
--Command     : generate_target BRAMRW_wrapper.bd
--Design      : BRAMRW_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity BRAMRW_wrapper is
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
end BRAMRW_wrapper;

architecture STRUCTURE of BRAMRW_wrapper is
  component BRAMRW is
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
  end component BRAMRW;
begin
BRAMRW_i: component BRAMRW
     port map (
      BRAM_PORTA_0_addr(18 downto 0) => BRAM_PORTA_0_addr(18 downto 0),
      BRAM_PORTA_0_clk => BRAM_PORTA_0_clk,
      BRAM_PORTA_0_din(11 downto 0) => BRAM_PORTA_0_din(11 downto 0),
      BRAM_PORTA_0_dout(11 downto 0) => BRAM_PORTA_0_dout(11 downto 0),
      BRAM_PORTA_0_we(0) => BRAM_PORTA_0_we(0),
      BRAM_PORTB_0_addr(18 downto 0) => BRAM_PORTB_0_addr(18 downto 0),
      BRAM_PORTB_0_clk => BRAM_PORTB_0_clk,
      BRAM_PORTB_0_din(11 downto 0) => BRAM_PORTB_0_din(11 downto 0),
      BRAM_PORTB_0_dout(11 downto 0) => BRAM_PORTB_0_dout(11 downto 0),
      BRAM_PORTB_0_we(0) => BRAM_PORTB_0_we(0)
    );
end STRUCTURE;
