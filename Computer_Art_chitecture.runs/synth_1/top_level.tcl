# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir {C:/Users/Alessio/Documents/PoliTo/II Anno/2_CA/Project/Computer_Art_chitecture/Computer_Art_chitecture.cache/wt} [current_project]
set_property parent.project_path {C:/Users/Alessio/Documents/PoliTo/II Anno/2_CA/Project/Computer_Art_chitecture/Computer_Art_chitecture.xpr} [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_output_repo {c:/Users/Alessio/Documents/PoliTo/II Anno/2_CA/Project/Computer_Art_chitecture/Computer_Art_chitecture.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
add_files {{C:/Users/Alessio/Documents/PoliTo/II Anno/2_CA/Project/Computer_Art_chitecture/Computer_Art_chitecture.srcs/sources_1/imports/BRAMtoVGA/my_coe.coe}}
add_files {{C:/Users/Alessio/Documents/PoliTo/II Anno/2_CA/Project/Computer_Art_chitecture/Computer_Art_chitecture.srcs/sources_1/imports/BRAMtoVGA/blank.coe}}
add_files {{C:/Users/Alessio/Documents/PoliTo/II Anno/2_CA/Project/Computer_Art_chitecture/Computer_Art_chitecture.srcs/sources_1/imports/BRAMtoVGA/newlogo.coe}}
read_vhdl -library xil_defaultlib {
  {C:/Users/Alessio/Documents/PoliTo/II Anno/2_CA/Project/Computer_Art_chitecture/Computer_Art_chitecture.srcs/sources_1/new/ADXL362Ctrl.vhd}
  {C:/Users/Alessio/Documents/PoliTo/II Anno/2_CA/Project/Computer_Art_chitecture/Computer_Art_chitecture.srcs/sources_1/new/AccelArithmetics.vhd}
  {C:/Users/Alessio/Documents/PoliTo/II Anno/2_CA/Project/Computer_Art_chitecture/Computer_Art_chitecture.srcs/sources_1/new/AccelerometerCtl.vhd}
  {C:/Users/Alessio/Documents/PoliTo/II Anno/2_CA/Project/Computer_Art_chitecture/Computer_Art_chitecture.srcs/sources_1/bd/BRAMRW/hdl/BRAMRW_wrapper.vhd}
  {C:/Users/Alessio/Documents/PoliTo/II Anno/2_CA/Project/Computer_Art_chitecture/Computer_Art_chitecture.srcs/sources_1/new/SPI_If.vhd}
  {C:/Users/Alessio/Documents/PoliTo/II Anno/2_CA/Project/Computer_Art_chitecture/Computer_Art_chitecture.srcs/sources_1/new/VGA_Sync.vhd}
  {C:/Users/Alessio/Documents/PoliTo/II Anno/2_CA/Project/Computer_Art_chitecture/Computer_Art_chitecture.srcs/sources_1/imports/hdl/clk25M_wrapper.vhd}
  {C:/Users/Alessio/Documents/PoliTo/II Anno/2_CA/Project/Computer_Art_chitecture/Computer_Art_chitecture.srcs/sources_1/new/top_level.vhd}
}
add_files {{C:/Users/Alessio/Documents/PoliTo/II Anno/2_CA/Project/Computer_Art_chitecture/Computer_Art_chitecture.srcs/sources_1/bd/BRAMRW/BRAMRW.bd}}
set_property used_in_implementation false [get_files -all {{c:/Users/Alessio/Documents/PoliTo/II Anno/2_CA/Project/Computer_Art_chitecture/Computer_Art_chitecture.srcs/sources_1/bd/BRAMRW/ip/BRAMRW_blk_mem_gen_0_0/BRAMRW_blk_mem_gen_0_0_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{C:/Users/Alessio/Documents/PoliTo/II Anno/2_CA/Project/Computer_Art_chitecture/Computer_Art_chitecture.srcs/sources_1/bd/BRAMRW/BRAMRW_ooc.xdc}}]

add_files {{C:/Users/Alessio/Documents/PoliTo/II Anno/2_CA/Project/Computer_Art_chitecture/Computer_Art_chitecture.srcs/sources_1/bd/clk25M/clk25M.bd}}
set_property used_in_implementation false [get_files -all {{c:/Users/Alessio/Documents/PoliTo/II Anno/2_CA/Project/Computer_Art_chitecture/Computer_Art_chitecture.srcs/sources_1/bd/clk25M/ip/clk25M_clk_wiz_0_0/clk25M_clk_wiz_0_0_board.xdc}}]
set_property used_in_implementation false [get_files -all {{c:/Users/Alessio/Documents/PoliTo/II Anno/2_CA/Project/Computer_Art_chitecture/Computer_Art_chitecture.srcs/sources_1/bd/clk25M/ip/clk25M_clk_wiz_0_0/clk25M_clk_wiz_0_0.xdc}}]
set_property used_in_implementation false [get_files -all {{c:/Users/Alessio/Documents/PoliTo/II Anno/2_CA/Project/Computer_Art_chitecture/Computer_Art_chitecture.srcs/sources_1/bd/clk25M/ip/clk25M_clk_wiz_0_0/clk25M_clk_wiz_0_0_ooc.xdc}}]
set_property used_in_implementation false [get_files -all {{C:/Users/Alessio/Documents/PoliTo/II Anno/2_CA/Project/Computer_Art_chitecture/Computer_Art_chitecture.srcs/sources_1/bd/clk25M/clk25M_ooc.xdc}}]

read_ip -quiet {{C:/Users/Alessio/Documents/PoliTo/II Anno/2_CA/Project/Computer_Art_chitecture/Computer_Art_chitecture.srcs/sources_1/ip/logo_rom/logo_rom.xci}}
set_property used_in_implementation false [get_files -all {{c:/Users/Alessio/Documents/PoliTo/II Anno/2_CA/Project/Computer_Art_chitecture/Computer_Art_chitecture.srcs/sources_1/ip/logo_rom/logo_rom_ooc.xdc}}]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc {{C:/Users/Alessio/Documents/PoliTo/II Anno/2_CA/Project/Computer_Art_chitecture/Computer_Art_chitecture.srcs/constrs_1/imports/BRAMtoVGA/Nexys-4-Master.xdc}}
set_property used_in_implementation false [get_files {{C:/Users/Alessio/Documents/PoliTo/II Anno/2_CA/Project/Computer_Art_chitecture/Computer_Art_chitecture.srcs/constrs_1/imports/BRAMtoVGA/Nexys-4-Master.xdc}}]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top top_level -part xc7a100tcsg324-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef top_level.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file top_level_utilization_synth.rpt -pb top_level_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
