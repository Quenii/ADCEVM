// File Name: 			nco_for_asic.v														//
// File Name: 			nco_for_asic_tb.v													//

//////////////////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ns

module nco_for_asic #(parameter BUSBITWIDTH = 16 ,
								PIPELENGTH = 23 ,
								PPWIDTH = 25 )
					(	input clk,
					   input rst_param,
						input rst,
						input config_sync,
						input nco_indicator,
						input [BUSBITWIDTH - 1:0] nco_param, 
						output reg[PPWIDTH - 1:0] nco_sine,
						output reg[PPWIDTH - 1:0] nco_cosine,
						output reg [14:0] nco_test,
						output reg [31:0] freq_word);

	// signal and wire declaration
//	reg[BUSBITWIDTH - 1:0] shift_reg[3:0] ;
//	reg[BUSBITWIDTH - 1:0] shift_reg[2:0] ;
	reg[BUSBITWIDTH - 1:0] shift_reg0;
	reg[BUSBITWIDTH - 1:0] shift_reg1;
	reg[BUSBITWIDTH - 1:0] shift_reg2;
	reg[BUSBITWIDTH - 1:0] shift_reg3;

	//reg [2 * BUSBITWIDTH - 1:0] freq_word;
	reg [2 * BUSBITWIDTH - 1:0] phase_word;
	reg inv_sine;
	
	reg [2 * BUSBITWIDTH - 1:0] phase_accum_reg ;
	reg [2 * BUSBITWIDTH - 1:0] phase_mod_reg ;
	
	reg [29:0] cordic_angular ;
	reg [PIPELENGTH:0] cordic_delay ;
	reg [2* BUSBITWIDTH - 1:0] nco_test_freq_word;
	
//	wire [PPWIDTH - 1:0] x[PIPELENGTH:0]; 
	wire [PPWIDTH - 1:0] x0 ; 
	wire [PPWIDTH - 1:0] x1 ; 
	wire [PPWIDTH - 1:0] x2 ; 
	wire [PPWIDTH - 1:0] x3 ; 
	wire [PPWIDTH - 1:0] x4 ; 
	wire [PPWIDTH - 1:0] x5 ; 
	wire [PPWIDTH - 1:0] x6 ; 
	wire [PPWIDTH - 1:0] x7 ; 
	wire [PPWIDTH - 1:0] x8 ; 
	wire [PPWIDTH - 1:0] x9 ; 
	wire [PPWIDTH - 1:0] x10 ; 
	wire [PPWIDTH - 1:0] x11 ; 
	wire [PPWIDTH - 1:0] x12 ; 
	wire [PPWIDTH - 1:0] x13 ; 
	wire [PPWIDTH - 1:0] x14 ; 
	wire [PPWIDTH - 1:0] x15 ; 
	wire [PPWIDTH - 1:0] x16 ; 
	wire [PPWIDTH - 1:0] x17 ; 
	wire [PPWIDTH - 1:0] x18 ; 
	wire [PPWIDTH - 1:0] x19 ; 
	wire [PPWIDTH - 1:0] x20 ; 
	wire [PPWIDTH - 1:0] x21 ; 
	wire [PPWIDTH - 1:0] x22 ; 
	wire [PPWIDTH - 1:0] x23 ; 
	
//	wire [PPWIDTH - 1:0] y[PIPELENGTH:0]; 
	wire [PPWIDTH - 1:0] y0 ; 
	wire [PPWIDTH - 1:0] y1 ; 
	wire [PPWIDTH - 1:0] y2 ; 
	wire [PPWIDTH - 1:0] y3 ; 
	wire [PPWIDTH - 1:0] y4 ; 
	wire [PPWIDTH - 1:0] y5 ; 
	wire [PPWIDTH - 1:0] y6 ; 
	wire [PPWIDTH - 1:0] y7 ; 
	wire [PPWIDTH - 1:0] y8 ; 
	wire [PPWIDTH - 1:0] y9 ; 
	wire [PPWIDTH - 1:0] y10 ; 
	wire [PPWIDTH - 1:0] y11 ; 
	wire [PPWIDTH - 1:0] y12 ; 
	wire [PPWIDTH - 1:0] y13 ; 
	wire [PPWIDTH - 1:0] y14 ; 
	wire [PPWIDTH - 1:0] y15 ; 
	wire [PPWIDTH - 1:0] y16 ; 
	wire [PPWIDTH - 1:0] y17 ; 
	wire [PPWIDTH - 1:0] y18 ; 
	wire [PPWIDTH - 1:0] y19 ; 
	wire [PPWIDTH - 1:0] y20 ; 
	wire [PPWIDTH - 1:0] y21 ; 
	wire [PPWIDTH - 1:0] y22 ; 
	wire [PPWIDTH - 1:0] y23 ; 
	
//	wire [29:0] z[PIPELENGTH:0];
	wire [29:0] z0 ;
	wire [29:0] z1 ;
	wire [29:0] z2 ;
	wire [29:0] z3 ;
	wire [29:0] z4 ;
	wire [29:0] z5 ;
	wire [29:0] z6 ;
	wire [29:0] z7 ;
	wire [29:0] z8 ;
	wire [29:0] z9 ;
	wire [29:0] z10 ;
	wire [29:0] z11 ;
	wire [29:0] z12 ;
	wire [29:0] z13 ;
	wire [29:0] z14 ;
	wire [29:0] z15 ;
	wire [29:0] z16 ;
	wire [29:0] z17 ;
	wire [29:0] z18 ;
	wire [29:0] z19 ;
	wire [29:0] z20 ;
	wire [29:0] z21 ;
	wire [29:0] z22 ;
	wire [29:0] z23 ;
	
	//wire [31:0] phi;

// pipeline wordlengh = 20, pipeline level = 18
//	localparam XINIT = 20'b00100110110111010110 ;
//	localparam YINIT = {20{1'b0}} ;

// pipeline wordlengh = 25, pipeline level = 23
	localparam XINIT = 25'b0100110110111010010111100 ;
	localparam YINIT = {25{1'b0}} ;

//	genvar i ;

//----------------------------main programme begin here-----------------------------------

/* load/update nco parameter */
// load......
always @(posedge clk or negedge rst_param )
begin
	if (rst_param == 1'b0)
		begin
			shift_reg0	<= {BUSBITWIDTH{1'b0}} ; 
			shift_reg1	<= {BUSBITWIDTH{1'b0}} ; 
			shift_reg2	<= {BUSBITWIDTH{1'b0}} ; 
			shift_reg3	<= {BUSBITWIDTH{1'b0}} ; 
		end
	else
		if (nco_indicator == 1'b1)
			begin
				shift_reg0	<= nco_param ;
				shift_reg1	<= shift_reg0 ;
				shift_reg2	<= shift_reg1 ;
				shift_reg3	<= shift_reg2 ;
			end 
end
// updating......
always @(posedge clk or negedge rst_param )
begin
	if (rst_param == 1'b0)
		begin
			freq_word[2* BUSBITWIDTH - 1:0]		<= {(2 * BUSBITWIDTH){1'b0}} ; 
			phase_word[2 * BUSBITWIDTH - 1:0]	<= {(2 * BUSBITWIDTH){1'b0}} ;
			inv_sine				<= 1'b0; 
			nco_test[14:0]				<= {15{1'b0}};
			
			
			
		end
	else
		if (config_sync == 1'b1)
			begin
				freq_word[2 * BUSBITWIDTH - 1:0]	<= {shift_reg1, shift_reg2} ;
				phase_word[2 * BUSBITWIDTH - 1:0]	<= {16'h0000, shift_reg0} ;	
				
				nco_test[14:0]			<= shift_reg3[15:1];
				inv_sine				<=shift_reg3[0];
			end 
end

//assign phi[31:0] = freq_word[31:0] + nco_test_freq_word[31:0];
//
//nco_for_test i_nco_for_test (
//    .out_valid(),
//    .fsin_o(sin_val[15:0]),
//    .phi_inc_i(phi[31:0]),
//    .reset_n(rst),
//    .clken(1'b1),
//    .clk(clk)
//    );

// Phase accumulating
always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		phase_accum_reg[2 * BUSBITWIDTH - 1:0] <= {(2 * BUSBITWIDTH){1'b0}} ; 
	else
		phase_accum_reg[2 * BUSBITWIDTH - 1:0] <= phase_accum_reg[2 * BUSBITWIDTH - 1:0] + freq_word[2 * BUSBITWIDTH - 1:0] ; 
end 

/* phase modulation*/
always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		phase_mod_reg[2 * BUSBITWIDTH - 1:0] <= {(2 * BUSBITWIDTH){1'b0}} ; 
	else
		phase_mod_reg[2 * BUSBITWIDTH - 1:0] <= phase_accum_reg[2 * BUSBITWIDTH - 1:0] + phase_word[2 * BUSBITWIDTH - 1:0] ; 
end 

/* angular mapping*/
always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		cordic_angular[2 * BUSBITWIDTH-3:0] <= {(2 * BUSBITWIDTH-2){1'b0}} ; 
	else
	begin
		case (phase_mod_reg[2 * BUSBITWIDTH - 1:2 * BUSBITWIDTH - 2])
			2'b00	:	cordic_angular[2 * BUSBITWIDTH-3:0] <= phase_mod_reg[2 * BUSBITWIDTH - 1:2] ; 
			2'b01	:	cordic_angular[2 * BUSBITWIDTH-3:0] <= {2'b00, (~phase_mod_reg[2 * BUSBITWIDTH-3:2])} ; 
			2'b10	:	cordic_angular[2 * BUSBITWIDTH-3:0] <= {2'b11, (~phase_mod_reg[2 * BUSBITWIDTH-3:2])} ; 
			2'b11	:	cordic_angular[2 * BUSBITWIDTH-3:0] <= phase_mod_reg[2 * BUSBITWIDTH - 1:2] ; 
			default	:	cordic_angular[2 * BUSBITWIDTH-3:0] <= {(2 * BUSBITWIDTH-2){1'b0}} ; 
		endcase 
	end  
end 

/* cordic algorithm latency*/
always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		cordic_delay[PIPELENGTH:0] <= {(PIPELENGTH + 1){1'b0}} ; 
	else
		begin
			cordic_delay[0]				<= phase_mod_reg[2 * BUSBITWIDTH - 1] ^ phase_mod_reg[2 * BUSBITWIDTH - 2] ; 
			cordic_delay[PIPELENGTH:1]	<= cordic_delay[PIPELENGTH - 1:0] ; 
		end  
end 


// fill first nodes
//assign x[0] = XINIT ;
//assign y[0] = YINIT ;
//assign z[0] = cordic_angular ;

assign x0 = XINIT ;
assign y0 = YINIT ;
assign z0 = cordic_angular ;


// generate PIPELENGTH of cordic algorithm
//generate
//	for(i = 1; i < PIPELENGTH + 1; i = i + 1)
//	begin: cordic_pipeline
//		cordic_p2r_pipe #(	.PPWIDTH(PPWIDTH),
//							.PIPEID(i - 1))
//				pplevel(	.clk(clk), 
//							.rst(rst),
//							.xi(x[i - 1]),
//							.yi(y[i - 1]),
//							.zi(z[i - 1]),
//							.xo(x[i]),
//							.yo(y[i]),
//							.zo(z[i]) ) ;
//	end
//endgenerate	

cordic_p2r_pipe #(	.PPWIDTH(PPWIDTH),
					.PIPEID(0))
		pplevel0(	.clk(clk), 
					.rst(rst),
					.xi(x0),
					.yi(y0),
					.zi(z0),
					.xo(x1),
					.yo(y1),
					.zo(z1) ) ;	 
					
cordic_p2r_pipe #(	.PPWIDTH(PPWIDTH),
					.PIPEID(1))
		pplevel1(	.clk(clk), 
					.rst(rst),
					.xi(x1),
					.yi(y1),
					.zi(z1),
					.xo(x2),
					.yo(y2),
					.zo(z2) ) ;

cordic_p2r_pipe #(	.PPWIDTH(PPWIDTH),
					.PIPEID(2))
		pplevel2(	.clk(clk), 
					.rst(rst),
					.xi(x2),
					.yi(y2),
					.zi(z2),
					.xo(x3),
					.yo(y3),
					.zo(z3) ) ;

cordic_p2r_pipe #(	.PPWIDTH(PPWIDTH),
					.PIPEID(3))
		pplevel3(	.clk(clk), 
					.rst(rst),
					.xi(x3),
					.yi(y3),
					.zi(z3),
					.xo(x4),
					.yo(y4),
					.zo(z4) ) ;

cordic_p2r_pipe #(	.PPWIDTH(PPWIDTH),
					.PIPEID(4))
		pplevel4(	.clk(clk), 
					.rst(rst),
					.xi(x4),
					.yi(y4),
					.zi(z4),
					.xo(x5),
					.yo(y5),
					.zo(z5) ) ;

cordic_p2r_pipe #(	.PPWIDTH(PPWIDTH),
					.PIPEID(5))
		pplevel5(	.clk(clk), 
					.rst(rst),
					.xi(x5),
					.yi(y5),
					.zi(z5),
					.xo(x6),
					.yo(y6),
					.zo(z6) ) ;

cordic_p2r_pipe #(	.PPWIDTH(PPWIDTH),
					.PIPEID(6))
		pplevel6(	.clk(clk), 
					.rst(rst),
					.xi(x6),
					.yi(y6),
					.zi(z6),
					.xo(x7),
					.yo(y7),
					.zo(z7) ) ;

cordic_p2r_pipe #(	.PPWIDTH(PPWIDTH),
					.PIPEID(7))
		pplevel7(	.clk(clk), 
					.rst(rst),
					.xi(x7),
					.yi(y7),
					.zi(z7),
					.xo(x8),
					.yo(y8),
					.zo(z8) ) ;

cordic_p2r_pipe #(	.PPWIDTH(PPWIDTH),
					.PIPEID(8))
		pplevel8(	.clk(clk), 
					.rst(rst),
					.xi(x8),
					.yi(y8),
					.zi(z8),
					.xo(x9),
					.yo(y9),
					.zo(z9) ) ;

cordic_p2r_pipe #(	.PPWIDTH(PPWIDTH),
					.PIPEID(9))
		pplevel9(	.clk(clk), 
					.rst(rst),
					.xi(x9),
					.yi(y9),
					.zi(z9),
					.xo(x10),
					.yo(y10),
					.zo(z10) ) ;

cordic_p2r_pipe #(	.PPWIDTH(PPWIDTH),
					.PIPEID(10))
		pplevel10(	.clk(clk), 
					.rst(rst),
					.xi(x10),
					.yi(y10),
					.zi(z10),
					.xo(x11),
					.yo(y11),
					.zo(z11) ) ;
cordic_p2r_pipe #(	.PPWIDTH(PPWIDTH),
					.PIPEID(11))
		pplevel11(	.clk(clk), 
					.rst(rst),
					.xi(x11),
					.yi(y11),
					.zi(z11),
					.xo(x12),
					.yo(y12),
					.zo(z12) ) ;

cordic_p2r_pipe #(	.PPWIDTH(PPWIDTH),
					.PIPEID(12))
		pplevel12(	.clk(clk), 
					.rst(rst),
					.xi(x12),
					.yi(y12),
					.zi(z12),
					.xo(x13),
					.yo(y13),
					.zo(z13) ) ;

cordic_p2r_pipe #(	.PPWIDTH(PPWIDTH),
					.PIPEID(13))
		pplevel13(	.clk(clk), 
					.rst(rst),
					.xi(x13),
					.yi(y13),
					.zi(z13),
					.xo(x14),
					.yo(y14),
					.zo(z14) ) ;

cordic_p2r_pipe #(	.PPWIDTH(PPWIDTH),
					.PIPEID(14))
		pplevel14(	.clk(clk), 
					.rst(rst),
					.xi(x14),
					.yi(y14),
					.zi(z14),
					.xo(x15),
					.yo(y15),
					.zo(z15) ) ;

cordic_p2r_pipe #(	.PPWIDTH(PPWIDTH),
					.PIPEID(15))
		pplevel15(	.clk(clk), 
					.rst(rst),
					.xi(x15),
					.yi(y15),
					.zi(z15),
					.xo(x16),
					.yo(y16),
					.zo(z16) ) ;

cordic_p2r_pipe #(	.PPWIDTH(PPWIDTH),
					.PIPEID(16))
		pplevel16(	.clk(clk), 
					.rst(rst),
					.xi(x16),
					.yi(y16),
					.zi(z16),
					.xo(x17),
					.yo(y17),
					.zo(z17) ) ;

cordic_p2r_pipe #(	.PPWIDTH(PPWIDTH),
					.PIPEID(17))
		pplevel17(	.clk(clk), 
					.rst(rst),
					.xi(x17),
					.yi(y17),
					.zi(z17),
					.xo(x18),
					.yo(y18),
					.zo(z18) ) ;

cordic_p2r_pipe #(	.PPWIDTH(PPWIDTH),
					.PIPEID(18))
		pplevel18(	.clk(clk), 
					.rst(rst),
					.xi(x18),
					.yi(y18),
					.zi(z18),
					.xo(x19),
					.yo(y19),
					.zo(z19) ) ;

cordic_p2r_pipe #(	.PPWIDTH(PPWIDTH),
					.PIPEID(19))
		pplevel19(	.clk(clk), 
					.rst(rst),
					.xi(x19),
					.yi(y19),
					.zi(z19),
					.xo(x20),
					.yo(y20),
					.zo(z20) ) ;

cordic_p2r_pipe #(	.PPWIDTH(PPWIDTH),
					.PIPEID(20))
		pplevel20(	.clk(clk), 
					.rst(rst),
					.xi(x20),
					.yi(y20),
					.zi(z20),
					.xo(x21),
					.yo(y21),
					.zo(z21) ) ;

cordic_p2r_pipe #(	.PPWIDTH(PPWIDTH),
					.PIPEID(21))
		pplevel21(	.clk(clk), 
					.rst(rst),
					.xi(x21),
					.yi(y21),
					.zi(z21),
					.xo(x22),
					.yo(y22),
					.zo(z22) ) ;

cordic_p2r_pipe #(	.PPWIDTH(PPWIDTH),
					.PIPEID(22))
		pplevel22(	.clk(clk), 
					.rst(rst),
					.xi(x22),
					.yi(y22),
					.zi(z22),
					.xo(x23),
					.yo(y23),
					.zo(z23) ) ;


/* nco cosinunoid output buffer*/
always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		nco_cosine[PPWIDTH - 1:0] <= {PPWIDTH{1'b0}} ; 
	else
	begin
		if (cordic_delay[PIPELENGTH] == 1'b0)
			nco_cosine[PPWIDTH - 1:0] <= x23 ; 
		else
			nco_cosine[PPWIDTH - 1:0] <= ~x23 ;
	end  
end 


/* nco sinunoid output buffer*/
always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		nco_sine[PPWIDTH - 1:0] <= {PPWIDTH{1'b0}} ; 
	else
		begin
			if (inv_sine == 1'b0)
				nco_sine[PPWIDTH - 1:0] <= y23 ; 
			else
				nco_sine[PPWIDTH - 1:0] <= ~y23 + 1'b1;
		end
end


endmodule
