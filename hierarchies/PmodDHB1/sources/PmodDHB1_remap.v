`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/16/2021 10:03:14 AM
// Design Name: 
// Module Name: PmodDHB1_remap
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


module PmodDHB1_remap(
    input [1:0] motor_enables,
    (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 M1_DIRECTION TRI_O" *)
    input [0:0] m1_direction,
    (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 M2_DIRECTION TRI_O" *)
    input [0:0] m2_direction,
    

    // GPIO Master interface, to be connected to Pmod Bridge Top Row
    (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 GPIO_OUT_TOP TRI_T" *)
    output [3:0] gpio_out_top_tri_t, // Tristate output enable signal (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 GPIO_OUT_TOP TRI_O" *)
    output [3:0] gpio_out_top_tri_o, // Tristate output signal (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 GPIO_OUT_TOP TRI_I" *)
    input [3:0] gpio_out_top_tri_i, // Tristate input signal (optional)
    
    // GPIO Master interface, to be connected to Pmod Bridge Bottom Row
    (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 GPIO_OUT_BOTTOM TRI_T" *)
    output [3:0] gpio_out_bottom_tri_t, // Tristate output enable signal (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 GPIO_OUT_BOTTOM TRI_O" *)
    output [3:0] gpio_out_bottom_tri_o, // Tristate output signal (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 GPIO_OUT_BOTTOM TRI_I" *)
    input [3:0] gpio_out_bottom_tri_i, // Tristate input signal (optional)
    
    output m1_feedback,
    output m2_feedback
);
  assign gpio_out_top_tri_o = {2'b0, m1_direction, motor_enables[0]};
  assign gpio_out_top_tri_t = 4'hC;
  assign m1_feedback = gpio_out_top_tri_i[2];
  
  assign gpio_out_bottom_tri_o = {2'b0, m2_direction, motor_enables[1]};
  assign gpio_out_bottom_tri_t = 4'hC;
  assign m2_feedback = gpio_out_bottom_tri_i[2];
endmodule
