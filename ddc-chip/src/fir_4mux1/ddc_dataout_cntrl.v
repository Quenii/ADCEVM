// File Name: 			ddc_dataout_cntrl.v													//
// Description:																				//
//																							//


`timescale 1ns/1ns

module ddc_dataout_cntrl #( parameter	ADBITWIDTH = 16 )
					(	input clk , 
						input rst ,
						input para_ser_sel ,	// (default 1 -- parallel, 0 -- serial) 
						input ddc_flaga ,
						input ddc_flagb ,
						input ddc_flagc ,
						input ddc_flagd ,
						input [ADBITWIDTH - 1:0] channel_a_i_data ,
						input [ADBITWIDTH - 1:0] channel_a_q_data ,
						input [ADBITWIDTH - 1:0] channel_b_i_data ,
						input [ADBITWIDTH - 1:0] channel_b_q_data ,
						input [ADBITWIDTH - 1:0] channel_c_i_data ,
						input [ADBITWIDTH - 1:0] channel_c_q_data ,
						input [ADBITWIDTH - 1:0] channel_d_i_data ,
						input [ADBITWIDTH - 1:0] channel_d_q_data ,

						output reg[ADBITWIDTH - 1:0] ca_iq_data ,	// multiplex for serial I output
						output reg[ADBITWIDTH - 1:0] cb_iq_data ,	// multiplex for serial Q output
						output reg[ADBITWIDTH - 1:0] cc_iq_data ,
						output reg[ADBITWIDTH - 1:0] cd_iq_data ,
						output reg iq_flaga ,
						output reg iq_flagb ,
						output reg iq_flagc ,			// multiplex for channel index msb
						output reg iq_flagd ,			// multiplex for channel index lsb
						output reg data_flaga ,
						output reg data_flagb ,
						output reg data_flagc ,			
						output reg data_flagd	) ;		


	// wire and register declaration
	reg [ADBITWIDTH - 1:0] ca_q_data_buf0 ;
	
	reg [ADBITWIDTH - 1:0] cb_i_data_buf0 ;
	reg [ADBITWIDTH - 1:0] cb_q_data_buf0 ;	
	
	reg [ADBITWIDTH - 1:0] cc_i_data_buf0 ;
	reg [ADBITWIDTH - 1:0] cc_q_data_buf0 ;
	reg [ADBITWIDTH - 1:0] cc_i_data_buf1 ;
	reg [ADBITWIDTH - 1:0] cc_q_data_buf1 ;
	
	reg [ADBITWIDTH - 1:0] cd_i_data_buf0 ;
	reg [ADBITWIDTH - 1:0] cd_q_data_buf0 ;
	reg [ADBITWIDTH - 1:0] cd_i_data_buf1 ;
	reg [ADBITWIDTH - 1:0] cd_q_data_buf1 ;
	reg [ADBITWIDTH - 1:0] cd_i_data_buf2 ;
	reg [ADBITWIDTH - 1:0] cd_q_data_buf2 ;
	
	reg [2:0] ddc_flaga_buf ;
	reg [2:0] ddc_flagb_buf ;
	reg [2:0] ddc_flagc_buf ;
	reg [2:0] ddc_flagd_buf ;


//----------------------------main programme begin here-----------------------------------

//--------------------------------------
// I/Q data multiplex parallel output //
//--------------------------------------

// buffer ddc Q data and ddc_flag
always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		begin
			ca_q_data_buf0[ADBITWIDTH - 1:0]	<= {ADBITWIDTH{1'b0}} ;	
			
			cb_i_data_buf0[ADBITWIDTH - 1:0]	<= {ADBITWIDTH{1'b0}} ;
			cb_q_data_buf0[ADBITWIDTH - 1:0]	<= {ADBITWIDTH{1'b0}} ;	
			
			cc_i_data_buf0[ADBITWIDTH - 1:0]	<= {ADBITWIDTH{1'b0}} ;
			cc_q_data_buf0[ADBITWIDTH - 1:0]	<= {ADBITWIDTH{1'b0}} ;	
			cc_i_data_buf1[ADBITWIDTH - 1:0]	<= {ADBITWIDTH{1'b0}} ;
			cc_q_data_buf1[ADBITWIDTH - 1:0]	<= {ADBITWIDTH{1'b0}} ;	
			
			cd_i_data_buf0[ADBITWIDTH - 1:0]	<= {ADBITWIDTH{1'b0}} ;
			cd_q_data_buf0[ADBITWIDTH - 1:0]	<= {ADBITWIDTH{1'b0}} ;
			cd_i_data_buf1[ADBITWIDTH - 1:0]	<= {ADBITWIDTH{1'b0}} ;
			cd_q_data_buf1[ADBITWIDTH - 1:0]	<= {ADBITWIDTH{1'b0}} ;
			cd_i_data_buf2[ADBITWIDTH - 1:0]	<= {ADBITWIDTH{1'b0}} ;
			cd_q_data_buf2[ADBITWIDTH - 1:0]	<= {ADBITWIDTH{1'b0}} ;

			ddc_flaga_buf[2:0] 					<= 3'b000 ;
			ddc_flagb_buf[2:0] 					<= 3'b000 ;
			ddc_flagc_buf[2:0] 					<= 3'b000 ;
			ddc_flagd_buf[2:0] 					<= 3'b000 ;
		end
	else
		begin
			ca_q_data_buf0[ADBITWIDTH - 1:0]	<= channel_a_q_data[ADBITWIDTH - 1:0] ;
			
			cb_i_data_buf0[ADBITWIDTH - 1:0]	<= channel_b_i_data[ADBITWIDTH - 1:0] ;
			cb_q_data_buf0[ADBITWIDTH - 1:0]	<= channel_b_q_data[ADBITWIDTH - 1:0] ;	
			
			cc_i_data_buf0[ADBITWIDTH - 1:0]	<= channel_c_i_data[ADBITWIDTH - 1:0] ;
			cc_q_data_buf0[ADBITWIDTH - 1:0]	<= channel_c_q_data[ADBITWIDTH - 1:0] ;
			cc_i_data_buf1[ADBITWIDTH - 1:0]	<= cc_i_data_buf0[ADBITWIDTH - 1:0] ;
			cc_q_data_buf1[ADBITWIDTH - 1:0]	<= cc_q_data_buf0[ADBITWIDTH - 1:0] ;
			
			cd_i_data_buf0[ADBITWIDTH - 1:0]	<= channel_d_i_data[ADBITWIDTH - 1:0] ;
			cd_q_data_buf0[ADBITWIDTH - 1:0]	<= channel_d_q_data[ADBITWIDTH - 1:0] ;
			cd_i_data_buf1[ADBITWIDTH - 1:0]	<= cd_i_data_buf0[ADBITWIDTH - 1:0] ;
			cd_q_data_buf1[ADBITWIDTH - 1:0]	<= cd_q_data_buf0[ADBITWIDTH - 1:0] ;
			cd_i_data_buf2[ADBITWIDTH - 1:0]	<= cd_i_data_buf1[ADBITWIDTH - 1:0] ;
			cd_q_data_buf2[ADBITWIDTH - 1:0]	<= cd_q_data_buf1[ADBITWIDTH - 1:0] ;

			ddc_flaga_buf[2:0] 					<= {ddc_flaga_buf[1:0], ddc_flaga} ;
			ddc_flagb_buf[2:0] 					<= {ddc_flagb_buf[1:0], ddc_flagb} ;
			ddc_flagc_buf[2:0] 					<= {ddc_flagc_buf[1:0], ddc_flagc} ;
			ddc_flagd_buf[2:0] 					<= {ddc_flagd_buf[1:0], ddc_flagd} ;
		end
end


// I/Q multiplex
always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0)
		begin
			ca_iq_data[ADBITWIDTH - 1:0] 	<= {ADBITWIDTH{1'b0}} ;
			cb_iq_data[ADBITWIDTH - 1:0] 	<= {ADBITWIDTH{1'b0}} ;
			cc_iq_data[ADBITWIDTH - 1:0] 	<= {ADBITWIDTH{1'b0}} ;
			cd_iq_data[ADBITWIDTH - 1:0] 	<= {ADBITWIDTH{1'b0}} ;
			data_flaga						<= 1'b0 ;
			data_flagb						<= 1'b0 ;
			data_flagc						<= 1'b0 ;
			data_flagd						<= 1'b0 ;
			iq_flaga						<= 1'b0;
			iq_flagb						<= 1'b0;
			iq_flagc						<= 1'b0;
			iq_flagd						<= 1'b0;
		end
	else
	
		// parallel I/Q multiplex output
		if (para_ser_sel == 1'b1) begin
			// channel a
			if (ddc_flaga == 1'b1)
				begin
					ca_iq_data[ADBITWIDTH - 1:0]	<= channel_a_i_data[ADBITWIDTH - 1:0] ;
					data_flaga						<= 1'b1 ;
					iq_flaga						<= 1'b1;
				end 
			else if (ddc_flaga_buf[0] == 1'b1)
				begin
					ca_iq_data[ADBITWIDTH - 1:0]	<= ca_q_data_buf0[ADBITWIDTH - 1:0] ;
					data_flaga						<= 1'b1 ;
					iq_flaga						<= 1'b0 ;
				end 
			else
				begin
					ca_iq_data[ADBITWIDTH - 1:0] 	<= {ADBITWIDTH{1'b0}} ;
					data_flaga						<= 1'b0 ; 
					iq_flaga						<= 1'b0;
				end

			// channel b
			if (ddc_flagb == 1'b1)
				begin
					cb_iq_data[ADBITWIDTH - 1:0]	<= channel_b_i_data[ADBITWIDTH - 1:0] ;
					data_flagb						<= 1'b1 ; 
					iq_flagb						<= 1'b1;
				end 
			else if (ddc_flagb_buf[0] == 1'b1)
				begin
					cb_iq_data[ADBITWIDTH - 1:0]	<= cb_q_data_buf0[ADBITWIDTH - 1:0] ;
					data_flagb						<= 1'b1 ;
					iq_flagb						<= 1'b0;
				end 
			else
				begin
					cb_iq_data[ADBITWIDTH - 1:0] 	<= {ADBITWIDTH{1'b0}} ;
					data_flagb						<= 1'b0 ;
					iq_flagb						<= 1'b0;
				end

			// channel c
			if (ddc_flagc == 1'b1)
				begin
					cc_iq_data[ADBITWIDTH - 1:0]	<= channel_c_i_data[ADBITWIDTH - 1:0] ;
					data_flagc						<= 1'b1 ;
					iq_flagc						<= 1'b1;
				end 
			else if (ddc_flagc_buf[0] == 1'b1)
				begin
					cc_iq_data[ADBITWIDTH - 1:0]	<= cc_q_data_buf0[ADBITWIDTH - 1:0] ;
					data_flagc						<= 1'b1 ;
					iq_flagc						<= 1'b0;
				end 
			else
				begin
					cc_iq_data[ADBITWIDTH - 1:0] 	<= {ADBITWIDTH{1'b0}} ;
					data_flagc						<= 1'b0 ;
					iq_flagc						<= 1'b0;
				end

			// channel d
			if (ddc_flagd == 1'b1)
				begin
					cd_iq_data[ADBITWIDTH - 1:0]	<= channel_d_i_data[ADBITWIDTH - 1:0] ;
					data_flagd						<= 1'b1 ;
					iq_flagd						<= 1'b1;
				end 
			else if (ddc_flagd_buf[0] == 1'b1)
				begin
					cd_iq_data[ADBITWIDTH - 1:0]	<= cd_q_data_buf0[ADBITWIDTH - 1:0] ;
					data_flagd						<= 1'b1 ;
					iq_flagd						<= 1'b0;
				end 
			else
				begin
					cd_iq_data[ADBITWIDTH - 1:0] 	<= {ADBITWIDTH{1'b0}} ;
					data_flagd						<= 1'b0 ;
					iq_flagd						<= 1'b0;
				end
			end
		

		// serial(four channel multiplex to one channel) I/Q multiplex output
		else begin
			if (ddc_flaga == 1'b1)
				begin
					ca_iq_data[ADBITWIDTH - 1:0]	<= channel_a_i_data[ADBITWIDTH - 1:0] ;
					cb_iq_data[ADBITWIDTH - 1:0]	<= channel_a_q_data[ADBITWIDTH - 1:0] ;
					data_flaga						<= 1'b1 ;
					data_flagb						<= 1'b1 ;
					iq_flaga						<= 1'b0;
					iq_flagb						<= 1'b0;
				end
			else if(ddc_flaga_buf[0] == 1'b1)
				begin
					ca_iq_data[ADBITWIDTH - 1:0]	<= cb_i_data_buf0[ADBITWIDTH - 1:0] ;
					cb_iq_data[ADBITWIDTH - 1:0]	<= cb_q_data_buf0[ADBITWIDTH - 1:0] ;
					data_flaga						<= 1'b1 ;
					data_flagb						<= 1'b1 ; 
					iq_flaga						<= 1'b0;
					iq_flagb						<= 1'b1;
				end
			else if(ddc_flaga_buf[1] == 1'b1)
				begin
					ca_iq_data[ADBITWIDTH - 1:0]	<= cc_i_data_buf1[ADBITWIDTH - 1:0] ;
					cb_iq_data[ADBITWIDTH - 1:0]	<= cc_q_data_buf1[ADBITWIDTH - 1:0] ;
					data_flaga						<= 1'b1 ;
					data_flagb						<= 1'b1 ;
					iq_flaga						<= 1'b1;
					iq_flagb						<= 1'b0;
				end
			else if (ddc_flaga_buf[2] == 1'b1)
				begin
					ca_iq_data[ADBITWIDTH - 1:0]	<= cd_i_data_buf2[ADBITWIDTH - 1:0] ;
					cb_iq_data[ADBITWIDTH - 1:0]	<= cd_q_data_buf2[ADBITWIDTH - 1:0] ;
					data_flaga						<= 1'b1 ;
					data_flagb						<= 1'b1 ;
					iq_flaga						<= 1'b1;
					iq_flagb						<= 1'b1;
				end
			else
				begin
					ca_iq_data[ADBITWIDTH - 1:0]	<= {ADBITWIDTH{1'b0}} ;
					cb_iq_data[ADBITWIDTH - 1:0]	<= {ADBITWIDTH{1'b0}} ;
					data_flaga						<= 1'b0 ;
					data_flagb						<= 1'b0 ;
					iq_flaga						<= 1'b0;
					iq_flagb						<= 1'b0;
				end
		end 
end



endmodule
