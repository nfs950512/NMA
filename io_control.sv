module ACC_Control
(
	input clk,
	input reset,
	input [31:0] to_hw_data,
	input [1:0] to_hw_sig,
	output logic [1:0] to_sw_sig,
	input [31:0] len,
	output logic [31:0] cur_length,
	output logic [3:0] cur_state,
	output logic cs, 
					 mem_write, 
					 addrmux_sel, 
					 load_len,
					 load_addr_a,
					 load_addr_b,
					 load_addr_s,
					 load_a,
					 load_b,
					 load_s,
					 addrinput_sel
	
);

logic [1:0] load_curlength;


counter curLength
(
    .clk(clk),
    .load(load_curlength),
    .out(cur_length)
);


enum int unsigned {
	IDLE,
	RESET,
	READ_LENGTH,
	ACK_LENGTH,
	READ_ADDR_A,
	ACK_ADDR_A,
	READ_ADDR_B,
	ACK_ADDR_B,
	READ_ADDR_S,
	ACK_ADDR_S,
	READ_A,
	STA_RDB,
	STB,
	ADDER,
	WRITE_S,
	SEND_DONE,
	ACK_DONE
} state, next_state;

assign cur_state = state;

always_comb
begin : state_actions
    /* Default output assignments */
    /* Actions for each state */
	to_sw_sig = 2'd0;
	cs = 1'b0;
	mem_write = 1'b0; 
	addrmux_sel = 1'b0; 
	load_len = 1'b0;
	load_addr_a = 1'b0;
	load_addr_b = 1'b0;
	load_addr_s = 1'b0;
	load_a = 1'b0;
	load_b = 1'b0;
	load_s = 1'b0;
	addrinput_sel = 1'b0;
	load_curlength = 2'b0;
    case (state)
    	IDLE: begin
    		to_sw_sig = 2'd0;
			load_curlength = 2'd2;
    	end
		
		RESET: begin
			to_sw_sig = 2'd3;
		end

    	READ_LENGTH: begin
    		load_len = 1'b1;
    		to_sw_sig = 2'd1;
    	end

    	ACK_LENGTH: begin
    		to_sw_sig = 2'd0;
    	end

    	READ_ADDR_A: begin
    		load_addr_a = 1'b1;
    		to_sw_sig = 2'd1;
    	end

    	ACK_ADDR_A: begin
    		to_sw_sig = 2'd0;
    	end

    	READ_ADDR_B: begin
    		load_addr_b = 1'b1;
    		to_sw_sig = 2'd1;
    	end

    	ACK_ADDR_B: begin
    		to_sw_sig = 2'd0;
    	end		
		
    	READ_ADDR_S: begin
    		load_addr_s = 1'b1;
    		to_sw_sig = 2'd1;
    	end

    	ACK_ADDR_S: begin
    		to_sw_sig = 2'd0;
    	end		
		
    	READ_A: begin
			addrmux_sel = 2'd0;
    		addrinput_sel = 1'b1;
    	end

    	STA_RDB: begin
			load_a = 1'b1;
			addrmux_sel = 2'd1;
    		addrinput_sel = 1'b1;
    	end
		
		STB: begin
			load_b = 1'b1;
			addrmux_sel = 2'd1;
    		addrinput_sel = 1'b1;		
		end
		
    	ADDER: begin
    		load_s = 1'b1;
    	end

    	WRITE_S: begin
    		load_addr_a = 1'b1;
			mem_write = 1'b1;
			addrmux_sel = 2'd2;
    		addrinput_sel = 1'b1;
			if (cur_length < len)
				load_curlength = 2'b1;
    	end

    	SEND_DONE: begin
    		to_sw_sig = 2'd1;
    	end
		
		ACK_DONE: begin
			to_sw_sig = 2'd0;
		end
		
		
		
    endcase

end



always_comb
begin
	next_state = state;
	case (state)
		IDLE: begin
			if (reset == 1'b0)
				next_state = RESET;
			else if (to_hw_sig == 2'd1)
				next_state = READ_LENGTH;
		end
		
		RESET: begin
			next_state = IDLE;
		end

		READ_LENGTH: begin
			if (to_hw_sig == 2'd2)
				next_state = ACK_LENGTH;
		end

		ACK_LENGTH: begin
			if (to_hw_sig == 2'd1)
				next_state = READ_ADDR_A;
		end

		READ_ADDR_A: begin
			if (to_hw_sig == 2'd2)
				next_state = ACK_ADDR_A;
		end

		ACK_ADDR_A: begin
			if (to_hw_sig == 2'd1)
				next_state = READ_ADDR_B;
		end

		READ_ADDR_B: begin
			if (to_hw_sig == 2'd2)
				next_state = ACK_ADDR_B;			
		end

		ACK_ADDR_B: begin
			if (to_hw_sig == 2'd1)
				next_state = READ_ADDR_S;
		end
		
		READ_ADDR_S: begin
			if (to_hw_sig == 2'd2)
				next_state = ACK_ADDR_S;
		end
		
		ACK_ADDR_S: begin
			if (to_hw_sig == 2'd1)
				next_state = READ_A;
		end
		
		READ_A: begin
			next_state = STA_RDB;
		end
		
		STA_RDB: begin
			next_state = STB;
		end
		
		STB: begin
			next_state = ADDER;
		end

		ADDER: begin
				next_state = WRITE_S;
		end

		WRITE_S: begin
			if (cur_length == (len[3:0]-1'b1))
				next_state = SEND_DONE;
			else
				next_state = READ_A;
		end
		
		SEND_DONE: begin
			if (to_hw_sig == 2'd2)
				next_state = ACK_DONE;
		end
		
		ACK_DONE: begin
			if (to_hw_sig == 2'd1)
				next_state = IDLE;
		end

	endcase
end



always_ff @(posedge clk)
begin: next_state_assignment
	state <= next_state;
end

endmodule : ACC_Control