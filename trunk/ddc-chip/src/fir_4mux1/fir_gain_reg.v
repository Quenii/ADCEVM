// File Name: 			fir_gain.v 						//      
// Testbench: 										//      

                                                                                                

`timescale 1ns/10ps

module fir_gain #(parameter INBITWIDTH = 26,
				COEBITWIDTH = 16,
				MANTBITWIDTH = 16,
				EXPBITWIDTH = 18,
				OUTBITWIDTH = 16)
		(	input clk,
			input rst,
			input rst_param,
			input config_sync,
			input firgain_indicator,
			input [COEBITWIDTH - 1:0] firgain_param,
			
			input signed[INBITWIDTH - 1:0] dataI_in,
			input dataI_flag,
			input signed[INBITWIDTH - 1:0] dataQ_in,
			input dataQ_flag,
			output reg [OUTBITWIDTH - 1:0] firgain_resultI,
			output reg [OUTBITWIDTH - 1:0] firgain_resultQ,
			output reg firgain_resultI_flag,
			output reg firgain_resultQ_flag
			);
			
			
	reg [COEBITWIDTH - 1:0] firgain_reg1;
	reg [COEBITWIDTH - 1:0] firgain_reg2;
	reg [3:0] exp_param;
	reg [MANTBITWIDTH - 1:0] mant_param;
	reg signed [EXPBITWIDTH - 1:0] shift_exp,shift_exp_reg;
	
	reg signed[INBITWIDTH - 1:0] data_in;
	
	reg [OUTBITWIDTH - 1:0] firgain_result;
	
	//reg signed [EXTINBITWIDTH -1 :0] mult;
	reg signed[INBITWIDTH - 1:0] dataQ_in_delay;
	
	reg [6:0] dataI_flag_delay;
	reg [6:0] dataQ_flag_delay; 
	
	
	reg overflow_reg,overflow_reg_delay;
	reg [OUTBITWIDTH - 1:0] firgain_resultI_reg;
	reg firgain_resultI_flag_reg;
	
	wire [14:0] overflow_flag;
	
	wire signed [INBITWIDTH - 2:0] shift_din;
	reg signed [EXPBITWIDTH - 1:0] shift_exp_w;
	wire signed [MANTBITWIDTH + EXPBITWIDTH - 1 :0] mult_w;
	//wire signed [EXTINBITWIDTH -1 :0] mult;
	reg signed [MANTBITWIDTH + EXPBITWIDTH -1 :0] mult;
	wire signed [MANTBITWIDTH + EXPBITWIDTH : 0] sum;
	reg signed [MANTBITWIDTH + EXPBITWIDTH - 1 :0] mul_w_buf;

reg signed [EXPBITWIDTH - 1:0] shift_exp_buf;
reg signed [EXPBITWIDTH - 1:0] shift_exp_buf1;
reg overflow_reg_reg;
	
	
//----------------------------main programme begin here-----------------------------------

/* loading and updating EXP and MANT gain parameter */
// loading......
always @(posedge clk, negedge rst_param )
begin
	if (rst_param == 1'b0)
		begin
			firgain_reg1 <= {COEBITWIDTH{1'b0}} ;
			firgain_reg2 <= {COEBITWIDTH{1'b0}} ;
			
		end
	else
		if (firgain_indicator == 1'b1)
			begin
				firgain_reg1 	<= firgain_param ;
				firgain_reg2	<= firgain_reg1;
			end
end

//updating......
always @(posedge clk, negedge rst_param )
begin
	if (rst_param == 1'b0)
		begin
			exp_param	<= {4{1'b0}} ;
			mant_param<= {COEBITWIDTH{1'b0}} ;
			
		end
	else
		if (config_sync == 1'b1)
			begin
				mant_param[MANTBITWIDTH - 1:0]	<= firgain_reg1[MANTBITWIDTH - 1:0] ;
				exp_param[3:0]	<= firgain_reg2[3:0] ;
			end
end	

/* input data buffer and sign extended to shift_exp */
// ck 080410 add
always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
	begin
	dataQ_in_delay<={INBITWIDTH{1'b0}};
	dataI_flag_delay<=0;
	dataQ_flag_delay<=0;
	end
	else
	begin
	dataQ_in_delay<=dataQ_in;
	dataI_flag_delay<={dataI_flag_delay[5:0],dataI_flag};
	dataQ_flag_delay<={dataQ_flag_delay[5:0],dataQ_flag};
	end	
end

always @(posedge clk, negedge rst)
begin
	if(rst==1'b0)
	data_in<={INBITWIDTH{1'b0}};
	else if(dataI_flag==1)data_in<=dataI_in;
	else if(dataQ_flag_delay[0]==1)data_in<=dataQ_in_delay;	
	//else data_in<={INBITWIDTH{1'b0}};//ck 080504
end

//end of ck 080410 add

assign overflow_flag = {15{data_in[INBITWIDTH - 1]}} ^ data_in[INBITWIDTH - 2 : INBITWIDTH - 16];


always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		overflow_reg <= 1'b0;
	else
		begin
			case (exp_param)
			4'b0001: overflow_reg <= overflow_flag[14];			
			4'b0010: overflow_reg <= |overflow_flag[14:13];
			4'b0011: overflow_reg <= |overflow_flag[14:12];
			4'b0100: overflow_reg <= |overflow_flag[14:11];
			4'b0101: overflow_reg <= |overflow_flag[14:10];
			4'b0110: overflow_reg <= |overflow_flag[14:9];
			4'b0111: overflow_reg <= |overflow_flag[14:8];
			4'b1000: overflow_reg <= |overflow_flag[14:7];
			4'b1001: overflow_reg <= |overflow_flag[14:6];
			4'b1010: overflow_reg <= |overflow_flag[14:5];
			4'b1011: overflow_reg <= |overflow_flag[14:4];
			4'b1100: overflow_reg <= |overflow_flag[14:3];
			4'b1101: overflow_reg <= |overflow_flag[14:2];
			4'b1110: overflow_reg <= |overflow_flag[14:1];
			4'b1111: overflow_reg <= |overflow_flag[14:0];
			default: overflow_reg <= 1'b0;
			endcase		
		end
end

assign shift_din = (data_in[INBITWIDTH - 2:0]) << exp_param;

always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		shift_exp[EXPBITWIDTH - 1:0] <= {EXPBITWIDTH{1'b0}} ;
	else
		begin
			if (data_in[INBITWIDTH - 1])
				shift_exp[EXPBITWIDTH - 1:0] <= {data_in[INBITWIDTH - 1], shift_din[INBITWIDTH - 2 : INBITWIDTH - EXPBITWIDTH]}
										+ (|shift_din[INBITWIDTH - EXPBITWIDTH - 1:0]);
			else
				shift_exp[EXPBITWIDTH - 1:0] <= {data_in[INBITWIDTH - 1], shift_din[INBITWIDTH - 2 : INBITWIDTH - EXPBITWIDTH]};
		end
end

always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		shift_exp_w[EXPBITWIDTH - 1:0] <= {EXPBITWIDTH{1'b0}} ;
	else if (shift_exp[EXPBITWIDTH - 1] == 1'b1)
		shift_exp_w <= ~shift_exp + 1'b1;
	else
		shift_exp_w <=  shift_exp;
end
		
		
// assign shift_exp_w = (shift_exp[EXPBITWIDTH - 1]) ? (~shift_exp + 1'b1) : (shift_exp);

assign mult_w = shift_exp_w * mant_param;



always @(posedge clk,negedge rst)
if(rst==0)
begin
mul_w_buf<=0;
shift_exp_buf<=0;
shift_exp_buf1<=0;
end
else
begin
mul_w_buf<=mult_w;
shift_exp_buf1<=shift_exp;
shift_exp_buf<=shift_exp_buf1;
end



//assign mult = (shift_exp[EXPBITWIDTH - 1]) ? (~mult_w + 1'b1) : (mult_w);//ck 080409 change
always @(posedge clk,negedge rst)
if(rst==0)
mult[MANTBITWIDTH + EXPBITWIDTH -1 :0]<={(MANTBITWIDTH + EXPBITWIDTH){1'b0}};
else if(shift_exp_buf[EXPBITWIDTH - 1])mult<=~mul_w_buf + 1'b1;
else mult<=mul_w_buf;



always @(posedge clk,negedge rst)
if(rst==0)
begin
overflow_reg_delay<=1'b0;
overflow_reg_reg<=0;
end
else 
begin
overflow_reg_delay<=overflow_reg;
overflow_reg_reg<=overflow_reg_delay;
end

always @(posedge clk,negedge rst)
if(rst==0)shift_exp_reg<={EXPBITWIDTH{1'b0}};
else
shift_exp_reg<=shift_exp_buf;


//end of ck change


assign sum[MANTBITWIDTH + EXPBITWIDTH: 0] = {mult[MANTBITWIDTH + EXPBITWIDTH - 1],mult[MANTBITWIDTH + EXPBITWIDTH - 1 : 0]} + {shift_exp_reg[EXPBITWIDTH - 1],shift_exp_reg[EXPBITWIDTH - 1 : 0], {MANTBITWIDTH{1'b0}}};//080409 ck change shift_exp to shift_exp_reg;ck080504change



always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		firgain_result[OUTBITWIDTH - 1 : 0] <= {OUTBITWIDTH{1'b0}};
	else
		begin
			if ((overflow_reg_reg) | (sum[MANTBITWIDTH + EXPBITWIDTH] ^ sum[MANTBITWIDTH + EXPBITWIDTH - 1]))
			begin
				if (sum[MANTBITWIDTH + EXPBITWIDTH] == 1'b1)				
					firgain_result[OUTBITWIDTH - 1 : 0] <= {sum[MANTBITWIDTH + EXPBITWIDTH], {(OUTBITWIDTH - 1){1'b0}}};
				else
					firgain_result[OUTBITWIDTH - 1 : 0] <= {{sum[MANTBITWIDTH + EXPBITWIDTH]}, {(OUTBITWIDTH - 1){1'b1}}};
			end
			else
				firgain_result[OUTBITWIDTH - 1 : 0] <= {sum[MANTBITWIDTH + EXPBITWIDTH], sum[MANTBITWIDTH + EXPBITWIDTH - 2 : MANTBITWIDTH + EXPBITWIDTH - OUTBITWIDTH]};
		end
end


//ck 080410 add
always @(posedge clk, negedge rst)
begin
	if(rst==1'b0)
	begin
	firgain_resultI_reg<={OUTBITWIDTH{1'b0}};
	firgain_resultQ<={OUTBITWIDTH{1'b0}};
	firgain_resultI_flag_reg<=1'b0;
	firgain_resultQ_flag<=1'b0;
	end
	else if(dataI_flag_delay[5]==1'b1)
	begin
	firgain_resultI_reg<=firgain_result;
	firgain_resultI_flag_reg<=1'b1;
	//firgain_resultQ<={OUTBITWIDTH{1'b0}};
	firgain_resultQ_flag<=1'b0;
	end
	else if(dataQ_flag_delay[6]==1'b1)
	begin
	firgain_resultQ<=firgain_result;
	firgain_resultQ_flag<=1'b1;
	//firgain_resultI_reg<={OUTBITWIDTH{1'b0}};
	firgain_resultI_flag_reg<=1'b0;
	end
	else 
	begin
	//firgain_resultQ<={OUTBITWIDTH{1'b0}};
	firgain_resultQ_flag<=1'b0;
	//firgain_resultI_reg<={OUTBITWIDTH{1'b0}};
	firgain_resultI_flag_reg<=1'b0;
	end
	end
	
	always @(posedge clk, negedge rst)
begin
	if(rst==1'b0)
	begin
	firgain_resultI<={OUTBITWIDTH{1'b0}};
	firgain_resultI_flag<=1'b0;
   end
   else
   begin
   firgain_resultI<=firgain_resultI_reg;
	firgain_resultI_flag<=firgain_resultI_flag_reg;
   end   
end
					
		

	        
endmodule		
       

                       

                       
                        
                        
                        
                        
                        
                        
                        
                        
                        