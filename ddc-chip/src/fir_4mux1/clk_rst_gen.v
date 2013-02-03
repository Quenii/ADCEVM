   module clk_rst_gen(	input rst_in,
			input clk_in,
			input decimgain_config_indicator_a,
			input config_sync,
			input m0,
			input start,
			input [2:0]decimgain_param_a,//[10:8]
			
			output rst,
			output rst_start,
			output rst_m0,
			
			output clk,
			
			output dpllreconfig_busy_test,
			output clk_div2_test,
			output [1:0] pllconfig_data_in_test,
			output pll_areset_test,
			output pll_scanclk_test,
			output pll_scandata_test,
			output pll_scandataout_test,
			output pll_scandone_test,
			output pll_scanread_test,
			output pll_scanwrite_test,
			output dpllconfig_reconfig_test,
			output pllconfig_reconfig_test,
			output [15:0]config_sync_delay_test,
			output rst_pllconfig_test,
			output pllconfig_write_param_test,
			output [1:0]dpllconfig_data_in_test,
			output  locked,
	        output pll_areset,
	        output dpllconfig_write_param_flag_test,
	        output dpllconfig_write_param_test
			
	
			);

		
wire decimgain_config_indicator_a_buf;
wire config_sync_buf;
			
wire [2:0]decimgain_param_a_buf;//[10:8]		
reg clk_div2;
reg [15:0] config_sync_delay;
reg dpll0_reconfig_en;
reg [1:0]dpllconfig_data_in;
reg  dpllconfig_write_param;
reg dpllconfig_write_param_flag;

reg dpllconfig_reconfig_flag;
reg dpllconfig_reconfig;

wire rst_pllconfig;
wire rst_div2;
//wire pll_areset;
wire pllconfig_reconfig;
//wire dpllconfig_reconfig;

wire pllconfig_write_param;
wire [1:0]pllconfig_data_in;

wire dpllreconfig_busy;
wire pll_reset;    
wire pll_scanclk	;	
wire pll_scandata    ;
wire pll_scandataout ;
wire pll_scandone    ;
wire pll_scanread    ;
wire pll_scanwrite   ;

assign dpllreconfig_busy_test=dpllreconfig_busy;
assign clk_div2_test=clk_div2;
assign pllconfig_data_in_test=pllconfig_data_in;
assign pll_areset_test=pll_areset;
assign pll_scanclk_test=pll_scanclk;
assign pll_scandata_test=pll_scandata;
assign pll_scandataout_test=pll_scandataout;
assign pll_scandone_test=pll_scandone;
assign pll_scanread_test=pll_scanread;
assign pll_scanwrite_test=pll_scanwrite;
assign pllconfig_reconfig_test=pllconfig_reconfig;
assign rst_pllconfig_test=rst_pllconfig;
assign pllconfig_write_param_test=pllconfig_write_param;
assign dpllconfig_data_in_test = dpllconfig_data_in;
assign dpllconfig_reconfig_test = dpllconfig_reconfig;
assign config_sync_delay_test = config_sync_delay;
		
assign dpllconfig_write_param_test=dpllconfig_write_param;
assign dpllconfig_write_param_flag_test=dpllconfig_write_param_flag ;	
		

always  @(posedge clk_in, negedge rst_div2)
begin
	if (rst_div2 ==1'b0)
		clk_div2 <= 1'b0;
	else
		clk_div2 <= ~clk_div2;
end

async_clk_div2_sync
			async_clk_div2_sync_inst5(	.rst(~rst_pllconfig),
				                        .clk_div2(clk_in),
							.async_clk_data(decimgain_param_a[0]),
							.sync_div2_data(decimgain_param_a_buf[0]));
async_clk_div2_sync
			async_clk_div2_sync_inst8(	.rst(~rst_pllconfig),
				                        .clk_div2(clk_in),
							.async_clk_data(decimgain_param_a[1]),
							.sync_div2_data(decimgain_param_a_buf[1]));
async_clk_div2_sync
			async_clk_div2_sync_inst9(	.rst(~rst_pllconfig),
				                        .clk_div2(clk_in),
							.async_clk_data(decimgain_param_a[2]),
							.sync_div2_data(decimgain_param_a_buf[2]));
							
async_clk_div2_sync
			async_clk_div2_sync_inst6(	.rst(~rst_pllconfig),
				                        .clk_div2(clk_in),
							.async_clk_data(decimgain_config_indicator_a),
							.sync_div2_data(decimgain_config_indicator_a_buf));
async_clk_div2_sync
			async_clk_div2_sync_inst7(	.rst(~rst_pllconfig),
				                        .clk_div2(clk_in),
							.async_clk_data(config_sync),
							.sync_div2_data(config_sync_buf));


always @(posedge clk_in or posedge rst_pllconfig)
begin
	if(rst_pllconfig == 1'b1)
		begin
			dpll0_reconfig_en <= 1'b0;
			dpllconfig_data_in[1:0] <= 2'b00; 
				
		end
	else if(decimgain_config_indicator_a_buf == 1'b1)
		begin
			dpll0_reconfig_en <= decimgain_param_a_buf[2];
			dpllconfig_data_in[1:0] <= decimgain_param_a_buf[1:0];
			
		end
	else
		begin
			dpll0_reconfig_en <= dpll0_reconfig_en;
			dpllconfig_data_in[1:0] <= dpllconfig_data_in[1:0];
			
		end
end

always @(posedge clk_in or posedge rst_pllconfig)
begin
	if(rst_pllconfig == 1'b1)
		begin
			dpllconfig_write_param_flag <= 1'b0;
			dpllconfig_write_param <= 1'b0;			
		end
	else if(decimgain_config_indicator_a_buf == 1'b1)
		begin
			dpllconfig_write_param_flag <= 1'b1;
			dpllconfig_write_param <= 1'b1;
		end
	else if (dpllconfig_write_param_flag == 1'b1)
		begin
			dpllconfig_write_param <= 1'b1;
			dpllconfig_write_param_flag <= 1'b0;
		end
	else
	   begin
	      dpllconfig_write_param <= 1'b0;
			dpllconfig_write_param_flag <= 1'b0;
  end 
end





//assign dpllconfig_reconfig = dpll0_reconfig_en & config_sync_delay[15];

always @(posedge clk_in or posedge rst_pllconfig)
begin
	if(rst_pllconfig==1)
		config_sync_delay[15:0] <= 16'h0000;
	else
		config_sync_delay[15:0] <= {config_sync_delay[14:0],config_sync_buf};
end

always @ (posedge clk_in or posedge rst_pllconfig)
begin
	if(rst_pllconfig==1)
	begin
		dpllconfig_reconfig <= 1'b0;
		dpllconfig_reconfig_flag <= 1'b0;
	end
	else if (dpll0_reconfig_en & config_sync_delay[15])
		begin
			dpllconfig_reconfig <= 1'b1;
			dpllconfig_reconfig_flag <= 1'b1;
		end
	else if (dpllconfig_reconfig_flag == 1'b1)
		begin
			dpllconfig_reconfig <= 1'b1;
			dpllconfig_reconfig_flag <= 1'b0;
		end
	else
		begin
			dpllconfig_reconfig <= 1'b0;
			dpllconfig_reconfig_flag <= 1'b0;
		end
end
	
async_clk_div2_sync
			async_clk_div2_sync_inst1(	.rst(~rst_pllconfig),
				                        .clk_div2(clk_div2),
							.async_clk_data(dpllconfig_reconfig),
							.sync_div2_data(pllconfig_reconfig));
async_clk_div2_sync
			async_clk_div2_sync_inst2(	.rst(~rst_pllconfig),
				                        .clk_div2(clk_div2),
							.async_clk_data(dpllconfig_write_param),
							.sync_div2_data(pllconfig_write_param));
async_clk_div2_sync
			async_clk_div2_sync_inst3(	.rst(~rst_pllconfig),
				                        .clk_div2(clk_div2),
							.async_clk_data(dpllconfig_data_in[1]),
							.sync_div2_data(pllconfig_data_in[1]));

async_clk_div2_sync
			async_clk_div2_sync_inst4(	.rst(~rst_pllconfig),
				                        .clk_div2(clk_div2),
							.async_clk_data(dpllconfig_data_in[0]),
							.sync_div2_data(pllconfig_data_in[0]));





rst_gen u_rst_gen(
	.clk(clk),//080605 ck change
	.clk_in(clk_in),
	.rst_in(rst_in),
	.rst(rst),
	.m0(m0),
	.start(start),
	
	.rst_start(rst_start),
	.rst_m0(rst_m0),
	.rst_div2(rst_div2),
	//.rst_clkin(rst_clkin),
	//.channel_rst(channel_rst),
	.rst_pllconfig(rst_pllconfig)
	);
	




dpll0_reconfig u_dpll0_reconfig_pllrcfg_gr11
	( 
	.busy(dpllreconfig_busy),
	.clock(clk_div2),
	.counter_param('h2),
	.counter_type('h4),
	.data_in({{7{1'b0}},{pllconfig_data_in[1:0]}}),
	//.data_out(),
	.pll_areset(pll_areset),
	//.pll_areset_in(),
	//.pll_scanaclr(),
	.pll_scanclk(pll_scanclk),
	.pll_scandata(pll_scandata),
	.pll_scandataout(pll_scandataout),
	.pll_scandone(pll_scandone),
	.pll_scanread(pll_scanread),
	.pll_scanwrite(pll_scanwrite),
	//.read_param(),
	.reconfig(pllconfig_reconfig),
	.reset(rst_pllconfig),
	.write_param(pllconfig_write_param)
	);
	
	//wire locked;
	//wire  pll_areset;
	
	dpll0	u_dpll0(
	.areset (pll_areset),//1'b0
	.inclk0 ( clk_in ),
	.scanclk ( pll_scanclk ),
	.scandata ( pll_scandata ),
	.scanread ( pll_scanread ),
	.scanwrite ( pll_scanwrite ),
	.c0 ( clk ),
//	.c1 (ca_sync_clk),
//	.c2 (cb_sync_clk),
//	.c3 (cc_sync_clk),
//	.c4 (cd_sync_clk),
	.locked ( locked ),
	.scandataout ( pll_scandataout ),
	.scandone ( pll_scandone )
	);

endmodule