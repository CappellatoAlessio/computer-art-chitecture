--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
--Date        : Fri May 25 17:39:24 2018
--Host        : DESKTOP-HGCFA0A running 64-bit major release  (build 9200)
--Command     : generate_target BRAMRW.bd
--Design      : BRAMRW
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity BRAMRW is
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
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of BRAMRW : entity is "BRAMRW,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=BRAMRW,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of BRAMRW : entity is "BRAMRW.hwdef";
end BRAMRW;

architecture STRUCTURE of BRAMRW is
  component BRAMRW_blk_mem_gen_0_0 is
  port (
    clka : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 18 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 11 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 11 downto 0 );
    clkb : in STD_LOGIC;
    web : in STD_LOGIC_VECTOR ( 0 to 0 );
    addrb : in STD_LOGIC_VECTOR ( 18 downto 0 );
    dinb : in STD_LOGIC_VECTOR ( 11 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  end component BRAMRW_blk_mem_gen_0_0;
  signal BRAM_PORTA_0_1_ADDR : STD_LOGIC_VECTOR ( 18 downto 0 );
  signal BRAM_PORTA_0_1_CLK : STD_LOGIC;
  signal BRAM_PORTA_0_1_DIN : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal BRAM_PORTA_0_1_DOUT : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal BRAM_PORTA_0_1_WE : STD_LOGIC_VECTOR ( 0 to 0 );
  signal BRAM_PORTB_0_1_ADDR : STD_LOGIC_VECTOR ( 18 downto 0 );
  signal BRAM_PORTB_0_1_CLK : STD_LOGIC;
  signal BRAM_PORTB_0_1_DIN : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal BRAM_PORTB_0_1_DOUT : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal BRAM_PORTB_0_1_WE : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of BRAM_PORTA_0_clk : signal is "xilinx.com:interface:bram:1.0 BRAM_PORTA_0 CLK";
  attribute X_INTERFACE_INFO of BRAM_PORTB_0_clk : signal is "xilinx.com:interface:bram:1.0 BRAM_PORTB_0 CLK";
  attribute X_INTERFACE_INFO of BRAM_PORTA_0_addr : signal is "xilinx.com:interface:bram:1.0 BRAM_PORTA_0 ADDR";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of BRAM_PORTA_0_addr : signal is "XIL_INTERFACENAME BRAM_PORTA_0, MASTER_TYPE OTHER, MEM_ECC NONE, MEM_SIZE 8192, MEM_WIDTH 32";
  attribute X_INTERFACE_INFO of BRAM_PORTA_0_din : signal is "xilinx.com:interface:bram:1.0 BRAM_PORTA_0 DIN";
  attribute X_INTERFACE_INFO of BRAM_PORTA_0_dout : signal is "xilinx.com:interface:bram:1.0 BRAM_PORTA_0 DOUT";
  attribute X_INTERFACE_INFO of BRAM_PORTA_0_we : signal is "xilinx.com:interface:bram:1.0 BRAM_PORTA_0 WE";
  attribute X_INTERFACE_INFO of BRAM_PORTB_0_addr : signal is "xilinx.com:interface:bram:1.0 BRAM_PORTB_0 ADDR";
  attribute X_INTERFACE_PARAMETER of BRAM_PORTB_0_addr : signal is "XIL_INTERFACENAME BRAM_PORTB_0, MASTER_TYPE OTHER, MEM_ECC NONE, MEM_SIZE 8192, MEM_WIDTH 32";
  attribute X_INTERFACE_INFO of BRAM_PORTB_0_din : signal is "xilinx.com:interface:bram:1.0 BRAM_PORTB_0 DIN";
  attribute X_INTERFACE_INFO of BRAM_PORTB_0_dout : signal is "xilinx.com:interface:bram:1.0 BRAM_PORTB_0 DOUT";
  attribute X_INTERFACE_INFO of BRAM_PORTB_0_we : signal is "xilinx.com:interface:bram:1.0 BRAM_PORTB_0 WE";
begin
  BRAM_PORTA_0_1_ADDR(18 downto 0) <= BRAM_PORTA_0_addr(18 downto 0);
  BRAM_PORTA_0_1_CLK <= BRAM_PORTA_0_clk;
  BRAM_PORTA_0_1_DIN(11 downto 0) <= BRAM_PORTA_0_din(11 downto 0);
  BRAM_PORTA_0_1_WE(0) <= BRAM_PORTA_0_we(0);
  BRAM_PORTA_0_dout(11 downto 0) <= BRAM_PORTA_0_1_DOUT(11 downto 0);
  BRAM_PORTB_0_1_ADDR(18 downto 0) <= BRAM_PORTB_0_addr(18 downto 0);
  BRAM_PORTB_0_1_CLK <= BRAM_PORTB_0_clk;
  BRAM_PORTB_0_1_DIN(11 downto 0) <= BRAM_PORTB_0_din(11 downto 0);
  BRAM_PORTB_0_1_WE(0) <= BRAM_PORTB_0_we(0);
  BRAM_PORTB_0_dout(11 downto 0) <= BRAM_PORTB_0_1_DOUT(11 downto 0);
blk_mem_gen_0: component BRAMRW_blk_mem_gen_0_0
     port map (
      addra(18 downto 0) => BRAM_PORTA_0_1_ADDR(18 downto 0),
      addrb(18 downto 0) => BRAM_PORTB_0_1_ADDR(18 downto 0),
      clka => BRAM_PORTA_0_1_CLK,
      clkb => BRAM_PORTB_0_1_CLK,
      dina(11 downto 0) => BRAM_PORTA_0_1_DIN(11 downto 0),
      dinb(11 downto 0) => BRAM_PORTB_0_1_DIN(11 downto 0),
      douta(11 downto 0) => BRAM_PORTA_0_1_DOUT(11 downto 0),
      doutb(11 downto 0) => BRAM_PORTB_0_1_DOUT(11 downto 0),
      wea(0) => BRAM_PORTA_0_1_WE(0),
      web(0) => BRAM_PORTB_0_1_WE(0)
    );
end STRUCTURE;
