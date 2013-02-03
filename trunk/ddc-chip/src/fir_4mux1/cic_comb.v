// File Name: 			cic_filter.v 			   			//
// Testbench: 			cic_filter_tb.v						//

`timescale 1ns/1ns

module cic_comb #(parameter EXTBITWIDTH = 43)
				(	input clk,
					input rst,
					input integ_flag,
					input signed[EXTBITWIDTH - 1:0] comb_in,
					output reg[EXTBITWIDTH - 1:0] comb_out);


	reg signed[EXTBITWIDTH - 1:0] comb_delay;
	reg signed[EXTBITWIDTH - 1:0] comb_out_temp;

//----------------------------main programme begin here-----------------------------------

/* comb differential delay	unit */
always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		comb_delay[EXTBITWIDTH - 1:0]	<= {EXTBITWIDTH{1'b0}} ;
	else 
		if (integ_flag == 1'b1)
			comb_delay[EXTBITWIDTH - 1:0]	<= comb_in[EXTBITWIDTH - 1:0] ;

end 


/* comb differential unit */

//substracter
always @(comb_in, comb_delay)
begin
	comb_out_temp	<= comb_in - comb_delay;
end

// register output
always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		comb_out[EXTBITWIDTH - 1:0] <= {EXTBITWIDTH{1'b0}} ;
	else
		if (integ_flag == 1'b1)
			comb_out[EXTBITWIDTH - 1:0] <= comb_out_temp[EXTBITWIDTH - 1:0];
end


endmodule
