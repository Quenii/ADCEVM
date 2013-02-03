// File Name: 			ddc_mixer.v 														//
// Description:			RTL of NCO(Numerical Controlled Oscillato) top module				//


`timescale 1ns/1ns

module ddc_mixer #(parameter 	ADBITWIDTH = 16 ,
								NCOBITWIDTH = 16 )
				(	input clk,
					input rst,
					input signed[ADBITWIDTH - 1:0] dataa,
					input signed[NCOBITWIDTH - 1:0] datab,
					output reg signed[NCOBITWIDTH + ADBITWIDTH - 1:0] mixer_result );

//----------------------------main programme begin here-----------------------------------

always @(posedge clk or negedge rst)
begin
	if (rst == 1'b0) 
		mixer_result <= {(NCOBITWIDTH + ADBITWIDTH){1'b0}} ;
	else
		mixer_result <= dataa * datab;
end 

endmodule
