// File Name: 			fir_pass_cntrl.v 													//
// Company:				CETC14			//


`timescale 1ns/1ns

module fir_pass_cntrl #(parameter 	FILTERBITWIDTH = 16 ,
									INBITWIDTH = 18)
					(	input clk,
						input rst,
						input fir_pass_flag,
						input cic_pass_data_flag,
						input [INBITWIDTH - 1:0] cic_pass_data,
						input fir_flag,
						input [FILTERBITWIDTH - 1:0] fir_data,
						output reg data_flag,
						output reg[FILTERBITWIDTH - 1:0] data_sel);


//----------------------------main programme begin here-----------------------------------

always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		begin
			data_sel[FILTERBITWIDTH - 1:0]	<= {FILTERBITWIDTH{1'b0}} ;
			data_flag					<= 1'b0 ;
		end 
	else
		if (fir_pass_flag == 1'b0)
			begin
				data_flag					<= fir_flag;
				data_sel[FILTERBITWIDTH - 1:0]	<= fir_data[FILTERBITWIDTH - 1:0] ;
			end 
		else
			begin
				data_flag					<= cic_pass_data_flag;
				data_sel[FILTERBITWIDTH - 1:0]	<= cic_pass_data[INBITWIDTH - 1:INBITWIDTH - FILTERBITWIDTH] ;
			end 
end


endmodule
