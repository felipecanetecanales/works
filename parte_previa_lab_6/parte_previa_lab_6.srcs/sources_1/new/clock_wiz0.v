`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2017 22:32:06
// Design Name: 
// Module Name: clock_wiz0
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

(* CORE_GENERATION_INFO = "clk_wiz_0,clk_wiz_v5_3_3_0,{component_name=clk_wiz_0,use_phase_alignment=true,use_min_o_jitter=false,use_max_i_jitter=false,use_dyn_phase_shift=false,use_inclk_switchover=false,use_dyn_reconfig=false,enable_axi=0,feedback_source=FDBK_AUTO,PRIMITIVE=MMCM,num_out_clk=1,clkin1_period=10.0,clkin2_period=10.0,use_power_down=false,use_reset=true,use_locked=true,use_inclk_stopped=false,feedback_type=SINGLE,CLOCK_MGR_TYPE=NA,manual_override=false}" *)

module clk_wiz_0 
 (
  // Clock out ports
  output        clk_out1,
  // Status and control signals
  input         reset,
  output        locked,
 // Clock in ports
  input         clk_in1
 );

  clk_wiz_0_clk_wiz inst
  (
  // Clock out ports  
  .clk_out1(clk_out1),
  // Status and control signals               
  .reset(reset), 
  .locked(locked),
 // Clock in ports
  .clk_in1(clk_in1)
  );

endmodule
