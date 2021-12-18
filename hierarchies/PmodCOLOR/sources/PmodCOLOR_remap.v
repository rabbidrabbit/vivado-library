`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Digilent Inc
// Engineer: Arthur Brown
// 
// Create Date: 12/15/2021 02:49:52 PM
// Design Name: 
// Module Name: PmodCOLOR_remap
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


module PmodCOLOR_remap (
    // GPIO Slave interface, to be connected to AXI GPIO
    (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 GPIO_IN TRI_I" *)
    output [1:0] gpio_in_tri_i, // Tristate output signal (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 GPIO_IN TRI_O" *)
    input [1:0] gpio_in_tri_o, // Tristate output signal (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 GPIO_IN TRI_T" *)
    input [1:0] gpio_in_tri_t, // Tristate output signal (optional)
    
    // IIC Slave interface, to be connected to AXI IIC
    (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 IIC SCL_I" *)
    output s_scl_i, // IIC Serial Clock Input from 3-state buffer (required)
    (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 IIC SCL_O" *)
    input s_scl_o, // IIC Serial Clock Output to 3-state buffer (required)
    (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 IIC SCL_T" *)
    input s_scl_t, // IIC Serial Clock Output Enable to 3-state buffer (required)
    (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 IIC SDA_I" *)
    output s_sda_i, // IIC Serial Data Input from 3-state buffer (required)
    (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 IIC SDA_O" *)
    input s_sda_o, // IIC Serial Data Output to 3-state buffer (required)
    (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 IIC SDA_T" *)
    input s_sda_t, // IIC Serial Data Output Enable to 3-state buffer (required)
    
    // GPIO Master interface, to be connected to Pmod Bridge Top Row
    (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 GPIO_OUT_TOP TRI_I" *)
    input [3:0] gpio_out_top_tri_i, // Tristate input signal (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 GPIO_OUT_TOP TRI_O" *)
    output [3:0] gpio_out_top_tri_o, // Tristate output signal (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 GPIO_OUT_TOP TRI_T" *)
    output [3:0] gpio_out_top_tri_t // Tristate output enable signal (optional)
);
    assign {s_sda_i, s_scl_i, gpio_in_tri_i} = gpio_out_top_tri_i;
    assign gpio_out_top_tri_t = {s_sda_t, s_scl_t, gpio_in_tri_t};
    assign gpio_out_top_tri_o = {s_sda_o, s_scl_o, gpio_in_tri_o};
endmodule
