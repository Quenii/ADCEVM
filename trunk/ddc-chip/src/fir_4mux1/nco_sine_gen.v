module nco_sine_gen ( input clk,
						input rst,
						input [31:0] freq_word,
						input [14:0] nco_test,
						
						output [15:0] sin_val,
						output reg nco_test_en);


reg [31:0]phi;

always @(posedge clk or negedge rst)
begin
	if (rst == 1'b0) 
		begin
			phi[31:0]		<= {32{1'b0}} ;	
			nco_test_en		<= 1'b0;		
		end 
	else
		begin
			phi[31:0]		<= freq_word[31:0] + {{2'b00},{nco_test[14:1]},{16'h0000}} ;
			nco_test_en		<= nco_test[0];
		end
end
	
	nco_for_test i_nco_for_test (
    .out_valid(),
    .fsin_o(sin_val[15:0]),
    .phi_inc_i(phi),
    .reset_n(rst),
    .clken(1'b1),
    .clk(clk)
    );	

endmodule