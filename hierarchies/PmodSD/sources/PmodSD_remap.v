`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/17/2021 09:16:20 AM
// Design Name: 
// Module Name: PmodSD_remap
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


module PmodSD_remap (
    // GPIO Slave interface, to be connected to AXI GPIO
    (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 GPIO_IN TRI_T" *)
    (* X_INTERFACE_PARAMETER = "MODE Slave" *) 
    input [0:0] gpio_in_t, // Tristate output signal (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 GPIO_IN TRI_O" *)
    input [0:0] gpio_in_o, // Tristate output signal (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 GPIO_IN TRI_I" *)
    output [0:0] gpio_in_i, // Tristate output signal (optional)
    
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
    output [3:0] gpio_out_top_t, // Tristate output enable signal (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 GPIO_OUT_TOP TRI_O" *)
    output [3:0] gpio_out_top_o, // Tristate output signal (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 GPIO_OUT_TOP TRI_I" *)
    input [3:0] gpio_out_top_i // Tristate input signal (optional)
);
    assign {m_sck_i, m_io1_i, m_io0_i, gpio_in_i} = gpio_out_top_i;
    assign gpio_out_top_o = {m_sck_o, m_io1_o, m_io0_o, gpio_in_o};
    assign gpio_out_top_t = {m_sck_t, m_io1_t, m_io0_t, gpio_in_t};
endmodule
