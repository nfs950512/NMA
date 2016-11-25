
# (C) 2001-2016 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and 
# other software and tools, and its AMPP partner logic functions, and 
# any output files any of the foregoing (including device programming 
# or simulation files), and any associated documentation or information 
# are expressly subject to the terms and conditions of the Altera 
# Program License Subscription Agreement, Altera MegaCore Function 
# License Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by Altera 
# or its authorized distributors. Please refer to the applicable 
# agreement for further details.

# ACDS 13.0sp1 232 win32 2016.11.24.21:36:25

# ----------------------------------------
# Auto-generated simulation script

# ----------------------------------------
# Initialize the variable
if ![info exists SYSTEM_INSTANCE_NAME] { 
  set SYSTEM_INSTANCE_NAME ""
} elseif { ![ string match "" $SYSTEM_INSTANCE_NAME ] } { 
  set SYSTEM_INSTANCE_NAME "/$SYSTEM_INSTANCE_NAME"
} 

if ![info exists TOP_LEVEL_NAME] { 
  set TOP_LEVEL_NAME "vectadd_tb"
} 

if ![info exists QSYS_SIMDIR] { 
  set QSYS_SIMDIR "./../"
} 

if ![info exists QUARTUS_INSTALL_DIR] { 
  set QUARTUS_INSTALL_DIR "C:/altera/13.0sp1/quartus/"
} 


# ----------------------------------------
# Copy ROM/RAM files to simulation directory
alias file_copy {
  echo "\[exec\] file_copy"
  file copy -force $QSYS_SIMDIR/vectadd_tb/simulation/submodules/vectadd_onchip_memory2_0.hex ./
  file copy -force $QSYS_SIMDIR/vectadd_tb/simulation/submodules/vectadd_nios2_qsys_0_ociram_default_contents.dat ./
  file copy -force $QSYS_SIMDIR/vectadd_tb/simulation/submodules/vectadd_nios2_qsys_0_ociram_default_contents.hex ./
  file copy -force $QSYS_SIMDIR/vectadd_tb/simulation/submodules/vectadd_nios2_qsys_0_ociram_default_contents.mif ./
  file copy -force $QSYS_SIMDIR/vectadd_tb/simulation/submodules/vectadd_nios2_qsys_0_rf_ram_a.dat ./
  file copy -force $QSYS_SIMDIR/vectadd_tb/simulation/submodules/vectadd_nios2_qsys_0_rf_ram_a.hex ./
  file copy -force $QSYS_SIMDIR/vectadd_tb/simulation/submodules/vectadd_nios2_qsys_0_rf_ram_a.mif ./
  file copy -force $QSYS_SIMDIR/vectadd_tb/simulation/submodules/vectadd_nios2_qsys_0_rf_ram_b.dat ./
  file copy -force $QSYS_SIMDIR/vectadd_tb/simulation/submodules/vectadd_nios2_qsys_0_rf_ram_b.hex ./
  file copy -force $QSYS_SIMDIR/vectadd_tb/simulation/submodules/vectadd_nios2_qsys_0_rf_ram_b.mif ./
}

# ----------------------------------------
# Create compilation libraries
proc ensure_lib { lib } { if ![file isdirectory $lib] { vlib $lib } }
ensure_lib          ./libraries/     
ensure_lib          ./libraries/work/
vmap       work     ./libraries/work/
vmap       work_lib ./libraries/work/
if { ![ string match "*ModelSim ALTERA*" [ vsim -version ] ] } {
  ensure_lib                  ./libraries/altera_ver/      
  vmap       altera_ver       ./libraries/altera_ver/      
  ensure_lib                  ./libraries/lpm_ver/         
  vmap       lpm_ver          ./libraries/lpm_ver/         
  ensure_lib                  ./libraries/sgate_ver/       
  vmap       sgate_ver        ./libraries/sgate_ver/       
  ensure_lib                  ./libraries/altera_mf_ver/   
  vmap       altera_mf_ver    ./libraries/altera_mf_ver/   
  ensure_lib                  ./libraries/altera_lnsim_ver/
  vmap       altera_lnsim_ver ./libraries/altera_lnsim_ver/
  ensure_lib                  ./libraries/cycloneii_ver/   
  vmap       cycloneii_ver    ./libraries/cycloneii_ver/   
}
ensure_lib                                                                                   ./libraries/altera_avalon_vip_pkgs_lib/                                                       
vmap       altera_avalon_vip_pkgs_lib                                                        ./libraries/altera_avalon_vip_pkgs_lib/                                                       
ensure_lib                                                                                   ./libraries/irq_mapper/                                                                       
vmap       irq_mapper                                                                        ./libraries/irq_mapper/                                                                       
ensure_lib                                                                                   ./libraries/rsp_xbar_mux_001/                                                                 
vmap       rsp_xbar_mux_001                                                                  ./libraries/rsp_xbar_mux_001/                                                                 
ensure_lib                                                                                   ./libraries/rsp_xbar_mux/                                                                     
vmap       rsp_xbar_mux                                                                      ./libraries/rsp_xbar_mux/                                                                     
ensure_lib                                                                                   ./libraries/rsp_xbar_demux_003/                                                               
vmap       rsp_xbar_demux_003                                                                ./libraries/rsp_xbar_demux_003/                                                               
ensure_lib                                                                                   ./libraries/rsp_xbar_demux/                                                                   
vmap       rsp_xbar_demux                                                                    ./libraries/rsp_xbar_demux/                                                                   
ensure_lib                                                                                   ./libraries/cmd_xbar_mux/                                                                     
vmap       cmd_xbar_mux                                                                      ./libraries/cmd_xbar_mux/                                                                     
ensure_lib                                                                                   ./libraries/cmd_xbar_demux_001/                                                               
vmap       cmd_xbar_demux_001                                                                ./libraries/cmd_xbar_demux_001/                                                               
ensure_lib                                                                                   ./libraries/cmd_xbar_demux/                                                                   
vmap       cmd_xbar_demux                                                                    ./libraries/cmd_xbar_demux/                                                                   
ensure_lib                                                                                   ./libraries/rst_controller/                                                                   
vmap       rst_controller                                                                    ./libraries/rst_controller/                                                                   
ensure_lib                                                                                   ./libraries/id_router_003/                                                                    
vmap       id_router_003                                                                     ./libraries/id_router_003/                                                                    
ensure_lib                                                                                   ./libraries/id_router/                                                                        
vmap       id_router                                                                         ./libraries/id_router/                                                                        
ensure_lib                                                                                   ./libraries/addr_router_001/                                                                  
vmap       addr_router_001                                                                   ./libraries/addr_router_001/                                                                  
ensure_lib                                                                                   ./libraries/addr_router/                                                                      
vmap       addr_router                                                                       ./libraries/addr_router/                                                                      
ensure_lib                                                                                   ./libraries/nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo/
vmap       nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo ./libraries/nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo/
ensure_lib                                                                                   ./libraries/nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent/         
vmap       nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent          ./libraries/nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent/         
ensure_lib                                                                                   ./libraries/nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent/       
vmap       nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent        ./libraries/nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent/       
ensure_lib                                                                                   ./libraries/sysid_qsys_0/                                                                     
vmap       sysid_qsys_0                                                                      ./libraries/sysid_qsys_0/                                                                     
ensure_lib                                                                                   ./libraries/to_sw_sig/                                                                        
vmap       to_sw_sig                                                                         ./libraries/to_sw_sig/                                                                        
ensure_lib                                                                                   ./libraries/to_hw_sig/                                                                        
vmap       to_hw_sig                                                                         ./libraries/to_hw_sig/                                                                        
ensure_lib                                                                                   ./libraries/to_hw_data/                                                                       
vmap       to_hw_data                                                                        ./libraries/to_hw_data/                                                                       
ensure_lib                                                                                   ./libraries/jtag_uart_0/                                                                      
vmap       jtag_uart_0                                                                       ./libraries/jtag_uart_0/                                                                      
ensure_lib                                                                                   ./libraries/onchip_memory2_0/                                                                 
vmap       onchip_memory2_0                                                                  ./libraries/onchip_memory2_0/                                                                 
ensure_lib                                                                                   ./libraries/nios2_qsys_0/                                                                     
vmap       nios2_qsys_0                                                                      ./libraries/nios2_qsys_0/                                                                     
ensure_lib                                                                                   ./libraries/vectadd_inst_onchip_memory2_0_s2_translator/                                      
vmap       vectadd_inst_onchip_memory2_0_s2_translator                                       ./libraries/vectadd_inst_onchip_memory2_0_s2_translator/                                      
ensure_lib                                                                                   ./libraries/vectadd_inst_onchip_memory2_0_s2_bfm_m0_translator/                               
vmap       vectadd_inst_onchip_memory2_0_s2_bfm_m0_translator                                ./libraries/vectadd_inst_onchip_memory2_0_s2_bfm_m0_translator/                               
ensure_lib                                                                                   ./libraries/vectadd_inst_onchip_memory2_0_s2_bfm/                                             
vmap       vectadd_inst_onchip_memory2_0_s2_bfm                                              ./libraries/vectadd_inst_onchip_memory2_0_s2_bfm/                                             
ensure_lib                                                                                   ./libraries/vectadd_inst_to_hw_data_bfm/                                                      
vmap       vectadd_inst_to_hw_data_bfm                                                       ./libraries/vectadd_inst_to_hw_data_bfm/                                                      
ensure_lib                                                                                   ./libraries/vectadd_inst_to_sw_sig_bfm/                                                       
vmap       vectadd_inst_to_sw_sig_bfm                                                        ./libraries/vectadd_inst_to_sw_sig_bfm/                                                       
ensure_lib                                                                                   ./libraries/vectadd_inst_to_hw_sig_bfm/                                                       
vmap       vectadd_inst_to_hw_sig_bfm                                                        ./libraries/vectadd_inst_to_hw_sig_bfm/                                                       
ensure_lib                                                                                   ./libraries/vectadd_inst_reset_bfm/                                                           
vmap       vectadd_inst_reset_bfm                                                            ./libraries/vectadd_inst_reset_bfm/                                                           
ensure_lib                                                                                   ./libraries/vectadd_inst_clk_bfm/                                                             
vmap       vectadd_inst_clk_bfm                                                              ./libraries/vectadd_inst_clk_bfm/                                                             
ensure_lib                                                                                   ./libraries/vectadd_inst/                                                                     
vmap       vectadd_inst                                                                      ./libraries/vectadd_inst/                                                                     

# ----------------------------------------
# Compile device library files
alias dev_com {
  echo "\[exec\] dev_com"
  if { ![ string match "*ModelSim ALTERA*" [ vsim -version ] ] } {
    vlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v" -work altera_ver      
    vlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"          -work lpm_ver         
    vlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"             -work sgate_ver       
    vlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"         -work altera_mf_ver   
    vlog -sv "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"     -work altera_lnsim_ver
    vlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneii_atoms.v"   -work cycloneii_ver   
  }
}

# ----------------------------------------
# Compile the design files in correct order
alias com {
  echo "\[exec\] com"
  vlog -sv "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/verbosity_pkg.sv"                                                               -work altera_avalon_vip_pkgs_lib                                                       
  vlog -sv "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/avalon_mm_pkg.sv"                                                               -work altera_avalon_vip_pkgs_lib                                                       
  vlog -sv "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/vectadd_irq_mapper.sv"                                                          -work irq_mapper                                                                       
  vlog -sv "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/altera_merlin_arbitrator.sv"                                                    -work rsp_xbar_mux_001                                                                 
  vlog -sv "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/vectadd_rsp_xbar_mux_001.sv"                                                    -work rsp_xbar_mux_001                                                                 
  vlog -sv "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/altera_merlin_arbitrator.sv"                                                    -work rsp_xbar_mux                                                                     
  vlog -sv "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/vectadd_rsp_xbar_mux.sv"                                                        -work rsp_xbar_mux                                                                     
  vlog -sv "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/vectadd_rsp_xbar_demux_003.sv"                                                  -work rsp_xbar_demux_003                                                               
  vlog -sv "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/vectadd_rsp_xbar_demux.sv"                                                      -work rsp_xbar_demux                                                                   
  vlog -sv "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/altera_merlin_arbitrator.sv"                                                    -work cmd_xbar_mux                                                                     
  vlog -sv "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/vectadd_cmd_xbar_mux.sv"                                                        -work cmd_xbar_mux                                                                     
  vlog -sv "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/vectadd_cmd_xbar_demux_001.sv"                                                  -work cmd_xbar_demux_001                                                               
  vlog -sv "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/vectadd_cmd_xbar_demux.sv"                                                      -work cmd_xbar_demux                                                                   
  vlog     "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/altera_reset_controller.v"                                                      -work rst_controller                                                                   
  vlog     "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/altera_reset_synchronizer.v"                                                    -work rst_controller                                                                   
  vlog -sv "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/vectadd_id_router_003.sv"                                                       -work id_router_003                                                                    
  vlog -sv "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/vectadd_id_router.sv"                                                           -work id_router                                                                        
  vlog -sv "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/vectadd_addr_router_001.sv"                                                     -work addr_router_001                                                                  
  vlog -sv "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/vectadd_addr_router.sv"                                                         -work addr_router                                                                      
  vlog     "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/altera_avalon_sc_fifo.v"                                                        -work nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo
  vlog -sv "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/altera_merlin_slave_agent.sv"                                                   -work nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent         
  vlog -sv "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/altera_merlin_burst_uncompressor.sv"                                            -work nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent         
  vlog -sv "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/altera_merlin_master_agent.sv"                                                  -work nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent       
  vlog     "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/vectadd_sysid_qsys_0.vo"                                                        -work sysid_qsys_0                                                                     
  vlog     "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/vectadd_to_sw_sig.v"                                                            -work to_sw_sig                                                                        
  vlog     "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/vectadd_to_hw_sig.v"                                                            -work to_hw_sig                                                                        
  vlog     "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/vectadd_to_hw_data.v"                                                           -work to_hw_data                                                                       
  vlog     "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/vectadd_jtag_uart_0.v"                                                          -work jtag_uart_0                                                                      
  vlog     "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/vectadd_onchip_memory2_0.v"                                                     -work onchip_memory2_0                                                                 
  vlog     "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/vectadd_nios2_qsys_0.v"                                                         -work nios2_qsys_0                                                                     
  vlog     "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/vectadd_nios2_qsys_0_jtag_debug_module_sysclk.v"                                -work nios2_qsys_0                                                                     
  vlog     "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/vectadd_nios2_qsys_0_jtag_debug_module_tck.v"                                   -work nios2_qsys_0                                                                     
  vlog     "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/vectadd_nios2_qsys_0_jtag_debug_module_wrapper.v"                               -work nios2_qsys_0                                                                     
  vlog     "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/vectadd_nios2_qsys_0_oci_test_bench.v"                                          -work nios2_qsys_0                                                                     
  vlog     "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/vectadd_nios2_qsys_0_test_bench.v"                                              -work nios2_qsys_0                                                                     
  vlog -sv "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/altera_merlin_slave_translator.sv"                                              -work vectadd_inst_onchip_memory2_0_s2_translator                                      
  vlog -sv "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/altera_merlin_master_translator.sv"                                             -work vectadd_inst_onchip_memory2_0_s2_bfm_m0_translator                               
  vlog -sv "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/altera_avalon_mm_master_bfm.sv"                   -L altera_avalon_vip_pkgs_lib -work vectadd_inst_onchip_memory2_0_s2_bfm                                             
  vlog -sv "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/altera_conduit_bfm_0003.sv"                       -L altera_avalon_vip_pkgs_lib -work vectadd_inst_to_hw_data_bfm                                                      
  vlog -sv "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/altera_conduit_bfm_0002.sv"                       -L altera_avalon_vip_pkgs_lib -work vectadd_inst_to_sw_sig_bfm                                                       
  vlog -sv "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/altera_conduit_bfm.sv"                            -L altera_avalon_vip_pkgs_lib -work vectadd_inst_to_hw_sig_bfm                                                       
  vlog -sv "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/altera_avalon_reset_source.sv"                    -L altera_avalon_vip_pkgs_lib -work vectadd_inst_reset_bfm                                                           
  vlog -sv "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/altera_avalon_clock_source.sv"                    -L altera_avalon_vip_pkgs_lib -work vectadd_inst_clk_bfm                                                             
  vlog     "$QSYS_SIMDIR/vectadd_tb/simulation/submodules/vectadd.v"                                                                      -work vectadd_inst                                                                     
  vlog     "$QSYS_SIMDIR/vectadd_tb/simulation/vectadd_tb.v"                                                                                                                                                                     
}

# ----------------------------------------
# Elaborate top level design
alias elab {
  echo "\[exec\] elab"
  vsim -t ps -L work -L work_lib -L altera_avalon_vip_pkgs_lib -L irq_mapper -L rsp_xbar_mux_001 -L rsp_xbar_mux -L rsp_xbar_demux_003 -L rsp_xbar_demux -L cmd_xbar_mux -L cmd_xbar_demux_001 -L cmd_xbar_demux -L rst_controller -L id_router_003 -L id_router -L addr_router_001 -L addr_router -L nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo -L nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent -L nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent -L sysid_qsys_0 -L to_sw_sig -L to_hw_sig -L to_hw_data -L jtag_uart_0 -L onchip_memory2_0 -L nios2_qsys_0 -L vectadd_inst_onchip_memory2_0_s2_translator -L vectadd_inst_onchip_memory2_0_s2_bfm_m0_translator -L vectadd_inst_onchip_memory2_0_s2_bfm -L vectadd_inst_to_hw_data_bfm -L vectadd_inst_to_sw_sig_bfm -L vectadd_inst_to_hw_sig_bfm -L vectadd_inst_reset_bfm -L vectadd_inst_clk_bfm -L vectadd_inst -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneii_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Elaborate the top level design with novopt option
alias elab_debug {
  echo "\[exec\] elab_debug"
  vsim -novopt -t ps -L work -L work_lib -L altera_avalon_vip_pkgs_lib -L irq_mapper -L rsp_xbar_mux_001 -L rsp_xbar_mux -L rsp_xbar_demux_003 -L rsp_xbar_demux -L cmd_xbar_mux -L cmd_xbar_demux_001 -L cmd_xbar_demux -L rst_controller -L id_router_003 -L id_router -L addr_router_001 -L addr_router -L nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo -L nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent -L nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent -L sysid_qsys_0 -L to_sw_sig -L to_hw_sig -L to_hw_data -L jtag_uart_0 -L onchip_memory2_0 -L nios2_qsys_0 -L vectadd_inst_onchip_memory2_0_s2_translator -L vectadd_inst_onchip_memory2_0_s2_bfm_m0_translator -L vectadd_inst_onchip_memory2_0_s2_bfm -L vectadd_inst_to_hw_data_bfm -L vectadd_inst_to_sw_sig_bfm -L vectadd_inst_to_hw_sig_bfm -L vectadd_inst_reset_bfm -L vectadd_inst_clk_bfm -L vectadd_inst -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneii_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Compile all the design files and elaborate the top level design
alias ld "
  dev_com
  com
  elab
"

# ----------------------------------------
# Compile all the design files and elaborate the top level design with -novopt
alias ld_debug "
  dev_com
  com
  elab_debug
"

# ----------------------------------------
# Print out user commmand line aliases
alias h {
  echo "List Of Command Line Aliases"
  echo
  echo "file_copy                     -- Copy ROM/RAM files to simulation directory"
  echo
  echo "dev_com                       -- Compile device library files"
  echo
  echo "com                           -- Compile the design files in correct order"
  echo
  echo "elab                          -- Elaborate top level design"
  echo
  echo "elab_debug                    -- Elaborate the top level design with novopt option"
  echo
  echo "ld                            -- Compile all the design files and elaborate the top level design"
  echo
  echo "ld_debug                      -- Compile all the design files and elaborate the top level design with -novopt"
  echo
  echo 
  echo
  echo "List Of Variables"
  echo
  echo "TOP_LEVEL_NAME                -- Top level module name."
  echo
  echo "SYSTEM_INSTANCE_NAME          -- Instantiated system module name inside top level module."
  echo
  echo "QSYS_SIMDIR                   -- Qsys base simulation directory."
  echo
  echo "QUARTUS_INSTALL_DIR           -- Quartus installation directory."
}
file_copy
h
