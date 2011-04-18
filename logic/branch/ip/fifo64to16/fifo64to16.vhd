-- megafunction wizard: %FIFO%
-- GENERATION: STANDARD
-- VERSION: WM1.0
-- MODULE: dcfifo_mixed_widths 

-- ============================================================
-- File Name: fifo64to16.vhd
-- Megafunction Name(s):
-- 			dcfifo_mixed_widths
--
-- Simulation Library Files(s):
-- 			altera_mf
-- ============================================================
-- ************************************************************
-- THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
--
-- 8.0 Build 231 07/10/2008 SP 1 SJ Full Version
-- ************************************************************


--Copyright (C) 1991-2008 Altera Corporation
--Your use of Altera Corporation's design tools, logic functions 
--and other software and tools, and its AMPP partner logic 
--functions, and any output files from any of the foregoing 
--(including device programming or simulation files), and any 
--associated documentation or information are expressly subject 
--to the terms and conditions of the Altera Program License 
--Subscription Agreement, Altera MegaCore Function License 
--Agreement, or other applicable license agreement, including, 
--without limitation, that your use is for the sole purpose of 
--programming logic devices manufactured by Altera and sold by 
--Altera or its authorized distributors.  Please refer to the 
--applicable agreement for further details.


LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY altera_mf;
USE altera_mf.all;

ENTITY fifo64to16 IS
	PORT
	(
		aclr		: IN STD_LOGIC  := '0';
		data		: IN STD_LOGIC_VECTOR (63 DOWNTO 0);
		rdclk		: IN STD_LOGIC ;
		rdreq		: IN STD_LOGIC ;
		wrclk		: IN STD_LOGIC ;
		wrreq		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
		rdempty		: OUT STD_LOGIC ;
		rdusedw		: OUT STD_LOGIC_VECTOR (14 DOWNTO 0);
		wrfull		: OUT STD_LOGIC ;
		wrusedw		: OUT STD_LOGIC_VECTOR (12 DOWNTO 0)
	);
END fifo64to16;


ARCHITECTURE SYN OF fifo64to16 IS

	SIGNAL sub_wire0	: STD_LOGIC ;
	SIGNAL sub_wire1	: STD_LOGIC_VECTOR (12 DOWNTO 0);
	SIGNAL sub_wire2	: STD_LOGIC ;
	SIGNAL sub_wire3	: STD_LOGIC_VECTOR (15 DOWNTO 0);
	SIGNAL sub_wire4	: STD_LOGIC_VECTOR (14 DOWNTO 0);



	COMPONENT dcfifo_mixed_widths
	GENERIC (
		intended_device_family		: STRING;
		lpm_numwords		: NATURAL;
		lpm_showahead		: STRING;
		lpm_type		: STRING;
		lpm_width		: NATURAL;
		lpm_widthu		: NATURAL;
		lpm_widthu_r		: NATURAL;
		lpm_width_r		: NATURAL;
		overflow_checking		: STRING;
		rdsync_delaypipe		: NATURAL;
		underflow_checking		: STRING;
		use_eab		: STRING;
		write_aclr_synch		: STRING;
		wrsync_delaypipe		: NATURAL
	);
	PORT (
			wrclk	: IN STD_LOGIC ;
			rdempty	: OUT STD_LOGIC ;
			rdreq	: IN STD_LOGIC ;
			wrusedw	: OUT STD_LOGIC_VECTOR (12 DOWNTO 0);
			aclr	: IN STD_LOGIC ;
			wrfull	: OUT STD_LOGIC ;
			rdclk	: IN STD_LOGIC ;
			q	: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
			wrreq	: IN STD_LOGIC ;
			data	: IN STD_LOGIC_VECTOR (63 DOWNTO 0);
			rdusedw	: OUT STD_LOGIC_VECTOR (14 DOWNTO 0)
	);
	END COMPONENT;

BEGIN
	rdempty    <= sub_wire0;
	wrusedw    <= sub_wire1(12 DOWNTO 0);
	wrfull    <= sub_wire2;
	q    <= sub_wire3(15 DOWNTO 0);
	rdusedw    <= sub_wire4(14 DOWNTO 0);

	dcfifo_mixed_widths_component : dcfifo_mixed_widths
	GENERIC MAP (
		intended_device_family => "Stratix II",
		lpm_numwords => 8192,
		lpm_showahead => "ON",
		lpm_type => "dcfifo",
		lpm_width => 64,
		lpm_widthu => 13,
		lpm_widthu_r => 15,
		lpm_width_r => 16,
		overflow_checking => "ON",
		rdsync_delaypipe => 4,
		underflow_checking => "ON",
		use_eab => "ON",
		write_aclr_synch => "OFF",
		wrsync_delaypipe => 4
	)
	PORT MAP (
		wrclk => wrclk,
		rdreq => rdreq,
		aclr => aclr,
		rdclk => rdclk,
		wrreq => wrreq,
		data => data,
		rdempty => sub_wire0,
		wrusedw => sub_wire1,
		wrfull => sub_wire2,
		q => sub_wire3,
		rdusedw => sub_wire4
	);



END SYN;

-- ============================================================
-- CNX file retrieval info
-- ============================================================
-- Retrieval info: PRIVATE: AlmostEmpty NUMERIC "0"
-- Retrieval info: PRIVATE: AlmostEmptyThr NUMERIC "-1"
-- Retrieval info: PRIVATE: AlmostFull NUMERIC "0"
-- Retrieval info: PRIVATE: AlmostFullThr NUMERIC "-1"
-- Retrieval info: PRIVATE: CLOCKS_ARE_SYNCHRONIZED NUMERIC "0"
-- Retrieval info: PRIVATE: Clock NUMERIC "4"
-- Retrieval info: PRIVATE: Depth NUMERIC "8192"
-- Retrieval info: PRIVATE: Empty NUMERIC "1"
-- Retrieval info: PRIVATE: Full NUMERIC "1"
-- Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Stratix II"
-- Retrieval info: PRIVATE: LE_BasedFIFO NUMERIC "0"
-- Retrieval info: PRIVATE: LegacyRREQ NUMERIC "0"
-- Retrieval info: PRIVATE: MAX_DEPTH_BY_9 NUMERIC "0"
-- Retrieval info: PRIVATE: OVERFLOW_CHECKING NUMERIC "0"
-- Retrieval info: PRIVATE: Optimize NUMERIC "0"
-- Retrieval info: PRIVATE: RAM_BLOCK_TYPE NUMERIC "0"
-- Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
-- Retrieval info: PRIVATE: UNDERFLOW_CHECKING NUMERIC "0"
-- Retrieval info: PRIVATE: UsedW NUMERIC "1"
-- Retrieval info: PRIVATE: Width NUMERIC "64"
-- Retrieval info: PRIVATE: dc_aclr NUMERIC "1"
-- Retrieval info: PRIVATE: diff_widths NUMERIC "1"
-- Retrieval info: PRIVATE: msb_usedw NUMERIC "0"
-- Retrieval info: PRIVATE: output_width NUMERIC "16"
-- Retrieval info: PRIVATE: rsEmpty NUMERIC "1"
-- Retrieval info: PRIVATE: rsFull NUMERIC "0"
-- Retrieval info: PRIVATE: rsUsedW NUMERIC "1"
-- Retrieval info: PRIVATE: sc_aclr NUMERIC "0"
-- Retrieval info: PRIVATE: sc_sclr NUMERIC "0"
-- Retrieval info: PRIVATE: wsEmpty NUMERIC "0"
-- Retrieval info: PRIVATE: wsFull NUMERIC "1"
-- Retrieval info: PRIVATE: wsUsedW NUMERIC "1"
-- Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Stratix II"
-- Retrieval info: CONSTANT: LPM_NUMWORDS NUMERIC "8192"
-- Retrieval info: CONSTANT: LPM_SHOWAHEAD STRING "ON"
-- Retrieval info: CONSTANT: LPM_TYPE STRING "dcfifo"
-- Retrieval info: CONSTANT: LPM_WIDTH NUMERIC "64"
-- Retrieval info: CONSTANT: LPM_WIDTHU NUMERIC "13"
-- Retrieval info: CONSTANT: LPM_WIDTHU_R NUMERIC "15"
-- Retrieval info: CONSTANT: LPM_WIDTH_R NUMERIC "16"
-- Retrieval info: CONSTANT: OVERFLOW_CHECKING STRING "ON"
-- Retrieval info: CONSTANT: RDSYNC_DELAYPIPE NUMERIC "4"
-- Retrieval info: CONSTANT: UNDERFLOW_CHECKING STRING "ON"
-- Retrieval info: CONSTANT: USE_EAB STRING "ON"
-- Retrieval info: CONSTANT: WRITE_ACLR_SYNCH STRING "OFF"
-- Retrieval info: CONSTANT: WRSYNC_DELAYPIPE NUMERIC "4"
-- Retrieval info: USED_PORT: aclr 0 0 0 0 INPUT GND aclr
-- Retrieval info: USED_PORT: data 0 0 64 0 INPUT NODEFVAL data[63..0]
-- Retrieval info: USED_PORT: q 0 0 16 0 OUTPUT NODEFVAL q[15..0]
-- Retrieval info: USED_PORT: rdclk 0 0 0 0 INPUT NODEFVAL rdclk
-- Retrieval info: USED_PORT: rdempty 0 0 0 0 OUTPUT NODEFVAL rdempty
-- Retrieval info: USED_PORT: rdreq 0 0 0 0 INPUT NODEFVAL rdreq
-- Retrieval info: USED_PORT: rdusedw 0 0 15 0 OUTPUT NODEFVAL rdusedw[14..0]
-- Retrieval info: USED_PORT: wrclk 0 0 0 0 INPUT NODEFVAL wrclk
-- Retrieval info: USED_PORT: wrfull 0 0 0 0 OUTPUT NODEFVAL wrfull
-- Retrieval info: USED_PORT: wrreq 0 0 0 0 INPUT NODEFVAL wrreq
-- Retrieval info: USED_PORT: wrusedw 0 0 13 0 OUTPUT NODEFVAL wrusedw[12..0]
-- Retrieval info: CONNECT: @data 0 0 64 0 data 0 0 64 0
-- Retrieval info: CONNECT: q 0 0 16 0 @q 0 0 16 0
-- Retrieval info: CONNECT: @wrreq 0 0 0 0 wrreq 0 0 0 0
-- Retrieval info: CONNECT: @rdreq 0 0 0 0 rdreq 0 0 0 0
-- Retrieval info: CONNECT: @rdclk 0 0 0 0 rdclk 0 0 0 0
-- Retrieval info: CONNECT: @wrclk 0 0 0 0 wrclk 0 0 0 0
-- Retrieval info: CONNECT: rdempty 0 0 0 0 @rdempty 0 0 0 0
-- Retrieval info: CONNECT: rdusedw 0 0 15 0 @rdusedw 0 0 15 0
-- Retrieval info: CONNECT: wrfull 0 0 0 0 @wrfull 0 0 0 0
-- Retrieval info: CONNECT: wrusedw 0 0 13 0 @wrusedw 0 0 13 0
-- Retrieval info: CONNECT: @aclr 0 0 0 0 aclr 0 0 0 0
-- Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
-- Retrieval info: GEN_FILE: TYPE_NORMAL fifo64to16.vhd TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL fifo64to16.inc FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL fifo64to16.cmp FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL fifo64to16.bsf TRUE FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL fifo64to16_inst.vhd FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL fifo64to16_waveforms.html FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL fifo64to16_wave*.jpg FALSE
-- Retrieval info: LIB_FILE: altera_mf
