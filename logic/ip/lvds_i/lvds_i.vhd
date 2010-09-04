-- megafunction wizard: %ALTLVDS%
-- GENERATION: STANDARD
-- VERSION: WM1.0
-- MODULE: altlvds_rx 

-- ============================================================
-- File Name: lvds_i.vhd
-- Megafunction Name(s):
-- 			altlvds_rx
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

ENTITY lvds_i IS
	PORT
	(
		pll_areset		: IN STD_LOGIC  := '0';
		rx_in		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		rx_inclock		: IN STD_LOGIC  := '0';
		rx_out		: OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
		rx_outclock		: OUT STD_LOGIC 
	);
END lvds_i;


ARCHITECTURE SYN OF lvds_i IS

	SIGNAL sub_wire0	: STD_LOGIC_VECTOR (63 DOWNTO 0);
	SIGNAL sub_wire1	: STD_LOGIC ;



	COMPONENT altlvds_rx
	GENERIC (
		common_rx_tx_pll		: STRING;
		deserialization_factor		: NATURAL;
		enable_dpa_mode		: STRING;
		implement_in_les		: STRING;
		inclock_data_alignment		: STRING;
		inclock_period		: NATURAL;
		inclock_phase_shift		: NATURAL;
		input_data_rate		: NATURAL;
		intended_device_family		: STRING;
		lpm_hint		: STRING;
		lpm_type		: STRING;
		number_of_channels		: NATURAL;
		outclock_resource		: STRING;
		registered_output		: STRING;
		use_external_pll		: STRING
	);
	PORT (
			pll_areset	: IN STD_LOGIC ;
			rx_out	: OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
			rx_inclock	: IN STD_LOGIC ;
			rx_in	: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
			rx_outclock	: OUT STD_LOGIC 
	);
	END COMPONENT;

BEGIN
	rx_out    <= sub_wire0(63 DOWNTO 0);
	rx_outclock    <= sub_wire1;

	altlvds_rx_component : altlvds_rx
	GENERIC MAP (
		common_rx_tx_pll => "ON",
		deserialization_factor => 4,
		enable_dpa_mode => "OFF",
		implement_in_les => "OFF",
		inclock_data_alignment => "UNUSED",
		inclock_period => 4000,
		inclock_phase_shift => 0,
		input_data_rate => 250,
		intended_device_family => "Stratix II",
		lpm_hint => "CBX_MODULE_PREFIX=lvds_i",
		lpm_type => "altlvds_rx",
		number_of_channels => 16,
		outclock_resource => "Global Clock",
		registered_output => "ON",
		use_external_pll => "OFF"
	)
	PORT MAP (
		pll_areset => pll_areset,
		rx_inclock => rx_inclock,
		rx_in => rx_in,
		rx_out => sub_wire0,
		rx_outclock => sub_wire1
	);



END SYN;

-- ============================================================
-- CNX file retrieval info
-- ============================================================
-- Retrieval info: PRIVATE: Bitslip NUMERIC "4"
-- Retrieval info: PRIVATE: Channel_Data_Align_Max NUMERIC "0"
-- Retrieval info: PRIVATE: Channel_Data_Align_Reset NUMERIC "0"
-- Retrieval info: PRIVATE: Clock_Mode NUMERIC "0"
-- Retrieval info: PRIVATE: Data_rate STRING "250"
-- Retrieval info: PRIVATE: Deser_Factor NUMERIC "4"
-- Retrieval info: PRIVATE: Enable_DPA_Mode STRING "OFF"
-- Retrieval info: PRIVATE: Ext_PLL STRING "OFF"
-- Retrieval info: PRIVATE: INCLOCK_PHASE_SHIFT STRING "0.00"
-- Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Stratix II"
-- Retrieval info: PRIVATE: Int_Device STRING "Stratix II"
-- Retrieval info: PRIVATE: LVDS_Mode NUMERIC "1"
-- Retrieval info: PRIVATE: Le_Serdes STRING "OFF"
-- Retrieval info: PRIVATE: Num_Channel NUMERIC "16"
-- Retrieval info: PRIVATE: PLL_Enable NUMERIC "0"
-- Retrieval info: PRIVATE: PLL_Freq STRING "250.00"
-- Retrieval info: PRIVATE: PLL_Period STRING "4.000"
-- Retrieval info: PRIVATE: Reg_InOut NUMERIC "1"
-- Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
-- Retrieval info: PRIVATE: Use_Clock_Resc STRING "Global Clock"
-- Retrieval info: PRIVATE: Use_Common_Rx_Tx_Plls NUMERIC "1"
-- Retrieval info: PRIVATE: Use_Data_Align NUMERIC "0"
-- Retrieval info: PRIVATE: Use_Lock NUMERIC "0"
-- Retrieval info: PRIVATE: Use_Pll_Areset NUMERIC "1"
-- Retrieval info: CONSTANT: COMMON_RX_TX_PLL STRING "ON"
-- Retrieval info: CONSTANT: DESERIALIZATION_FACTOR NUMERIC "4"
-- Retrieval info: CONSTANT: ENABLE_DPA_MODE STRING "OFF"
-- Retrieval info: CONSTANT: IMPLEMENT_IN_LES STRING "OFF"
-- Retrieval info: CONSTANT: INCLOCK_DATA_ALIGNMENT STRING "UNUSED"
-- Retrieval info: CONSTANT: INCLOCK_PERIOD NUMERIC "4000"
-- Retrieval info: CONSTANT: INCLOCK_PHASE_SHIFT NUMERIC "0"
-- Retrieval info: CONSTANT: INPUT_DATA_RATE NUMERIC "250"
-- Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Stratix II"
-- Retrieval info: CONSTANT: LPM_TYPE STRING "altlvds_rx"
-- Retrieval info: CONSTANT: NUMBER_OF_CHANNELS NUMERIC "16"
-- Retrieval info: CONSTANT: OUTCLOCK_RESOURCE STRING "Global Clock"
-- Retrieval info: CONSTANT: REGISTERED_OUTPUT STRING "ON"
-- Retrieval info: CONSTANT: USE_EXTERNAL_PLL STRING "OFF"
-- Retrieval info: USED_PORT: pll_areset 0 0 0 0 INPUT GND pll_areset
-- Retrieval info: USED_PORT: rx_in 0 0 16 0 INPUT NODEFVAL rx_in[15..0]
-- Retrieval info: USED_PORT: rx_inclock 0 0 0 0 INPUT_CLK_EXT GND rx_inclock
-- Retrieval info: USED_PORT: rx_out 0 0 64 0 OUTPUT NODEFVAL rx_out[63..0]
-- Retrieval info: USED_PORT: rx_outclock 0 0 0 0 OUTPUT NODEFVAL rx_outclock
-- Retrieval info: CONNECT: @rx_in 0 0 16 0 rx_in 0 0 16 0
-- Retrieval info: CONNECT: rx_out 0 0 64 0 @rx_out 0 0 64 0
-- Retrieval info: CONNECT: @rx_inclock 0 0 0 0 rx_inclock 0 0 0 0
-- Retrieval info: CONNECT: @pll_areset 0 0 0 0 pll_areset 0 0 0 0
-- Retrieval info: CONNECT: rx_outclock 0 0 0 0 @rx_outclock 0 0 0 0
-- Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
-- Retrieval info: GEN_FILE: TYPE_NORMAL lvds_i.vhd TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL lvds_i.ppf TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL lvds_i.inc FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL lvds_i.cmp FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL lvds_i.bsf TRUE FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL lvds_i_inst.vhd FALSE
-- Retrieval info: LIB_FILE: altera_mf
-- Retrieval info: CBX_MODULE_PREFIX: ON
