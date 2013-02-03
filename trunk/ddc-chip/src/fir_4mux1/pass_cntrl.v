// File Name: 			cic_filter.v 			   			//
// Testbench: 			cic_filter_tb.v						//
// Company:				CETC14, 					//


`timescale 1ns/1ns

module pass_cntrl #(parameter INBITWIDTH = 22,
				COEBITWIDTH = 16,
				FILTERBITWIDTH = 18)
					(	input clk ,
						input rst ,
						input pass_flag,
						input rst_param,
						//input hb_pass_flag,
						input gain_indicator,
						input config_sync,
						input [COEBITWIDTH - 1:0] gain_param,
						//input [FILTERBITWIDTH - 1:0] dataa,
						input [FILTERBITWIDTH - 1:0] dataa,
						input [INBITWIDTH - 1:0] datab,
						input dataa_flag,
						input datab_flag,
						output reg data_sel_flag,
						output reg[FILTERBITWIDTH - 1:0] data_sel,
						output reg overflow_reg);

	reg [COEBITWIDTH - 1:0]gain_reg;
	reg signed [INBITWIDTH - 1:0] data_sel_buf;
	reg data_sel_wm;
	reg data_sel_flag_buf;
	reg pass_flag_buf;
	//reg overflow_reg;
	reg [2:0] gain_factor;
	reg signed [FILTERBITWIDTH - 1:0] dataa_buf;
	
	//wire [1:0] pass_cntrl ;
	wire [INBITWIDTH - 1:0] data_sel_w0;
	wire signed [FILTERBITWIDTH:0]data_sel_w1;
	wire data_sel_flag_w;
	wire [6:0]overflow_flag;


//----------------------------main programme begin here-----------------------------------

/* loading and updating gain parameter */
// loading......
always @(posedge clk, negedge rst_param )
begin
	if (rst_param == 1'b0)
		begin
			gain_reg <= {COEBITWIDTH{1'b0}} ;			
		end
	else
		if (gain_indicator == 1'b1)
			begin
				gain_reg 	<= gain_param ;				
			end
end

//updating......
always @(posedge clk, negedge rst_param )
begin
	if (rst_param == 1'b0)
		begin
			gain_factor	<= {3{1'b0}} ;
		end
	else
		if (config_sync == 1'b1)
			begin
				gain_factor[2:0] <= gain_reg[2:0] ;
			end
end

assign data_sel_w0 = (datab);
assign data_sel_flag_w = (pass_flag == 1'b0) ? (datab_flag) : (dataa_flag);
always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		begin
			data_sel_buf <= {INBITWIDTH{1'b0}};
			data_sel_wm <= 1'b0;
			data_sel_flag_buf <= 1'b0;
			dataa_buf <= 1'b0;
			pass_flag_buf <=1'b0;
			//data_sel_buf1 <= {NCOBITWIDTH{1'b0}};
		end
	else
		begin
			data_sel_buf <= data_sel_w0 << gain_factor;
			data_sel_wm <= data_sel_w0[INBITWIDTH - 1];
			data_sel_flag_buf <= data_sel_flag_w;
			dataa_buf <= dataa;
			pass_flag_buf <= pass_flag;
				//end
		end
end

assign data_sel_w1[FILTERBITWIDTH:0] = $signed((overflow_reg == 1'b1) ? ({data_sel_wm, {(FILTERBITWIDTH ){1'b0}}}) : ({data_sel_buf[INBITWIDTH - 1],data_sel_buf[INBITWIDTH - 1:INBITWIDTH - FILTERBITWIDTH] }
									+ data_sel_buf[INBITWIDTH - FILTERBITWIDTH - 1]));

assign overflow_flag = ({7{data_sel_w0[INBITWIDTH - 1]}})^data_sel_w0[INBITWIDTH - 2:INBITWIDTH - 8];

always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		overflow_reg <= 1'b0;
	else
		begin
			case (gain_factor)
			4'b001: overflow_reg <= overflow_flag[6];			
			4'b010: overflow_reg <= |overflow_flag[6:5];
			4'b011: overflow_reg <= |overflow_flag[6:4];
			4'b100: overflow_reg <= |overflow_flag[6:3];
			4'b101: overflow_reg <= |overflow_flag[6:2];
			4'b110: overflow_reg <= |overflow_flag[6:1];
			4'b111: overflow_reg <= |overflow_flag[6:0];
			
			default: overflow_reg <= 1'b0;
			endcase		
		end
end



always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		data_sel[FILTERBITWIDTH - 1:0] <= {FILTERBITWIDTH{1'b0}} ;
	else
	begin
		if (pass_flag_buf == 1'b1)
			data_sel[FILTERBITWIDTH - 1:0] <= dataa_buf[FILTERBITWIDTH - 1:0];
		else
			begin
				if ((data_sel_w1[FILTERBITWIDTH] ^ data_sel_w1[FILTERBITWIDTH - 1] == 1'b1) || (overflow_reg == 1'b1)) 
				begin
					if (data_sel_w1[FILTERBITWIDTH] == 1'b1)
						data_sel[FILTERBITWIDTH - 1:0]	<= {data_sel_w1[FILTERBITWIDTH], {(FILTERBITWIDTH - 1){1'b0}}};
					else
						data_sel[FILTERBITWIDTH - 1:0]	<= {{data_sel_w1[FILTERBITWIDTH]}, {(FILTERBITWIDTH - 1){1'b1}}};
				end
				else
					data_sel[FILTERBITWIDTH - 1:0]	<= data_sel_w1[FILTERBITWIDTH - 1:0]; 
			end
								


  	end
  	
end


always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		data_sel_flag <= 1'b0;
	else
		begin
			data_sel_flag <= data_sel_flag_buf;
		end
end		





/*always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		data_sel_flag	<= 1'b0 ;
	else
		case (pass_cntrl)
			3'b011:		data_sel_flag	<= 1'b1 ;
			3'b001:		data_sel_flag	<= dataa_flag ;
			3'b010: 	data_sel_flag	<= datab_flag ;
			default: 	data_sel_flag	<= datab_flag ;
		endcase
end



assign pass_cntrl = {cic_pass_flag, hb_pass_flag} ;

always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		data_sel[FILTERBITWIDTH - 1:0]	<= {FILTERBITWIDTH{1'b0}} ;
	else
		case (pass_cntrl)
			3'b011:		data_sel[FILTERBITWIDTH - 1:0]	<= dataa[FILTERBITWIDTH - 1:0] ;
			3'b001:		data_sel[FILTERBITWIDTH - 1:0]	<= dataa[FILTERBITWIDTH - 1:0] ;
			3'b010: 	data_sel[FILTERBITWIDTH - 1:0]	<= datab[FILTERBITWIDTH - 1:0] ;
			default: 	data_sel[FILTERBITWIDTH - 1:0]	<= dataa[FILTERBITWIDTH - 1:0] ;
		endcase
end

always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		data_sel_flag	<= 1'b0 ;
	else
		case (pass_cntrl)
			3'b011:		data_sel_flag	<= 1'b1 ;
			3'b001:		data_sel_flag	<= dataa_flag ;
			3'b010: 	data_sel_flag	<= datab_flag ;
			default: 	data_sel_flag	<= dataa_flag ;
		endcase
end */


endmodule
