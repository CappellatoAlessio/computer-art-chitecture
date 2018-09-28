--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
--Date        : Wed May 23 17:32:26 2018
--Host        : DESKTOP-HGCFA0A running 64-bit major release  (build 9200)
--Command     : generate_target clk25M_wrapper.bd
--Design      : clk25M_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clk25M_wrapper is
  port (
    clk_in1_0 : in STD_LOGIC;
    clk_out1_0 : out STD_LOGIC
  );
end clk25M_wrapper;

architecture STRUCTURE of clk25M_wrapper is
  component clk25M is
  port (
    clk_in1_0 : in STD_LOGIC;
    clk_out1_0 : out STD_LOGIC
  );
  end component clk25M;
begin
clk25M_i: component clk25M
     port map (
      clk_in1_0 => clk_in1_0,
      clk_out1_0 => clk_out1_0
    );
end STRUCTURE;
