`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/16/2021 04:11:51 PM
// Design Name: 
// Module Name: PmodMTDS_remap
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


module PmodMTDS_remap(
    // GPIO Slave interface, to be connected to AXI GPIO
    (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 GPIO_IN_1 TRI_T" *)
    (* X_INTERFACE_PARAMETER = "MODE Slave" *) 
    input [1:0] gpio_in_1_tri_t, // Tristate output signal (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 GPIO_IN_1 TRI_O" *)
    input [1:0] gpio_in_1_tri_o, // Tristate output signal (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 GPIO_IN_1 TRI_I" *)
    output [1:0] gpio_in_1_tri_i, // Tristate output signal (optional)
    
    // GPIO Slave interface, to be connected to AXI GPIO
    (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 GPIO_IN_2 TRI_T" *)
    (* X_INTERFACE_PARAMETER = "MODE Slave" *) 
    input [2:0] gpio_in_2_tri_t, // Tristate output signal (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 GPIO_IN_2 TRI_O" *)
    input [2:0] gpio_in_2_tri_o, // Tristate output signal (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 GPIO_IN_2 TRI_I" *)
    output [2:0] gpio_in_2_tri_i, // Tristate output signal (optional)
    
    (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 SPI_IN SS_I" *)
    output m_ss_i, // Slave Select Input (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 SPI_IN SS_O" *)
    input m_ss_o, // Slave Select Output (required)
    (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 SPI_IN SS_T" *)
    input m_ss_t, // Slave Select Tri-State Control (required)
    (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 SPI_IN SCK_I" *)
    output m_sck_i, // SPI Clock Input (required)
    (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 SPI_IN SCK_O" *)
    input m_sck_o, // SPI Clock Output (required)
    (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 SPI_IN SCK_T" *)
    input m_sck_t, // SPI Clock Tri-State Control (required)
    (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 SPI_IN IO0_I" *)
    output m_io0_i, // IO0 Input Port (required)
    (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 SPI_IN IO0_O" *)
    input m_io0_o, // IO0 Output Port (required)
    (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 SPI_IN IO0_T" *)
    input m_io0_t, // IO0 Tri-State Control (required)
    (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 SPI_IN IO1_I" *)
    output m_io1_i, // IO1 Input Port (required)
    (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 SPI_IN IO1_O" *)
    input m_io1_o, // IO1 Output Port (required)
    (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 SPI_IN IO1_T" *)
    input m_io1_t, // IO1 Tri-State Control (required)
  
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
    input [3:0] gpio_out_bottom_tri_i // Tristate input signal (optional
);
    wire [4:0] gpio_i;
    wire [4:0] gpio_o = {gpio_in_2_tri_o, gpio_in_1_tri_o};
    wire [4:0] gpio_t = {gpio_in_2_tri_t, gpio_in_1_tri_t};
    assign {gpio_in_2_tri_t, gpio_in_1_tri_t} = gpio_i;
    
    assign gpio_i[3:0] = gpio_out_bottom_tri_i;
    assign gpio_out_bottom_tri_o = gpio_o[3:0];
    assign gpio_out_bottom_tri_t = gpio_t[3:0];
    
//    assign gpio_i[4] = m_ss_i;
//    assign m_ss_o = gpio_o[4];
//    assign m_ss_t = gpio_t[4];
    
    assign {m_sck_i, m_io1_i, m_io0_i, gpio_i[4]} = gpio_out_top_tri_i;
    assign gpio_out_top_tri_o = {m_sck_o, m_io1_o, m_io0_o, gpio_o[4]};
    assign gpio_out_top_tri_t = {m_sck_t, m_io1_t, m_io0_t, gpio_t[4]};
endmodule
