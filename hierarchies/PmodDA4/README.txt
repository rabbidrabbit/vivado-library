Hierarchy Port Requirements
---------------------------
* s_axi_aclk: There arent any specific clocks frequencies that are required to make the hierarchy work,
although it should be noted that the SPI clock frequency on the Pmod interface will be 1/16th of the frequency of the AXI Quad SPI IPs ext_spi_clock pin.

Constraints
-----------
* When using the Board Flow, no additional constraints are required
* When not using the Board Flow, template constraints for the Pmod_out port can be found in
the imported PmodDA4_*.xdc file