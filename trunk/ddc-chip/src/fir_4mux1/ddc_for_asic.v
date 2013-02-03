// File Name: 			ddc_for_asic.v														//
// File Name: 			ddc_for_asic_tb.v													//
// Simulation tools:	ModelSimSE 6.1d														//
// Description:			1. configuration interface bus bitwidth equals to filter 			//
//							coefficiect	bitwidth											//
//


`timescale 1ns/1ns

module ddc_for_asic #(parameter ADBITWIDTH = 16 ,
								NCOBITWIDTH = 25 ,
								FILTERBITWIDTH = 18 ,
								MIXBITWIDTH = 22,
								COEBITWIDTH = 16,
								FIRBITWIDTH = 26)	
					(	input clk,
						input rst_m0,
						input rst_start,
						input rst,
						input config_sync,
						input [COEBITWIDTH - 1:0] nco_param ,
						input [COEBITWIDTH - 1:0] ncogain_param ,
						input [COEBITWIDTH - 1:0] hb_param ,
						input [COEBITWIDTH - 1:0] cic_param ,
						input [COEBITWIDTH - 1:0] decimgain_param,
						input [COEBITWIDTH - 1:0] hbgain_param,
						input [COEBITWIDTH - 1:0] fir_param ,
						input [COEBITWIDTH - 1:0] firgain_param,
						input orp,
						input [ADBITWIDTH - 1:0] data_in ,
						input nco_indicator ,
						input nco_pass_flag ,
						input ncogain_indicator,
						input hb_indicator ,
						input hb_pass_flag ,
						input decimgain_indicator,
						input cic_indicator ,
						input cic_pass_flag ,
						input hbgain_indicator,						
						input fir_indicator ,
						input fir_pass_flag ,
						input firgain_indicator,
						input [15:0] sin_val,
						input nco_test_en,
						
						//just for simulation 
						output [NCOBITWIDTH - 1:0] nco_sine_test ,
						output [NCOBITWIDTH - 1:0] nco_cosine_test ,
						output [MIXBITWIDTH - 1:0] mixer_i_test ,
						output [MIXBITWIDTH - 1:0] mixer_q_test ,
						output [FILTERBITWIDTH - 1:0]nco_i_pass_data_test,
						output [FILTERBITWIDTH - 1:0]nco_q_pass_data_test,
						output [MIXBITWIDTH - 1:0] hb_i_test ,
						output [MIXBITWIDTH - 1:0] hb_q_test ,
						output [MIXBITWIDTH - 1:0] cic_i_test ,
						output [MIXBITWIDTH - 1:0] cic_q_test ,
						output hb_flag ,
						output cic_flag ,
						output [FIRBITWIDTH-1:0]fir_i_result_test,
						output [FIRBITWIDTH-1:0]fir_q_result_test,
						output fir_flag,
		
						output [ADBITWIDTH - 1:0] ddc_i_data ,
						output [ADBITWIDTH - 1:0] ddc_q_data ,
						output ddc_flag,
						output [14:0] nco_test,
						output [31:0] freq_word ) ;

	// wire declaration
	wire [NCOBITWIDTH - 1:0] nco_sine ;
	wire [NCOBITWIDTH - 1:0] nco_cosine ;
						
	wire [ADBITWIDTH - 1:0] ad_data ;
	wire [NCOBITWIDTH - 1:0] nco_sine_buf ;
	wire [NCOBITWIDTH - 1:0] nco_cosine_buf ;
	
	wire [ADBITWIDTH + NCOBITWIDTH - 1:0] mixer_i ;
	wire [ADBITWIDTH + NCOBITWIDTH - 1:0] mixer_q ;
	
	wire [MIXBITWIDTH - 1:0] mixer_i_wire;
	wire [MIXBITWIDTH - 1:0] mixer_q_wire;	
	wire [FILTERBITWIDTH - 1:0] nco_i_pass_data;
	wire [FILTERBITWIDTH - 1:0] nco_q_pass_data;
	wire [ADBITWIDTH - 1:0]firgain_i_result;
	wire [ADBITWIDTH - 1:0]firgain_q_result;
	wire firgain_i_flag;
	wire firgain_q_flag;
	wire [6:0] overflow;
	
	wire hb_i_flag ;
	wire hb_q_flag ;
	wire [MIXBITWIDTH - 1:0] hb_i_result ;
	wire [MIXBITWIDTH - 1:0] hb_q_result ;

	wire cic_i_flag ;
	wire cic_q_flag ;
	wire [MIXBITWIDTH - 1:0] cic_i_result ;
	wire [MIXBITWIDTH - 1:0] cic_q_result ;

	wire hb_i_pass_flag ;
	wire hb_q_pass_flag ;
	wire [FILTERBITWIDTH - 1:0] hb_i_pass_data ;
	wire [FILTERBITWIDTH - 1:0] hb_q_pass_data ;

	wire cic_i_pass_flag ;
	wire cic_q_pass_flag ;
	wire [FILTERBITWIDTH - 1:0] cic_i_pass_data ;
	wire [FILTERBITWIDTH - 1:0] cic_q_pass_data ;
	
	wire fir_i_flag ;
	wire fir_q_flag ;
	wire [FIRBITWIDTH - 1:0] fir_i_result ;
	wire [FIRBITWIDTH - 1:0] fir_q_result ;
	
	

//	wire ddc_flag_test ;
//	wire nco_test_en;
//	wire [15:0] sin_val;
//----------------------------main programme begin here-----------------------------------

// component instantiation

/* NCO instantiation */
nco_for_asic #(	.BUSBITWIDTH(COEBITWIDTH) ,
				.PIPELENGTH(23) ,
				.PPWIDTH(NCOBITWIDTH) )
	U_NCO(	.clk(clk),
	         .rst_param(rst),
	      			.rst(rst_start),
				.config_sync(config_sync),
				.nco_indicator(nco_indicator),
				.nco_param(nco_param), 
				.nco_sine(nco_sine),
				.nco_cosine(nco_cosine),
				//.sin_val(sin_val),
				.nco_test(nco_test),
				.freq_word(freq_word));


/* NCO result buffer instantiation */
nco_trigger  #(	.ADBITWIDTH(ADBITWIDTH) ,
				.NCOBITWIDTH(NCOBITWIDTH) )
	U_NCO_TRIG(	.clk(clk),
				.rst(rst_m0),
				.orp(orp),
				.dataa_in(data_in),
				.datab_in(nco_sine),
				.datac_in(nco_cosine),
				.dataa_out(ad_data),
				.datab_out(nco_sine_buf),
				.datac_out(nco_cosine_buf),
				.sin_val(sin_val),
				.nco_test_en(nco_test_en) );


/* MIXER instantiation */
// MIXER-I
ddc_mixer #(	.ADBITWIDTH(ADBITWIDTH) ,
				.NCOBITWIDTH(NCOBITWIDTH) )
	U_MIXER_I(	.clk(clk),
				.rst(rst_m0),
				.dataa(ad_data),
				.datab(nco_cosine_buf),
				.mixer_result(mixer_i) );
// MIXER-Q
ddc_mixer #(	.ADBITWIDTH(ADBITWIDTH) ,
				.NCOBITWIDTH(NCOBITWIDTH) )
	U_MIXER_Q(	.clk(clk),
				.rst(rst_m0),
				.dataa(ad_data),
				.datab(nco_sine_buf),
				.mixer_result(mixer_q) );


/* NCO pass controller */
// pruning
assign mixer_i_wire[MIXBITWIDTH - 1:0] = mixer_i[ADBITWIDTH + NCOBITWIDTH - 1:ADBITWIDTH + NCOBITWIDTH - MIXBITWIDTH] ;
assign mixer_q_wire[MIXBITWIDTH - 1:0] = mixer_q[ADBITWIDTH + NCOBITWIDTH - 1:ADBITWIDTH + NCOBITWIDTH - MIXBITWIDTH] ;

// NCO-I pass controller
nco_pass_cntrl #(	.ADBITWIDTH(ADBITWIDTH) ,
			.COEBITWIDTH(COEBITWIDTH),
			.NCOBITWIDTH(MIXBITWIDTH),
			.FILTERBITWIDTH(FILTERBITWIDTH) )
	U_NCO_I_PASS_CNTRL(	.clk(clk),
						.rst(rst_m0),
						.rst_param(rst),
						.nco_pass_flag(nco_pass_flag),
						.dataa(ad_data),
						.datab(mixer_i_wire),
						.config_sync(config_sync),
						.ncogain_indicator(ncogain_indicator),
						.ncogain_param(ncogain_param),
						.data_sel(nco_i_pass_data),
						.overflow_reg(overflow[0])) ;

// NCO-Q pass controller
nco_pass_cntrl #(	.ADBITWIDTH(ADBITWIDTH) ,
			.COEBITWIDTH(COEBITWIDTH),
			.NCOBITWIDTH(MIXBITWIDTH),
			.FILTERBITWIDTH(FILTERBITWIDTH) )
	U_NCO_Q_PASS_CNTRL(	.clk(clk),
						.rst(rst_m0),
						.rst_param(rst),
						.nco_pass_flag(nco_pass_flag),
						.dataa(ad_data),
						.datab(mixer_q_wire),
						.config_sync(config_sync),
						.ncogain_indicator(ncogain_indicator),
						.ncogain_param(ncogain_param),
						.data_sel(nco_q_pass_data),
						.overflow_reg(overflow[1])) ;


/* CIC filter instantiation */
 //CIC I filter
cic_filter #(	.EXTBITWIDTH(43) ,
				.COEBITWIDTH(COEBITWIDTH) ,
				.FILTERBITWIDTH(FILTERBITWIDTH),
				.MIXBITWIDTH(MIXBITWIDTH))
	U_CIC_I(.clk(clk),
			.rst(rst_m0),
			.rst_param(rst),
			.config_sync(config_sync),
			.cic_indicator(cic_indicator),
			.cic_param(cic_param),
			.data_in(nco_i_pass_data),
			.cic_flag(cic_i_flag),
			.cic_result(cic_i_result));

// CIC Q filter
cic_filter #(	.EXTBITWIDTH(43) ,
				.COEBITWIDTH(COEBITWIDTH) ,
				.FILTERBITWIDTH(FILTERBITWIDTH),
				.MIXBITWIDTH(MIXBITWIDTH))
	U_CIC_Q(.clk(clk),
			.rst(rst_m0),
			.rst_param(rst),
			.config_sync(config_sync),
			.cic_indicator(cic_indicator),
			.cic_param(cic_param),
			.data_in(nco_q_pass_data),
			.cic_flag(cic_q_flag),
			.cic_result(cic_q_result));

 /*CIC filter result pass controller  */
 //CIC filter I pass controller
pass_cntrl #(	.INBITWIDTH(MIXBITWIDTH) ,
			.COEBITWIDTH(COEBITWIDTH),
			.FILTERBITWIDTH(FILTERBITWIDTH) )
	U_CIC_I_PASS_CNTRL(	.clk(clk) ,
						.rst(rst_m0) ,
						.rst_param(rst),
						//.nco_pass_flag(nco_pass_flag),
						.pass_flag(cic_pass_flag),
						//.hb_pass_flag(hb_pass_flag),
						.gain_indicator(decimgain_indicator),
						.config_sync(config_sync),
						.gain_param(decimgain_param),
						.dataa(nco_i_pass_data),
						.datab(cic_i_result),
						//.hb_data(hb_i_result),
						.dataa_flag(1'b1),
						.datab_flag(cic_i_flag),
						.data_sel_flag(cic_i_pass_flag),
						.data_sel(cic_i_pass_data),
						.overflow_reg(overflow[2]));

 //CIC filter Q pass controller
pass_cntrl #(	.INBITWIDTH(MIXBITWIDTH) ,
			.COEBITWIDTH(COEBITWIDTH),
			.FILTERBITWIDTH(FILTERBITWIDTH) )
	U_CIC_Q_PASS_CNTRL(	.clk(clk) ,
						.rst(rst_m0) ,
						.rst_param(rst),
						//.nco_pass_flag(nco_pass_flag),
						.pass_flag(cic_pass_flag),
						//.hb_pass_flag(hb_pass_flag),
						.gain_indicator(decimgain_indicator),
						.config_sync(config_sync),
						.gain_param(decimgain_param),
						.dataa(nco_q_pass_data),
						.datab(cic_q_result),
						//.hb_data(hb_q_result),
						.dataa_flag(1'b1),
						.datab_flag(cic_q_flag),
						.data_sel_flag(cic_q_pass_flag),
						.data_sel(cic_q_pass_data),
						.overflow_reg(overflow[3]));
	

/* halfband filter instantiation */
 //halfband I filter
hb_filter #(.INBITWIDTH(FILTERBITWIDTH),
			.COEBITWIDTH(COEBITWIDTH),
			.OUTBITWIDTH(MIXBITWIDTH))

		U_HB_I(	.clk(clk),
				.rst(rst_m0),
				.rst_param(rst),
				.config_sync(config_sync),
				.hb_indicator(hb_indicator),
				.hb_param(hb_param),
				.data_in(cic_i_pass_data),
				.data_in_flag(cic_i_pass_flag),//ck 080504 add
				.hb_flag(hb_i_flag),
				.hb_result(hb_i_result)) ;

 //halfband Q filter
hb_filter #(.INBITWIDTH(FILTERBITWIDTH),
			.COEBITWIDTH(COEBITWIDTH),
			.OUTBITWIDTH(MIXBITWIDTH))
		U_HB_Q(	.clk(clk),
				  .rst(rst_m0),
				 .rst_param(rst),
				.config_sync(config_sync),
				.hb_indicator(hb_indicator),
				.hb_param(hb_param),
				.data_in(cic_q_pass_data),
				.data_in_flag(cic_q_pass_flag),//ck 080504 add
				.hb_flag(hb_q_flag),
				.hb_result(hb_q_result)) ;

/* halfband filter result pass controller  */
// halfband filter I pass controller
pass_cntrl #(	.INBITWIDTH(MIXBITWIDTH) ,
			.COEBITWIDTH(COEBITWIDTH),
			.FILTERBITWIDTH(FILTERBITWIDTH) )
	U_HB_I_PASS_CNTRL(	.clk(clk) ,
						.rst(rst_m0) ,
						.rst_param(rst),
						//.nco_pass_flag(nco_pass_flag),
						.pass_flag(hb_pass_flag),
						//.hb_pass_flag(hb_pass_flag),
						.gain_indicator(hbgain_indicator),
						.config_sync(config_sync),
						.gain_param(hbgain_param),
						.dataa(cic_i_pass_data),
						.datab(hb_i_result),
						//.hb_data(hb_i_result),
						.dataa_flag(cic_i_pass_flag),
						.datab_flag(hb_i_flag),
						.data_sel_flag(hb_i_pass_flag),
						.data_sel(hb_i_pass_data),
						.overflow_reg(overflow[4]));

 


 //halfband filter I pass controller
pass_cntrl #(	.INBITWIDTH(MIXBITWIDTH) ,
			.COEBITWIDTH(COEBITWIDTH),
			.FILTERBITWIDTH(FILTERBITWIDTH) )
	U_HB_Q_PASS_CNTRL(	.clk(clk) ,
						.rst(rst_m0) ,
						.rst_param(rst),
						//.nco_pass_flag(nco_pass_flag),
						.pass_flag(hb_pass_flag),
						//.hb_pass_flag(hb_pass_flag),
						.gain_indicator(hbgain_indicator),
						.config_sync(config_sync),
						.gain_param(hbgain_param),
						.dataa(cic_q_pass_data),
						.datab(hb_q_result),
						//.hb_data(hb_q_result),
						.dataa_flag(cic_q_pass_flag),
						.datab_flag(hb_q_flag),
						.data_sel_flag(hb_q_pass_flag),
						.data_sel(hb_q_pass_data),
						.overflow_reg(overflow[5]));








 /*FIR filter instantiation  */
 //FIR I filter instantiation
fir_filter #(	.FILTERBITWIDTH(FILTERBITWIDTH) ,
				.OUTBITWIDTH(FIRBITWIDTH) ,
				.COEBITWIDTH(COEBITWIDTH) )
	U_FIR_I(.clk(clk),
			.rst(rst_m0),
			.rst_param(rst),
			.fir_indicator(fir_indicator),
			.config_sync(config_sync),
			.fir_param(fir_param),
			.cic_pass_flag(cic_pass_flag),
			.hb_pass_flag(hb_pass_flag),
			.data_flag(hb_i_pass_flag),
			.data_in(hb_i_pass_data),
			
			.fir_result(fir_i_result),
			.fir_flag(fir_i_flag) );

// FIR Q filter instantiation
fir_filter #(	.FILTERBITWIDTH(FILTERBITWIDTH) ,
				.OUTBITWIDTH(FIRBITWIDTH) ,
				.COEBITWIDTH(COEBITWIDTH) )
	U_FIR_Q(.clk(clk),
			.rst(rst_m0),
			.rst_param(rst),
			.fir_indicator(fir_indicator),
			.config_sync(config_sync),
			.fir_param(fir_param),
			.cic_pass_flag(cic_pass_flag),
			.hb_pass_flag(hb_pass_flag),
			.data_flag(hb_q_pass_flag),
			.data_in(hb_q_pass_data),
			
			.fir_result(fir_q_result),
			.fir_flag(fir_q_flag) );
			

fir_gain #(			.INBITWIDTH(FIRBITWIDTH),
				.COEBITWIDTH(COEBITWIDTH),
				.MANTBITWIDTH(COEBITWIDTH),
				.EXPBITWIDTH(FILTERBITWIDTH),
				.OUTBITWIDTH(ADBITWIDTH))
	U_FIR_GAIN(	.clk(clk),
			.rst(rst_m0),
			.rst_param(rst),
			.config_sync(config_sync),
			.firgain_indicator(firgain_indicator),
			.firgain_param(firgain_param),
			.dataI_in(fir_i_result),
			.dataI_flag(fir_i_flag),
			.dataQ_in(fir_q_result),
			.dataQ_flag(fir_q_flag),
			.firgain_resultI(firgain_i_result),
			.firgain_resultQ(firgain_q_result),
			.firgain_resultI_flag(firgain_i_flag),
			.firgain_resultQ_flag(firgain_q_flag));


 /*FIR filter result pass controller  */
 //FIR filter I pass controller
fir_pass_cntrl #(	.FILTERBITWIDTH(ADBITWIDTH),
					.INBITWIDTH(FILTERBITWIDTH))
	U_FIR_I_PASS_CNTRL(	.clk(clk),
						.rst(rst_m0),
						.fir_pass_flag(fir_pass_flag),
						.cic_pass_data_flag(hb_i_pass_flag),
						.cic_pass_data(hb_i_pass_data),
						.fir_flag(firgain_i_flag),
						.fir_data(firgain_i_result),
						.data_flag(ddc_flag),
						.data_sel(ddc_i_data));

 //FIR filter Q pass controller
fir_pass_cntrl #(	.FILTERBITWIDTH(ADBITWIDTH),
					.INBITWIDTH(FILTERBITWIDTH))
	U_FIR_Q_PASS_CNTRL(	.clk(clk),
						.rst(rst_m0),
						.fir_pass_flag(fir_pass_flag),
						.cic_pass_data_flag(hb_q_pass_flag),
						.cic_pass_data(hb_q_pass_data),
						.fir_flag(firgain_q_flag),
						.fir_data(firgain_q_result),
						.data_flag(ddc_flag_test),
						.data_sel(ddc_q_data));

// test port connection
	assign nco_sine_test	= nco_sine_buf ;
	assign nco_cosine_test	= nco_cosine_buf ;	
	assign mixer_i_test		= mixer_i_wire ;
	assign mixer_q_test		= mixer_q_wire ;
	assign nco_i_pass_data_test = nco_i_pass_data;
	assign nco_q_pass_data_test = nco_q_pass_data;
	assign hb_i_test		= hb_i_result ;
	assign hb_q_test		= hb_q_result ;
	assign hb_flag			= hb_i_flag ;	
	assign cic_i_test		= cic_i_result ;
	assign cic_q_test		= cic_q_result ;
	assign cic_flag			= cic_i_flag ;
	
	assign fir_i_result_test=fir_i_result;
	assign fir_q_result_test=fir_q_result;
	assign fir_flag=fir_i_flag;




endmodule
