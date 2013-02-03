
// File Name: 			cic_filter.v 			   			//
// Testbench: 			cic_filter_tb.v						//


`timescale 1ns/1ns

module cic_decimator #(parameter EXTBITWIDTH = 43)
						(	input clk,
							input rst,
							input [4:0] cic_order,
							input [4:0] cic_decim_factor,
							input [EXTBITWIDTH - 1:0] integ3,
							input [EXTBITWIDTH - 1:0] integ4,
							input [EXTBITWIDTH - 1:0] integ5,
							output reg[EXTBITWIDTH - 1:0] dout,
							output reg dout_flag);

	// register and wire declaration
	reg[EXTBITWIDTH - 1:0] integ_reg;
	reg[4:0] decim_cnt;


//----------------------------main programme begin here-----------------------------------

/* select input data from cic order parameter */
always @(cic_order, integ3, integ4, integ5)
begin
	case(cic_order)
		5'b00011:	integ_reg[EXTBITWIDTH - 1:0]	<= integ3[EXTBITWIDTH - 1:0];
		5'b00100:	integ_reg[EXTBITWIDTH - 1:0]	<= integ4[EXTBITWIDTH - 1:0];
		5'b00101:	integ_reg[EXTBITWIDTH - 1:0]	<= integ5[EXTBITWIDTH - 1:0];
		default:	integ_reg[EXTBITWIDTH - 1:0]	<= integ3[EXTBITWIDTH - 1:0];
	endcase
end


/* data decimating */
// decimating counter 
always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		decim_cnt[4:0] <= {5{1'b0}} ;
	else
		if (decim_cnt[4:0] == cic_decim_factor[4:0]) 
			decim_cnt[4:0]	<= 5'b00000;
		else
			decim_cnt[4:0]	<= decim_cnt[4:0] + 1'b1 ;
end

// decimating data and flag output
always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		begin
			dout[EXTBITWIDTH - 1:0] <= {EXTBITWIDTH{1'B0}} ;
			dout_flag <= 1'b0;
		end
	else
		begin
			if (decim_cnt[4:0] == cic_decim_factor[4:0])
				begin
					dout[EXTBITWIDTH - 1:0] <= integ_reg[EXTBITWIDTH - 1:0];
					dout_flag <= 1'b1;
				end
			else
				begin
//					dout[EXTBITWIDTH - 1:0] <= {EXTBITWIDTH{1'B0}} ;	// mentain previous value
					dout_flag <= 1'b0;			
				end
		end
end


endmodule
