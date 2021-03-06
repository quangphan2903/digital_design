## Clock signal 50 MHz (period in nanosec-- 8->125Mhz, 10->100Mhz 20->50Mhz)
## waveform: aseta kellon reunat {nouseva laskeva}, jos ei asetettu, menee puoliväliin, niinkuin tässäkin
set_property -dict {PACKAGE_PIN H16 IOSTANDARD LVCMOS18} [get_ports clk]
create_clock -period 20.000 -name clk_pin -waveform {0.000 10.000} -add [get_ports clk]

set_property PACKAGE_PIN D19 [get_ports {btn[0]}]
set_property PACKAGE_PIN D20 [get_ports {btn[1]}]
set_property PACKAGE_PIN L20 [get_ports {btn[2]}]
set_property PACKAGE_PIN L19 [get_ports {btn[3]}]
set_property PACKAGE_PIN R14 [get_ports {led[0]}]
set_property PACKAGE_PIN P14 [get_ports {led[1]}]
set_property PACKAGE_PIN N16 [get_ports {led[2]}]
set_property PACKAGE_PIN M14 [get_ports {led[3]}]
set_property PACKAGE_PIN M19 [get_ports rst_n]
set_property PACKAGE_PIN V17 [get_ports {channel[0]}]
set_property PACKAGE_PIN V18 [get_ports {channel[1]}]
set_property PACKAGE_PIN T16 [get_ports {channel[2]}]
set_property PACKAGE_PIN R17 [get_ports {channel[3]}]
set_property PACKAGE_PIN P18 [get_ports {channel[4]}]
set_property PACKAGE_PIN N17 [get_ports {channel[5]}]
set_property PACKAGE_PIN V13 [get_ports {channel[6]}]
set_property PACKAGE_PIN V15 [get_ports {channel[7]}]
set_property PACKAGE_PIN U17 [get_ports s_sda]
set_property PACKAGE_PIN R16 [get_ports s_clk]
set_property PACKAGE_PIN W11 [get_ports s_rst]
set_property PACKAGE_PIN Y12 [get_ports lat]
set_property PACKAGE_PIN Y11 [get_ports sb]
set_property IOSTANDARD LVCMOS18 [get_ports rst_n]
set_property IOSTANDARD LVCMOS18 [get_ports {btn[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {btn[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {btn[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {btn[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {channel[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {channel[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {channel[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {channel[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {channel[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {channel[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {channel[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {channel[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports s_sda]
set_property IOSTANDARD LVCMOS18 [get_ports s_clk]
set_property IOSTANDARD LVCMOS18 [get_ports s_rst]
set_property IOSTANDARD LVCMOS18 [get_ports lat]
set_property IOSTANDARD LVCMOS18 [get_ports sb]







set_property IOSTANDARD LVCMOS18 [get_ports sw0]
set_property PACKAGE_PIN M20 [get_ports sw0]

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 2 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list clk_IBUF_BUFG]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 3 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {btn_IBUF[0]} {btn_IBUF[1]} {btn_IBUF[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 8 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {channel_OBUF[0]} {channel_OBUF[1]} {channel_OBUF[2]} {channel_OBUF[3]} {channel_OBUF[4]} {channel_OBUF[5]} {channel_OBUF[6]} {channel_OBUF[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 1 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list clk_IBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 1 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list defeated]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 1 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list enable]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list frame_done]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list hit]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list lat_OBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list rst_n_IBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list s_clk_OBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list s_rst_OBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list s_sda_OBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list sb_OBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 1 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list write]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 1 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list write_ready]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_IBUF_BUFG]
