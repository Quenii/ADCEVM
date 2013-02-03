// File Name: 			nco_trigger.v	 													//
// Company:				CETC14			//


`timescale 1ns/1ns

module nco_trigger #(parameter 	ADBITWIDTH = 16 ,
								NCOBITWIDTH = 25 )
				(	input clk,
					input rst,
					input orp,
					input[ADBITWIDTH - 1:0] dataa_in,
					input[NCOBITWIDTH - 1:0] datab_in,
					input[NCOBITWIDTH - 1:0] datac_in,
					input[15:0] sin_val,
					input nco_test_en,					
					output reg[ADBITWIDTH - 1:0] dataa_out,
					output reg[NCOBITWIDTH - 1:0] datab_out,
					output reg[NCOBITWIDTH - 1:0] datac_out );

//----------------------------main programme begin here-----------------------------------

//reg [ADBITWIDTH - 1:0] dataa_in_buf;
//reg [NCOBITWIDTH - 1:0] datab_in_buf;
//reg [NCOBITWIDTH - 1:0] datac_in_buf;
//reg orp_reg;
//always @(posedge clk or negedge rst)
//begin
//	if (rst == 1'b0) 
//		begin
//			dataa_in_buf[ADBITWIDTH - 1:0]		<= {ADBITWIDTH{1'b0}} ;
//			datab_in_buf[NCOBITWIDTH - 1:0]	<= {NCOBITWIDTH{1'b0}} ;
//			datac_in_buf[NCOBITWIDTH - 1:0]	<= {NCOBITWIDTH{1'b0}} ;
//			orp_reg <=1'b0;
//			
//		end 
//	else
//		begin
//			dataa_in_buf[ADBITWIDTH - 1:0]		<= dataa_in[ADBITWIDTH - 1:0] ;
//			datab_in_buf[NCOBITWIDTH - 1:0]	<= datab_in[NCOBITWIDTH - 1:0] ;
//			datac_in_buf[NCOBITWIDTH - 1:0]	<= datac_in[NCOBITWIDTH - 1:0] ;
//			orp_reg <= orp;
//		end
//end


always @(posedge clk or negedge rst)
begin
	if (rst == 1'b0) 
		begin
			dataa_out[ADBITWIDTH - 1:0]		<= {ADBITWIDTH{1'b0}} ;
			datab_out[NCOBITWIDTH - 1:0]	<= {NCOBITWIDTH{1'b0}} ;
			datac_out[NCOBITWIDTH - 1:0]	<= {NCOBITWIDTH{1'b0}} ;
		end 
	else
		begin
			
			if (orp == 1'b1)
				begin
					if (dataa_in[ADBITWIDTH - 1] == 1'b1)
						dataa_out[ADBITWIDTH - 1:0] <= 16'h8000;
					else
						dataa_out[ADBITWIDTH - 1:0] <= 16'h7fff;
					
				end	
			else if (nco_test_en == 1'b1)
				begin
					dataa_out[ADBITWIDTH - 1:0]	<= sin_val[ADBITWIDTH - 1:0] ;
				end
					
			else
				begin
					dataa_out[ADBITWIDTH - 1:0]	<= dataa_in[ADBITWIDTH - 1:0] ;
					
				end
			datab_out[NCOBITWIDTH - 1:0]	<= datab_in[NCOBITWIDTH - 1:0] ;
			datac_out[NCOBITWIDTH - 1:0]	<= datac_in[NCOBITWIDTH - 1:0] ;
		end 
end


endmodule
