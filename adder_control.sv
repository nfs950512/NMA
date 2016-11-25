module Adder_control 
(
	input clk,
	input reset, en,
	input [31:0] a,
	input [31:0] b,
	input [7:0] len,
	output logic [7:0] cur_idx,
	output logic write_s, sum_ready, index_sel
);

initial
begin
	cur_idx = 8'b0;
	index_sel = 1'b0;
end

enum int unsigned {
	IDLE,
	ADD
} state, next_state;


always_ff @(posedge clk)
begin: next_state_assignment
    /* Assignment of next state on clock edge */
	state <= next_state;
	 
	case (state)
	 
	IDLE: ;
	
	ADD: begin
		if (cur_idx == len) 
			cur_idx <= 8'b0;
		else 
			cur_idx <= cur_idx + 1'b1;
	end

	endcase
end


always_comb
begin : next_state_logic
    /* Next state information and conditions (if any)
     * for transitioning between states */
	next_state = state;
	
	case (state)
	
	IDLE: 
	begin
		if (en)
			next_state = ADD;
	end
	
	ADD: 
	begin
		if (cur_idx == len)
			next_state = IDLE;
	end
	
	endcase
	
end

always_comb
begin : state_actions
    /* Default output assignments */
    /* Actions for each state */
	write_s = 1'b0;
	sum_ready = 1'b0;
	index_sel = 1'b0;
	
	case (state)
	
	IDLE: ;
	 
	ADD: 
	begin
		index_sel = 1'b1;
		if (cur_idx == len)
			sum_ready = 1'b1;
		else
			write_s = 1'b1;
	end
	
	endcase
end



endmodule : Adder_control