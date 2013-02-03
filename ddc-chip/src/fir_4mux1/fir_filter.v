// File Name: 			fir_filter.v 						//
// Testbench: 										//


`timescale 1ns/1ns

module fir_filter #(parameter 	FILTERBITWIDTH = 18 ,	
								OUTBITWIDTH = 26 ,
								COEBITWIDTH = 16)
				(	input clk,
					input rst,
					input rst_param,
					input fir_indicator,
					input config_sync,
					input signed[COEBITWIDTH - 1:0] fir_param,
					input cic_pass_flag,
					input hb_pass_flag,
					
					input data_flag,
					input signed[FILTERBITWIDTH - 1:0] data_in,

					output reg[OUTBITWIDTH - 1:0] fir_result,
					output reg fir_flag );


	// register and wire declaration
//	reg signed[COEBITWIDTH - 1:0] coeff_reg[32:0] ;
	reg signed[COEBITWIDTH - 1:0] coeff_reg0 ;	
	reg signed[COEBITWIDTH - 1:0] coeff_reg1 ;	
	reg signed[COEBITWIDTH - 1:0] coeff_reg2 ;	
	reg signed[COEBITWIDTH - 1:0] coeff_reg3 ;	
	reg signed[COEBITWIDTH - 1:0] coeff_reg4 ;	
	reg signed[COEBITWIDTH - 1:0] coeff_reg5 ;	
	reg signed[COEBITWIDTH - 1:0] coeff_reg6 ;	
	reg signed[COEBITWIDTH - 1:0] coeff_reg7 ;	
	reg signed[COEBITWIDTH - 1:0] coeff_reg8 ;	
	reg signed[COEBITWIDTH - 1:0] coeff_reg9 ;	
	reg signed[COEBITWIDTH - 1:0] coeff_reg10 ;	
	reg signed[COEBITWIDTH - 1:0] coeff_reg11 ;	
	reg signed[COEBITWIDTH - 1:0] coeff_reg12 ;	
	reg signed[COEBITWIDTH - 1:0] coeff_reg13 ;	
	reg signed[COEBITWIDTH - 1:0] coeff_reg14 ;	
	reg signed[COEBITWIDTH - 1:0] coeff_reg15 ;	
	reg signed[COEBITWIDTH - 1:0] coeff_reg16 ;	
	reg signed[COEBITWIDTH - 1:0] coeff_reg17 ;	
	reg signed[COEBITWIDTH - 1:0] coeff_reg18 ;	
	reg signed[COEBITWIDTH - 1:0] coeff_reg19 ;	
	reg signed[COEBITWIDTH - 1:0] coeff_reg20 ;	
	reg signed[COEBITWIDTH - 1:0] coeff_reg21 ;	
	reg signed[COEBITWIDTH - 1:0] coeff_reg22 ;	
	reg signed[COEBITWIDTH - 1:0] coeff_reg23 ;	
	reg signed[COEBITWIDTH - 1:0] coeff_reg24 ;	
	reg signed[COEBITWIDTH - 1:0] coeff_reg25 ;	
	reg signed[COEBITWIDTH - 1:0] coeff_reg26 ;	
	reg signed[COEBITWIDTH - 1:0] coeff_reg27 ;	
	reg signed[COEBITWIDTH - 1:0] coeff_reg28 ;	
	reg signed[COEBITWIDTH - 1:0] coeff_reg29 ;
	reg signed[COEBITWIDTH - 1:0] coeff_reg30 ;	
	reg signed[COEBITWIDTH - 1:0] coeff_reg31 ;	
	reg signed[COEBITWIDTH - 1:0] coeff_reg32 ;	
	
//	reg signed[COEBITWIDTH - 1:0] coeff[31:0] ;
	reg signed[COEBITWIDTH - 1:0] coeff0;
	reg signed[COEBITWIDTH - 1:0] coeff1;
	reg signed[COEBITWIDTH - 1:0] coeff2;
	reg signed[COEBITWIDTH - 1:0] coeff3;
	reg signed[COEBITWIDTH - 1:0] coeff4;
	reg signed[COEBITWIDTH - 1:0] coeff5;
	reg signed[COEBITWIDTH - 1:0] coeff6;
	reg signed[COEBITWIDTH - 1:0] coeff7;
	reg signed[COEBITWIDTH - 1:0] coeff8;
	reg signed[COEBITWIDTH - 1:0] coeff9; 
	reg signed[COEBITWIDTH - 1:0] coeff10;
	reg signed[COEBITWIDTH - 1:0] coeff11;
	reg signed[COEBITWIDTH - 1:0] coeff12;
	reg signed[COEBITWIDTH - 1:0] coeff13;
	reg signed[COEBITWIDTH - 1:0] coeff14;
	reg signed[COEBITWIDTH - 1:0] coeff15;
	reg signed[COEBITWIDTH - 1:0] coeff16;
	reg signed[COEBITWIDTH - 1:0] coeff17;
	reg signed[COEBITWIDTH - 1:0] coeff18;
	reg signed[COEBITWIDTH - 1:0] coeff19; 
	reg signed[COEBITWIDTH - 1:0] coeff20;
	reg signed[COEBITWIDTH - 1:0] coeff21;
	reg signed[COEBITWIDTH - 1:0] coeff22;
	reg signed[COEBITWIDTH - 1:0] coeff23;
	reg signed[COEBITWIDTH - 1:0] coeff24;
	reg signed[COEBITWIDTH - 1:0] coeff25;
	reg signed[COEBITWIDTH - 1:0] coeff26;
	reg signed[COEBITWIDTH - 1:0] coeff27;
	reg signed[COEBITWIDTH - 1:0] coeff28;
	reg signed[COEBITWIDTH - 1:0] coeff29;
	reg signed[COEBITWIDTH - 1:0] coeff30;
	reg signed[COEBITWIDTH - 1:0] coeff31;
	
//	reg signed[FILTERBITWIDTH - 1:0] shift_reg[63:0] ;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg0;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg1;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg2;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg3;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg4;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg5;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg6;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg7;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg8;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg9;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg10;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg11;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg12;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg13;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg14;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg15;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg16;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg17;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg18;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg19;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg20;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg21;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg22;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg23;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg24;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg25;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg26;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg27;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg28;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg29;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg30;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg31;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg32;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg33;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg34;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg35;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg36;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg37;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg38;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg39;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg40;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg41;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg42;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg43;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg44;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg45;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg46;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg47;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg48;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg49;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg50;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg51;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg52;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg53;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg54;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg55;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg56;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg57;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg58;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg59;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg60;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg61;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg62;
	reg signed[FILTERBITWIDTH - 1:0] shift_reg63;

//	wire signed[COEBITWIDTH - 1:0] coeff_sel[7:0] ;
	wire signed[COEBITWIDTH - 1:0] coeff_sel0 ;
	wire signed[COEBITWIDTH - 1:0] coeff_sel1 ;
	wire signed[COEBITWIDTH - 1:0] coeff_sel2 ;
	wire signed[COEBITWIDTH - 1:0] coeff_sel3 ;
	wire signed[COEBITWIDTH - 1:0] coeff_sel4 ;
	wire signed[COEBITWIDTH - 1:0] coeff_sel5 ;
	wire signed[COEBITWIDTH - 1:0] coeff_sel6 ;
	wire signed[COEBITWIDTH - 1:0] coeff_sel7 ;	
	
//	reg signed[COEBITWIDTH - 1:0] pp_coeff_sel[7:0] ; 
	reg signed[COEBITWIDTH - 1:0] pp_coeff_sel0; 
	reg signed[COEBITWIDTH - 1:0] pp_coeff_sel1; 
	reg signed[COEBITWIDTH - 1:0] pp_coeff_sel2; 
	reg signed[COEBITWIDTH - 1:0] pp_coeff_sel3; 
	reg signed[COEBITWIDTH - 1:0] pp_coeff_sel4; 
	reg signed[COEBITWIDTH - 1:0] pp_coeff_sel5; 
	reg signed[COEBITWIDTH - 1:0] pp_coeff_sel6; 
	reg signed[COEBITWIDTH - 1:0] pp_coeff_sel7; 
	
//	wire signed[FILTERBITWIDTH - 1:0] data_2mux1_0[7:0] ;
	wire signed[FILTERBITWIDTH - 1:0] data_2mux1_00 ;
	wire signed[FILTERBITWIDTH - 1:0] data_2mux1_01 ;
	wire signed[FILTERBITWIDTH - 1:0] data_2mux1_02 ;
	wire signed[FILTERBITWIDTH - 1:0] data_2mux1_03 ;
	wire signed[FILTERBITWIDTH - 1:0] data_2mux1_04 ;
	wire signed[FILTERBITWIDTH - 1:0] data_2mux1_05 ;
	wire signed[FILTERBITWIDTH - 1:0] data_2mux1_06 ;
	wire signed[FILTERBITWIDTH - 1:0] data_2mux1_07 ;
	
//	wire signed[FILTERBITWIDTH - 1:0] data_2mux1_1[7:0] ;
	wire signed[FILTERBITWIDTH - 1:0] data_2mux1_10 ;
	wire signed[FILTERBITWIDTH - 1:0] data_2mux1_11 ;
	wire signed[FILTERBITWIDTH - 1:0] data_2mux1_12 ;
	wire signed[FILTERBITWIDTH - 1:0] data_2mux1_13 ;
	wire signed[FILTERBITWIDTH - 1:0] data_2mux1_14 ;
	wire signed[FILTERBITWIDTH - 1:0] data_2mux1_15 ;
	wire signed[FILTERBITWIDTH - 1:0] data_2mux1_16 ;
	wire signed[FILTERBITWIDTH - 1:0] data_2mux1_17 ;
	
	wire signed[FILTERBITWIDTH :0] symm_add_00_temp ;
	wire signed[FILTERBITWIDTH :0] symm_add_01_temp ;
	wire signed[FILTERBITWIDTH :0] symm_add_02_temp ;
	wire signed[FILTERBITWIDTH :0] symm_add_03_temp ;
	wire signed[FILTERBITWIDTH :0] symm_add_04_temp ;
	wire signed[FILTERBITWIDTH :0] symm_add_05_temp ;
	wire signed[FILTERBITWIDTH :0] symm_add_06_temp ;
	wire signed[FILTERBITWIDTH :0] symm_add_07_temp ;
	                                         
//	wire signed[FILTERBITWIDTH :0] symm_add_1[_temp7:0] ;
	wire signed[FILTERBITWIDTH :0] symm_add_10_temp ;
	wire signed[FILTERBITWIDTH :0] symm_add_11_temp ;
	wire signed[FILTERBITWIDTH :0] symm_add_12_temp ;
	wire signed[FILTERBITWIDTH :0] symm_add_13_temp ;
	wire signed[FILTERBITWIDTH :0] symm_add_14_temp ;
	wire signed[FILTERBITWIDTH :0] symm_add_15_temp ;
	wire signed[FILTERBITWIDTH :0] symm_add_16_temp ;
	wire signed[FILTERBITWIDTH :0] symm_add_17_temp ;	   
	                                         
//	wire signed[FILTERBITWIDTH :0] symm_add_2[_temp7:0] ;
	wire signed[FILTERBITWIDTH :0] symm_add_20_temp ;
	wire signed[FILTERBITWIDTH :0] symm_add_21_temp ;
	wire signed[FILTERBITWIDTH :0] symm_add_22_temp ;
	wire signed[FILTERBITWIDTH :0] symm_add_23_temp ;
	wire signed[FILTERBITWIDTH :0] symm_add_24_temp ;
	wire signed[FILTERBITWIDTH :0] symm_add_25_temp ;
	wire signed[FILTERBITWIDTH :0] symm_add_26_temp ;
	wire signed[FILTERBITWIDTH :0] symm_add_27_temp ;
	                                         
//	wire signed[FILTERBITWIDTH :0] symm_add_3[_temp7:0] ;
	wire signed[FILTERBITWIDTH :0] symm_add_30_temp ;
	wire signed[FILTERBITWIDTH :0] symm_add_31_temp ;
	wire signed[FILTERBITWIDTH :0] symm_add_32_temp ;
	wire signed[FILTERBITWIDTH :0] symm_add_33_temp ;
	wire signed[FILTERBITWIDTH :0] symm_add_34_temp ;
	wire signed[FILTERBITWIDTH :0] symm_add_35_temp ;
	wire signed[FILTERBITWIDTH :0] symm_add_36_temp ;
	wire signed[FILTERBITWIDTH :0] symm_add_37_temp ;
	
//	wire signed[FILTERBITWIDTH - 1:0] symm_add_0[7:0] ;
	wire signed[FILTERBITWIDTH - 1:0] symm_add_00 ;
	wire signed[FILTERBITWIDTH - 1:0] symm_add_01 ;
	wire signed[FILTERBITWIDTH - 1:0] symm_add_02 ;
	wire signed[FILTERBITWIDTH - 1:0] symm_add_03 ;
	wire signed[FILTERBITWIDTH - 1:0] symm_add_04 ;
	wire signed[FILTERBITWIDTH - 1:0] symm_add_05 ;
	wire signed[FILTERBITWIDTH - 1:0] symm_add_06 ;
	wire signed[FILTERBITWIDTH - 1:0] symm_add_07 ;
	   
//	wire signed[FILTERBITWIDTH - 1:0] symm_add_1[7:0] ;
	wire signed[FILTERBITWIDTH - 1:0] symm_add_10 ;
	wire signed[FILTERBITWIDTH - 1:0] symm_add_11 ;
	wire signed[FILTERBITWIDTH - 1:0] symm_add_12 ;
	wire signed[FILTERBITWIDTH - 1:0] symm_add_13 ;
	wire signed[FILTERBITWIDTH - 1:0] symm_add_14 ;
	wire signed[FILTERBITWIDTH - 1:0] symm_add_15 ;
	wire signed[FILTERBITWIDTH - 1:0] symm_add_16 ;
	wire signed[FILTERBITWIDTH - 1:0] symm_add_17 ;	   
	   
//	wire signed[FILTERBITWIDTH - 1:0] symm_add_2[7:0] ;
	wire signed[FILTERBITWIDTH - 1:0] symm_add_20 ;
	wire signed[FILTERBITWIDTH - 1:0] symm_add_21 ;
	wire signed[FILTERBITWIDTH - 1:0] symm_add_22 ;
	wire signed[FILTERBITWIDTH - 1:0] symm_add_23 ;
	wire signed[FILTERBITWIDTH - 1:0] symm_add_24 ;
	wire signed[FILTERBITWIDTH - 1:0] symm_add_25 ;
	wire signed[FILTERBITWIDTH - 1:0] symm_add_26 ;
	wire signed[FILTERBITWIDTH - 1:0] symm_add_27 ;
	   
//	wire signed[FILTERBITWIDTH - 1:0] symm_add_3[7:0] ;
	wire signed[FILTERBITWIDTH - 1:0] symm_add_30 ;
	wire signed[FILTERBITWIDTH - 1:0] symm_add_31 ;
	wire signed[FILTERBITWIDTH - 1:0] symm_add_32 ;
	wire signed[FILTERBITWIDTH - 1:0] symm_add_33 ;
	wire signed[FILTERBITWIDTH - 1:0] symm_add_34 ;
	wire signed[FILTERBITWIDTH - 1:0] symm_add_35 ;
	wire signed[FILTERBITWIDTH - 1:0] symm_add_36 ;
	wire signed[FILTERBITWIDTH - 1:0] symm_add_37 ;
	
//	wire signed[FILTERBITWIDTH - 1:0] data_4mux1[7:0] ;
	wire signed[FILTERBITWIDTH - 1:0] data_4mux10 ;
	wire signed[FILTERBITWIDTH - 1:0] data_4mux11 ;
	wire signed[FILTERBITWIDTH - 1:0] data_4mux12 ;
	wire signed[FILTERBITWIDTH - 1:0] data_4mux13 ;
	wire signed[FILTERBITWIDTH - 1:0] data_4mux14 ;
	wire signed[FILTERBITWIDTH - 1:0] data_4mux15 ;
	wire signed[FILTERBITWIDTH - 1:0] data_4mux16 ;
	wire signed[FILTERBITWIDTH - 1:0] data_4mux17 ;
	
//	reg signed[FILTERBITWIDTH - 1:0] pp_data_4mux1[7:0] ;
	reg signed[FILTERBITWIDTH - 1:0] pp_data_4mux10;
	reg signed[FILTERBITWIDTH - 1:0] pp_data_4mux11;
	reg signed[FILTERBITWIDTH - 1:0] pp_data_4mux12;
	reg signed[FILTERBITWIDTH - 1:0] pp_data_4mux13;
	reg signed[FILTERBITWIDTH - 1:0] pp_data_4mux14;
	reg signed[FILTERBITWIDTH - 1:0] pp_data_4mux15;
	reg signed[FILTERBITWIDTH - 1:0] pp_data_4mux16;
	reg signed[FILTERBITWIDTH - 1:0] pp_data_4mux17;

	reg [7:0] data_flag_buf ;
	reg [1:0] mux_sel ;
	reg [COEBITWIDTH - 1:0] fir_decim_cnt_reg;
	reg [COEBITWIDTH - 1:0] decim_factor_reg ;
	
	reg fir_flag_reg ;

	wire signed[FILTERBITWIDTH + COEBITWIDTH - 1:0] mult_resul_0 ;
	wire signed[FILTERBITWIDTH + COEBITWIDTH - 1:0] mult_resul_1 ;
	wire signed[FILTERBITWIDTH + COEBITWIDTH - 1:0] mult_resul_2 ;
	wire signed[FILTERBITWIDTH + COEBITWIDTH - 1:0] mult_resul_3 ;
	wire signed[FILTERBITWIDTH + COEBITWIDTH - 1:0] mult_resul_4 ;
	wire signed[FILTERBITWIDTH + COEBITWIDTH - 1:0] mult_resul_5 ;
	wire signed[FILTERBITWIDTH + COEBITWIDTH - 1:0] mult_resul_6 ;
	wire signed[FILTERBITWIDTH + COEBITWIDTH - 1:0] mult_resul_7 ;	

	reg signed[FILTERBITWIDTH + COEBITWIDTH - 1:0] pp_mult_0 ;
	reg signed[FILTERBITWIDTH + COEBITWIDTH - 1:0] pp_mult_1 ;
	reg signed[FILTERBITWIDTH + COEBITWIDTH - 1:0] pp_mult_2 ;
	reg signed[FILTERBITWIDTH + COEBITWIDTH - 1:0] pp_mult_3 ;
	reg signed[FILTERBITWIDTH + COEBITWIDTH - 1:0] pp_mult_4 ;
	reg signed[FILTERBITWIDTH + COEBITWIDTH - 1:0] pp_mult_5 ;
	reg signed[FILTERBITWIDTH + COEBITWIDTH - 1:0] pp_mult_6 ;
	reg signed[FILTERBITWIDTH + COEBITWIDTH - 1:0] pp_mult_7 ;

	wire signed[FILTERBITWIDTH + COEBITWIDTH - 1:0] add_0_0 ;
	wire signed[FILTERBITWIDTH + COEBITWIDTH - 1:0] add_0_1 ;
	wire signed[FILTERBITWIDTH + COEBITWIDTH - 1:0] add_0_2 ;
	wire signed[FILTERBITWIDTH + COEBITWIDTH - 1:0] add_0_3 ;
	wire signed[FILTERBITWIDTH + COEBITWIDTH :0] add_1_0 ;
	wire signed[FILTERBITWIDTH + COEBITWIDTH :0] add_1_1 ;
	reg signed[FILTERBITWIDTH + COEBITWIDTH :0] pp_add_1_0 ;
	reg signed[FILTERBITWIDTH + COEBITWIDTH :0] pp_add_1_1 ;
	wire signed[FILTERBITWIDTH + COEBITWIDTH + 1:0] add_2 ;

	reg signed[FILTERBITWIDTH + COEBITWIDTH + 1:0] add_result_buf ;
	reg [OUTBITWIDTH - 1:0] fir_result_reg ;
	
	
	//ck 080331 add
	reg [1:0] mux_sel_delay1,mux_sel_delay2;
	reg signed[FILTERBITWIDTH + COEBITWIDTH - 1:0] add_add_0_0_4_reg,add_add_0_1_4_reg,add_add_0_2_4_reg,add_add_0_3_4_reg;
	reg signed[FILTERBITWIDTH + COEBITWIDTH - 1:0] add_0_0_4_reg,add_0_1_4_reg,add_0_2_4_reg,add_0_3_4_reg;

	integer i;
//	genvar j;
reg data_flag_delay3,data_flag_delay2,data_flag_delay1;

reg fir_order;//0--64;1--32 ck 080507 change


//----------------------------main programme begin here-----------------------------------

//------------------------------------------------
// loading and updating fir filter coefficients //
//------------------------------------------------
// loading......
always @(posedge clk, negedge rst_param )
begin
	if (rst_param == 1'b0)
		begin
			coeff_reg0 <= {COEBITWIDTH{1'b0}} ;
			coeff_reg1 <= {COEBITWIDTH{1'b0}} ;
			coeff_reg2 <= {COEBITWIDTH{1'b0}} ;
			coeff_reg3 <= {COEBITWIDTH{1'b0}} ;
			coeff_reg4 <= {COEBITWIDTH{1'b0}} ;
			coeff_reg5 <= {COEBITWIDTH{1'b0}} ;
			coeff_reg6 <= {COEBITWIDTH{1'b0}} ;
			coeff_reg7 <= {COEBITWIDTH{1'b0}} ;
			coeff_reg8 <= {COEBITWIDTH{1'b0}} ;
			coeff_reg9 <= {COEBITWIDTH{1'b0}} ;
			coeff_reg10 <= {COEBITWIDTH{1'b0}} ;
			coeff_reg11 <= {COEBITWIDTH{1'b0}} ;
			coeff_reg12 <= {COEBITWIDTH{1'b0}} ;
			coeff_reg13 <= {COEBITWIDTH{1'b0}} ;
			coeff_reg14 <= {COEBITWIDTH{1'b0}} ;
			coeff_reg15 <= {COEBITWIDTH{1'b0}} ;
			coeff_reg16 <= {COEBITWIDTH{1'b0}} ;
			coeff_reg17 <= {COEBITWIDTH{1'b0}} ;
			coeff_reg18 <= {COEBITWIDTH{1'b0}} ;
			coeff_reg19 <= {COEBITWIDTH{1'b0}} ;
			coeff_reg20 <= {COEBITWIDTH{1'b0}} ;
			coeff_reg21 <= {COEBITWIDTH{1'b0}} ;
			coeff_reg22 <= {COEBITWIDTH{1'b0}} ;
			coeff_reg23 <= {COEBITWIDTH{1'b0}} ;
			coeff_reg24 <= {COEBITWIDTH{1'b0}} ;
			coeff_reg25 <= {COEBITWIDTH{1'b0}} ;
			coeff_reg26 <= {COEBITWIDTH{1'b0}} ;
			coeff_reg27 <= {COEBITWIDTH{1'b0}} ;
			coeff_reg28 <= {COEBITWIDTH{1'b0}} ;
			coeff_reg29 <= {COEBITWIDTH{1'b0}} ;
			coeff_reg30 <= {COEBITWIDTH{1'b0}} ;
			coeff_reg31 <= {COEBITWIDTH{1'b0}} ;
			coeff_reg32 <= {COEBITWIDTH{1'b0}} ;
//			for(i = 0; i < 33; i = i + 1)
//				coeff_reg[i] <= {COEBITWIDTH{1'b0}} ;
		end
	else
		if (fir_indicator == 1'b1)
			begin
				coeff_reg0 <= fir_param ;
				coeff_reg1 <= coeff_reg0 ;
				coeff_reg2 <= coeff_reg1 ;
				coeff_reg3 <= coeff_reg2 ;
				coeff_reg4 <= coeff_reg3 ;
				coeff_reg5 <= coeff_reg4 ;
				coeff_reg6 <= coeff_reg5 ;
				coeff_reg7 <= coeff_reg6 ;
				coeff_reg8 <= coeff_reg7 ;
				coeff_reg9 <= coeff_reg8 ;
				coeff_reg10 <= coeff_reg9 ;
				coeff_reg11 <= coeff_reg10 ;
				coeff_reg12 <= coeff_reg11 ;
				coeff_reg13 <= coeff_reg12 ;
				coeff_reg14 <= coeff_reg13 ;
				coeff_reg15 <= coeff_reg14 ;
				coeff_reg16 <= coeff_reg15 ;
				coeff_reg17 <= coeff_reg16 ;
				coeff_reg18 <= coeff_reg17 ;
				coeff_reg19 <= coeff_reg18 ;
				coeff_reg20 <= coeff_reg19 ;
				coeff_reg21 <= coeff_reg20 ;
				coeff_reg22 <= coeff_reg21 ;
				coeff_reg23 <= coeff_reg22 ;
				coeff_reg24 <= coeff_reg23 ;
				coeff_reg25 <= coeff_reg24 ;
				coeff_reg26 <= coeff_reg25 ;
				coeff_reg27 <= coeff_reg26 ;
				coeff_reg28 <= coeff_reg27 ;
				coeff_reg29 <= coeff_reg28 ;
				coeff_reg30 <= coeff_reg29 ; 
				coeff_reg31 <= coeff_reg30 ;
				coeff_reg32 <= coeff_reg31 ;
//				coeff_reg[0] <= fir_param ;
//				for(i = 1; i < 33; i = i + 1)
//					coeff_reg[i] <= coeff_reg[i - 1] ;
			end
end
//updating......(coefficient)
always @(posedge clk, negedge rst_param )
begin
	if (rst_param == 1'b0)
		begin
			coeff0 <= {COEBITWIDTH{1'b0}} ;
			coeff1 <= {COEBITWIDTH{1'b0}} ;
			coeff2 <= {COEBITWIDTH{1'b0}} ;
			coeff3 <= {COEBITWIDTH{1'b0}} ;
			coeff4 <= {COEBITWIDTH{1'b0}} ;
			coeff5 <= {COEBITWIDTH{1'b0}} ;
			coeff6 <= {COEBITWIDTH{1'b0}} ;
			coeff7 <= {COEBITWIDTH{1'b0}} ;
			coeff8 <= {COEBITWIDTH{1'b0}} ;
			coeff9 <= {COEBITWIDTH{1'b0}} ;
			coeff10 <= {COEBITWIDTH{1'b0}} ;
			coeff11 <= {COEBITWIDTH{1'b0}} ;
			coeff12 <= {COEBITWIDTH{1'b0}} ;
			coeff13 <= {COEBITWIDTH{1'b0}} ;
			coeff14 <= {COEBITWIDTH{1'b0}} ;
			coeff15 <= {COEBITWIDTH{1'b0}} ;
			coeff16 <= {COEBITWIDTH{1'b0}} ;
			coeff17 <= {COEBITWIDTH{1'b0}} ;
			coeff18 <= {COEBITWIDTH{1'b0}} ;
			coeff19 <= {COEBITWIDTH{1'b0}} ;
			coeff20 <= {COEBITWIDTH{1'b0}} ;
			coeff21 <= {COEBITWIDTH{1'b0}} ;
			coeff22 <= {COEBITWIDTH{1'b0}} ;
			coeff23 <= {COEBITWIDTH{1'b0}} ;
			coeff24 <= {COEBITWIDTH{1'b0}} ;
			coeff25 <= {COEBITWIDTH{1'b0}} ;
			coeff26 <= {COEBITWIDTH{1'b0}} ;
			coeff27 <= {COEBITWIDTH{1'b0}} ;
			coeff28 <= {COEBITWIDTH{1'b0}} ;
			coeff29 <= {COEBITWIDTH{1'b0}} ;
			coeff30 <= {COEBITWIDTH{1'b0}} ;
			coeff31 <= {COEBITWIDTH{1'b0}} ;
//			for(i = 0; i < 32; i = i + 1)
//				coeff[i] <= {COEBITWIDTH{1'b0}} ;
		end
	else
		if (config_sync == 1'b1)
			begin
				coeff0 <= coeff_reg31 ;
				coeff1 <= coeff_reg30 ;
				coeff2 <= coeff_reg29 ;
				coeff3 <= coeff_reg28 ;
				coeff4 <= coeff_reg27 ;
				coeff5 <= coeff_reg26 ;
				coeff6 <= coeff_reg25 ;
				coeff7 <= coeff_reg24 ;
				coeff8 <= coeff_reg23 ;
				coeff9 <= coeff_reg22 ;
				coeff10 <= coeff_reg21 ;
				coeff11 <= coeff_reg20 ;
				coeff12 <= coeff_reg19 ;
				coeff13 <= coeff_reg18 ;
				coeff14 <= coeff_reg17 ;
				coeff15 <= coeff_reg16 ;
				coeff16 <= coeff_reg15 ;
				coeff17 <= coeff_reg14 ;
				coeff18 <= coeff_reg13 ;
				coeff19 <= coeff_reg12 ;
				coeff20 <= coeff_reg11 ;
				coeff21 <= coeff_reg10 ;
				coeff22 <= coeff_reg9 ;
				coeff23 <= coeff_reg8 ;
				coeff24 <= coeff_reg7 ;
				coeff25 <= coeff_reg6 ;
				coeff26 <= coeff_reg5 ;
				coeff27 <= coeff_reg4 ;
				coeff28 <= coeff_reg3 ;
				coeff29 <= coeff_reg2 ;
				coeff30 <= coeff_reg1 ;
				coeff31 <= coeff_reg0 ;
//				for(i = 0; i < 32; i = i + 1)
//					coeff[i] <= coeff_reg[31 - i] ;
			end
end
//updating......(decimation factor)
always @(posedge clk, negedge rst_param )
begin
	if (rst_param == 1'b0)
		begin
		decim_factor_reg <= {COEBITWIDTH{1'b0}} ;
		fir_order<=1'b0;
		end
		
	else
		if (config_sync == 1'b1)
		begin
			decim_factor_reg <= {8'b0,coeff_reg32[7:0]};
			fir_order<=coeff_reg32[8];	
			end
end

//----------------------------------------
// fir filter control signal generation //
//----------------------------------------

// buffer input data flag
always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		data_flag_buf	<= {8{1'b0}} ;
	else
		begin
			data_flag_buf[0]	<= data_flag ;
			data_flag_buf[7:1]	<= data_flag_buf[6:0] ;
		end
end

// 4-mux-1 control signal 
always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		mux_sel[1:0] <= 2'b00;
	else
		begin
			if (fir_order==1'b1)//(hb_pass_flag == 1'b0 & cic_pass_flag == 1'b1) ck080507 change
				//mux_sel[1:0] <= {1'b0, ~data_flag} ;//ck 080403 change data_flag->~data_flag for line 1129 working correctly for hb-fir 32 order
			begin
						if (data_flag == 1'b1)
							mux_sel[1:0]	<= 2'b00 ;
						else if (data_flag_buf[0] == 1'b1)
							mux_sel[1:0]<= 2'b01 ;
						else
							mux_sel[1:0]<= 2'b00 ;
					end
			
			else 
				if (fir_order==1'b0)//(hb_pass_flag == 1'b1 & cic_pass_flag == 1'b0) ck080507 change
					begin
						if (data_flag == 1'b1)
							mux_sel[1:0]	<= 2'b00 ;
						else if (data_flag_buf[0] == 1'b1)
							mux_sel[1:0]<= 2'b01 ;
						else if (data_flag_buf[1] == 1'b1)
							mux_sel[1:0]<= 2'b10 ;
						else if (data_flag_buf[2] == 1'b1)
							mux_sel[1:0]<= 2'b11 ;
						else
							mux_sel[1:0]<= 2'b00 ;
					end
					else
					mux_sel[1:0]<= 2'b00 ;
		end
end

//---------------------------------------
// fir filter shift register selection //
//---------------------------------------
// shifting register
always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0) 
		begin 
			shift_reg0 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg1 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg2 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg3 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg4 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg5 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg6 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg7 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg8 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg9 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg10 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg11 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg12 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg13 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg14 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg15 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg16 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg17 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg18 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg19 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg20 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg21 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg22 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg23 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg24 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg25 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg26 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg27 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg28 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg29 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg30 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg31 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg32 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg33 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg34 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg35 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg36 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg37 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg38 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg39 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg40 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg41 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg42 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg43 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg44 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg45 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg46 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg47 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg48 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg49 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg50 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg51 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg52 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg53 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg54 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg55 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg56 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg57 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg58 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg59 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg60 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg61 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg62 <= {FILTERBITWIDTH{1'b0}} ;
			shift_reg63 <= {FILTERBITWIDTH{1'b0}} ;
		end
//		for(i = 0; i < 64; i = i + 1)
//			shift_reg[i] <= {FILTERBITWIDTH{1'b0}} ;
	else
		if (data_flag == 1'b1)
			begin
				shift_reg0 <= data_in;
				shift_reg1 <= shift_reg0;
				shift_reg2 <= shift_reg1;
				shift_reg3 <= shift_reg2;
				shift_reg4 <= shift_reg3;
				shift_reg5 <= shift_reg4;
				shift_reg6 <= shift_reg5;
				shift_reg7 <= shift_reg6;
				shift_reg8 <= shift_reg7;
				shift_reg9 <= shift_reg8;
				shift_reg10 <= shift_reg9;
				shift_reg11 <= shift_reg10;
				shift_reg12 <= shift_reg11;
				shift_reg13 <= shift_reg12;
				shift_reg14 <= shift_reg13;
				shift_reg15 <= shift_reg14;
				shift_reg16 <= shift_reg15;
				shift_reg17 <= shift_reg16;
				shift_reg18 <= shift_reg17;
				shift_reg19 <= shift_reg18;
				shift_reg20 <= shift_reg19;
				shift_reg21 <= shift_reg20;
				shift_reg22 <= shift_reg21;
				shift_reg23 <= shift_reg22;
				shift_reg24 <= shift_reg23;
				shift_reg25 <= shift_reg24;
				shift_reg26 <= shift_reg25;
				shift_reg27 <= shift_reg26;
				shift_reg28 <= shift_reg27;
				shift_reg29 <= shift_reg28;
				shift_reg30 <= shift_reg29;
				shift_reg31 <= shift_reg30;
				shift_reg32 <= shift_reg31;
				shift_reg33 <= shift_reg32;
				shift_reg34 <= shift_reg33;
				shift_reg35 <= shift_reg34;
				shift_reg36 <= shift_reg35;
				shift_reg37 <= shift_reg36;
				shift_reg38 <= shift_reg37;
				shift_reg39 <= shift_reg38;
				shift_reg40 <= shift_reg39;
				shift_reg41 <= shift_reg40;
				shift_reg42 <= shift_reg41;
				shift_reg43 <= shift_reg42;
				shift_reg44 <= shift_reg43;
				shift_reg45 <= shift_reg44;
				shift_reg46 <= shift_reg45;
				shift_reg47 <= shift_reg46;
				shift_reg48 <= shift_reg47;
				shift_reg49 <= shift_reg48;
				shift_reg50 <= shift_reg49;
				shift_reg51 <= shift_reg50;
				shift_reg52 <= shift_reg51;
				shift_reg53 <= shift_reg52;
				shift_reg54 <= shift_reg53;
				shift_reg55 <= shift_reg54;
				shift_reg56 <= shift_reg55;
				shift_reg57 <= shift_reg56;
				shift_reg58 <= shift_reg57;
				shift_reg59 <= shift_reg58;
				shift_reg60 <= shift_reg59;
				shift_reg61 <= shift_reg60;
				shift_reg62 <= shift_reg61;
				shift_reg63 <= shift_reg62;
//			shift_reg[0] <= data_in;
//			for(i = 1; i < 64; i = i + 1)
//				shift_reg[i] <= shift_reg[i - 1];
		end
end

// 2-mux-1
//generate 
//	for(j = 0; j < 8; j = j + 1)
//		begin : fir_2mux1_sreg0
//			fir_2mux1 #(.FILTERBITWIDTH(FILTERBITWIDTH))
//			U_2MUX1_SREG0(	.mux_sel(cic_pass_flag) ,
//							.dataa(shift_reg[63 - j]) ,
//							.datab(shift_reg[31 - j]) ,
//							.data_sel(data_2mux1_0[j]) );
//		end
//endgenerate

fir_2mux1 #(.FILTERBITWIDTH(FILTERBITWIDTH))
	U_2MUX1_SREG00(	.mux_sel(fir_order) ,
					.dataa(shift_reg63) ,
					.datab(shift_reg31) ,
					.data_sel(data_2mux1_00) );

fir_2mux1 #(.FILTERBITWIDTH(FILTERBITWIDTH))
	U_2MUX1_SREG01(	.mux_sel(fir_order) ,
					.dataa(shift_reg62) ,
					.datab(shift_reg30) ,
					.data_sel(data_2mux1_01) );

fir_2mux1 #(.FILTERBITWIDTH(FILTERBITWIDTH))
	U_2MUX1_SREG02(	.mux_sel(fir_order) ,
					.dataa(shift_reg61) ,
					.datab(shift_reg29) ,
					.data_sel(data_2mux1_02) );

fir_2mux1 #(.FILTERBITWIDTH(FILTERBITWIDTH))
	U_2MUX1_SREG03(	.mux_sel(fir_order) ,
					.dataa(shift_reg60) ,
					.datab(shift_reg28) ,
					.data_sel(data_2mux1_03) );

fir_2mux1 #(.FILTERBITWIDTH(FILTERBITWIDTH))
	U_2MUX1_SREG04(	.mux_sel(fir_order) ,
					.dataa(shift_reg59) ,
					.datab(shift_reg27) ,
					.data_sel(data_2mux1_04) );

fir_2mux1 #(.FILTERBITWIDTH(FILTERBITWIDTH))
	U_2MUX1_SREG05(	.mux_sel(fir_order) ,
					.dataa(shift_reg58) ,
					.datab(shift_reg26) ,
					.data_sel(data_2mux1_05) );

fir_2mux1 #(.FILTERBITWIDTH(FILTERBITWIDTH))
	U_2MUX1_SREG06(	.mux_sel(fir_order) ,
					.dataa(shift_reg57) ,
					.datab(shift_reg25) ,
					.data_sel(data_2mux1_06) );

fir_2mux1 #(.FILTERBITWIDTH(FILTERBITWIDTH))
	U_2MUX1_SREG07(	.mux_sel(fir_order) ,
					.dataa(shift_reg56) ,
					.datab(shift_reg24) ,
					.data_sel(data_2mux1_07) );
// 2-mux-1
//generate 
//	for(j = 0; j < 8; j = j + 1)
//		begin : fir_2mux1_sreg1
//			fir_2mux1 #(.FILTERBITWIDTH(FILTERBITWIDTH))
//			U_2MUX1_SREG1(	.mux_sel(cic_pass_flag) ,
//							.dataa(shift_reg[55 - j]) ,
//							.datab(shift_reg[23 - j]) ,
//							.data_sel(data_2mux1_1[j]) );
//		end 
//endgenerate

fir_2mux1 #(.FILTERBITWIDTH(FILTERBITWIDTH))
	U_2MUX1_SREG10(	.mux_sel(fir_order) ,
					.dataa(shift_reg55) ,
					.datab(shift_reg23) ,
					.data_sel(data_2mux1_10) );

fir_2mux1 #(.FILTERBITWIDTH(FILTERBITWIDTH))
	U_2MUX1_SREG11(	.mux_sel(fir_order) ,
					.dataa(shift_reg54) ,
					.datab(shift_reg22) ,
					.data_sel(data_2mux1_11) );

fir_2mux1 #(.FILTERBITWIDTH(FILTERBITWIDTH))
	U_2MUX1_SREG12(	.mux_sel(fir_order) ,
					.dataa(shift_reg53) ,
					.datab(shift_reg21) ,
					.data_sel(data_2mux1_12) );

fir_2mux1 #(.FILTERBITWIDTH(FILTERBITWIDTH))
	U_2MUX1_SREG13(	.mux_sel(fir_order) ,
					.dataa(shift_reg52) ,
					.datab(shift_reg20) ,
					.data_sel(data_2mux1_13) );

fir_2mux1 #(.FILTERBITWIDTH(FILTERBITWIDTH))
	U_2MUX1_SREG14(	.mux_sel(fir_order) ,
					.dataa(shift_reg51) ,
					.datab(shift_reg19) ,
					.data_sel(data_2mux1_14) );

fir_2mux1 #(.FILTERBITWIDTH(FILTERBITWIDTH))
	U_2MUX1_SREG15(	.mux_sel(fir_order) ,
					.dataa(shift_reg50) ,
					.datab(shift_reg18) ,
					.data_sel(data_2mux1_15) );

fir_2mux1 #(.FILTERBITWIDTH(FILTERBITWIDTH))
	U_2MUX1_SREG16(	.mux_sel(fir_order) ,
					.dataa(shift_reg49) ,
					.datab(shift_reg17) ,
					.data_sel(data_2mux1_16) );

fir_2mux1 #(.FILTERBITWIDTH(FILTERBITWIDTH))
	U_2MUX1_SREG17(	.mux_sel(fir_order) ,
					.dataa(shift_reg48) ,
					.datab(shift_reg16) ,
					.data_sel(data_2mux1_17) );

// symmetric fir filter shift register summation stage

assign symm_add_00_temp = shift_reg0 + data_2mux1_00 ;
assign symm_add_01_temp = shift_reg1 + data_2mux1_01 ;
assign symm_add_02_temp = shift_reg2 + data_2mux1_02 ;
assign symm_add_03_temp = shift_reg3 + data_2mux1_03 ;
assign symm_add_04_temp = shift_reg4 + data_2mux1_04 ;
assign symm_add_05_temp = shift_reg5 + data_2mux1_05 ;
assign symm_add_06_temp = shift_reg6 + data_2mux1_06 ;
assign symm_add_07_temp = shift_reg7 + data_2mux1_07 ;
                  
assign symm_add_10_temp = shift_reg8 + data_2mux1_10 ;
assign symm_add_11_temp = shift_reg9 + data_2mux1_11 ;
assign symm_add_12_temp = shift_reg10 + data_2mux1_12 ;
assign symm_add_13_temp = shift_reg11 + data_2mux1_13 ;
assign symm_add_14_temp = shift_reg12 + data_2mux1_14 ;
assign symm_add_15_temp = shift_reg13 + data_2mux1_15 ;
assign symm_add_16_temp = shift_reg14 + data_2mux1_16 ;
assign symm_add_17_temp = shift_reg15 + data_2mux1_17 ;
                  
assign symm_add_20_temp = shift_reg16 + shift_reg47 ;
assign symm_add_21_temp = shift_reg17 + shift_reg46 ;
assign symm_add_22_temp = shift_reg18 + shift_reg45 ;
assign symm_add_23_temp = shift_reg19 + shift_reg44 ;
assign symm_add_24_temp = shift_reg20 + shift_reg43 ;
assign symm_add_25_temp = shift_reg21 + shift_reg42 ;
assign symm_add_26_temp = shift_reg22 + shift_reg41 ;
assign symm_add_27_temp = shift_reg23 + shift_reg40 ;
                  
assign symm_add_30_temp = shift_reg24 + shift_reg39;
assign symm_add_31_temp = shift_reg25 + shift_reg38;
assign symm_add_32_temp = shift_reg26 + shift_reg37;
assign symm_add_33_temp = shift_reg27 + shift_reg36;
assign symm_add_34_temp = shift_reg28 + shift_reg35;
assign symm_add_35_temp = shift_reg29 + shift_reg34;
assign symm_add_36_temp = shift_reg30 + shift_reg33;
assign symm_add_37_temp = shift_reg31 + shift_reg32;

assign symm_add_00 = symm_add_00_temp[FILTERBITWIDTH : 1] + symm_add_00_temp[0];
assign symm_add_01 = symm_add_01_temp[FILTERBITWIDTH : 1] + symm_add_01_temp[0];
assign symm_add_02 = symm_add_02_temp[FILTERBITWIDTH : 1] + symm_add_02_temp[0];
assign symm_add_03 = symm_add_03_temp[FILTERBITWIDTH : 1] + symm_add_03_temp[0];
assign symm_add_04 = symm_add_04_temp[FILTERBITWIDTH : 1] + symm_add_04_temp[0];
assign symm_add_05 = symm_add_05_temp[FILTERBITWIDTH : 1] + symm_add_05_temp[0];
assign symm_add_06 = symm_add_06_temp[FILTERBITWIDTH : 1] + symm_add_06_temp[0];
assign symm_add_07 = symm_add_07_temp[FILTERBITWIDTH : 1] + symm_add_07_temp[0];

assign symm_add_10 = symm_add_10_temp[FILTERBITWIDTH : 1] + symm_add_10_temp[0];
assign symm_add_11 = symm_add_11_temp[FILTERBITWIDTH : 1] + symm_add_11_temp[0];
assign symm_add_12 = symm_add_12_temp[FILTERBITWIDTH : 1] + symm_add_12_temp[0];
assign symm_add_13 = symm_add_13_temp[FILTERBITWIDTH : 1] + symm_add_13_temp[0];
assign symm_add_14 = symm_add_14_temp[FILTERBITWIDTH : 1] + symm_add_14_temp[0];
assign symm_add_15 = symm_add_15_temp[FILTERBITWIDTH : 1] + symm_add_15_temp[0];
assign symm_add_16 = symm_add_16_temp[FILTERBITWIDTH : 1] + symm_add_16_temp[0];
assign symm_add_17 = symm_add_17_temp[FILTERBITWIDTH : 1] + symm_add_17_temp[0];

assign symm_add_20 = symm_add_20_temp[FILTERBITWIDTH : 1] + symm_add_20_temp[0];
assign symm_add_21 = symm_add_21_temp[FILTERBITWIDTH : 1] + symm_add_21_temp[0];
assign symm_add_22 = symm_add_22_temp[FILTERBITWIDTH : 1] + symm_add_22_temp[0];
assign symm_add_23 = symm_add_23_temp[FILTERBITWIDTH : 1] + symm_add_23_temp[0];
assign symm_add_24 = symm_add_24_temp[FILTERBITWIDTH : 1] + symm_add_24_temp[0];
assign symm_add_25 = symm_add_25_temp[FILTERBITWIDTH : 1] + symm_add_25_temp[0];
assign symm_add_26 = symm_add_26_temp[FILTERBITWIDTH : 1] + symm_add_26_temp[0];
assign symm_add_27 = symm_add_27_temp[FILTERBITWIDTH : 1] + symm_add_27_temp[0];

assign symm_add_30 = symm_add_30_temp[FILTERBITWIDTH : 1] + symm_add_30_temp[0];
assign symm_add_31 = symm_add_31_temp[FILTERBITWIDTH : 1] + symm_add_31_temp[0];
assign symm_add_32 = symm_add_32_temp[FILTERBITWIDTH : 1] + symm_add_32_temp[0];
assign symm_add_33 = symm_add_33_temp[FILTERBITWIDTH : 1] + symm_add_33_temp[0];
assign symm_add_34 = symm_add_34_temp[FILTERBITWIDTH : 1] + symm_add_34_temp[0];
assign symm_add_35 = symm_add_35_temp[FILTERBITWIDTH : 1] + symm_add_35_temp[0];
assign symm_add_36 = symm_add_36_temp[FILTERBITWIDTH : 1] + symm_add_36_temp[0];
assign symm_add_37 = symm_add_37_temp[FILTERBITWIDTH : 1] + symm_add_37_temp[0];
                                      
                                      
// shift register 4-mux-1             FILTERBITWIDTH :
//generate
//	for(j = 0; j < 8; j = j + 1)
//		begin: fir_4mux1_sreg
//			fir_4mux1 # (.FILTERBITWIDTH(FILTERBITWIDTH))
//			U_4MUX1_SREG(	.mux_sel(mux_sel),
//							.dataa(symm_add_0[j]),
//							.datab(symm_add_1[j]),
//							.datac(symm_add_2[j]),
//							.datad(symm_add_3[j]),
//							.data_sel(data_4mux1[j]));
//		end 
//endgenerate 

fir_4mux1 # (.FILTERBITWIDTH(FILTERBITWIDTH))
	U_4MUX1_SREG0(	.mux_sel(mux_sel),
					.dataa(symm_add_00),
					.datab(symm_add_10),
					.datac(symm_add_20),
					.datad(symm_add_30),
					.data_sel(data_4mux10));

fir_4mux1 # (.FILTERBITWIDTH(FILTERBITWIDTH))
	U_4MUX1_SREG1(	.mux_sel(mux_sel),
					.dataa(symm_add_01),
					.datab(symm_add_11),
					.datac(symm_add_21),
					.datad(symm_add_31),
					.data_sel(data_4mux11));

fir_4mux1 # (.FILTERBITWIDTH(FILTERBITWIDTH))
	U_4MUX1_SREG2(	.mux_sel(mux_sel),
					.dataa(symm_add_02),
					.datab(symm_add_12),
					.datac(symm_add_22),
					.datad(symm_add_32),
					.data_sel(data_4mux12));

fir_4mux1 # (.FILTERBITWIDTH(FILTERBITWIDTH))
	U_4MUX1_SREG3(	.mux_sel(mux_sel),
					.dataa(symm_add_03),
					.datab(symm_add_13),
					.datac(symm_add_23),
					.datad(symm_add_33),
					.data_sel(data_4mux13));

fir_4mux1 # (.FILTERBITWIDTH(FILTERBITWIDTH))
	U_4MUX1_SREG4(	.mux_sel(mux_sel),
					.dataa(symm_add_04),
					.datab(symm_add_14),
					.datac(symm_add_24),
					.datad(symm_add_34),
					.data_sel(data_4mux14));

fir_4mux1 # (.FILTERBITWIDTH(FILTERBITWIDTH))
	U_4MUX1_SREG5(	.mux_sel(mux_sel),
					.dataa(symm_add_05),
					.datab(symm_add_15),
					.datac(symm_add_25),
					.datad(symm_add_35),
					.data_sel(data_4mux15));

fir_4mux1 # (.FILTERBITWIDTH(FILTERBITWIDTH))
	U_4MUX1_SREG6(	.mux_sel(mux_sel),
					.dataa(symm_add_06),
					.datab(symm_add_16),
					.datac(symm_add_26),
					.datad(symm_add_36),
					.data_sel(data_4mux16));

fir_4mux1 # (.FILTERBITWIDTH(FILTERBITWIDTH))
	U_4MUX1_SREG7(	.mux_sel(mux_sel),
					.dataa(symm_add_07),
					.datab(symm_add_17),
					.datac(symm_add_27),
					.datad(symm_add_37),
					.data_sel(data_4mux17));


// pipeline 4mux1 result
always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		begin
			pp_data_4mux10 <= {FILTERBITWIDTH{1'b0}} ;
			pp_data_4mux11 <= {FILTERBITWIDTH{1'b0}} ;
			pp_data_4mux12 <= {FILTERBITWIDTH{1'b0}} ;
			pp_data_4mux13 <= {FILTERBITWIDTH{1'b0}} ;
			pp_data_4mux14 <= {FILTERBITWIDTH{1'b0}} ;
			pp_data_4mux15 <= {FILTERBITWIDTH{1'b0}} ;
			pp_data_4mux16 <= {FILTERBITWIDTH{1'b0}} ;
			pp_data_4mux17 <= {FILTERBITWIDTH{1'b0}} ;
		end
	else
		begin
			pp_data_4mux10 <= data_4mux10 ;
			pp_data_4mux11 <= data_4mux11 ;
			pp_data_4mux12 <= data_4mux12 ;
			pp_data_4mux13 <= data_4mux13 ;
			pp_data_4mux14 <= data_4mux14 ;
			pp_data_4mux15 <= data_4mux15 ;
			pp_data_4mux16 <= data_4mux16 ;
			pp_data_4mux17 <= data_4mux17 ;
		end
end


/* fir coefficient 4-mux-1*/
//generate
//	for(j = 0; j < 8; j = j + 1)
//		begin: mux_4sel1_coeff
//			fir_4mux1 # (.FILTERBITWIDTH(COEBITWIDTH))
//			U_4MUX1_COEFF(	.mux_sel(mux_sel),
//							.dataa(coeff[j]),
//							.datab(coeff[j + 8]),
//							.datac(coeff[j + 16]),
//							.datad(coeff[j + 24]),
//							.data_sel(coeff_sel[j]) );
//		end 
//endgenerate

fir_4mux1 # (.FILTERBITWIDTH(COEBITWIDTH))
	U_4MUX1_COEFF0(	.mux_sel(mux_sel),
					.dataa(coeff0),
					.datab(coeff8),
					.datac(coeff16),
					.datad(coeff24),
					.data_sel(coeff_sel0) );

fir_4mux1 # (.FILTERBITWIDTH(COEBITWIDTH))
	U_4MUX1_COEFF1(	.mux_sel(mux_sel),
					.dataa(coeff1),
					.datab(coeff9),
					.datac(coeff17),
					.datad(coeff25),
					.data_sel(coeff_sel1) );

fir_4mux1 # (.FILTERBITWIDTH(COEBITWIDTH))
	U_4MUX1_COEFF2(	.mux_sel(mux_sel),
					.dataa(coeff2),
					.datab(coeff10),
					.datac(coeff18),
					.datad(coeff26),
					.data_sel(coeff_sel2) );

fir_4mux1 # (.FILTERBITWIDTH(COEBITWIDTH))
	U_4MUX1_COEFF3(	.mux_sel(mux_sel),
					.dataa(coeff3),
					.datab(coeff11),
					.datac(coeff19),
					.datad(coeff27),
					.data_sel(coeff_sel3) );

fir_4mux1 # (.FILTERBITWIDTH(COEBITWIDTH))
	U_4MUX1_COEFF4(	.mux_sel(mux_sel),
					.dataa(coeff4),
					.datab(coeff12),
					.datac(coeff20),
					.datad(coeff28),
					.data_sel(coeff_sel4) );

fir_4mux1 # (.FILTERBITWIDTH(COEBITWIDTH))
	U_4MUX1_COEFF5(	.mux_sel(mux_sel),
					.dataa(coeff5),
					.datab(coeff13),
					.datac(coeff21),
					.datad(coeff29),
					.data_sel(coeff_sel5) );

fir_4mux1 # (.FILTERBITWIDTH(COEBITWIDTH))
	U_4MUX1_COEFF6(	.mux_sel(mux_sel),
					.dataa(coeff6),
					.datab(coeff14),
					.datac(coeff22),
					.datad(coeff30),
					.data_sel(coeff_sel6) );

fir_4mux1 # (.FILTERBITWIDTH(COEBITWIDTH))
	U_4MUX1_COEFF7(	.mux_sel(mux_sel),
					.dataa(coeff7),
					.datab(coeff15),
					.datac(coeff23),
					.datad(coeff31),
					.data_sel(coeff_sel7) );



// pipeline coefficient 4mux1 result
always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		begin
			pp_coeff_sel0 <= {COEBITWIDTH{1'b0}} ;
			pp_coeff_sel1 <= {COEBITWIDTH{1'b0}} ;
			pp_coeff_sel2 <= {COEBITWIDTH{1'b0}} ;
			pp_coeff_sel3 <= {COEBITWIDTH{1'b0}} ;
			pp_coeff_sel4 <= {COEBITWIDTH{1'b0}} ;
			pp_coeff_sel5 <= {COEBITWIDTH{1'b0}} ;
			pp_coeff_sel6 <= {COEBITWIDTH{1'b0}} ;
			pp_coeff_sel7 <= {COEBITWIDTH{1'b0}} ;
		end
	else
		begin
			pp_coeff_sel0 <= coeff_sel0 ;
			pp_coeff_sel1 <= coeff_sel1 ;
			pp_coeff_sel2 <= coeff_sel2 ;
			pp_coeff_sel3 <= coeff_sel3 ;
			pp_coeff_sel4 <= coeff_sel4 ;
			pp_coeff_sel5 <= coeff_sel5 ;
			pp_coeff_sel6 <= coeff_sel6 ;
			pp_coeff_sel7 <= coeff_sel7 ;
		end
end 

//-------------------
// multiply stages //
//-------------------
//multiply
assign mult_resul_0 = pp_data_4mux10 * pp_coeff_sel0 ;
assign mult_resul_1 = pp_data_4mux11 * pp_coeff_sel1 ;
assign mult_resul_2 = pp_data_4mux12 * pp_coeff_sel2 ;
assign mult_resul_3 = pp_data_4mux13 * pp_coeff_sel3 ;
assign mult_resul_4 = pp_data_4mux14 * pp_coeff_sel4 ;
assign mult_resul_5 = pp_data_4mux15 * pp_coeff_sel5 ;
assign mult_resul_6 = pp_data_4mux16 * pp_coeff_sel6 ;
assign mult_resul_7 = pp_data_4mux17 * pp_coeff_sel7 ;
// pipeline multiply result
always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		begin
			pp_mult_0	<= {(FILTERBITWIDTH + COEBITWIDTH){1'b0}} ;
			pp_mult_1	<= {(FILTERBITWIDTH + COEBITWIDTH){1'b0}} ;
			pp_mult_2	<= {(FILTERBITWIDTH + COEBITWIDTH){1'b0}} ;
			pp_mult_3	<= {(FILTERBITWIDTH + COEBITWIDTH){1'b0}} ;
			pp_mult_4	<= {(FILTERBITWIDTH + COEBITWIDTH){1'b0}} ;
			pp_mult_5	<= {(FILTERBITWIDTH + COEBITWIDTH){1'b0}} ;
			pp_mult_6	<= {(FILTERBITWIDTH + COEBITWIDTH){1'b0}} ;
			pp_mult_7	<= {(FILTERBITWIDTH + COEBITWIDTH){1'b0}} ;
		end
	else
		begin
			pp_mult_0	<= mult_resul_0 ;
			pp_mult_1	<= mult_resul_1 ;
			pp_mult_2	<= mult_resul_2 ;
			pp_mult_3	<= mult_resul_3 ;
			pp_mult_4	<= mult_resul_4 ;
			pp_mult_5	<= mult_resul_5 ;
			pp_mult_6	<= mult_resul_6 ;
			pp_mult_7	<= mult_resul_7 ;
		end
end



//----------------
// adder stages //
//----------------
// stage 0
assign add_0_0 = pp_mult_0 + pp_mult_1 ;
assign add_0_1 = pp_mult_2 + pp_mult_3 ;
assign add_0_2 = pp_mult_4 + pp_mult_5 ;
assign add_0_3 = pp_mult_6 + pp_mult_7 ;
//CK 080331 add


always @(posedge clk,negedge rst)
if(!rst)
begin
mux_sel_delay1<=2'b00;
mux_sel_delay2<=2'b00;
end
else
begin
mux_sel_delay1<=mux_sel;
mux_sel_delay2<=mux_sel_delay1;
end

always @(posedge clk,negedge rst)
if(!rst)
begin
data_flag_delay1<=0;
data_flag_delay2<=0;
data_flag_delay3<=0;
end
else
begin
data_flag_delay1<=data_flag;
data_flag_delay2<=data_flag_delay1;
data_flag_delay3<=data_flag_delay2;
end



always @(posedge clk,negedge rst)
if(!rst)
begin
add_add_0_0_4_reg<= {(FILTERBITWIDTH + COEBITWIDTH){1'b0}};
add_add_0_1_4_reg<= {(FILTERBITWIDTH + COEBITWIDTH){1'b0}};
add_add_0_2_4_reg<= {(FILTERBITWIDTH + COEBITWIDTH){1'b0}};
add_add_0_3_4_reg<= {(FILTERBITWIDTH + COEBITWIDTH){1'b0}};
end
else
if(mux_sel_delay2==2'b00 && data_flag_delay3==1'b1)
begin
add_0_0_4_reg<=add_add_0_0_4_reg;
add_add_0_0_4_reg<=add_0_0;
add_0_1_4_reg<=add_add_0_1_4_reg;
add_add_0_1_4_reg<=add_0_1;
add_0_2_4_reg<=add_add_0_2_4_reg;
add_add_0_2_4_reg<=add_0_2;
add_0_3_4_reg<=add_add_0_3_4_reg;
add_add_0_3_4_reg<=add_0_3;
end
else if(mux_sel_delay2==2'b00)
begin
add_add_0_0_4_reg<=add_add_0_0_4_reg;
add_add_0_1_4_reg<=add_add_0_1_4_reg;
add_add_0_2_4_reg<=add_add_0_2_4_reg;
add_add_0_3_4_reg<=add_add_0_3_4_reg;
end
else
begin
add_add_0_0_4_reg<=add_add_0_0_4_reg+add_0_0;
add_add_0_1_4_reg<=add_add_0_1_4_reg+add_0_1;
add_add_0_2_4_reg<=add_add_0_2_4_reg+add_0_2;
add_add_0_3_4_reg<=add_add_0_3_4_reg+add_0_3;
end



//end of CK add
// stage 1
assign add_1_0 = add_0_0_4_reg + add_0_1_4_reg ;
assign add_1_1 = add_0_2_4_reg + add_0_3_4_reg ;
// pipeline stage 1 adder
always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		begin
			pp_add_1_0 <= {(FILTERBITWIDTH + COEBITWIDTH){1'b0}} ;
			pp_add_1_1 <= {(FILTERBITWIDTH + COEBITWIDTH){1'b0}} ;
		end
	else
		begin
			pp_add_1_0 <= add_1_0 ;
			pp_add_1_1 <= add_1_1 ;
		end
end
// stage 2
assign add_2 = pp_add_1_0 + pp_add_1_1 ;
// pipeline adder result
always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		add_result_buf	<= {(FILTERBITWIDTH + COEBITWIDTH){1'b0}} ;
	else
		add_result_buf	<= add_2;
end

//----------------------------
// FIR filter result output //
//----------------------------
// data output
always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		begin
			fir_result_reg[OUTBITWIDTH - 1:0] 	<= {OUTBITWIDTH{1'b0}} ;
			fir_flag_reg						<= 1'b0 ;
		end
	else
		if (data_flag_buf[7] == 1'b1) begin
			fir_result_reg	<= add_result_buf[FILTERBITWIDTH + COEBITWIDTH + 1:FILTERBITWIDTH + COEBITWIDTH +2 - OUTBITWIDTH];
			fir_flag_reg	<= 1'b1 ;
		end
		else
			fir_flag_reg	<= 1'b0 ;
end

//-------------------------
// fir result decimation //
//-------------------------

always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		fir_decim_cnt_reg[COEBITWIDTH - 1:0]	<= {COEBITWIDTH{1'b0}} ;
	else
		if (fir_flag_reg == 1'b1)
			if (fir_decim_cnt_reg[COEBITWIDTH - 1:0] == decim_factor_reg[COEBITWIDTH - 1:0])
				fir_decim_cnt_reg[COEBITWIDTH - 1:0]	<= {COEBITWIDTH{1'b0}} ;
			else
				fir_decim_cnt_reg[COEBITWIDTH - 1:0]	<= fir_decim_cnt_reg[COEBITWIDTH - 1:0] + 1'b1 ;
end

//
always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		begin
			fir_result[OUTBITWIDTH - 1:0]	<= {OUTBITWIDTH{1'b0}} ;
			fir_flag						<= 1'b0 ;
		end
	else
		if ((fir_decim_cnt_reg[COEBITWIDTH - 1:0] == decim_factor_reg[COEBITWIDTH - 1:0])& (fir_flag_reg == 1'b1))
			begin
				fir_result[OUTBITWIDTH - 1:0]	<= fir_result_reg[OUTBITWIDTH - 1:0] ;
				fir_flag						<= 1'b1 ;
			end
		else
			fir_flag	<= 1'b0 ;
end


endmodule
