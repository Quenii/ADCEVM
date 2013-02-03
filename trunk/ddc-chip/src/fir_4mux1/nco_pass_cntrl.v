// File Name: 			nco_pass_cntrl.v 													//


`timescale 1ns/1ns

module nco_pass_cntrl #(parameter 	ADBITWIDTH = 16 ,
					COEBITWIDTH = 16,
					NCOBITWIDTH = 22,
					FILTERBITWIDTH = 18 )
					(	input clk,
					   input rst_param,
						input rst,
						input nco_pass_flag,
						input[ADBITWIDTH - 1:0] dataa,
						input[NCOBITWIDTH - 1:0] datab,
						input config_sync,
						input ncogain_indicator,
						input [COEBITWIDTH - 1:0] ncogain_param,
						output reg[FILTERBITWIDTH - 1:0] data_sel,
						output reg overflow_reg) ;


reg [COEBITWIDTH - 1:0] ncogain_reg;
reg [1:0] gain_factor;
reg signed [NCOBITWIDTH - 1:0]data_sel_buf;
reg datab_m;
reg nco_pass_flag_buf;
//reg [NCOBITWIDTH - 1:0]data_sel_buf1;
//reg overflow_reg;

wire [2:0] overflow_flag;
wire signed [FILTERBITWIDTH : 0]data_sel_w;


//----------------------------main programme begin here-----------------------------------


/* loading and updating gain parameter */
// loading......
always @(posedge clk, negedge rst_param )
begin
	if (rst_param == 1'b0)
		begin
			ncogain_reg <= {COEBITWIDTH{1'b0}} ;			
		end
	else
		if (ncogain_indicator == 1'b1)
			begin
				ncogain_reg 	<= ncogain_param ;				
			end
end

//updating......
always @(posedge clk, negedge rst_param )
begin
	if (rst_param == 1'b0)
		begin
			gain_factor	<= {2{1'b0}} ;
		end
	else
		if (config_sync == 1'b1)
			begin
				gain_factor[1:0] <= ncogain_reg[1:0] ;
			end
end

always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		begin
			data_sel_buf <= {NCOBITWIDTH{1'b0}};
			datab_m <= 1'b0;
			nco_pass_flag_buf <= 1'b0;
			//data_sel_buf1 <= {NCOBITWIDTH{1'b0}};
		end
	else
		begin
			data_sel_buf <= datab << gain_factor;
			datab_m <= datab[NCOBITWIDTH - 1];
			nco_pass_flag_buf <= nco_pass_flag;
				//end
		end
end

		
				

assign overflow_flag = ({3{datab[NCOBITWIDTH - 1]}})^datab[NCOBITWIDTH - 2:NCOBITWIDTH - 4];

always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		overflow_reg <= 1'b0;
	else
		begin
			case (gain_factor)
			4'b01: overflow_reg <= overflow_flag[2];			
			4'b10: overflow_reg <= |overflow_flag[2:1];
			4'b11: overflow_reg <= |overflow_flag[2:0];
			
			default: overflow_reg <= 1'b0;
			endcase		
		end
end



assign data_sel_w[FILTERBITWIDTH:0] = $signed((overflow_reg == 1'b1) ? ({datab_m, {(FILTERBITWIDTH ){1'b0}}}) : ({data_sel_buf[NCOBITWIDTH - 1],data_sel_buf[NCOBITWIDTH - 1:NCOBITWIDTH - FILTERBITWIDTH] }
									+ data_sel_buf[NCOBITWIDTH - FILTERBITWIDTH - 1]));


	
always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		data_sel[FILTERBITWIDTH - 1:0] <= {FILTERBITWIDTH{1'b0}} ;
	else
		begin
			if (nco_pass_flag_buf == 1'b1)
				data_sel <= {dataa[ADBITWIDTH - 1:0], {(FILTERBITWIDTH - ADBITWIDTH ){1'b0}}};
			else
				begin
					if ((data_sel_w[FILTERBITWIDTH] ^ data_sel_w[FILTERBITWIDTH - 1] == 1'b1) || (overflow_reg == 1'b1)) 
					begin
						if (data_sel_w[FILTERBITWIDTH] == 1'b1)
							data_sel[FILTERBITWIDTH - 1:0]	<= {{data_sel_w[FILTERBITWIDTH]}, {(FILTERBITWIDTH - 1){1'b0}}};
						else
							data_sel[FILTERBITWIDTH - 1:0]	<= {{data_sel_w[FILTERBITWIDTH]}, {(FILTERBITWIDTH - 1){1'b1}}};
					end
					else
						data_sel[FILTERBITWIDTH - 1:0]	<= data_sel_w[FILTERBITWIDTH - 1:0]; 
									

  		   end
  	end
end


endmodule
