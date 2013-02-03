// File Name: 			cordic_p2r_pipe.v													//
// Simulation tools:	ModelSimSE 6.1d														//


`timescale 1ns/1ns

module cordic_p2r_pipe #(	parameter 	PPWIDTH = 25 ,		// parameter declaration
										PIPEID = 18 )
						(	input clk,
							input rst,
							input signed[PPWIDTH - 1:0] xi,
							input signed[PPWIDTH - 1:0] yi,
							input signed[29:0] zi,
							output reg[PPWIDTH - 1:0] xo,
							output reg[PPWIDTH - 1:0] yo,
							output reg[29:0] zo );

	// register and wire declaration
	reg signed[PPWIDTH - 1:0] xresult; 
	reg signed[PPWIDTH - 1:0] yresult; 
	reg signed[29:0] zresult; 

	reg signed[29:0] arctan; 
	
	wire signed[PPWIDTH - 1:0] dx; 
	wire signed[PPWIDTH - 1:0] dy; 
	wire zneg; 
	wire zpos; 


//----------------------------main programme begin here-----------------------------------

//arithmetic shift right(divided by 2^n)
assign dx = (xi >>> PIPEID) ;
assign dy = (yi >>> PIPEID) ;

assign zneg = zi[29] ;
assign zpos = ~zi[29] ;

//assign atan = arctan(PIPEID) ;

// x-axes rotation
always @(xi, dy, zneg)
begin
	if (zneg == 1'b1)
		xresult = xi + dy; 
	else
		xresult = xi - dy; 
end

// y-axes rotation
always @(yi, dx, zpos)
begin
	if (zpos == 1'b1)
		yresult = yi + dx ; 
	else
		yresult = yi - dx; 
end

// z-angular rotation
always @(zi, arctan, zneg, PIPEID)
begin
	case(PIPEID)
		0 		:	arctan = {30'sh08000000};
		1 		:	arctan = {30'sh04b90147}; 
		2 		:	arctan = {30'sh027ece16}; 
		3 		:	arctan = {30'sh01444475}; 
		4 		:	arctan = {30'sh00a2c350}; 
		5 		:	arctan = {30'sh005175f8}; 
		6 		:	arctan = {30'sh0028bd87}; 
		7 		:	arctan = {30'sh00145f15}; 
		8 		:	arctan = {30'sh000a2f94}; 
		9 		:	arctan = {30'sh000517cb}; 
		10 		:	arctan = {30'sh00028be6}; 
		11 		:	arctan = {30'sh000145f3}; 
		12 		:	arctan = {30'sh0000a2f9}; 
		13 		:	arctan = {30'sh0000517c}; 
		14 		:	arctan = {30'sh000028be}; 
		15 		:	arctan = {30'sh0000145f}; 
		16 		:	arctan = {30'sh00000a2f}; 
		17 		:	arctan = {30'sh00000517}; 
		18 		:	arctan = {30'sh0000028b}; 
		19 		:	arctan = {30'sh00000145}; 
		20 		:	arctan = {30'sh000000a2}; 
		21 		:	arctan = {30'sh00000051}; 
		22 		:	arctan = {30'sh00000028}; 
		23 		:	arctan = {30'sh00000014}; 
		default :	arctan = {30'sh00000000}; 
	endcase 
	if (zneg == 1'b1)
		zresult = zi + arctan ; 
	else
		zresult = zi - arctan ; 
end

//register output
always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		begin
			xo	<= {PPWIDTH{1'b0}} ;
			yo	<= {PPWIDTH{1'b0}} ;
			zo	<= {PPWIDTH{1'b0}} ;
		end
	else
		begin
			xo <= xresult ; 
			yo <= yresult ; 
			zo <= zresult ; 
		end  
end 


endmodule
