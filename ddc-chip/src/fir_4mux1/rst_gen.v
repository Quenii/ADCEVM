// File Name: 			fifo_rst_gen.v														//
// Company:				CETC14						//


`timescale 1ns / 1ns

module rst_gen (
	input clk,
	input clk_in,
	input rst_in, 
	//input clk_sel,
//	input pll_locked,
	//input [15:0] rst_channel_parama,
//	input rst_channela_config_indicator,
	input m0,
	input start,
	
	output  rst,
	output  rst_m0,
	output  rst_start,
	
	output  rst_div2,
	
	
	//output  reg channel_rst,
	output  rst_pllconfig
	);
 	
	// register declaraion
	wire rst_w;
	wire rst_in_w;
	wire rst_m0_w;
	wire rst_start_w;
	reg channel_rst_buf;
	
	reg [3:0]rst_buf;
	reg [3:0]rst_reg1;
	
	reg [3:0]m0_buf;
	wire m0_buf1;
	reg [3:0]start_buf;
	wire start_buf1;
	
	
	
//----------------------------main programme begin here-----------------------------------

async_low_rst_sync
	async_low_rst_sync_inst1(.clk(clk),
							.async_rst(rst_in),
							.sync_rst(rst_in_w));
							
async_low_rst_sync
	async_low_rst_sync_inst2(.clk(clk_in),
							.async_rst(rst_in),
							.sync_rst(rst_div2));
							
async_low_rst_sync
	async_low_rst_sync_inst3(.clk(clk),
							.async_rst(m0),
							.sync_rst(rst_m0_w));

async_low_rst_sync
	async_low_rst_sync_inst4(.clk(clk),
							.async_rst(start),
							.sync_rst(rst_start_w));
assign rst_w = rst_in_w;

assign m0_buf1 = rst_w & rst_m0_w & rst_start_w;
	  
assign start_buf1 = rst_w & rst_start_w;

async_low_rst_sync
	async_low_rst_sync_inst5(.clk(clk),
							.async_rst(rst_w),
							.sync_rst(rst));

							
async_low_rst_sync
	async_low_rst_sync_inst6(.clk(clk),
							.async_rst(m0_buf1),
							.sync_rst(rst_m0));

async_low_rst_sync
	async_low_rst_sync_inst7(.clk(clk),
							.async_rst(start_buf1),
							.sync_rst(rst_start));
							

async_low_rst_sync_6tap
	async_low_rst_sync_inst(.clk(clk_in),
							.async_rst(~rst_in),
							.sync_rst(rst_pllconfig));


//always @(posedge clk)
//	begin
//			rst_buf <= rst_w;	  
//			rst <= rst_buf;
//	end
//	
//always @(posedge clk)
//	begin
//			m0_buf <= m0_buf1;	  
//			rst_m0 <= m0_buf;
//	end
//	
//always @(posedge clk)
//	begin
//			start_buf <= start_buf1;	  
//			rst_start <= start_buf;
//	end



	
//always @(posedge clk)
//	begin
//			
//	end
	

//always @(posedge clk)
//	begin
//			rst_buf <= rst_w;	  
//			rst <= rst_buf;
//	end
	

// channel_rst output

//always @(posedge clk, negedge rst)
//	begin
//		if (rst== 1'b0) channel_rst_buf <= 1'b0;
//		else if (rst_channela_config_indicator == 1'b1)
//			begin 
//				channel_rst_buf <= rst_channel_parama[0];
//			end
//		else channel_rst_buf <= channel_rst_buf;		
//	end
//	
//always @(posedge clk, negedge rst)	
//if(rst==0)
//channel_rst<=0;
//else
//channel_rst <= rst & (~channel_rst_buf);

endmodule