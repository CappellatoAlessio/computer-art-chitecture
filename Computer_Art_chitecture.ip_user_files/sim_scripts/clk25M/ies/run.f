-makelib ies_lib/xil_defaultlib -sv \
  "C:/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies_lib/xpm \
  "C:/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../BRAMtoVGA.srcs/sources_1/bd/clk25M/sim/clk25M.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

