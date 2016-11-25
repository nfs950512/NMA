module vectoradd_accelerator(
	input clk,
	input [1:0] KEY,
	output logic led,
	output [6:0]  HEX0, HEX1, HEX2, HEX3
);

logic [31:0] to_hw_data;
logic [1:0] to_hw_sig, to_sw_sig;

logic [31:0] mem_rdata, mem_wdata;
logic [13:0] mem_address, addr_a, addr_b, addr_s;
logic [31:0] len, cur_length;
logic [31:0] a_out, b_out, s_out;
logic [1:0] addrmux_sel;
logic [3:0] state;

assign led = 1;

logic mem_write,
	  load_addr_a,
	  load_addr_b,
	  load_addr_s,
	  load_len,
	  addrinput_sel,
	  load_a,
	  load_b,
	  load_s,
	  cs;
	  
HexDriver Hex0 
(
	.In0(state),
	.Out0(HEX0)
);

HexDriver Hex1 
(
	.In0(len[3:0]),
	.Out0(HEX1)
);

HexDriver Hex2
(
	.In0(cur_length[3:0]),
	.Out0(HEX2)
);

HexDriver Hex3
(
	.In0(0),
	.Out0(HEX3)
);

vectadd u0 (
	  .clk_clk                        (clk),                        //                 clk.clk
	  .reset_reset_n                  (KEY[0]),                  //               reset.reset_n
	  .to_hw_sig_export               (to_hw_sig),               //           to_hw_sig.export
	  .to_sw_sig_export               (to_sw_sig),               //           to_sw_sig.export
	  .to_hw_data_export              (to_hw_data),              //          to_hw_data.export
	  .onchip_memory2_0_s2_address    (mem_address),    // onchip_memory2_0_s2.address
	  .onchip_memory2_0_s2_chipselect (cs), //                    .chipselect
	  .onchip_memory2_0_s2_clken      (1'b1),      //                    .clken
	  .onchip_memory2_0_s2_write      (mem_write),      //                    .write
	  .onchip_memory2_0_s2_readdata   (mem_rdata),   //                    .readdata
	  .onchip_memory2_0_s2_writedata  (mem_wdata),  //                    .writedata
	  .onchip_memory2_0_s2_byteenable (4'b1111)  //                    .byteenable
);

ACC_Control ctrl0
(
	.clk(clk),
	.reset(KEY[0]),
	.to_hw_data(to_hw_data),
	.to_hw_sig(to_hw_sig),
	.to_sw_sig(to_sw_sig),
	.len(len),
	.cs(cs),
	.mem_write(mem_write), 
	.addrmux_sel(addrmux_sel),
	.load_len(load_len),
	.load_addr_a(load_addr_a),
	.load_addr_b(load_addr_b),
	.load_addr_s(load_addr_s),
	.load_a(load_a),
	.load_b(load_b),
	.load_s(load_s),
	.addrinput_sel(addrinput_sel),
	.cur_state(state),
	.cur_length(cur_length)
);

register #(.width(32)) vectorLength
(
    .clk,
    .load(load_len),
    .in(to_hw_data[31:0]),
    .out(len)
);

register #(.width(14)) Addr_A
(
    .clk,
    .load(load_addr_a),
    .in(addrinput_sel ? to_hw_data[13:0] : addr_a+14'd4),
    .out(addr_a)
);

register #(.width(14)) Addr_B
(
    .clk,
    .load(load_addr_b),
    .in(addrinput_sel ? to_hw_data[13:0] : addr_b+14'd4),
    .out(addr_b)
);

register #(.width(14)) Addr_S
(
    .clk,
    .load(load_addr_s),
    .in(addrinput_sel ? to_hw_data[13:0] : addr_s+14'd4),
    .out(addr_s)
);

register #(.width(32)) A
(
    .clk,
    .load(load_a),
    .in(mem_rdata),
    .out(a_out)
);

register #(.width(32)) B
(
    .clk,
    .load(load_b),
    .in(mem_rdata),
    .out(b_out)
);

register #(.width(32)) S
(
    .clk,
    .load(load_s),
    .in(a_out+b_out),
    .out(mem_wdata)
);

mux4 addrmux
(
	.sel(addrmux_sel),
	.a(addr_a),
	.b(addr_b),
	.c(addr_s),
	.d(10'd0),
	.f(mem_address)
);




endmodule : vectoradd_accelerator