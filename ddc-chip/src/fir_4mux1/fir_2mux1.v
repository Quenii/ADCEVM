// File Name: 			fir_2mux1.v 						//

`timescale 1ns/1ns

module fir_2mux1 #(parameter FILTERBITWIDTH = 20)
				(	input mux_sel,
					input [FILTERBITWIDTH - 1:0] dataa ,
					input [FILTERBITWIDTH - 1:0] datab ,
					output reg [FILTERBITWIDTH - 1:0] data_sel );

//----------------------------main programme begin here-----------------------------------

always @(mux_sel, dataa, datab)
begin
	case (mux_sel)
		1'b0:		data_sel = dataa ;
		1'b1:		data_sel = datab ;
		default: 	data_sel = dataa ;
	endcase
end


endmodule
