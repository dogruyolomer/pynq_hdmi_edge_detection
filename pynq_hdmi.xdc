# 125 MHz System Clock
set_property -dict { PACKAGE_PIN H16 IOSTANDARD LVCMOS33 } [get_ports { sys_clock }];

# Reset Button (BTN0)
set_property -dict { PACKAGE_PIN D19 IOSTANDARD LVCMOS33 } [get_ports { reset_0 }];

# HDMI RX (Input from Laptop)
set_property -dict { PACKAGE_PIN N18 IOSTANDARD TMDS_33 } [get_ports { hdmi_in_clk_p }];
set_property -dict { PACKAGE_PIN P19 IOSTANDARD TMDS_33 } [get_ports { hdmi_in_clk_n }];
set_property -dict { PACKAGE_PIN V20 IOSTANDARD TMDS_33 } [get_ports { hdmi_in_data_p[0] }];
set_property -dict { PACKAGE_PIN W20 IOSTANDARD TMDS_33 } [get_ports { hdmi_in_data_n[0] }];
set_property -dict { PACKAGE_PIN T20 IOSTANDARD TMDS_33 } [get_ports { hdmi_in_data_p[1] }];
set_property -dict { PACKAGE_PIN U20 IOSTANDARD TMDS_33 } [get_ports { hdmi_in_data_n[1] }];
set_property -dict { PACKAGE_PIN N20 IOSTANDARD TMDS_33 } [get_ports { hdmi_in_data_p[2] }];
set_property -dict { PACKAGE_PIN P20 IOSTANDARD TMDS_33 } [get_ports { hdmi_in_data_n[2] }];

# HDMI RX DDC (EDID Info to Laptop)
set_property -dict { PACKAGE_PIN U14 IOSTANDARD LVCMOS33 } [get_ports { DDC_0_scl_io }];
set_property -dict { PACKAGE_PIN U15 IOSTANDARD LVCMOS33 } [get_ports { DDC_0_sda_io }];

# HDMI RX Hot Plug Detect
set_property -dict { PACKAGE_PIN T19 IOSTANDARD LVCMOS33 } [get_ports { hdmi_rx_hpd[0] }];

# HDMI TX (Output to Monitor)
set_property -dict { PACKAGE_PIN L16 IOSTANDARD TMDS_33 } [get_ports { hdmi_out_clk_p }];
set_property -dict { PACKAGE_PIN L17 IOSTANDARD TMDS_33 } [get_ports { hdmi_out_clk_n }];
set_property -dict { PACKAGE_PIN K17 IOSTANDARD TMDS_33 } [get_ports { hdmi_out_data_p[0] }];
set_property -dict { PACKAGE_PIN K18 IOSTANDARD TMDS_33 } [get_ports { hdmi_out_data_n[0] }];
set_property -dict { PACKAGE_PIN K19 IOSTANDARD TMDS_33 } [get_ports { hdmi_out_data_p[1] }];
set_property -dict { PACKAGE_PIN J19 IOSTANDARD TMDS_33 } [get_ports { hdmi_out_data_n[1] }];
set_property -dict { PACKAGE_PIN J18 IOSTANDARD TMDS_33 } [get_ports { hdmi_out_data_p[2] }];
set_property -dict { PACKAGE_PIN H18 IOSTANDARD TMDS_33 } [get_ports { hdmi_out_data_n[2] }];

# Clock Dedicated Route Override
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets hdmi_bypass_i/dvi2rgb_0/U0/TMDS_ClockingX/CLK_IN_hdmi_clk]