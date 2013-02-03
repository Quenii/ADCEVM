// File Name: 			cic_filter.v 			   			//
// Testbench: 			cic_filter_tb.v						//


`timescale 1ns/1ns

module cic_filter #(parameter	EXTBITWIDTH = 43 ,
								COEBITWIDTH = 16 ,
								FILTERBITWIDTH = 18,
								MIXBITWIDTH = 22)
				(	input clk,
					input rst,
					input rst_param,
					input config_sync,
					input cic_indicator,
					input[COEBITWIDTH - 1:0] cic_param,
					input[FILTERBITWIDTH - 1:0] data_in,
					output reg cic_flag,
					output [MIXBITWIDTH - 1:0] cic_result);

	// register and wire declaration
	reg[EXTBITWIDTH - 1:0] data_ext;
	reg[COEBITWIDTH - 1:0] cic_param_temp; 
	reg[4:0] cic_order;
	reg[4:0] cic_decim_factor;
	reg[4:0] cic_max_shifte;
	
//	wire [EXTBITWIDTH - 1:0] integ_reg[5:0];
	wire [EXTBITWIDTH - 1:0] integreg0;
	wire [EXTBITWIDTH - 1:0] integreg1;
	wire [EXTBITWIDTH - 1:0] integreg2;
	wire [EXTBITWIDTH - 1:0] integreg3;
	wire [EXTBITWIDTH - 1:0] integreg4;
	wire [EXTBITWIDTH - 1:0] integreg5; 
	
	wire[EXTBITWIDTH - 1:0] integ_out;
	wire integ_flag;
//	wire[EXTBITWIDTH - 1:0] comb_reg[5:0];
	wire[EXTBITWIDTH - 1:0] combreg0;
	wire[EXTBITWIDTH - 1:0] combreg1;
	wire[EXTBITWIDTH - 1:0] combreg2;
	wire[EXTBITWIDTH - 1:0] combreg3;
	wire[EXTBITWIDTH - 1:0] combreg4;
	wire[EXTBITWIDTH - 1:0] combreg5;
	
	wire[EXTBITWIDTH - 1:0] comb_reg3;
	wire[EXTBITWIDTH - 1:0] comb_reg4;
	wire[EXTBITWIDTH - 1:0] comb_reg5;
	
	reg[EXTBITWIDTH - 1:0] cic_result_temp;
	reg[MIXBITWIDTH - 1:0] cic_result_reg;
	
	reg comb_flag;
	
	// test output port wire

//	genvar i;
//	genvar j;


//----------------------------main programme begin here-----------------------------------

/* input data buffer and sign extended to out_EXTBITWIDTH */
always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		data_ext[EXTBITWIDTH - 1:0] <= {EXTBITWIDTH{1'b0}} ;
	else
		data_ext[EXTBITWIDTH - 1:0]	<= {{(EXTBITWIDTH-FILTERBITWIDTH){data_in[FILTERBITWIDTH - 1]}}, data_in[FILTERBITWIDTH - 1:0]}<<cic_max_shifte ;
end




/* cic parameter load and update */
// loading........
always @(posedge clk, negedge rst_param )
begin
	if (rst_param == 1'b0)
		cic_param_temp[COEBITWIDTH - 1:0] <= {COEBITWIDTH{1'b0}} ;
	else
		if (cic_indicator == 1'b1)
			cic_param_temp[COEBITWIDTH - 1:0] <= cic_param[COEBITWIDTH - 1:0] ;
end 
// updating........
always @(posedge clk, negedge rst_param )
begin
	if (rst_param == 1'b0)
		begin
			cic_order[4:0]			<= 5'b00011 ;
			cic_decim_factor[4:0]	<= 5'b11111 ;
			cic_max_shifte[4:0]	<= 5'b00000;
		end
	else
		if (config_sync == 1'b1)
			begin
				cic_order[4:0]			<= cic_param_temp[4:0];
				cic_decim_factor[4:0]	<= cic_param_temp[9:5];
				cic_max_shifte[4:0]	<= cic_param_temp[14:10];//change
			end
end


/* CIC filter integrator stages */
// loading generate inital data
//assign	integ_reg[0] = data_ext ; 
assign	integreg0 = data_ext ; 

// multiple integrators generation
//generate
//	for (i = 1; i < 6; i = i + 1)
//	begin: integrator_stages
//		cic_integraotr #(.EXTBITWIDTH(EXTBITWIDTH))
//				U_INTEG(	.clk(clk),
//							.rst(rst),
//							.din(integ_reg[i-1]),
//							.dout(integ_reg[i]) );
//	end
//endgenerate
cic_integraotr #(.EXTBITWIDTH(EXTBITWIDTH))
	U_INTEG0(	.clk(clk),
				.rst(rst),
				.din(integreg0),
				.dout(integreg1));

cic_integraotr #(.EXTBITWIDTH(EXTBITWIDTH))
	U_INTEG1(	.clk(clk),
				.rst(rst),
				.din(integreg1),
				.dout(integreg2));

cic_integraotr #(.EXTBITWIDTH(EXTBITWIDTH))
	U_INTEG2(	.clk(clk),
				.rst(rst),
				.din(integreg2),
				.dout(integreg3));

cic_integraotr #(.EXTBITWIDTH(EXTBITWIDTH))
	U_INTEG3(	.clk(clk),
				.rst(rst),
				.din(integreg3),
				.dout(integreg4));

cic_integraotr #(.EXTBITWIDTH(EXTBITWIDTH))
	U_INTEG4(	.clk(clk),
				.rst(rst),
				.din(integreg4),
				.dout(integreg5));


/* CIC filter sample rate decimator */
cic_decimator #(.EXTBITWIDTH(EXTBITWIDTH))
		U_DECIM(	.clk(clk),
					.rst(rst),
					.cic_order(cic_order),
					.cic_decim_factor(cic_decim_factor),
					.integ3(integreg3),
					.integ4(integreg4),
					.integ5(integreg5),
					.dout(integ_out),
					.dout_flag(integ_flag) );


/* CIC filter comb stages */
// loading generate initial data
//assign	comb_reg[0]	= integ_out; 
assign	combreg0	= integ_out; 

// multiple comb generation
//generate
//	for(j = 1; j < 6; j = j + 1)
//	begin: comb_stages
//		cic_comb #(.EXTBITWIDTH(EXTBITWIDTH))
//			U_COMB(	.clk(clk),
//					.rst(rst),
//					.integ_flag(integ_flag),
//					.comb_in(comb_reg[j-1]),
//					.comb_out(comb_reg[j]) );
//	end 
//endgenerate

cic_comb #(.EXTBITWIDTH(EXTBITWIDTH))
	U_COMB0(.clk(clk),
			.rst(rst),
			.integ_flag(integ_flag),
			.comb_in(combreg0),
			.comb_out(combreg1) );

cic_comb #(.EXTBITWIDTH(EXTBITWIDTH))
	U_COMB1(.clk(clk),
			.rst(rst),
			.integ_flag(integ_flag),
			.comb_in(combreg1),
			.comb_out(combreg2) );

cic_comb #(.EXTBITWIDTH(EXTBITWIDTH))
	U_COMB2(.clk(clk),
			.rst(rst),
			.integ_flag(integ_flag),
			.comb_in(combreg2),
			.comb_out(combreg3) );

cic_comb #(.EXTBITWIDTH(EXTBITWIDTH))
	U_COMB3(.clk(clk),
			.rst(rst),
			.integ_flag(integ_flag),
			.comb_in(combreg3),
			.comb_out(combreg4) );

cic_comb #(.EXTBITWIDTH(EXTBITWIDTH))
	U_COMB4(.clk(clk),
			.rst(rst),
			.integ_flag(integ_flag),
			.comb_in(combreg4),
			.comb_out(combreg5) );

// comb result multiplex
assign comb_reg3 = combreg3 ;
assign comb_reg4 = combreg4 ;
assign comb_reg5 = combreg5 ;

always @(comb_reg3, comb_reg4, comb_reg5, cic_order)
begin
	case (cic_order)
		5'b00011:	cic_result_temp[EXTBITWIDTH - 1:0]	<= comb_reg3;
		5'b00100:	cic_result_temp[EXTBITWIDTH - 1:0]	<= comb_reg4;
		5'b00101:	cic_result_temp[EXTBITWIDTH - 1:0]	<= comb_reg5;
		default:	cic_result_temp[EXTBITWIDTH - 1:0]	<= comb_reg3;
	endcase
end

// regsiter output
always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		begin
			cic_result_reg[MIXBITWIDTH - 1:0]	<= {MIXBITWIDTH{1'b0}} ;
			comb_flag	<= 1'b0 ;
			cic_flag	<= 1'b0 ;
		end
	else
		begin
			cic_result_reg[MIXBITWIDTH - 1:0]	<= cic_result_temp[EXTBITWIDTH - 1:EXTBITWIDTH - MIXBITWIDTH]; 
									
			comb_flag	<= integ_flag;
			cic_flag	<= comb_flag;
		end 
end


/* CIC filter gain normalized */
assign cic_result[MIXBITWIDTH - 1:0] = cic_result_reg[MIXBITWIDTH - 1:0];


endmodule
