`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/16/2021 02:55:05 PM
// Design Name: 
// Module Name: PmodMAXSONAR_remap
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


module PmodMAXSONAR_remap(
    output pwm,
    
    // GPIO Master interface, to be connected to Pmod Bridge Top Row
    (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 GPIO_OUT_TOP TRI_T" *)
    output [3:0] gpio_out_top_tri_t, // Tristate output enable signal (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 GPIO_OUT_TOP TRI_O" *)
    output [3:0] gpio_out_top_tri_o, // Tristate output signal (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 GPIO_OUT_TOP TRI_I" *)
    input [3:0] gpio_out_top_tri_i // Tristate input signal (optional)
);
//    assign xlconstant_0_dout = 4'hF;
    assign pwm = gpio_out_top_tri_i[3];
    assign gpio_out_top_tri_o = 4'hF;
    assign gpio_out_top_tri_t = 4'hF;
endmodule
