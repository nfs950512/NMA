module counter #(parameter width = 16)
(
    input clk,
    input [1:0] load,
    output logic [width-1:0] out
);

logic [width-1:0] data;

/* Altera device registers are 0 at power on. Specify this
 * so that Modelsim works as expected.
 */

always_ff @(posedge clk)
begin
	if (load == 2'd1)
		data <= data + 1'b1;
	else if (load  == 2'd2)
		data <= 0;
end

always_comb
begin
    out = data;
end

endmodule : counter
