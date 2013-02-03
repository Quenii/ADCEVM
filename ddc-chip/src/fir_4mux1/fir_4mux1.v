// File Name: 			fir_4mux1.v 														//

`timescale 1ns/1ns

module fir_4mux1 #(parameter FILTERBITWIDTH = 20)
				(	input [1:0] mux_sel,
					input [FILTERBITWIDTH - 1:0] dataa ,
					input [FILTERBITWIDTH - 1:0] datab ,
					input [FILTERBITWIDTH - 1:0] datac ,
					input [FILTERBITWIDTH - 1:0] datad ,
					output reg [FILTERBITWIDTH - 1:0] data_sel );

//----------------------------main programme begin here-----------------------------------

always @(mux_sel, dataa, datab, datac, datad)
begin
	case (mux_sel)
		2'b00:		data_sel = dataa ;
		2'b01:		data_sel = datab ;
		2'b10:		data_sel = datac ;
		2'b11:		data_sel = datad ;
		default: 	data_sel = dataa ;
	endcase
end


endmodule
