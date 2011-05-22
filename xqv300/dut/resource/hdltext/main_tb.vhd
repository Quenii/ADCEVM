-- **************************************************************
-- Owner:		Xilinx Inc.
-- File:  		main_tb.vhd
--
-- Purpose: 		Test for encoder and decoder functionality 
--			of 16 bit-wide transmission.
--	
-- Author:		Jennifer Jenkins
-- Date:		3-31-2000
--
-- ****************************************************************


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity MAIN_TB is
end MAIN_TB;


architecture BEHAVIOUR of MAIN_TB is

-- ******************** CONSTANT DECLARATIONS ***********************
constant RESET_ACTIVE 			: STD_LOGIC := '0';

-- ********************* SIGNAL DECLARATIONS ************************
signal clk, rst				: STD_LOGIC;
signal data_trs, data_rcv 		: STD_LOGIC_VECTOR(15 downto 0);
signal k_char, dis_in, dis_out		: STD_LOGIC;
signal encoded_data, serial_data	: STD_LOGIC_VECTOR(19 downto 0);
signal frame_in_enc, frame_out_enc 	: STD_LOGIC;
signal frame_in_dec, frame_out_dec 	: STD_LOGIC;
signal char_err				: STD_LOGIC;


-- ******************** COMPONENT DECLARATION ***********************

-- 16B/20B Encoder Function
component ENC_16B20B
	port(
          	clk			: in STD_LOGIC;
          	rst			: in STD_LOGIC;                     
	  	data_trs		: in STD_LOGIC_VECTOR(15 downto 0);   	-- Parallel byte of incoming data
	  	k_char			: in STD_LOGIC;				-- Asserted specifies the transmission of 
										-- a special character
	  	frame_in_enc 		: in STD_LOGIC;				-- Asserted when parallel data is stable	 
	    	dis_in			: in STD_LOGIC;			   	-- Disparity in
	  	dis_out			: out STD_LOGIC;		  	-- Disparity out
	  	serial_data		: out STD_LOGIC_VECTOR(19 downto 0);  	-- Encoded data to send out
	  	frame_out_enc		: out STD_LOGIC);			-- Asserted when data is encoded and ready
										-- to be sent through the external serializer	  
        	
end component;


-- 16B/20B Decoder Function
component DEC_16B20B
    	port(
               	clk			: in STD_LOGIC;
         	rst			: in STD_LOGIC;
               	serial_data		: in STD_LOGIC_VECTOR(19 downto 0);   	-- Incoming data to decode
	  	frame_in_dec 		: in STD_LOGIC;				-- Asserted when data is presented to decoder
	 	decoded_data		: out STD_LOGIC_VECTOR(15 downto 0);  	-- Decoded data to present
	 	frame_out_dec		: out STD_LOGIC;			-- Asserted when data is decoded
		ill_char_det		: out STD_LOGIC);			-- Asserted when illegal character is transmitted						-- to be sent through the external serializer	  
	  	
end component;


-- 16B/20B Test Function Generator
component TST_16B20B
	port(

		clk20			: inout	STD_LOGIC;			-- Local clock to encoder & decoder @ 20MHz	
		sync_reset		: out	STD_LOGIC;			-- Control signals to encoder
		
		data_trs		: out	STD_LOGIC_VECTOR (15 downto 0);	-- Date byte to encode
		k_char			: out 	STD_LOGIC;			-- Asserted denotes special 
										-- character transmission									
		disparity		: out	STD_LOGIC;			-- Denotes incoming parity
		run_dis			: in	STD_LOGIC;			-- Running disparity
		frame_to_enc		: inout	STD_LOGIC;			-- Control to start data encoding
		frame_out_enc		: in	STD_LOGIC;			-- Asserted - done with encoding
	
		
		data_rcv		: in	STD_LOGIC_VECTOR (15 downto 0);	-- Incoming data from decoder
		frame_in_dec		: out 	STD_LOGIC;			-- Control to start decoding
		frame_out_dec		: in	STD_LOGIC;			-- Asserted => done decoding
		data_from_enc		: in 	STD_LOGIC_VECTOR (19 downto 0);	-- Data transfer from encoder
		data_to_dec		: out	STD_LOGIC_VECTOR (19 downto 0); -- Serial data to decoder
		ill_char_det		: in 	STD_LOGIC);			-- Asserted when illegal char detected	
		
end component;


begin

	-- ***************** COMPONENT ASSIGNMENTS *********************
	ENC: ENC_16B20B
		port map(
          		clk		=> clk,			
        		rst		=> rst,
			data_trs	=> data_trs,
		  	k_char		=> k_char,
	  		frame_in_enc 	=> frame_in_enc,	  
	  		dis_in		=> dis_in,			   	
	  		dis_out		=> dis_out,		  		
	  		serial_data	=> encoded_data, 
	  		frame_out_enc	=> frame_out_enc);


	DEC: DEC_16B20B	
		port map(	
			clk		=> clk,			
        		rst		=> rst,
 			serial_data	=> serial_data,
			frame_in_dec 	=> frame_in_dec,		  	 
	  		decoded_data	=> data_rcv,
	 		frame_out_dec	=> frame_out_dec,			  
	  		ill_char_det	=> char_err);	

							
	TB: TST_16B20B
		port map(
			clk20		=> clk,
			sync_reset	=> rst,		
			data_trs	=> data_trs,
			k_char		=> k_char,										
			disparity	=> dis_in,
			run_dis		=> dis_out,
			frame_to_enc	=> frame_in_enc,
			frame_out_enc	=> frame_out_enc,
			data_rcv	=> data_rcv,
			frame_in_dec	=> frame_in_dec,
			frame_out_dec	=> frame_out_dec,
			data_from_enc	=> encoded_data,
			data_to_dec	=> serial_data,
			ill_char_det	=> char_err);
  
   
end BEHAVIOUR;










