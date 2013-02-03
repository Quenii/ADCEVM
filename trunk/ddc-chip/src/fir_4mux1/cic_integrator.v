// File Name: 			cic_filter.v 			   			//
// Testbench: 			cic_filter_tb.v						//
//////////////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ns

module cic_integraotr #(parameter EXTBITWIDTH = 43)
						(	input clk,
							input rst,
							input signed[EXTBITWIDTH - 1:0] din,
							output [EXTBITWIDTH - 1:0] dout);


	wire signed[EXTBITWIDTH - 1:0] dout_temp;
	reg signed[EXTBITWIDTH - 1:0] dout_reg;

//----------------------------main programme begin here-----------------------------------

assign	dout_temp = dout_reg + din ;

/* delay unit */
always @(posedge clk or negedge rst)
begin
	if (rst == 1'b0)
		dout_reg <= {EXTBITWIDTH{1'b0}} ;
	else
		dout_reg <= dout_temp ;
end 

/* connect output port */
assign dout = dout_reg;

endmodule
