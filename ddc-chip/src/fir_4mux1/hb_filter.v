`timescale 1ns / 10ps



module hb_filter #(parameter	INBITWIDTH = 18,
								COEBITWIDTH = 16,
								OUTBITWIDTH = 22)
					(	input clk,
						input rst,
						input rst_param,
						input config_sync,
						input hb_indicator,
						input signed[COEBITWIDTH - 1:0] hb_param,
						input signed[INBITWIDTH - 1:0] data_in,
						input data_in_flag,
						output reg hb_flag,
						output reg [OUTBITWIDTH - 1:0] hb_result) ;


	// register and wire declaration 

	reg signed[COEBITWIDTH - 1:0] coeff_reg0; 
	reg signed[COEBITWIDTH - 1:0] coeff_reg1; 
	reg signed[COEBITWIDTH - 1:0] coeff_reg2; 
	reg signed[COEBITWIDTH - 1:0] coeff_reg3; 

	reg signed[COEBITWIDTH - 1:0] coeff1 ;
	reg signed[COEBITWIDTH - 1:0] coeff3 ;
	reg signed[COEBITWIDTH - 1:0] coeff5 ;
	reg signed[COEBITWIDTH - 1:0] coeff7 ;
	reg signed[INBITWIDTH - 1:0] data_in_buf; 
	

	reg signed[INBITWIDTH - 1:0] shift_reg0;
	reg signed[INBITWIDTH - 1:0] shift_reg1;
	reg signed[INBITWIDTH - 1:0] shift_reg2;
	reg signed[INBITWIDTH - 1:0] shift_reg3;
	reg signed[INBITWIDTH - 1:0] shift_reg4;
	reg signed[INBITWIDTH - 1:0] shift_reg5;
	reg signed[INBITWIDTH - 1:0] shift_reg6;
	reg signed[INBITWIDTH - 1:0] shift_reg7;
	reg signed[INBITWIDTH - 1:0] shift_reg8;
	reg signed[INBITWIDTH - 1:0] shift_reg9;
	reg signed[INBITWIDTH - 1:0] shift_reg10;
	reg signed[INBITWIDTH - 1:0] shift_reg11;
	reg signed[INBITWIDTH - 1:0] shift_reg12;
	reg signed[INBITWIDTH - 1:0] shift_reg13;
	reg signed[INBITWIDTH - 1:0] shift_reg14;
	
	wire signed[INBITWIDTH:0] shift_reg0_cast;
	wire signed[INBITWIDTH:0] shift_reg2_cast;
	wire signed[INBITWIDTH:0] shift_reg4_cast;
	wire signed[INBITWIDTH:0] shift_reg6_cast;
	wire signed[INBITWIDTH:0] shift_reg8_cast;
	wire signed[INBITWIDTH:0] shift_reg10_cast;
	wire signed[INBITWIDTH:0] shift_reg12_cast;
	wire signed[INBITWIDTH:0] shift_reg14_cast;
	
	wire signed[INBITWIDTH :0] sum_0_1_temp;
	wire signed[INBITWIDTH :0] sum_0_3_temp;
	wire signed[INBITWIDTH :0] sum_0_5_temp;
	wire signed[INBITWIDTH :0] sum_0_7_temp;

	wire signed[INBITWIDTH - 1:0] sum_0_1;
	wire signed[INBITWIDTH - 1:0] sum_0_3;
	wire signed[INBITWIDTH - 1:0] sum_0_5;
	wire signed[INBITWIDTH - 1:0] sum_0_7;

	wire signed[COEBITWIDTH + INBITWIDTH - 1:0] mult_1 ;
	wire signed[COEBITWIDTH + INBITWIDTH - 1:0] mult_3 ;
	wire signed[COEBITWIDTH + INBITWIDTH - 1:0] mult_5 ;
	wire signed[COEBITWIDTH + INBITWIDTH - 1:0] mult_7 ;
	wire signed[COEBITWIDTH + INBITWIDTH + 1:0] mult_8 ;

	reg signed[COEBITWIDTH + INBITWIDTH - 1:0] pp_mult_1;
	reg signed[COEBITWIDTH + INBITWIDTH - 1:0] pp_mult_3;
	reg signed[COEBITWIDTH + INBITWIDTH - 1:0] pp_mult_5;
	reg signed[COEBITWIDTH + INBITWIDTH - 1:0] pp_mult_7;
	
	wire signed[COEBITWIDTH + INBITWIDTH - 1 :0] pp_mult_1_cast;
	wire signed[COEBITWIDTH + INBITWIDTH - 1 :0] pp_mult_3_cast;
	wire signed[COEBITWIDTH + INBITWIDTH - 1 :0] pp_mult_5_cast;
	wire signed[COEBITWIDTH + INBITWIDTH - 1 :0] pp_mult_7_cast;
	
	//wire signed[COEBITWIDTH + INBITWIDTH + 2 :0] sum_1_0_temp ;
	//wire signed[COEBITWIDTH + INBITWIDTH + 2 :0] sum_1_1_temp ;
	
	wire signed[COEBITWIDTH + INBITWIDTH - 1:0] sum_1_0 ;
	wire signed[COEBITWIDTH + INBITWIDTH - 1:0] sum_1_1 ;
	
	wire signed[COEBITWIDTH + INBITWIDTH :0] sum_1_0_cast ;
	wire signed[COEBITWIDTH + INBITWIDTH :0] sum_1_1_cast ;
	
	wire signed[COEBITWIDTH + INBITWIDTH :0] sum_2_0 ;
	//wire signed[COEBITWIDTH + INBITWIDTH + 1 :0] sum_2_0_temp;
	
	
	reg signed[COEBITWIDTH + INBITWIDTH + 1 :0] pp_mult_8;
	reg signed[COEBITWIDTH + INBITWIDTH + 1 :0] pp_mult_8_buf;



	reg signed[COEBITWIDTH + INBITWIDTH + 1 :0] pp_sum_2_0;
	wire signed[COEBITWIDTH + INBITWIDTH + 1 :0] sum_3_0 ;
	//wire signed[COEBITWIDTH + INBITWIDTH + 4 :0] sum_3_0_temp ;
	
	
	
	

	reg signed[COEBITWIDTH + INBITWIDTH + 1:0] sum_reg;
	
	reg decim_flag ;
	integer i;
	reg [4:0] data_in_flag_buf;


//----------------------------main programme begin here-----------------------------------

/* loading and updating halfband filter coefficients */
// loading......
always @(posedge clk, negedge rst_param )
begin
	if (rst_param == 1'b0)
		begin
			coeff_reg0 <= {COEBITWIDTH{1'b0}} ;
			coeff_reg1 <= {COEBITWIDTH{1'b0}} ;
			coeff_reg2 <= {COEBITWIDTH{1'b0}} ;
			coeff_reg3 <= {COEBITWIDTH{1'b0}} ;
		end
	else
		if (hb_indicator == 1'b1)
			begin
				coeff_reg0 	<= hb_param ;
				coeff_reg1	<= coeff_reg0;
				coeff_reg2	<= coeff_reg1;
				coeff_reg3	<= coeff_reg2;
			end
end
//updating......
always @(posedge clk, negedge rst_param )
begin
	if (rst_param == 1'b0)
		begin
			coeff1	<= {COEBITWIDTH{1'b0}} ;
			coeff3	<= {COEBITWIDTH{1'b0}} ;
			coeff5	<= {COEBITWIDTH{1'b0}} ;
			coeff7	<= {COEBITWIDTH{1'b0}} ;
		end
	else
		if (config_sync == 1'b1)
			begin
				coeff1	<= coeff_reg0 ;
				coeff3	<= coeff_reg1 ;
				coeff5	<= coeff_reg2 ;
				coeff7	<= coeff_reg3 ;
			end
end
//ck 080504 add
always @(posedge clk, negedge rst)
if(rst==0)data_in_flag_buf<={5{1'b0}};
else data_in_flag_buf<={data_in_flag_buf[3:0],data_in_flag};


//end of ck 080504

/* halfband filter shift regiter shfiting */
// buffering input data
always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		data_in_buf <= {INBITWIDTH{1'b0}} ;
	else if(data_in_flag)//ck 080504 change
		data_in_buf <= data_in ;
end

// shift register shifting
always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		begin

			shift_reg0 <= {INBITWIDTH{1'b0}}; 
			shift_reg1 <= {INBITWIDTH{1'b0}}; 
			shift_reg2 <= {INBITWIDTH{1'b0}}; 
			shift_reg3 <= {INBITWIDTH{1'b0}}; 
			shift_reg4 <= {INBITWIDTH{1'b0}}; 
			shift_reg5 <= {INBITWIDTH{1'b0}}; 
			shift_reg6 <= {INBITWIDTH{1'b0}}; 
			shift_reg7 <= {INBITWIDTH{1'b0}}; 
			shift_reg8 <= {INBITWIDTH{1'b0}}; 
			shift_reg9 <= {INBITWIDTH{1'b0}};
			shift_reg10 <= {INBITWIDTH{1'b0}}; 
			shift_reg11 <= {INBITWIDTH{1'b0}}; 
			shift_reg12 <= {INBITWIDTH{1'b0}}; 
			shift_reg13 <= {INBITWIDTH{1'b0}}; 
			shift_reg14 <= {INBITWIDTH{1'b0}}; 
		end
	else if(data_in_flag_buf[0]==1)
		begin
			shift_reg0	<= data_in_buf ;
			shift_reg1	<= shift_reg0 ;
			shift_reg2	<= shift_reg1;
			shift_reg3	<= shift_reg2;
			shift_reg4	<= shift_reg3;
			shift_reg5	<= shift_reg4;
			shift_reg6	<= shift_reg5;
			shift_reg7	<= shift_reg6;
			shift_reg8	<= shift_reg7;
			shift_reg9	<= shift_reg8;
			shift_reg10	<= shift_reg9;
			shift_reg11	<= shift_reg10;
			shift_reg12	<= shift_reg11;
			shift_reg13	<= shift_reg12;
			shift_reg14	<= shift_reg13;				

		end
end


/* halfband filter multiply stages */
// adder
assign shift_reg0_cast = $signed({{shift_reg0[INBITWIDTH - 1]}, shift_reg0});
assign shift_reg2_cast = $signed({{shift_reg2[INBITWIDTH - 1]}, shift_reg2});
assign shift_reg4_cast = $signed({{shift_reg4[INBITWIDTH - 1]}, shift_reg4});
assign shift_reg6_cast = $signed({{shift_reg6[INBITWIDTH - 1]}, shift_reg6});
assign shift_reg8_cast = $signed({{shift_reg8[INBITWIDTH - 1]}, shift_reg8});
assign shift_reg10_cast = $signed({{shift_reg10[INBITWIDTH - 1]}, shift_reg10});
assign shift_reg12_cast = $signed({{shift_reg12[INBITWIDTH - 1]}, shift_reg12});
assign shift_reg14_cast = $signed({{shift_reg14[INBITWIDTH - 1]}, shift_reg14});//21bits


assign sum_0_1_temp = shift_reg0_cast + shift_reg14_cast;
assign sum_0_3_temp = shift_reg2_cast + shift_reg12_cast;
assign sum_0_5_temp = shift_reg4_cast + shift_reg10_cast;
assign sum_0_7_temp = shift_reg6_cast + shift_reg8_cast;


assign  sum_0_1	= sum_0_1_temp[INBITWIDTH :1] + sum_0_1_temp[0];	
assign  sum_0_3 = sum_0_3_temp[INBITWIDTH :1] + sum_0_3_temp[0];
assign  sum_0_5 = sum_0_5_temp[INBITWIDTH :1] + sum_0_5_temp[0];
assign  sum_0_7 = sum_0_7_temp[INBITWIDTH :1] + sum_0_7_temp[0];//25bits

// multiply
assign mult_1 = coeff1 * sum_0_1 ;
assign mult_3 = coeff3 * sum_0_3 ;
assign mult_5 = coeff5 * sum_0_5 ;
assign mult_7 = coeff7 * sum_0_7 ;//25+16=41bits


wire [INBITWIDTH-1 :0] shift_reg_7;
assign shift_reg_7 = shift_reg7;
assign mult_8 = {{5{shift_reg_7[INBITWIDTH-1]}}, {shift_reg_7}, {(COEBITWIDTH - 3){1'b0}}} ;

// multiplier result pipeline
always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		begin
			pp_mult_1 <= {(COEBITWIDTH + INBITWIDTH - 1){1'b0}} ;
			pp_mult_3 <= {(COEBITWIDTH + INBITWIDTH - 1){1'b0}} ;
			pp_mult_5 <= {(COEBITWIDTH + INBITWIDTH - 1){1'b0}} ;
			pp_mult_7 <= {(COEBITWIDTH + INBITWIDTH - 1){1'b0}} ;
			pp_mult_8 <= {(COEBITWIDTH + INBITWIDTH + 2){1'b0}} ;
		end
	else
		begin
			pp_mult_1 <= mult_1 ;
			pp_mult_3 <= mult_3 ;
			pp_mult_5 <= mult_5 ;
			pp_mult_7 <= mult_7 ;
			pp_mult_8 <= mult_8 ;
		end
end

/* accumulating */
// sum
//assign pp_mult_1_cast = $signed({{pp_mult_1[COEBITWIDTH + INBITWIDTH]}, pp_mult_1});
//assign pp_mult_3_cast = $signed({{pp_mult_3[COEBITWIDTH + INBITWIDTH]}, pp_mult_3});
//assign pp_mult_5_cast = $signed({{pp_mult_5[COEBITWIDTH + INBITWIDTH]}, pp_mult_5});
//assign pp_mult_7_cast = $signed({{pp_mult_7[COEBITWIDTH + INBITWIDTH]}, pp_mult_7});//42bits

assign sum_1_0 = pp_mult_1 + pp_mult_3 ;
assign sum_1_1 = pp_mult_5 + pp_mult_7 ;


//assign sum_1_0 = sum_1_0_temp[COEBITWIDTH + INBITWIDTH + 1:0];
//assign sum_1_1 = sum_1_1_temp[COEBITWIDTH + INBITWIDTH + 1:0];//42bits

assign sum_1_0_cast = $signed({{sum_1_0[COEBITWIDTH + INBITWIDTH - 1]}, sum_1_0});
assign sum_1_1_cast = $signed({{sum_1_1[COEBITWIDTH + INBITWIDTH - 1]}, sum_1_1});

assign sum_2_0 = sum_1_0_cast + sum_1_1_cast;
//assign sum_2_0 = sum_2_0_temp[COEBITWIDTH + INBITWIDTH + 2:0];//43bits



// pipeline sum result
always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		begin
			pp_sum_2_0		<= {(COEBITWIDTH + INBITWIDTH + 2){1'b0}} ;
			pp_mult_8_buf	<= {(COEBITWIDTH + INBITWIDTH + 2){1'b0}} ;
		end 		
	else
		begin
			pp_sum_2_0		<= $signed({{sum_2_0[COEBITWIDTH + INBITWIDTH]},sum_2_0}) ;
			pp_mult_8_buf	<= pp_mult_8;
		end
end

// result sum
assign sum_3_0 = pp_sum_2_0 + pp_mult_8_buf;
//assign sum_3_0 = sum_3_0_temp[COEBITWIDTH + INBITWIDTH + 2:0] ;//3.20 sum_2_0 changed by pp_sum_2_0

// register sum result
always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		sum_reg <= {(COEBITWIDTH + INBITWIDTH + 2){1'b0}} ;
	else
		sum_reg	<= sum_3_0;
end 


/*  halfband filter result decimated by 2  */
always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		decim_flag <= 1'b0;
	else if(data_in_flag_buf[3]==1'b1) //ck 080504 change
		decim_flag <= ~decim_flag;
end 

// halfband filter result output 
always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		hb_result[OUTBITWIDTH - 1:0]	<= {OUTBITWIDTH{1'b0}} ;
	else
		if (decim_flag == 1'b1 && data_in_flag_buf[4]==1'b1) //ck 080504change
			hb_result[OUTBITWIDTH - 1:0]	<= sum_reg[COEBITWIDTH + INBITWIDTH + 1: COEBITWIDTH + INBITWIDTH +2 - OUTBITWIDTH] ;
end

// halfband filter result flag output 
always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		hb_flag	<= 1'b0;
	else
		if (decim_flag == 1'b1 && data_in_flag_buf[4]==1'b1) //ck 080504change
			hb_flag	<= 1'b1 ;
		else
			hb_flag	<= 1'b0;
end


endmodule
