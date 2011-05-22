-- Xilinx Vhdl produced by program ngd2vhdl F.23
-- Command: -rpw 100 -ar Structure -te ENCODER_TIME_POST -xon false -w -log __projnav/ngd2vhdl.log enc_16b20b.nga ENCODER_TIME_POST.vhd 
-- Input file: enc_16b20b.nga
-- Output file: ENCODER_TIME_POST.vhd
-- Design name: enc_16b20b
-- Xilinx: C:/Xilinx_WebPACK_51
-- # of Entities: 1
-- Device: XCR3128XL-6-VQ100

-- The output of ngd2vhdl is a simulation model. This file cannot be synthesized,
-- or used in any other manner other than simulation. This netlist uses simulation
-- primitives which may not represent the true implementation of the device, however
-- the netlist is functionally correct. Do not modify this file.

-- Model for  ROC (Reset-On-Configuration) Cell
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.VITAL_Timing.all;
entity ROC is
  generic (InstancePath: STRING := "*";
           WIDTH : Time := 100 ns);
  port(O : out std_ulogic := '1') ;
  attribute VITAL_LEVEL0 of ROC : entity is TRUE;
end ROC;

architecture ROC_V of ROC is
attribute VITAL_LEVEL0 of ROC_V : architecture is TRUE;
begin
  ONE_SHOT : process
  begin
    if (WIDTH <= 0 ns) then
       assert FALSE report
       "*** Error: a positive value of WIDTH must be specified ***"
       severity failure;
    else
       wait for WIDTH;
       O <= '0';
    end if;
    wait;
  end process ONE_SHOT;
end ROC_V;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library SIMPRIM;
use SIMPRIM.VCOMPONENTS.ALL;
use SIMPRIM.VPACKAGE.ALL;
entity ENCODER_TIME_POST is
  port (
    clk : in STD_LOGIC := 'X'; 
    dis_in : in STD_LOGIC := 'X'; 
    rst : in STD_LOGIC := 'X'; 
    frame_in_enc : in STD_LOGIC := 'X'; 
    k_char : in STD_LOGIC := 'X'; 
    dis_out : out STD_LOGIC; 
    frame_out_enc : out STD_LOGIC; 
    data_trs : in STD_LOGIC_VECTOR ( 15 downto 0 ); 
    serial_data : out STD_LOGIC_VECTOR ( 19 downto 0 ) 
  );
end ENCODER_TIME_POST;

architecture Structure of ENCODER_TIME_POST is
  component ROC
    generic (InstancePath: STRING := "*";
             WIDTH : Time := 100 ns);
    port (O : out STD_ULOGIC := '1');
  end component;
  signal dis_out_MC_Q : STD_LOGIC; 
  signal dis_out_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal dis_out_MC_D : STD_LOGIC; 
  signal clk_II_FCLK : STD_LOGIC; 
  signal dis_out_MC_D1 : STD_LOGIC; 
  signal rst_II_UIM : STD_LOGIC; 
  signal dis_out_MC_UIM : STD_LOGIC; 
  signal dis_out_MC_D2_PT_0 : STD_LOGIC; 
  signal lower_enc_dis_func_prs_state_fft1 : STD_LOGIC; 
  signal lower_enc_dis_func_prs_state_fft3 : STD_LOGIC; 
  signal lower_enc_dis_func_prs_state_fft2 : STD_LOGIC; 
  signal lower_enc_dis_func_n0040 : STD_LOGIC; 
  signal dis_out_MC_D2_PT_1 : STD_LOGIC; 
  signal dis_out_MC_D2_PT_2 : STD_LOGIC; 
  signal dis_out_MC_D2 : STD_LOGIC; 
  signal lower_enc_dis_func_prs_state_fft1_MC_Q : STD_LOGIC; 
  signal FOOBAR3_ctinst_7 : STD_LOGIC; 
  signal lower_enc_dis_func_prs_state_fft1_MC_R_OR_PRLD : STD_LOGIC; 
  signal lower_enc_dis_func_prs_state_fft1_MC_D : STD_LOGIC; 
  signal lower_enc_dis_func_prs_state_fft1_MC_D1 : STD_LOGIC; 
  signal lower_enc_dis_func_prs_state_fft1_MC_D2_PT_0 : STD_LOGIC; 
  signal lower_enc_prs_state_fft2 : STD_LOGIC; 
  signal lower_enc_prs_state_fft1 : STD_LOGIC; 
  signal N_PZ_233 : STD_LOGIC; 
  signal lower_enc_dis_func_prs_state_fft1_MC_D2_PT_1 : STD_LOGIC; 
  signal disparity_rdy : STD_LOGIC; 
  signal lower_enc_dis_func_prs_state_fft1_MC_D2_PT_2 : STD_LOGIC; 
  signal lower_enc_dis_func_prs_state_fft1_MC_D2 : STD_LOGIC; 
  signal lower_enc_dis_func_prs_state_fft1_MC_D_TFF : STD_LOGIC; 
  signal lower_enc_dis_func_prs_state_fft3_MC_Q : STD_LOGIC; 
  signal lower_enc_dis_func_prs_state_fft3_MC_R_OR_PRLD : STD_LOGIC; 
  signal lower_enc_dis_func_prs_state_fft3_MC_D : STD_LOGIC; 
  signal lower_enc_dis_func_prs_state_fft3_MC_D1 : STD_LOGIC; 
  signal lower_enc_dis_func_prs_state_fft3_MC_D2_PT_0 : STD_LOGIC; 
  signal lower_enc_dis_func_prs_state_fft3_MC_D2_PT_1 : STD_LOGIC; 
  signal lower_enc_dis_func_prs_state_fft3_MC_D2_PT_2 : STD_LOGIC; 
  signal lower_enc_dis_func_prs_state_fft3_MC_D2 : STD_LOGIC; 
  signal lower_enc_dis_func_prs_state_fft3_MC_D_TFF : STD_LOGIC; 
  signal lower_enc_dis_func_prs_state_fft2_MC_Q : STD_LOGIC; 
  signal lower_enc_dis_func_prs_state_fft2_MC_R_OR_PRLD : STD_LOGIC; 
  signal lower_enc_dis_func_prs_state_fft2_MC_D : STD_LOGIC; 
  signal lower_enc_dis_func_prs_state_fft2_MC_D1_PT_0 : STD_LOGIC; 
  signal lower_enc_dis_func_prs_state_fft2_MC_D1 : STD_LOGIC; 
  signal lower_enc_dis_func_prs_state_fft2_MC_D2 : STD_LOGIC; 
  signal lower_enc_dis_func_prs_state_fft2_MC_D_TFF : STD_LOGIC; 
  signal lower_enc_prs_state_fft2_MC_Q : STD_LOGIC; 
  signal lower_enc_prs_state_fft2_MC_R_OR_PRLD : STD_LOGIC; 
  signal lower_enc_prs_state_fft2_MC_D : STD_LOGIC; 
  signal lower_enc_prs_state_fft2_MC_D1 : STD_LOGIC; 
  signal frame_in_enc_II_UIM : STD_LOGIC; 
  signal lower_enc_prs_state_fft2_MC_D2_PT_0 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_prs_state_fft2 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_prs_state_fft3 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_prs_state_fft1 : STD_LOGIC; 
  signal lower_enc_prs_state_fft2_MC_D2_PT_1 : STD_LOGIC; 
  signal lower_enc_prs_state_fft2_MC_D2 : STD_LOGIC; 
  signal lower_enc_prs_state_fft2_MC_D_TFF : STD_LOGIC; 
  signal lower_enc_prs_state_fft1_MC_Q : STD_LOGIC; 
  signal lower_enc_prs_state_fft1_MC_R_OR_PRLD : STD_LOGIC; 
  signal lower_enc_prs_state_fft1_MC_D : STD_LOGIC; 
  signal lower_enc_prs_state_fft1_MC_D1 : STD_LOGIC; 
  signal N_PZ_226 : STD_LOGIC; 
  signal lower_enc_prs_state_fft1_MC_D2_PT_0 : STD_LOGIC; 
  signal lower_enc_prs_state_fft1_MC_D2_PT_1 : STD_LOGIC; 
  signal lower_enc_prs_state_fft1_MC_D2 : STD_LOGIC; 
  signal lower_enc_prs_state_fft1_MC_D_TFF : STD_LOGIC; 
  signal N_PZ_226_MC_Q : STD_LOGIC; 
  signal N_PZ_226_MC_D : STD_LOGIC; 
  signal N_PZ_226_MC_D1_PT_0 : STD_LOGIC; 
  signal N_PZ_226_MC_D1 : STD_LOGIC; 
  signal N_PZ_226_MC_D2 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_prs_state_fft2_MC_Q : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_prs_state_fft2_MC_R_OR_PRLD : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_prs_state_fft2_MC_D : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_prs_state_fft2_MC_D1_PT_0 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_prs_state_fft2_MC_D1 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_prs_state_fft2_MC_D2 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_prs_state_fft2_MC_D_TFF : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_prs_state_fft3_MC_Q : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_prs_state_fft3_MC_R_OR_PRLD : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_prs_state_fft3_MC_D : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_prs_state_fft3_MC_D1 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_0 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_1 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_2 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_prs_state_fft3_MC_D2 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_prs_state_fft3_MC_D_TFF : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_prs_state_fft1_MC_Q : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_prs_state_fft1_MC_R_OR_PRLD : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_prs_state_fft1_MC_D : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_prs_state_fft1_MC_D1 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_0 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_1 : STD_LOGIC; 
  signal lower_enc_s_func_prs_state_ffd1 : STD_LOGIC; 
  signal lower_enc_s_func_prs_state_ffd2 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_2 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_prs_state_fft1_MC_D2 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_prs_state_fft1_MC_D_TFF : STD_LOGIC; 
  signal lower_enc_s_func_prs_state_ffd1_MC_Q : STD_LOGIC; 
  signal lower_enc_s_func_prs_state_ffd1_MC_R_OR_PRLD : STD_LOGIC; 
  signal lower_enc_s_func_prs_state_ffd1_MC_D : STD_LOGIC; 
  signal lower_enc_s_func_prs_state_ffd1_MC_D1 : STD_LOGIC; 
  signal lower_enc_s_func_prs_state_ffd1_MC_D2_PT_0 : STD_LOGIC; 
  signal lower_enc_s_func_prs_state_ffd1_MC_D2_PT_1 : STD_LOGIC; 
  signal lower_enc_s_func_prs_state_ffd1_MC_D2 : STD_LOGIC; 
  signal lower_enc_s_func_prs_state_ffd2_MC_Q : STD_LOGIC; 
  signal lower_enc_s_func_prs_state_ffd2_MC_R_OR_PRLD : STD_LOGIC; 
  signal lower_enc_s_func_prs_state_ffd2_MC_D : STD_LOGIC; 
  signal lower_enc_s_func_prs_state_ffd2_MC_D1_PT_0 : STD_LOGIC; 
  signal lower_enc_s_func_prs_state_ffd2_MC_D1 : STD_LOGIC; 
  signal lower_enc_s_func_prs_state_ffd2_MC_D2 : STD_LOGIC; 
  signal N_PZ_233_MC_Q : STD_LOGIC; 
  signal N_PZ_233_MC_D : STD_LOGIC; 
  signal N_PZ_233_MC_D1_PT_0 : STD_LOGIC; 
  signal N_PZ_233_MC_D1 : STD_LOGIC; 
  signal N_PZ_233_MC_D2 : STD_LOGIC; 
  signal disparity_rdy_MC_Q : STD_LOGIC; 
  signal disparity_rdy_MC_R_OR_PRLD : STD_LOGIC; 
  signal disparity_rdy_MC_D : STD_LOGIC; 
  signal disparity_rdy_MC_D1 : STD_LOGIC; 
  signal upper_enc_dis_func_prs_state_ffd1 : STD_LOGIC; 
  signal disparity_rdy_MC_D2_PT_0 : STD_LOGIC; 
  signal upper_enc_prs_state_fft2 : STD_LOGIC; 
  signal upper_enc_prs_state_fft1 : STD_LOGIC; 
  signal disparity_rdy_MC_D2_PT_1 : STD_LOGIC; 
  signal disparity_rdy_MC_D2 : STD_LOGIC; 
  signal upper_enc_dis_func_prs_state_ffd1_MC_Q : STD_LOGIC; 
  signal upper_enc_dis_func_prs_state_ffd1_MC_R_OR_PRLD : STD_LOGIC; 
  signal upper_enc_dis_func_prs_state_ffd1_MC_D : STD_LOGIC; 
  signal upper_enc_dis_func_prs_state_ffd1_MC_D1 : STD_LOGIC; 
  signal upper_enc_dis_func_prs_state_ffd1_MC_D2_PT_0 : STD_LOGIC; 
  signal upper_enc_dis_func_prs_state_ffd1_MC_D2_PT_1 : STD_LOGIC; 
  signal upper_enc_dis_func_prs_state_ffd1_MC_D2 : STD_LOGIC; 
  signal upper_enc_prs_state_fft2_MC_Q : STD_LOGIC; 
  signal upper_enc_prs_state_fft2_MC_R_OR_PRLD : STD_LOGIC; 
  signal upper_enc_prs_state_fft2_MC_D : STD_LOGIC; 
  signal upper_enc_prs_state_fft2_MC_D1 : STD_LOGIC; 
  signal upper_enc_prs_state_fft2_MC_D2_PT_0 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_prs_state_fft2 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_prs_state_fft3 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_prs_state_fft1 : STD_LOGIC; 
  signal upper_enc_prs_state_fft2_MC_D2_PT_1 : STD_LOGIC; 
  signal upper_enc_prs_state_fft2_MC_D2 : STD_LOGIC; 
  signal upper_enc_prs_state_fft2_MC_D_TFF : STD_LOGIC; 
  signal upper_enc_prs_state_fft1_MC_Q : STD_LOGIC; 
  signal upper_enc_prs_state_fft1_MC_R_OR_PRLD : STD_LOGIC; 
  signal upper_enc_prs_state_fft1_MC_D : STD_LOGIC; 
  signal upper_enc_prs_state_fft1_MC_D1 : STD_LOGIC; 
  signal upper_enc_prs_state_fft1_MC_D2_PT_0 : STD_LOGIC; 
  signal upper_enc_prs_state_fft1_MC_D2_PT_1 : STD_LOGIC; 
  signal upper_enc_prs_state_fft1_MC_D2 : STD_LOGIC; 
  signal upper_enc_prs_state_fft1_MC_D_TFF : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_prs_state_fft2_MC_Q : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_prs_state_fft2_MC_R_OR_PRLD : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_prs_state_fft2_MC_D : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_prs_state_fft2_MC_D1_PT_0 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_prs_state_fft2_MC_D1 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_prs_state_fft2_MC_D2 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_prs_state_fft2_MC_D_TFF : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_prs_state_fft3_MC_Q : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_prs_state_fft3_MC_R_OR_PRLD : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_prs_state_fft3_MC_D : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_prs_state_fft3_MC_D1 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_0 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_1 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_2 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_prs_state_fft3_MC_D2 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_prs_state_fft3_MC_D_TFF : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_prs_state_fft1_MC_Q : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_prs_state_fft1_MC_R_OR_PRLD : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_prs_state_fft1_MC_D : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_prs_state_fft1_MC_D1 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_0 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_1 : STD_LOGIC; 
  signal upper_enc_s_func_prs_state_ffd1 : STD_LOGIC; 
  signal upper_enc_s_func_prs_state_ffd2 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_2 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_prs_state_fft1_MC_D2 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_prs_state_fft1_MC_D_TFF : STD_LOGIC; 
  signal upper_enc_s_func_prs_state_ffd1_MC_Q : STD_LOGIC; 
  signal upper_enc_s_func_prs_state_ffd1_MC_R_OR_PRLD : STD_LOGIC; 
  signal upper_enc_s_func_prs_state_ffd1_MC_D : STD_LOGIC; 
  signal upper_enc_s_func_prs_state_ffd1_MC_D1 : STD_LOGIC; 
  signal upper_enc_s_func_prs_state_ffd1_MC_D2_PT_0 : STD_LOGIC; 
  signal upper_enc_s_func_prs_state_ffd1_MC_D2_PT_1 : STD_LOGIC; 
  signal upper_enc_s_func_prs_state_ffd1_MC_D2 : STD_LOGIC; 
  signal upper_enc_s_func_prs_state_ffd2_MC_Q : STD_LOGIC; 
  signal upper_enc_s_func_prs_state_ffd2_MC_R_OR_PRLD : STD_LOGIC; 
  signal upper_enc_s_func_prs_state_ffd2_MC_D : STD_LOGIC; 
  signal N_PZ_312 : STD_LOGIC; 
  signal upper_enc_s_func_prs_state_ffd2_MC_D1_PT_0 : STD_LOGIC; 
  signal upper_enc_s_func_prs_state_ffd2_MC_D1 : STD_LOGIC; 
  signal upper_enc_s_func_prs_state_ffd2_MC_D2 : STD_LOGIC; 
  signal N_PZ_312_MC_Q : STD_LOGIC; 
  signal N_PZ_312_MC_D : STD_LOGIC; 
  signal N_PZ_312_MC_D1_PT_0 : STD_LOGIC; 
  signal N_PZ_312_MC_D1 : STD_LOGIC; 
  signal N_PZ_312_MC_D2 : STD_LOGIC; 
  signal lower_enc_dis_func_n0040_MC_Q : STD_LOGIC; 
  signal lower_enc_dis_func_n0040_MC_D : STD_LOGIC; 
  signal lower_enc_dis_func_n0040_MC_D1 : STD_LOGIC; 
  signal N_PZ_307 : STD_LOGIC; 
  signal lower_enc_dis_func_n0040_MC_D2_PT_0 : STD_LOGIC; 
  signal lower_enc_nds6 : STD_LOGIC; 
  signal lower_enc_pds6 : STD_LOGIC; 
  signal lower_enc_dis_func_n0040_MC_D2_PT_1 : STD_LOGIC; 
  signal lower_enc_dis_func_n0040_MC_D2_PT_2 : STD_LOGIC; 
  signal data_trs_5_II_UIM : STD_LOGIC; 
  signal data_trs_6_II_UIM : STD_LOGIC; 
  signal lower_enc_dis_func_n0040_MC_D2_PT_3 : STD_LOGIC; 
  signal data_trs_7_II_UIM : STD_LOGIC; 
  signal lower_enc_dis_func_n0040_MC_D2_PT_4 : STD_LOGIC; 
  signal lower_enc_dis_func_n0040_MC_D2_PT_5 : STD_LOGIC; 
  signal lower_enc_dis_func_n0040_MC_D2_PT_6 : STD_LOGIC; 
  signal lower_enc_dis_func_n0040_MC_D2_PT_7 : STD_LOGIC; 
  signal lower_enc_dis_func_n0040_MC_D2 : STD_LOGIC; 
  signal N_PZ_307_MC_Q : STD_LOGIC; 
  signal N_PZ_307_MC_D : STD_LOGIC; 
  signal run_disparity : STD_LOGIC; 
  signal N_PZ_307_MC_D1_PT_0 : STD_LOGIC; 
  signal N_PZ_307_MC_D1 : STD_LOGIC; 
  signal N_PZ_307_MC_D2_PT_0 : STD_LOGIC; 
  signal N_PZ_307_MC_D2 : STD_LOGIC; 
  signal run_disparity_MC_Q : STD_LOGIC; 
  signal run_disparity_MC_D : STD_LOGIC; 
  signal dis_in_II_UIM : STD_LOGIC; 
  signal run_disparity_MC_D1_PT_0 : STD_LOGIC; 
  signal run_disparity_MC_D1 : STD_LOGIC; 
  signal upper_enc_nds6 : STD_LOGIC; 
  signal upper_enc_pds6 : STD_LOGIC; 
  signal run_disparity_MC_D2_PT_0 : STD_LOGIC; 
  signal N_PZ_327 : STD_LOGIC; 
  signal run_disparity_MC_D2_PT_1 : STD_LOGIC; 
  signal run_disparity_MC_D2_PT_2 : STD_LOGIC; 
  signal run_disparity_MC_D2_PT_3 : STD_LOGIC; 
  signal run_disparity_MC_D2 : STD_LOGIC; 
  signal upper_enc_nds6_MC_Q : STD_LOGIC; 
  signal upper_enc_nds6_MC_D : STD_LOGIC; 
  signal upper_enc_nds6_MC_D1 : STD_LOGIC; 
  signal upper_enc_nds6_MC_D2_PT_0 : STD_LOGIC; 
  signal data_trs_11_II_UIM : STD_LOGIC; 
  signal data_trs_12_II_UIM : STD_LOGIC; 
  signal N_PZ_246 : STD_LOGIC; 
  signal upper_enc_nds6_MC_D2_PT_1 : STD_LOGIC; 
  signal data_trs_10_II_UIM : STD_LOGIC; 
  signal data_trs_8_II_UIM : STD_LOGIC; 
  signal data_trs_9_II_UIM : STD_LOGIC; 
  signal upper_enc_nds6_MC_D2_PT_2 : STD_LOGIC; 
  signal N_PZ_317 : STD_LOGIC; 
  signal upper_enc_nds6_MC_D2_PT_3 : STD_LOGIC; 
  signal upper_enc_nds6_MC_D2 : STD_LOGIC; 
  signal N_PZ_246_MC_Q : STD_LOGIC; 
  signal N_PZ_246_MC_D : STD_LOGIC; 
  signal N_PZ_246_MC_D1 : STD_LOGIC; 
  signal N_PZ_246_MC_D2_PT_0 : STD_LOGIC; 
  signal N_PZ_246_MC_D2_PT_1 : STD_LOGIC; 
  signal N_PZ_246_MC_D2 : STD_LOGIC; 
  signal N_PZ_317_MC_Q : STD_LOGIC; 
  signal N_PZ_317_MC_D : STD_LOGIC; 
  signal N_PZ_317_MC_D1_PT_0 : STD_LOGIC; 
  signal N_PZ_317_MC_D1 : STD_LOGIC; 
  signal N_PZ_317_MC_D2 : STD_LOGIC; 
  signal upper_enc_pds6_MC_Q : STD_LOGIC; 
  signal upper_enc_pds6_MC_D : STD_LOGIC; 
  signal upper_enc_pds6_MC_D1 : STD_LOGIC; 
  signal upper_enc_pds6_MC_D2_PT_0 : STD_LOGIC; 
  signal k_char_II_UIM : STD_LOGIC; 
  signal upper_enc_pds6_MC_D2_PT_1 : STD_LOGIC; 
  signal upper_enc_pds6_MC_D2_PT_2 : STD_LOGIC; 
  signal upper_enc_pds6_MC_D2_PT_3 : STD_LOGIC; 
  signal upper_enc_pds6_MC_D2_PT_4 : STD_LOGIC; 
  signal upper_enc_pds6_MC_D2_PT_5 : STD_LOGIC; 
  signal upper_enc_pds6_MC_D2_PT_6 : STD_LOGIC; 
  signal upper_enc_pds6_MC_D2 : STD_LOGIC; 
  signal N_PZ_327_MC_Q : STD_LOGIC; 
  signal N_PZ_327_MC_D : STD_LOGIC; 
  signal N_PZ_327_MC_D1 : STD_LOGIC; 
  signal data_trs_13_II_UIM : STD_LOGIC; 
  signal data_trs_14_II_UIM : STD_LOGIC; 
  signal N_PZ_327_MC_D2_PT_0 : STD_LOGIC; 
  signal N_PZ_327_MC_D2_PT_1 : STD_LOGIC; 
  signal data_trs_15_II_UIM : STD_LOGIC; 
  signal N_PZ_327_MC_D2_PT_2 : STD_LOGIC; 
  signal N_PZ_327_MC_D2 : STD_LOGIC; 
  signal lower_enc_nds6_MC_Q : STD_LOGIC; 
  signal lower_enc_nds6_MC_D : STD_LOGIC; 
  signal lower_enc_nds6_MC_D1 : STD_LOGIC; 
  signal lower_enc_nds6_MC_D2_PT_0 : STD_LOGIC; 
  signal data_trs_3_II_UIM : STD_LOGIC; 
  signal data_trs_4_II_UIM : STD_LOGIC; 
  signal N_PZ_342 : STD_LOGIC; 
  signal lower_enc_nds6_MC_D2_PT_1 : STD_LOGIC; 
  signal data_trs_0_II_UIM : STD_LOGIC; 
  signal data_trs_1_II_UIM : STD_LOGIC; 
  signal data_trs_2_II_UIM : STD_LOGIC; 
  signal lower_enc_nds6_MC_D2_PT_2 : STD_LOGIC; 
  signal lower_enc_nds6_MC_D2_PT_3 : STD_LOGIC; 
  signal lower_enc_nds6_MC_D2 : STD_LOGIC; 
  signal N_PZ_342_MC_Q : STD_LOGIC; 
  signal N_PZ_342_MC_D : STD_LOGIC; 
  signal N_PZ_342_MC_D1 : STD_LOGIC; 
  signal N_PZ_342_MC_D2_PT_0 : STD_LOGIC; 
  signal N_PZ_342_MC_D2_PT_1 : STD_LOGIC; 
  signal N_PZ_342_MC_D2_PT_2 : STD_LOGIC; 
  signal N_PZ_342_MC_D2 : STD_LOGIC; 
  signal lower_enc_pds6_MC_Q : STD_LOGIC; 
  signal lower_enc_pds6_MC_D : STD_LOGIC; 
  signal lower_enc_pds6_MC_D1 : STD_LOGIC; 
  signal lower_enc_pds6_MC_D2_PT_0 : STD_LOGIC; 
  signal lower_enc_pds6_MC_D2_PT_1 : STD_LOGIC; 
  signal lower_enc_pds6_MC_D2_PT_2 : STD_LOGIC; 
  signal lower_enc_pds6_MC_D2_PT_3 : STD_LOGIC; 
  signal lower_enc_pds6_MC_D2 : STD_LOGIC; 
  signal frame_out_enc_MC_Q : STD_LOGIC; 
  signal frame_out_enc_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal frame_out_enc_MC_D : STD_LOGIC; 
  signal frame_out_enc_MC_D1_PT_0 : STD_LOGIC; 
  signal frame_out_enc_MC_D1 : STD_LOGIC; 
  signal frame_out_enc_MC_D2 : STD_LOGIC; 
  signal serial_data_0_MC_Q : STD_LOGIC; 
  signal serial_data_0_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal serial_data_0_MC_D : STD_LOGIC; 
  signal serial_data_0_MC_D1 : STD_LOGIC; 
  signal serial_data_0_MC_UIM : STD_LOGIC; 
  signal serial_data_0_MC_D2_PT_0 : STD_LOGIC; 
  signal serial_data_0_MC_D2_PT_1 : STD_LOGIC; 
  signal serial_data_0_MC_D2_PT_2 : STD_LOGIC; 
  signal serial_data_0_MC_D2_PT_3 : STD_LOGIC; 
  signal lower_enc_s_term : STD_LOGIC; 
  signal serial_data_0_MC_D2_PT_4 : STD_LOGIC; 
  signal serial_data_0_MC_D2 : STD_LOGIC; 
  signal lower_enc_s_term_MC_Q : STD_LOGIC; 
  signal lower_enc_s_term_MC_D : STD_LOGIC; 
  signal lower_enc_s_term_MC_D1 : STD_LOGIC; 
  signal N_PZ_377 : STD_LOGIC; 
  signal lower_enc_s_term_MC_D2_PT_0 : STD_LOGIC; 
  signal lower_enc_s_term_MC_D2_PT_1 : STD_LOGIC; 
  signal lower_enc_s_term_MC_D2_PT_2 : STD_LOGIC; 
  signal lower_enc_s_term_MC_D2_PT_3 : STD_LOGIC; 
  signal lower_enc_s_term_MC_D2_PT_4 : STD_LOGIC; 
  signal lower_enc_s_term_MC_D2_PT_5 : STD_LOGIC; 
  signal lower_enc_s_term_MC_D2_PT_6 : STD_LOGIC; 
  signal lower_enc_s_term_MC_D2_PT_7 : STD_LOGIC; 
  signal lower_enc_s_term_MC_D2_PT_8 : STD_LOGIC; 
  signal lower_enc_s_term_MC_D2_PT_9 : STD_LOGIC; 
  signal lower_enc_s_term_MC_D2_PT_10 : STD_LOGIC; 
  signal lower_enc_s_term_MC_D2_PT_11 : STD_LOGIC; 
  signal lower_enc_s_term_MC_D2 : STD_LOGIC; 
  signal N_PZ_377_MC_Q : STD_LOGIC; 
  signal N_PZ_377_MC_D : STD_LOGIC; 
  signal N_PZ_377_MC_D1 : STD_LOGIC; 
  signal N_PZ_377_MC_D2_PT_0 : STD_LOGIC; 
  signal N_PZ_377_MC_D2_PT_1 : STD_LOGIC; 
  signal N_PZ_377_MC_D2 : STD_LOGIC; 
  signal serial_data_10_MC_Q : STD_LOGIC; 
  signal serial_data_10_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal serial_data_10_MC_D : STD_LOGIC; 
  signal serial_data_10_MC_D1 : STD_LOGIC; 
  signal serial_data_10_MC_UIM : STD_LOGIC; 
  signal serial_data_10_MC_D2_PT_0 : STD_LOGIC; 
  signal N_PZ_302 : STD_LOGIC; 
  signal serial_data_10_MC_D2_PT_1 : STD_LOGIC; 
  signal serial_data_10_MC_D2_PT_2 : STD_LOGIC; 
  signal serial_data_10_MC_D2_PT_3 : STD_LOGIC; 
  signal upper_enc_s_term : STD_LOGIC; 
  signal serial_data_10_MC_D2_PT_4 : STD_LOGIC; 
  signal serial_data_10_MC_D2 : STD_LOGIC; 
  signal N_PZ_302_MC_Q : STD_LOGIC; 
  signal N_PZ_302_MC_D : STD_LOGIC; 
  signal N_PZ_302_MC_D1 : STD_LOGIC; 
  signal N_PZ_302_MC_D2_PT_0 : STD_LOGIC; 
  signal N_PZ_302_MC_D2_PT_1 : STD_LOGIC; 
  signal N_PZ_302_MC_D2_PT_2 : STD_LOGIC; 
  signal N_PZ_302_MC_D2 : STD_LOGIC; 
  signal upper_enc_s_term_MC_Q : STD_LOGIC; 
  signal upper_enc_s_term_MC_D : STD_LOGIC; 
  signal upper_enc_s_term_MC_D1 : STD_LOGIC; 
  signal upper_enc_s_term_MC_D2_PT_0 : STD_LOGIC; 
  signal upper_enc_s_term_MC_D2_PT_1 : STD_LOGIC; 
  signal upper_enc_s_term_MC_D2_PT_2 : STD_LOGIC; 
  signal upper_enc_s_term_MC_D2_PT_3 : STD_LOGIC; 
  signal upper_enc_s_term_MC_D2_PT_4 : STD_LOGIC; 
  signal upper_enc_s_term_MC_D2_PT_5 : STD_LOGIC; 
  signal upper_enc_s_term_MC_D2_PT_6 : STD_LOGIC; 
  signal upper_enc_s_term_MC_D2_PT_7 : STD_LOGIC; 
  signal upper_enc_s_term_MC_D2_PT_8 : STD_LOGIC; 
  signal upper_enc_s_term_MC_D2_PT_9 : STD_LOGIC; 
  signal upper_enc_s_term_MC_D2 : STD_LOGIC; 
  signal serial_data_11_MC_Q : STD_LOGIC; 
  signal serial_data_11_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal serial_data_11_MC_D : STD_LOGIC; 
  signal serial_data_11_MC_D1 : STD_LOGIC; 
  signal serial_data_11_MC_UIM : STD_LOGIC; 
  signal serial_data_11_MC_D2_PT_0 : STD_LOGIC; 
  signal serial_data_11_MC_D2_PT_1 : STD_LOGIC; 
  signal serial_data_11_MC_D2 : STD_LOGIC; 
  signal serial_data_12_MC_Q : STD_LOGIC; 
  signal serial_data_12_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal serial_data_12_MC_D : STD_LOGIC; 
  signal serial_data_12_MC_D1 : STD_LOGIC; 
  signal serial_data_12_MC_UIM : STD_LOGIC; 
  signal serial_data_12_MC_D2_PT_0 : STD_LOGIC; 
  signal serial_data_12_MC_D2_PT_1 : STD_LOGIC; 
  signal serial_data_12_MC_D2_PT_2 : STD_LOGIC; 
  signal serial_data_12_MC_D2_PT_3 : STD_LOGIC; 
  signal serial_data_12_MC_D2 : STD_LOGIC; 
  signal serial_data_13_MC_Q : STD_LOGIC; 
  signal serial_data_13_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal serial_data_13_MC_D : STD_LOGIC; 
  signal serial_data_13_MC_D1 : STD_LOGIC; 
  signal serial_data_13_MC_UIM : STD_LOGIC; 
  signal serial_data_13_MC_D2_PT_0 : STD_LOGIC; 
  signal serial_data_13_MC_D2_PT_1 : STD_LOGIC; 
  signal serial_data_13_MC_D2_PT_2 : STD_LOGIC; 
  signal serial_data_13_MC_D2_PT_3 : STD_LOGIC; 
  signal serial_data_13_MC_D2 : STD_LOGIC; 
  signal serial_data_14_MC_Q : STD_LOGIC; 
  signal serial_data_14_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal serial_data_14_MC_D : STD_LOGIC; 
  signal serial_data_14_MC_D1 : STD_LOGIC; 
  signal serial_data_14_MC_D2_PT_0 : STD_LOGIC; 
  signal serial_data_14_MC_D2_PT_1 : STD_LOGIC; 
  signal serial_data_14_MC_UIM : STD_LOGIC; 
  signal serial_data_14_MC_D2_PT_2 : STD_LOGIC; 
  signal serial_data_14_MC_D2_PT_3 : STD_LOGIC; 
  signal serial_data_14_MC_D2_PT_4 : STD_LOGIC; 
  signal serial_data_14_MC_D2_PT_5 : STD_LOGIC; 
  signal serial_data_14_MC_D2_PT_6 : STD_LOGIC; 
  signal serial_data_14_MC_D2_PT_7 : STD_LOGIC; 
  signal serial_data_14_MC_D2_PT_8 : STD_LOGIC; 
  signal serial_data_14_MC_D2_PT_9 : STD_LOGIC; 
  signal serial_data_14_MC_D2_PT_10 : STD_LOGIC; 
  signal serial_data_14_MC_D2 : STD_LOGIC; 
  signal serial_data_15_MC_Q : STD_LOGIC; 
  signal serial_data_15_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal serial_data_15_MC_D : STD_LOGIC; 
  signal serial_data_15_MC_D1 : STD_LOGIC; 
  signal serial_data_15_MC_UIM : STD_LOGIC; 
  signal serial_data_15_MC_D2_PT_0 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_e_prel : STD_LOGIC; 
  signal serial_data_15_MC_D2_PT_1 : STD_LOGIC; 
  signal serial_data_15_MC_D2 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_e_prel_MC_Q : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_e_prel_MC_D : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_e_prel_MC_D1 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_e_prel_MC_D2_PT_0 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_e_prel_MC_D2_PT_1 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_e_prel_MC_D2_PT_2 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_e_prel_MC_D2_PT_3 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_e_prel_MC_D2_PT_4 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_e_prel_MC_D2_PT_5 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_e_prel_MC_D2_PT_6 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_e_prel_MC_D2_PT_7 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_e_prel_MC_D2_PT_8 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_e_prel_MC_D2 : STD_LOGIC; 
  signal serial_data_16_MC_Q : STD_LOGIC; 
  signal serial_data_16_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal serial_data_16_MC_D : STD_LOGIC; 
  signal serial_data_16_MC_D1 : STD_LOGIC; 
  signal serial_data_16_MC_UIM : STD_LOGIC; 
  signal serial_data_16_MC_D2_PT_0 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_d_prel : STD_LOGIC; 
  signal serial_data_16_MC_D2_PT_1 : STD_LOGIC; 
  signal serial_data_16_MC_D2 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_d_prel_MC_Q : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_d_prel_MC_D : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_d_prel_MC_D1 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_d_prel_MC_D2_PT_0 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_d_prel_MC_D2_PT_1 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_d_prel_MC_D2_PT_2 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_d_prel_MC_D2 : STD_LOGIC; 
  signal serial_data_17_MC_Q : STD_LOGIC; 
  signal serial_data_17_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal serial_data_17_MC_D : STD_LOGIC; 
  signal serial_data_17_MC_D1 : STD_LOGIC; 
  signal serial_data_17_MC_UIM : STD_LOGIC; 
  signal serial_data_17_MC_D2_PT_0 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_c_prel : STD_LOGIC; 
  signal serial_data_17_MC_D2_PT_1 : STD_LOGIC; 
  signal serial_data_17_MC_D2 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_c_prel_MC_Q : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_c_prel_MC_D : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_c_prel_MC_D1 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_c_prel_MC_D2_PT_0 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_c_prel_MC_D2_PT_1 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_c_prel_MC_D2_PT_2 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_c_prel_MC_D2_PT_3 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_c_prel_MC_D2_PT_4 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_c_prel_MC_D2 : STD_LOGIC; 
  signal serial_data_18_MC_Q : STD_LOGIC; 
  signal serial_data_18_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal serial_data_18_MC_D : STD_LOGIC; 
  signal serial_data_18_MC_D1 : STD_LOGIC; 
  signal serial_data_18_MC_UIM : STD_LOGIC; 
  signal serial_data_18_MC_D2_PT_0 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_b_prel : STD_LOGIC; 
  signal serial_data_18_MC_D2_PT_1 : STD_LOGIC; 
  signal serial_data_18_MC_D2 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_b_prel_MC_Q : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_b_prel_MC_D : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_b_prel_MC_D1 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_b_prel_MC_D2_PT_0 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_b_prel_MC_D2_PT_1 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_b_prel_MC_D2_PT_2 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_b_prel_MC_D2_PT_3 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_b_prel_MC_D2_PT_4 : STD_LOGIC; 
  signal upper_enc_enc_8b_10b_b_prel_MC_D2 : STD_LOGIC; 
  signal serial_data_19_MC_Q : STD_LOGIC; 
  signal serial_data_19_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal serial_data_19_MC_D : STD_LOGIC; 
  signal serial_data_19_MC_D1 : STD_LOGIC; 
  signal serial_data_19_MC_UIM : STD_LOGIC; 
  signal serial_data_19_MC_D2_PT_0 : STD_LOGIC; 
  signal serial_data_19_MC_D2_PT_1 : STD_LOGIC; 
  signal serial_data_19_MC_D2 : STD_LOGIC; 
  signal serial_data_1_MC_Q : STD_LOGIC; 
  signal serial_data_1_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal serial_data_1_MC_D : STD_LOGIC; 
  signal serial_data_1_MC_D1 : STD_LOGIC; 
  signal serial_data_1_MC_UIM : STD_LOGIC; 
  signal serial_data_1_MC_D2_PT_0 : STD_LOGIC; 
  signal serial_data_1_MC_D2_PT_1 : STD_LOGIC; 
  signal serial_data_1_MC_D2 : STD_LOGIC; 
  signal serial_data_2_MC_Q : STD_LOGIC; 
  signal serial_data_2_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal serial_data_2_MC_D : STD_LOGIC; 
  signal serial_data_2_MC_D1 : STD_LOGIC; 
  signal serial_data_2_MC_UIM : STD_LOGIC; 
  signal serial_data_2_MC_D2_PT_0 : STD_LOGIC; 
  signal serial_data_2_MC_D2_PT_1 : STD_LOGIC; 
  signal serial_data_2_MC_D2_PT_2 : STD_LOGIC; 
  signal serial_data_2_MC_D2_PT_3 : STD_LOGIC; 
  signal serial_data_2_MC_D2 : STD_LOGIC; 
  signal serial_data_3_MC_Q : STD_LOGIC; 
  signal serial_data_3_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal serial_data_3_MC_D : STD_LOGIC; 
  signal serial_data_3_MC_D1 : STD_LOGIC; 
  signal serial_data_3_MC_UIM : STD_LOGIC; 
  signal serial_data_3_MC_D2_PT_0 : STD_LOGIC; 
  signal serial_data_3_MC_D2_PT_1 : STD_LOGIC; 
  signal serial_data_3_MC_D2_PT_2 : STD_LOGIC; 
  signal serial_data_3_MC_D2_PT_3 : STD_LOGIC; 
  signal serial_data_3_MC_D2 : STD_LOGIC; 
  signal serial_data_4_MC_Q : STD_LOGIC; 
  signal serial_data_4_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal serial_data_4_MC_D : STD_LOGIC; 
  signal serial_data_4_MC_D1 : STD_LOGIC; 
  signal serial_data_4_MC_D2_PT_0 : STD_LOGIC; 
  signal serial_data_4_MC_D2_PT_1 : STD_LOGIC; 
  signal serial_data_4_MC_UIM : STD_LOGIC; 
  signal serial_data_4_MC_D2_PT_2 : STD_LOGIC; 
  signal serial_data_4_MC_D2_PT_3 : STD_LOGIC; 
  signal serial_data_4_MC_D2_PT_4 : STD_LOGIC; 
  signal serial_data_4_MC_D2_PT_5 : STD_LOGIC; 
  signal serial_data_4_MC_D2_PT_6 : STD_LOGIC; 
  signal serial_data_4_MC_D2_PT_7 : STD_LOGIC; 
  signal serial_data_4_MC_D2_PT_8 : STD_LOGIC; 
  signal serial_data_4_MC_D2_PT_9 : STD_LOGIC; 
  signal serial_data_4_MC_D2_PT_10 : STD_LOGIC; 
  signal serial_data_4_MC_D2_PT_11 : STD_LOGIC; 
  signal serial_data_4_MC_D2 : STD_LOGIC; 
  signal serial_data_5_MC_Q : STD_LOGIC; 
  signal serial_data_5_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal serial_data_5_MC_D : STD_LOGIC; 
  signal serial_data_5_MC_D1 : STD_LOGIC; 
  signal serial_data_5_MC_UIM : STD_LOGIC; 
  signal serial_data_5_MC_D2_PT_0 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_e_prel : STD_LOGIC; 
  signal serial_data_5_MC_D2_PT_1 : STD_LOGIC; 
  signal serial_data_5_MC_D2 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_e_prel_MC_Q : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_e_prel_MC_D : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_e_prel_MC_D1 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_e_prel_MC_D2_PT_0 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_e_prel_MC_D2_PT_1 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_e_prel_MC_D2_PT_2 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_e_prel_MC_D2_PT_3 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_e_prel_MC_D2_PT_4 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_e_prel_MC_D2_PT_5 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_e_prel_MC_D2_PT_6 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_e_prel_MC_D2_PT_7 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_e_prel_MC_D2_PT_8 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_e_prel_MC_D2 : STD_LOGIC; 
  signal serial_data_6_MC_Q : STD_LOGIC; 
  signal serial_data_6_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal serial_data_6_MC_D : STD_LOGIC; 
  signal serial_data_6_MC_D1 : STD_LOGIC; 
  signal serial_data_6_MC_UIM : STD_LOGIC; 
  signal serial_data_6_MC_D2_PT_0 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_d_prel : STD_LOGIC; 
  signal serial_data_6_MC_D2_PT_1 : STD_LOGIC; 
  signal serial_data_6_MC_D2 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_d_prel_MC_Q : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_d_prel_MC_D : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_d_prel_MC_D1 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_d_prel_MC_D2_PT_0 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_d_prel_MC_D2_PT_1 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_d_prel_MC_D2_PT_2 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_d_prel_MC_D2_PT_3 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_d_prel_MC_D2 : STD_LOGIC; 
  signal serial_data_7_MC_Q : STD_LOGIC; 
  signal serial_data_7_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal serial_data_7_MC_D : STD_LOGIC; 
  signal serial_data_7_MC_D1 : STD_LOGIC; 
  signal serial_data_7_MC_UIM : STD_LOGIC; 
  signal serial_data_7_MC_D2_PT_0 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_c_prel : STD_LOGIC; 
  signal serial_data_7_MC_D2_PT_1 : STD_LOGIC; 
  signal serial_data_7_MC_D2 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_c_prel_MC_Q : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_c_prel_MC_D : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_c_prel_MC_D1 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_c_prel_MC_D2_PT_0 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_c_prel_MC_D2_PT_1 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_c_prel_MC_D2_PT_2 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_c_prel_MC_D2_PT_3 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_c_prel_MC_D2_PT_4 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_c_prel_MC_D2 : STD_LOGIC; 
  signal serial_data_8_MC_Q : STD_LOGIC; 
  signal serial_data_8_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal serial_data_8_MC_D : STD_LOGIC; 
  signal serial_data_8_MC_D1 : STD_LOGIC; 
  signal serial_data_8_MC_UIM : STD_LOGIC; 
  signal serial_data_8_MC_D2_PT_0 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_b_prel : STD_LOGIC; 
  signal serial_data_8_MC_D2_PT_1 : STD_LOGIC; 
  signal serial_data_8_MC_D2 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_b_prel_MC_Q : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_b_prel_MC_D : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_b_prel_MC_D1 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_b_prel_MC_D2_PT_0 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_b_prel_MC_D2_PT_1 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_b_prel_MC_D2_PT_2 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_b_prel_MC_D2_PT_3 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_b_prel_MC_D2_PT_4 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_b_prel_MC_D2_PT_5 : STD_LOGIC; 
  signal lower_enc_enc_8b_10b_b_prel_MC_D2 : STD_LOGIC; 
  signal serial_data_9_MC_Q : STD_LOGIC; 
  signal serial_data_9_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal serial_data_9_MC_D : STD_LOGIC; 
  signal serial_data_9_MC_D1 : STD_LOGIC; 
  signal serial_data_9_MC_UIM : STD_LOGIC; 
  signal serial_data_9_MC_D2_PT_0 : STD_LOGIC; 
  signal serial_data_9_MC_D2_PT_1 : STD_LOGIC; 
  signal serial_data_9_MC_D2 : STD_LOGIC; 
  signal VCC : STD_LOGIC; 
  signal GND : STD_LOGIC; 
  signal PRLD : STD_LOGIC; 
  signal NlwInverterSignal_dis_out_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_dis_out_MC_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_dis_out_MC_D2_PT_1_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_dis_out_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_dis_out_MC_D2_PT_2_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_dis_out_MC_D2_PT_2_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_FOOBAR3_ctinst_7_OUT : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_dis_func_prs_state_fft1_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_dis_func_prs_state_fft1_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_dis_func_prs_state_fft1_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_dis_func_prs_state_fft1_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_dis_func_prs_state_fft3_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_dis_func_prs_state_fft3_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_dis_func_prs_state_fft3_MC_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_dis_func_prs_state_fft3_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_dis_func_prs_state_fft3_MC_D2_PT_2_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_dis_func_prs_state_fft3_MC_D2_PT_2_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_dis_func_prs_state_fft2_MC_D1_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_prs_state_fft2_MC_D2_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_prs_state_fft2_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_prs_state_fft2_MC_D2_PT_1_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_prs_state_fft1_MC_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_226_MC_D1_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_226_MC_D1_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft2_MC_D1_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_1_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_2_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_1_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_1_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_2_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_2_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_s_func_prs_state_ffd1_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_s_func_prs_state_ffd1_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_s_func_prs_state_ffd1_MC_D2_PT_1_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_s_func_prs_state_ffd2_MC_D1_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_s_func_prs_state_ffd2_MC_D1_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_s_func_prs_state_ffd2_MC_D1_PT_0_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_s_func_prs_state_ffd2_MC_D1_PT_0_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_s_func_prs_state_ffd2_MC_D1_PT_0_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_233_MC_D1_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_233_MC_D1_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_233_MC_D1_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_disparity_rdy_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_dis_func_prs_state_ffd1_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_dis_func_prs_state_ffd1_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_dis_func_prs_state_ffd1_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_prs_state_fft2_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_prs_state_fft2_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_prs_state_fft2_MC_D2_PT_1_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_prs_state_fft1_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_prs_state_fft1_MC_D2_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_prs_state_fft1_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft2_MC_D1_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_1_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_2_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_1_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_1_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_2_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_2_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_func_prs_state_ffd1_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_func_prs_state_ffd1_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_func_prs_state_ffd1_MC_D2_PT_1_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_func_prs_state_ffd2_MC_D1_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_func_prs_state_ffd2_MC_D1_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_func_prs_state_ffd2_MC_D1_PT_0_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_func_prs_state_ffd2_MC_D1_PT_0_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_func_prs_state_ffd2_MC_D1_PT_0_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_312_MC_D1_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_312_MC_D1_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_dis_func_n0040_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_dis_func_n0040_MC_D2_PT_2_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_dis_func_n0040_MC_D2_PT_3_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_dis_func_n0040_MC_D2_PT_3_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_dis_func_n0040_MC_D2_PT_4_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_dis_func_n0040_MC_D2_PT_4_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_dis_func_n0040_MC_D2_PT_5_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_dis_func_n0040_MC_D2_PT_5_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_dis_func_n0040_MC_D2_PT_6_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_dis_func_n0040_MC_D2_PT_6_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_dis_func_n0040_MC_D2_PT_6_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_dis_func_n0040_MC_D2_PT_6_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_dis_func_n0040_MC_D2_PT_7_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_dis_func_n0040_MC_D2_PT_7_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_307_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_307_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_run_disparity_MC_D2_PT_0_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_run_disparity_MC_D2_PT_1_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_run_disparity_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_run_disparity_MC_D2_PT_3_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_run_disparity_MC_D2_PT_3_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_run_disparity_MC_D2_PT_3_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_nds6_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_nds6_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_nds6_MC_D2_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_nds6_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_nds6_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_nds6_MC_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_nds6_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_nds6_MC_D2_PT_2_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_nds6_MC_D2_PT_2_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_nds6_MC_D2_PT_2_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_nds6_MC_D2_PT_3_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_nds6_MC_D2_PT_3_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_246_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_246_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_246_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_246_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_pds6_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_pds6_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_pds6_MC_D2_PT_2_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_pds6_MC_D2_PT_3_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_pds6_MC_D2_PT_4_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_pds6_MC_D2_PT_4_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_pds6_MC_D2_PT_4_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_pds6_MC_D2_PT_5_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_pds6_MC_D2_PT_5_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_pds6_MC_D2_PT_5_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_pds6_MC_D2_PT_6_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_pds6_MC_D2_PT_6_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_pds6_MC_D2_PT_6_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_327_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_327_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_327_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_327_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_nds6_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_nds6_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_nds6_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_nds6_MC_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_nds6_MC_D2_PT_1_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_nds6_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_nds6_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_nds6_MC_D2_PT_2_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_nds6_MC_D2_PT_2_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_nds6_MC_D2_PT_3_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_nds6_MC_D2_PT_3_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_pds6_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_pds6_MC_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_pds6_MC_D2_PT_1_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_pds6_MC_D2_PT_2_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_pds6_MC_D2_PT_2_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_pds6_MC_D2_PT_3_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_pds6_MC_D2_PT_3_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_pds6_MC_D2_PT_3_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_pds6_MC_D2_PT_3_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_pds6_MC_D2_PT_3_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_pds6_MC_D2_PT_3_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_0_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_0_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_0_MC_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_0_MC_D2_PT_1_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_0_MC_D2_PT_1_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_0_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_0_MC_D2_PT_2_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_0_MC_D2_PT_2_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_0_MC_D2_PT_2_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_0_MC_D2_PT_3_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_0_MC_D2_PT_3_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_0_MC_D2_PT_4_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_0_MC_D2_PT_4_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_s_term_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_s_term_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_s_term_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_s_term_MC_D2_PT_3_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_s_term_MC_D2_PT_3_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_s_term_MC_D2_PT_4_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_s_term_MC_D2_PT_5_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_s_term_MC_D2_PT_5_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_s_term_MC_D2_PT_7_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_s_term_MC_D2_PT_8_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_s_term_MC_D2_PT_8_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_s_term_MC_D2_PT_10_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_s_term_MC_D2_PT_10_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_s_term_MC_D2_PT_10_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_s_term_MC_D2_PT_11_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_s_term_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_377_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_377_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_377_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_377_MC_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_10_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_10_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_10_MC_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_10_MC_D2_PT_1_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_10_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_10_MC_D2_PT_2_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_10_MC_D2_PT_2_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_10_MC_D2_PT_3_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_10_MC_D2_PT_4_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_302_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_302_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_302_MC_D2_PT_2_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_1_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_1_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_1_IN8 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_2_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_2_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_2_IN8 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_3_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_3_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_3_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_3_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_3_IN8 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_4_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_4_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_4_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_4_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_4_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_4_IN8 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_5_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_5_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_5_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_5_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_5_IN8 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_6_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_6_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_6_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_6_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_6_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_6_IN8 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_7_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_7_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_7_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_7_IN10 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_8_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_8_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_8_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_8_IN10 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_9_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_9_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_9_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_s_term_MC_D2_PT_9_IN10 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_11_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_11_MC_D2_PT_1_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_12_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_12_MC_D2_PT_1_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_12_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_12_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_12_MC_D2_PT_2_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_12_MC_D2_PT_3_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_12_MC_D2_PT_3_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_12_MC_D2_PT_3_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_13_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_13_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_13_MC_D2_PT_1_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_13_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_13_MC_D2_PT_2_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_13_MC_D2_PT_3_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_13_MC_D2_PT_3_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_13_MC_D2_PT_3_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_14_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_14_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_14_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_14_MC_D2_PT_3_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_14_MC_D2_PT_3_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_14_MC_D2_PT_4_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_14_MC_D2_PT_4_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_14_MC_D2_PT_5_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_14_MC_D2_PT_5_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_14_MC_D2_PT_6_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_14_MC_D2_PT_6_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_14_MC_D2_PT_7_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_14_MC_D2_PT_8_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_14_MC_D2_PT_8_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_14_MC_D2_PT_8_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_14_MC_D2_PT_9_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_14_MC_D2_PT_10_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_14_MC_D2_PT_10_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_14_MC_D2_PT_10_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_14_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_15_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_15_MC_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_3_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_3_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_4_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_5_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_6_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_7_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_7_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_7_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_8_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_8_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_8_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_8_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_8_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_16_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_16_MC_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_d_prel_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_d_prel_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_d_prel_MC_D2_PT_1_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_d_prel_MC_D2_PT_1_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_d_prel_MC_D2_PT_2_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_d_prel_MC_D2_PT_2_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_d_prel_MC_D2_PT_2_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_17_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_17_MC_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_1_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_1_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_2_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_2_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_2_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_3_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_3_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_3_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_3_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_3_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_4_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_4_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_4_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_4_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_18_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_18_MC_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_1_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_1_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_2_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_2_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_2_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_3_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_3_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_3_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_3_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_4_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_4_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_4_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_4_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_4_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_19_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_19_MC_D2_PT_1_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_1_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_1_MC_D2_PT_1_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_1_MC_D2_PT_1_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_2_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_2_MC_D2_PT_1_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_2_MC_D2_PT_2_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_2_MC_D2_PT_3_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_2_MC_D2_PT_3_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_2_MC_D2_PT_3_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_3_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_3_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_3_MC_D2_PT_1_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_3_MC_D2_PT_1_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_3_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_3_MC_D2_PT_2_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_3_MC_D2_PT_2_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_3_MC_D2_PT_3_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_3_MC_D2_PT_3_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_3_MC_D2_PT_3_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_3_MC_D2_PT_3_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_4_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_4_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_4_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_4_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_4_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_4_MC_D2_PT_3_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_4_MC_D2_PT_4_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_4_MC_D2_PT_5_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_4_MC_D2_PT_6_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_4_MC_D2_PT_7_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_4_MC_D2_PT_7_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_4_MC_D2_PT_7_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_4_MC_D2_PT_8_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_4_MC_D2_PT_9_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_4_MC_D2_PT_9_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_4_MC_D2_PT_9_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_4_MC_D2_PT_10_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_4_MC_D2_PT_10_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_4_MC_D2_PT_11_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_4_MC_D2_PT_11_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_4_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_5_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_5_MC_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_3_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_4_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_5_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_6_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_7_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_7_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_7_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_8_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_8_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_8_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_8_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_8_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_6_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_6_MC_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_1_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_1_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_1_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_2_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_2_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_2_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_3_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_3_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_3_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_3_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_7_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_7_MC_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_1_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_1_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_2_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_2_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_3_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_3_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_3_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_3_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_3_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_4_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_4_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_4_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_4_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_8_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_8_MC_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_1_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_2_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_2_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_3_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_3_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_3_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_4_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_4_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_4_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_5_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_5_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_5_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_5_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_5_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_9_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_9_MC_D2_PT_1_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_serial_data_9_MC_D2_PT_1_IN5 : STD_LOGIC; 
begin
  dis_out_0 : X_BUF
    port map (
      I => dis_out_MC_Q,
      O => dis_out
    );
  dis_out_MC_Q_1 : X_BUF
    port map (
      I => dis_out_MC_Q_tsim_ireg_Q,
      O => dis_out_MC_Q
    );
  dis_out_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => dis_out_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => dis_out_MC_Q_tsim_ireg_Q
    );
  VCC_ONE : X_ONE
    port map (
      O => VCC
    );
  GND_ZERO : X_ZERO
    port map (
      O => GND
    );
  dis_out_MC_D1_2 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => dis_out_MC_D1
    );
  dis_out_MC_D2_PT_0_3 : X_AND2
    port map (
      I0 => NlwInverterSignal_dis_out_MC_D2_PT_0_IN0,
      I1 => dis_out_MC_UIM,
      O => dis_out_MC_D2_PT_0
    );
  dis_out_MC_D2_PT_1_4 : X_AND5
    port map (
      I0 => rst_II_UIM,
      I1 => lower_enc_dis_func_prs_state_fft1,
      I2 => NlwInverterSignal_dis_out_MC_D2_PT_1_IN2,
      I3 => lower_enc_dis_func_prs_state_fft2,
      I4 => NlwInverterSignal_dis_out_MC_D2_PT_1_IN4,
      O => dis_out_MC_D2_PT_1
    );
  dis_out_MC_D2_PT_2_5 : X_AND5
    port map (
      I0 => rst_II_UIM,
      I1 => NlwInverterSignal_dis_out_MC_D2_PT_2_IN1,
      I2 => lower_enc_dis_func_prs_state_fft3,
      I3 => NlwInverterSignal_dis_out_MC_D2_PT_2_IN3,
      I4 => NlwInverterSignal_dis_out_MC_D2_PT_2_IN4,
      O => dis_out_MC_D2_PT_2
    );
  dis_out_MC_D2_6 : X_OR3
    port map (
      I0 => dis_out_MC_D2_PT_0,
      I1 => dis_out_MC_D2_PT_1,
      I2 => dis_out_MC_D2_PT_2,
      O => dis_out_MC_D2
    );
  dis_out_MC_XOR : X_XOR2
    port map (
      I0 => dis_out_MC_D1,
      I1 => dis_out_MC_D2,
      O => dis_out_MC_D
    );
  dis_out_MC_UIM_7 : X_BUF
    port map (
      I => dis_out_MC_Q_tsim_ireg_Q,
      O => dis_out_MC_UIM
    );
  rst_II_UIM_8 : X_BUF
    port map (
      I => rst,
      O => rst_II_UIM
    );
  lower_enc_dis_func_prs_state_fft1_9 : X_BUF
    port map (
      I => lower_enc_dis_func_prs_state_fft1_MC_Q,
      O => lower_enc_dis_func_prs_state_fft1
    );
  lower_enc_dis_func_prs_state_fft1_MC_R_OR_PRLD_10 : X_OR2
    port map (
      I0 => FOOBAR3_ctinst_7,
      I1 => PRLD,
      O => lower_enc_dis_func_prs_state_fft1_MC_R_OR_PRLD
    );
  lower_enc_dis_func_prs_state_fft1_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => lower_enc_dis_func_prs_state_fft1_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => lower_enc_dis_func_prs_state_fft1_MC_R_OR_PRLD,
      O => lower_enc_dis_func_prs_state_fft1_MC_Q
    );
  FOOBAR3_ctinst_7_11 : X_AND2
    port map (
      I0 => rst_II_UIM,
      I1 => rst_II_UIM,
      O => NlwInverterSignal_FOOBAR3_ctinst_7_OUT
    );
  lower_enc_dis_func_prs_state_fft1_MC_D1_12 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => lower_enc_dis_func_prs_state_fft1_MC_D1
    );
  lower_enc_dis_func_prs_state_fft1_MC_D2_PT_0_13 : X_AND2
    port map (
      I0 => lower_enc_dis_func_prs_state_fft1,
      I1 => NlwInverterSignal_lower_enc_dis_func_prs_state_fft1_MC_D2_PT_0_IN1,
      O => lower_enc_dis_func_prs_state_fft1_MC_D2_PT_0
    );
  lower_enc_dis_func_prs_state_fft1_MC_D2_PT_1_14 : X_AND3
    port map (
      I0 => NlwInverterSignal_lower_enc_dis_func_prs_state_fft1_MC_D2_PT_1_IN0,
      I1 => lower_enc_prs_state_fft1,
      I2 => N_PZ_233,
      O => lower_enc_dis_func_prs_state_fft1_MC_D2_PT_1
    );
  lower_enc_dis_func_prs_state_fft1_MC_D2_PT_2_15 : X_AND4
    port map (
      I0 => NlwInverterSignal_lower_enc_dis_func_prs_state_fft1_MC_D2_PT_2_IN0,
      I1 => NlwInverterSignal_lower_enc_dis_func_prs_state_fft1_MC_D2_PT_2_IN1,
      I2 => lower_enc_dis_func_prs_state_fft2,
      I3 => disparity_rdy,
      O => lower_enc_dis_func_prs_state_fft1_MC_D2_PT_2
    );
  lower_enc_dis_func_prs_state_fft1_MC_D2_16 : X_OR3
    port map (
      I0 => lower_enc_dis_func_prs_state_fft1_MC_D2_PT_0,
      I1 => lower_enc_dis_func_prs_state_fft1_MC_D2_PT_1,
      I2 => lower_enc_dis_func_prs_state_fft1_MC_D2_PT_2,
      O => lower_enc_dis_func_prs_state_fft1_MC_D2
    );
  lower_enc_dis_func_prs_state_fft1_MC_D_17 : X_XOR2
    port map (
      I0 => lower_enc_dis_func_prs_state_fft1_MC_D_TFF,
      I1 => lower_enc_dis_func_prs_state_fft1_MC_Q,
      O => lower_enc_dis_func_prs_state_fft1_MC_D
    );
  lower_enc_dis_func_prs_state_fft1_MC_XOR : X_XOR2
    port map (
      I0 => lower_enc_dis_func_prs_state_fft1_MC_D1,
      I1 => lower_enc_dis_func_prs_state_fft1_MC_D2,
      O => lower_enc_dis_func_prs_state_fft1_MC_D_TFF
    );
  lower_enc_dis_func_prs_state_fft3_18 : X_BUF
    port map (
      I => lower_enc_dis_func_prs_state_fft3_MC_Q,
      O => lower_enc_dis_func_prs_state_fft3
    );
  lower_enc_dis_func_prs_state_fft3_MC_R_OR_PRLD_19 : X_OR2
    port map (
      I0 => FOOBAR3_ctinst_7,
      I1 => PRLD,
      O => lower_enc_dis_func_prs_state_fft3_MC_R_OR_PRLD
    );
  lower_enc_dis_func_prs_state_fft3_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => lower_enc_dis_func_prs_state_fft3_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => lower_enc_dis_func_prs_state_fft3_MC_R_OR_PRLD,
      O => lower_enc_dis_func_prs_state_fft3_MC_Q
    );
  lower_enc_dis_func_prs_state_fft3_MC_D1_20 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => lower_enc_dis_func_prs_state_fft3_MC_D1
    );
  lower_enc_dis_func_prs_state_fft3_MC_D2_PT_0_21 : X_AND3
    port map (
      I0 => lower_enc_dis_func_prs_state_fft1,
      I1 => NlwInverterSignal_lower_enc_dis_func_prs_state_fft3_MC_D2_PT_0_IN1,
      I2 => lower_enc_dis_func_prs_state_fft2,
      O => lower_enc_dis_func_prs_state_fft3_MC_D2_PT_0
    );
  lower_enc_dis_func_prs_state_fft3_MC_D2_PT_1_22 : X_AND4
    port map (
      I0 => NlwInverterSignal_lower_enc_dis_func_prs_state_fft3_MC_D2_PT_1_IN0,
      I1 => lower_enc_dis_func_prs_state_fft3,
      I2 => NlwInverterSignal_lower_enc_dis_func_prs_state_fft3_MC_D2_PT_1_IN2,
      I3 => lower_enc_prs_state_fft2,
      O => lower_enc_dis_func_prs_state_fft3_MC_D2_PT_1
    );
  lower_enc_dis_func_prs_state_fft3_MC_D2_PT_2_23 : X_AND4
    port map (
      I0 => NlwInverterSignal_lower_enc_dis_func_prs_state_fft3_MC_D2_PT_2_IN0,
      I1 => lower_enc_dis_func_prs_state_fft3,
      I2 => NlwInverterSignal_lower_enc_dis_func_prs_state_fft3_MC_D2_PT_2_IN2,
      I3 => NlwInverterSignal_lower_enc_dis_func_prs_state_fft3_MC_D2_PT_2_IN3,
      O => lower_enc_dis_func_prs_state_fft3_MC_D2_PT_2
    );
  lower_enc_dis_func_prs_state_fft3_MC_D2_24 : X_OR3
    port map (
      I0 => lower_enc_dis_func_prs_state_fft3_MC_D2_PT_0,
      I1 => lower_enc_dis_func_prs_state_fft3_MC_D2_PT_1,
      I2 => lower_enc_dis_func_prs_state_fft3_MC_D2_PT_2,
      O => lower_enc_dis_func_prs_state_fft3_MC_D2
    );
  lower_enc_dis_func_prs_state_fft3_MC_D_25 : X_XOR2
    port map (
      I0 => lower_enc_dis_func_prs_state_fft3_MC_D_TFF,
      I1 => lower_enc_dis_func_prs_state_fft3_MC_Q,
      O => lower_enc_dis_func_prs_state_fft3_MC_D
    );
  lower_enc_dis_func_prs_state_fft3_MC_XOR : X_XOR2
    port map (
      I0 => lower_enc_dis_func_prs_state_fft3_MC_D1,
      I1 => lower_enc_dis_func_prs_state_fft3_MC_D2,
      O => lower_enc_dis_func_prs_state_fft3_MC_D_TFF
    );
  lower_enc_dis_func_prs_state_fft2_26 : X_BUF
    port map (
      I => lower_enc_dis_func_prs_state_fft2_MC_Q,
      O => lower_enc_dis_func_prs_state_fft2
    );
  lower_enc_dis_func_prs_state_fft2_MC_R_OR_PRLD_27 : X_OR2
    port map (
      I0 => FOOBAR3_ctinst_7,
      I1 => PRLD,
      O => lower_enc_dis_func_prs_state_fft2_MC_R_OR_PRLD
    );
  lower_enc_dis_func_prs_state_fft2_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => lower_enc_dis_func_prs_state_fft2_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => lower_enc_dis_func_prs_state_fft2_MC_R_OR_PRLD,
      O => lower_enc_dis_func_prs_state_fft2_MC_Q
    );
  lower_enc_dis_func_prs_state_fft2_MC_D1_PT_0_28 : X_AND2
    port map (
      I0 => lower_enc_dis_func_prs_state_fft1,
      I1 => NlwInverterSignal_lower_enc_dis_func_prs_state_fft2_MC_D1_PT_0_IN1,
      O => lower_enc_dis_func_prs_state_fft2_MC_D1_PT_0
    );
  lower_enc_dis_func_prs_state_fft2_MC_D1_29 : X_OR2
    port map (
      I0 => lower_enc_dis_func_prs_state_fft2_MC_D1_PT_0,
      I1 => lower_enc_dis_func_prs_state_fft2_MC_D1_PT_0,
      O => lower_enc_dis_func_prs_state_fft2_MC_D1
    );
  lower_enc_dis_func_prs_state_fft2_MC_D2_30 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => lower_enc_dis_func_prs_state_fft2_MC_D2
    );
  lower_enc_dis_func_prs_state_fft2_MC_D_31 : X_XOR2
    port map (
      I0 => lower_enc_dis_func_prs_state_fft2_MC_D_TFF,
      I1 => lower_enc_dis_func_prs_state_fft2_MC_Q,
      O => lower_enc_dis_func_prs_state_fft2_MC_D
    );
  lower_enc_dis_func_prs_state_fft2_MC_XOR : X_XOR2
    port map (
      I0 => lower_enc_dis_func_prs_state_fft2_MC_D1,
      I1 => lower_enc_dis_func_prs_state_fft2_MC_D2,
      O => lower_enc_dis_func_prs_state_fft2_MC_D_TFF
    );
  clk_II_FCLK_32 : X_BUF
    port map (
      I => clk,
      O => clk_II_FCLK
    );
  lower_enc_prs_state_fft2_33 : X_BUF
    port map (
      I => lower_enc_prs_state_fft2_MC_Q,
      O => lower_enc_prs_state_fft2
    );
  lower_enc_prs_state_fft2_MC_R_OR_PRLD_34 : X_OR2
    port map (
      I0 => FOOBAR3_ctinst_7,
      I1 => PRLD,
      O => lower_enc_prs_state_fft2_MC_R_OR_PRLD
    );
  lower_enc_prs_state_fft2_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => lower_enc_prs_state_fft2_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => lower_enc_prs_state_fft2_MC_R_OR_PRLD,
      O => lower_enc_prs_state_fft2_MC_Q
    );
  lower_enc_prs_state_fft2_MC_D1_35 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => lower_enc_prs_state_fft2_MC_D1
    );
  lower_enc_prs_state_fft2_MC_D2_PT_0_36 : X_AND3
    port map (
      I0 => lower_enc_prs_state_fft2,
      I1 => lower_enc_prs_state_fft1,
      I2 => NlwInverterSignal_lower_enc_prs_state_fft2_MC_D2_PT_0_IN2,
      O => lower_enc_prs_state_fft2_MC_D2_PT_0
    );
  lower_enc_prs_state_fft2_MC_D2_PT_1_37 : X_AND5
    port map (
      I0 => NlwInverterSignal_lower_enc_prs_state_fft2_MC_D2_PT_1_IN0,
      I1 => lower_enc_prs_state_fft1,
      I2 => lower_enc_enc_8b_10b_prs_state_fft2,
      I3 => NlwInverterSignal_lower_enc_prs_state_fft2_MC_D2_PT_1_IN3,
      I4 => lower_enc_enc_8b_10b_prs_state_fft1,
      O => lower_enc_prs_state_fft2_MC_D2_PT_1
    );
  lower_enc_prs_state_fft2_MC_D2_38 : X_OR2
    port map (
      I0 => lower_enc_prs_state_fft2_MC_D2_PT_0,
      I1 => lower_enc_prs_state_fft2_MC_D2_PT_1,
      O => lower_enc_prs_state_fft2_MC_D2
    );
  lower_enc_prs_state_fft2_MC_D_39 : X_XOR2
    port map (
      I0 => lower_enc_prs_state_fft2_MC_D_TFF,
      I1 => lower_enc_prs_state_fft2_MC_Q,
      O => lower_enc_prs_state_fft2_MC_D
    );
  lower_enc_prs_state_fft2_MC_XOR : X_XOR2
    port map (
      I0 => lower_enc_prs_state_fft2_MC_D1,
      I1 => lower_enc_prs_state_fft2_MC_D2,
      O => lower_enc_prs_state_fft2_MC_D_TFF
    );
  lower_enc_prs_state_fft1_40 : X_BUF
    port map (
      I => lower_enc_prs_state_fft1_MC_Q,
      O => lower_enc_prs_state_fft1
    );
  lower_enc_prs_state_fft1_MC_R_OR_PRLD_41 : X_OR2
    port map (
      I0 => FOOBAR3_ctinst_7,
      I1 => PRLD,
      O => lower_enc_prs_state_fft1_MC_R_OR_PRLD
    );
  lower_enc_prs_state_fft1_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => lower_enc_prs_state_fft1_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => lower_enc_prs_state_fft1_MC_R_OR_PRLD,
      O => lower_enc_prs_state_fft1_MC_Q
    );
  lower_enc_prs_state_fft1_MC_D1_42 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => lower_enc_prs_state_fft1_MC_D1
    );
  lower_enc_prs_state_fft1_MC_D2_PT_0_43 : X_AND2
    port map (
      I0 => frame_in_enc_II_UIM,
      I1 => N_PZ_226,
      O => lower_enc_prs_state_fft1_MC_D2_PT_0
    );
  lower_enc_prs_state_fft1_MC_D2_PT_1_44 : X_AND3
    port map (
      I0 => lower_enc_prs_state_fft2,
      I1 => lower_enc_prs_state_fft1,
      I2 => NlwInverterSignal_lower_enc_prs_state_fft1_MC_D2_PT_1_IN2,
      O => lower_enc_prs_state_fft1_MC_D2_PT_1
    );
  lower_enc_prs_state_fft1_MC_D2_45 : X_OR2
    port map (
      I0 => lower_enc_prs_state_fft1_MC_D2_PT_0,
      I1 => lower_enc_prs_state_fft1_MC_D2_PT_1,
      O => lower_enc_prs_state_fft1_MC_D2
    );
  lower_enc_prs_state_fft1_MC_D_46 : X_XOR2
    port map (
      I0 => lower_enc_prs_state_fft1_MC_D_TFF,
      I1 => lower_enc_prs_state_fft1_MC_Q,
      O => lower_enc_prs_state_fft1_MC_D
    );
  lower_enc_prs_state_fft1_MC_XOR : X_XOR2
    port map (
      I0 => lower_enc_prs_state_fft1_MC_D1,
      I1 => lower_enc_prs_state_fft1_MC_D2,
      O => lower_enc_prs_state_fft1_MC_D_TFF
    );
  frame_in_enc_II_UIM_47 : X_BUF
    port map (
      I => frame_in_enc,
      O => frame_in_enc_II_UIM
    );
  N_PZ_226_48 : X_BUF
    port map (
      I => N_PZ_226_MC_Q,
      O => N_PZ_226
    );
  N_PZ_226_MC_REG : X_BUF
    port map (
      I => N_PZ_226_MC_D,
      O => N_PZ_226_MC_Q
    );
  N_PZ_226_MC_D1_PT_0_49 : X_AND2
    port map (
      I0 => NlwInverterSignal_N_PZ_226_MC_D1_PT_0_IN0,
      I1 => NlwInverterSignal_N_PZ_226_MC_D1_PT_0_IN1,
      O => N_PZ_226_MC_D1_PT_0
    );
  N_PZ_226_MC_D1_50 : X_OR2
    port map (
      I0 => N_PZ_226_MC_D1_PT_0,
      I1 => N_PZ_226_MC_D1_PT_0,
      O => N_PZ_226_MC_D1
    );
  N_PZ_226_MC_D2_51 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => N_PZ_226_MC_D2
    );
  N_PZ_226_MC_XOR : X_XOR2
    port map (
      I0 => N_PZ_226_MC_D1,
      I1 => N_PZ_226_MC_D2,
      O => N_PZ_226_MC_D
    );
  lower_enc_enc_8b_10b_prs_state_fft2_52 : X_BUF
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft2_MC_Q,
      O => lower_enc_enc_8b_10b_prs_state_fft2
    );
  lower_enc_enc_8b_10b_prs_state_fft2_MC_R_OR_PRLD_53 : X_OR2
    port map (
      I0 => FOOBAR3_ctinst_7,
      I1 => PRLD,
      O => lower_enc_enc_8b_10b_prs_state_fft2_MC_R_OR_PRLD
    );
  lower_enc_enc_8b_10b_prs_state_fft2_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft2_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => lower_enc_enc_8b_10b_prs_state_fft2_MC_R_OR_PRLD,
      O => lower_enc_enc_8b_10b_prs_state_fft2_MC_Q
    );
  lower_enc_enc_8b_10b_prs_state_fft2_MC_D1_PT_0_54 : X_AND2
    port map (
      I0 => NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft2_MC_D1_PT_0_IN0,
      I1 => lower_enc_enc_8b_10b_prs_state_fft1,
      O => lower_enc_enc_8b_10b_prs_state_fft2_MC_D1_PT_0
    );
  lower_enc_enc_8b_10b_prs_state_fft2_MC_D1_55 : X_OR2
    port map (
      I0 => lower_enc_enc_8b_10b_prs_state_fft2_MC_D1_PT_0,
      I1 => lower_enc_enc_8b_10b_prs_state_fft2_MC_D1_PT_0,
      O => lower_enc_enc_8b_10b_prs_state_fft2_MC_D1
    );
  lower_enc_enc_8b_10b_prs_state_fft2_MC_D2_56 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => lower_enc_enc_8b_10b_prs_state_fft2_MC_D2
    );
  lower_enc_enc_8b_10b_prs_state_fft2_MC_D_57 : X_XOR2
    port map (
      I0 => lower_enc_enc_8b_10b_prs_state_fft2_MC_D_TFF,
      I1 => lower_enc_enc_8b_10b_prs_state_fft2_MC_Q,
      O => lower_enc_enc_8b_10b_prs_state_fft2_MC_D
    );
  lower_enc_enc_8b_10b_prs_state_fft2_MC_XOR : X_XOR2
    port map (
      I0 => lower_enc_enc_8b_10b_prs_state_fft2_MC_D1,
      I1 => lower_enc_enc_8b_10b_prs_state_fft2_MC_D2,
      O => lower_enc_enc_8b_10b_prs_state_fft2_MC_D_TFF
    );
  lower_enc_enc_8b_10b_prs_state_fft3_58 : X_BUF
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft3_MC_Q,
      O => lower_enc_enc_8b_10b_prs_state_fft3
    );
  lower_enc_enc_8b_10b_prs_state_fft3_MC_R_OR_PRLD_59 : X_OR2
    port map (
      I0 => FOOBAR3_ctinst_7,
      I1 => PRLD,
      O => lower_enc_enc_8b_10b_prs_state_fft3_MC_R_OR_PRLD
    );
  lower_enc_enc_8b_10b_prs_state_fft3_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft3_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => lower_enc_enc_8b_10b_prs_state_fft3_MC_R_OR_PRLD,
      O => lower_enc_enc_8b_10b_prs_state_fft3_MC_Q
    );
  lower_enc_enc_8b_10b_prs_state_fft3_MC_D1_60 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => lower_enc_enc_8b_10b_prs_state_fft3_MC_D1
    );
  lower_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_0_61 : X_AND3
    port map (
      I0 => lower_enc_enc_8b_10b_prs_state_fft2,
      I1 => NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_0_IN1,
      I2 => lower_enc_enc_8b_10b_prs_state_fft1,
      O => lower_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_0
    );
  lower_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_1_62 : X_AND4
    port map (
      I0 => lower_enc_prs_state_fft2,
      I1 => NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_1_IN1,
      I2 => lower_enc_enc_8b_10b_prs_state_fft3,
      I3 => NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_1_IN3,
      O => lower_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_1
    );
  lower_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_2_63 : X_AND4
    port map (
      I0 => NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_2_IN0,
      I1 => NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_2_IN1,
      I2 => lower_enc_enc_8b_10b_prs_state_fft3,
      I3 => NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_2_IN3,
      O => lower_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_2
    );
  lower_enc_enc_8b_10b_prs_state_fft3_MC_D2_64 : X_OR3
    port map (
      I0 => lower_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_0,
      I1 => lower_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_1,
      I2 => lower_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_2,
      O => lower_enc_enc_8b_10b_prs_state_fft3_MC_D2
    );
  lower_enc_enc_8b_10b_prs_state_fft3_MC_D_65 : X_XOR2
    port map (
      I0 => lower_enc_enc_8b_10b_prs_state_fft3_MC_D_TFF,
      I1 => lower_enc_enc_8b_10b_prs_state_fft3_MC_Q,
      O => lower_enc_enc_8b_10b_prs_state_fft3_MC_D
    );
  lower_enc_enc_8b_10b_prs_state_fft3_MC_XOR : X_XOR2
    port map (
      I0 => lower_enc_enc_8b_10b_prs_state_fft3_MC_D1,
      I1 => lower_enc_enc_8b_10b_prs_state_fft3_MC_D2,
      O => lower_enc_enc_8b_10b_prs_state_fft3_MC_D_TFF
    );
  lower_enc_enc_8b_10b_prs_state_fft1_66 : X_BUF
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft1_MC_Q,
      O => lower_enc_enc_8b_10b_prs_state_fft1
    );
  lower_enc_enc_8b_10b_prs_state_fft1_MC_R_OR_PRLD_67 : X_OR2
    port map (
      I0 => FOOBAR3_ctinst_7,
      I1 => PRLD,
      O => lower_enc_enc_8b_10b_prs_state_fft1_MC_R_OR_PRLD
    );
  lower_enc_enc_8b_10b_prs_state_fft1_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft1_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => lower_enc_enc_8b_10b_prs_state_fft1_MC_R_OR_PRLD,
      O => lower_enc_enc_8b_10b_prs_state_fft1_MC_Q
    );
  lower_enc_enc_8b_10b_prs_state_fft1_MC_D1_68 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => lower_enc_enc_8b_10b_prs_state_fft1_MC_D1
    );
  lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_0_69 : X_AND2
    port map (
      I0 => NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_0_IN0,
      I1 => lower_enc_enc_8b_10b_prs_state_fft1,
      O => lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_0
    );
  lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_1_70 : X_AND5
    port map (
      I0 => NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_1_IN0,
      I1 => lower_enc_prs_state_fft1,
      I2 => NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_1_IN2,
      I3 => NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_1_IN3,
      I4 => NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_1_IN4,
      O => lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_1
    );
  lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_2_71 : X_AND5
    port map (
      I0 => lower_enc_enc_8b_10b_prs_state_fft2,
      I1 => NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_2_IN1,
      I2 => NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_2_IN2,
      I3 => NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_2_IN3,
      I4 => lower_enc_s_func_prs_state_ffd2,
      O => lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_2
    );
  lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_72 : X_OR3
    port map (
      I0 => lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_0,
      I1 => lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_1,
      I2 => lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_2,
      O => lower_enc_enc_8b_10b_prs_state_fft1_MC_D2
    );
  lower_enc_enc_8b_10b_prs_state_fft1_MC_D_73 : X_XOR2
    port map (
      I0 => lower_enc_enc_8b_10b_prs_state_fft1_MC_D_TFF,
      I1 => lower_enc_enc_8b_10b_prs_state_fft1_MC_Q,
      O => lower_enc_enc_8b_10b_prs_state_fft1_MC_D
    );
  lower_enc_enc_8b_10b_prs_state_fft1_MC_XOR : X_XOR2
    port map (
      I0 => lower_enc_enc_8b_10b_prs_state_fft1_MC_D1,
      I1 => lower_enc_enc_8b_10b_prs_state_fft1_MC_D2,
      O => lower_enc_enc_8b_10b_prs_state_fft1_MC_D_TFF
    );
  lower_enc_s_func_prs_state_ffd1_74 : X_BUF
    port map (
      I => lower_enc_s_func_prs_state_ffd1_MC_Q,
      O => lower_enc_s_func_prs_state_ffd1
    );
  lower_enc_s_func_prs_state_ffd1_MC_R_OR_PRLD_75 : X_OR2
    port map (
      I0 => FOOBAR3_ctinst_7,
      I1 => PRLD,
      O => lower_enc_s_func_prs_state_ffd1_MC_R_OR_PRLD
    );
  lower_enc_s_func_prs_state_ffd1_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => lower_enc_s_func_prs_state_ffd1_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => lower_enc_s_func_prs_state_ffd1_MC_R_OR_PRLD,
      O => lower_enc_s_func_prs_state_ffd1_MC_Q
    );
  lower_enc_s_func_prs_state_ffd1_MC_D1_76 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => lower_enc_s_func_prs_state_ffd1_MC_D1
    );
  lower_enc_s_func_prs_state_ffd1_MC_D2_PT_0_77 : X_AND2
    port map (
      I0 => NlwInverterSignal_lower_enc_s_func_prs_state_ffd1_MC_D2_PT_0_IN0,
      I1 => lower_enc_s_func_prs_state_ffd2,
      O => lower_enc_s_func_prs_state_ffd1_MC_D2_PT_0
    );
  lower_enc_s_func_prs_state_ffd1_MC_D2_PT_1_78 : X_AND4
    port map (
      I0 => NlwInverterSignal_lower_enc_s_func_prs_state_ffd1_MC_D2_PT_1_IN0,
      I1 => lower_enc_prs_state_fft1,
      I2 => lower_enc_s_func_prs_state_ffd1,
      I3 => NlwInverterSignal_lower_enc_s_func_prs_state_ffd1_MC_D2_PT_1_IN3,
      O => lower_enc_s_func_prs_state_ffd1_MC_D2_PT_1
    );
  lower_enc_s_func_prs_state_ffd1_MC_D2_79 : X_OR2
    port map (
      I0 => lower_enc_s_func_prs_state_ffd1_MC_D2_PT_0,
      I1 => lower_enc_s_func_prs_state_ffd1_MC_D2_PT_1,
      O => lower_enc_s_func_prs_state_ffd1_MC_D2
    );
  lower_enc_s_func_prs_state_ffd1_MC_XOR : X_XOR2
    port map (
      I0 => lower_enc_s_func_prs_state_ffd1_MC_D1,
      I1 => lower_enc_s_func_prs_state_ffd1_MC_D2,
      O => lower_enc_s_func_prs_state_ffd1_MC_D
    );
  lower_enc_s_func_prs_state_ffd2_80 : X_BUF
    port map (
      I => lower_enc_s_func_prs_state_ffd2_MC_Q,
      O => lower_enc_s_func_prs_state_ffd2
    );
  lower_enc_s_func_prs_state_ffd2_MC_R_OR_PRLD_81 : X_OR2
    port map (
      I0 => FOOBAR3_ctinst_7,
      I1 => PRLD,
      O => lower_enc_s_func_prs_state_ffd2_MC_R_OR_PRLD
    );
  lower_enc_s_func_prs_state_ffd2_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => lower_enc_s_func_prs_state_ffd2_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => lower_enc_s_func_prs_state_ffd2_MC_R_OR_PRLD,
      O => lower_enc_s_func_prs_state_ffd2_MC_Q
    );
  lower_enc_s_func_prs_state_ffd2_MC_D1_PT_0_82 : X_AND6
    port map (
      I0 => NlwInverterSignal_lower_enc_s_func_prs_state_ffd2_MC_D1_PT_0_IN0,
      I1 => lower_enc_enc_8b_10b_prs_state_fft2,
      I2 => NlwInverterSignal_lower_enc_s_func_prs_state_ffd2_MC_D1_PT_0_IN2,
      I3 => NlwInverterSignal_lower_enc_s_func_prs_state_ffd2_MC_D1_PT_0_IN3,
      I4 => NlwInverterSignal_lower_enc_s_func_prs_state_ffd2_MC_D1_PT_0_IN4,
      I5 => NlwInverterSignal_lower_enc_s_func_prs_state_ffd2_MC_D1_PT_0_IN5,
      O => lower_enc_s_func_prs_state_ffd2_MC_D1_PT_0
    );
  lower_enc_s_func_prs_state_ffd2_MC_D1_83 : X_OR2
    port map (
      I0 => lower_enc_s_func_prs_state_ffd2_MC_D1_PT_0,
      I1 => lower_enc_s_func_prs_state_ffd2_MC_D1_PT_0,
      O => lower_enc_s_func_prs_state_ffd2_MC_D1
    );
  lower_enc_s_func_prs_state_ffd2_MC_D2_84 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => lower_enc_s_func_prs_state_ffd2_MC_D2
    );
  lower_enc_s_func_prs_state_ffd2_MC_XOR : X_XOR2
    port map (
      I0 => lower_enc_s_func_prs_state_ffd2_MC_D1,
      I1 => lower_enc_s_func_prs_state_ffd2_MC_D2,
      O => lower_enc_s_func_prs_state_ffd2_MC_D
    );
  N_PZ_233_85 : X_BUF
    port map (
      I => N_PZ_233_MC_Q,
      O => N_PZ_233
    );
  N_PZ_233_MC_REG : X_BUF
    port map (
      I => N_PZ_233_MC_D,
      O => N_PZ_233_MC_Q
    );
  N_PZ_233_MC_D1_PT_0_86 : X_AND3
    port map (
      I0 => NlwInverterSignal_N_PZ_233_MC_D1_PT_0_IN0,
      I1 => NlwInverterSignal_N_PZ_233_MC_D1_PT_0_IN1,
      I2 => NlwInverterSignal_N_PZ_233_MC_D1_PT_0_IN2,
      O => N_PZ_233_MC_D1_PT_0
    );
  N_PZ_233_MC_D1_87 : X_OR2
    port map (
      I0 => N_PZ_233_MC_D1_PT_0,
      I1 => N_PZ_233_MC_D1_PT_0,
      O => N_PZ_233_MC_D1
    );
  N_PZ_233_MC_D2_88 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => N_PZ_233_MC_D2
    );
  N_PZ_233_MC_XOR : X_XOR2
    port map (
      I0 => N_PZ_233_MC_D1,
      I1 => N_PZ_233_MC_D2,
      O => N_PZ_233_MC_D
    );
  disparity_rdy_89 : X_BUF
    port map (
      I => disparity_rdy_MC_Q,
      O => disparity_rdy
    );
  disparity_rdy_MC_R_OR_PRLD_90 : X_OR2
    port map (
      I0 => FOOBAR3_ctinst_7,
      I1 => PRLD,
      O => disparity_rdy_MC_R_OR_PRLD
    );
  disparity_rdy_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => disparity_rdy_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => disparity_rdy_MC_R_OR_PRLD,
      O => disparity_rdy_MC_Q
    );
  disparity_rdy_MC_D1_91 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => disparity_rdy_MC_D1
    );
  disparity_rdy_MC_D2_PT_0_92 : X_AND2
    port map (
      I0 => upper_enc_dis_func_prs_state_ffd1,
      I1 => upper_enc_dis_func_prs_state_ffd1,
      O => disparity_rdy_MC_D2_PT_0
    );
  disparity_rdy_MC_D2_PT_1_93 : X_AND3
    port map (
      I0 => disparity_rdy,
      I1 => NlwInverterSignal_disparity_rdy_MC_D2_PT_1_IN1,
      I2 => upper_enc_prs_state_fft1,
      O => disparity_rdy_MC_D2_PT_1
    );
  disparity_rdy_MC_D2_94 : X_OR2
    port map (
      I0 => disparity_rdy_MC_D2_PT_0,
      I1 => disparity_rdy_MC_D2_PT_1,
      O => disparity_rdy_MC_D2
    );
  disparity_rdy_MC_XOR : X_XOR2
    port map (
      I0 => disparity_rdy_MC_D1,
      I1 => disparity_rdy_MC_D2,
      O => disparity_rdy_MC_D
    );
  upper_enc_dis_func_prs_state_ffd1_95 : X_BUF
    port map (
      I => upper_enc_dis_func_prs_state_ffd1_MC_Q,
      O => upper_enc_dis_func_prs_state_ffd1
    );
  upper_enc_dis_func_prs_state_ffd1_MC_R_OR_PRLD_96 : X_OR2
    port map (
      I0 => FOOBAR3_ctinst_7,
      I1 => PRLD,
      O => upper_enc_dis_func_prs_state_ffd1_MC_R_OR_PRLD
    );
  upper_enc_dis_func_prs_state_ffd1_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => upper_enc_dis_func_prs_state_ffd1_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => upper_enc_dis_func_prs_state_ffd1_MC_R_OR_PRLD,
      O => upper_enc_dis_func_prs_state_ffd1_MC_Q
    );
  upper_enc_dis_func_prs_state_ffd1_MC_D1_97 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => upper_enc_dis_func_prs_state_ffd1_MC_D1
    );
  upper_enc_dis_func_prs_state_ffd1_MC_D2_PT_0_98 : X_AND2
    port map (
      I0 => NlwInverterSignal_upper_enc_dis_func_prs_state_ffd1_MC_D2_PT_0_IN0,
      I1 => upper_enc_dis_func_prs_state_ffd1,
      O => upper_enc_dis_func_prs_state_ffd1_MC_D2_PT_0
    );
  upper_enc_dis_func_prs_state_ffd1_MC_D2_PT_1_99 : X_AND3
    port map (
      I0 => NlwInverterSignal_upper_enc_dis_func_prs_state_ffd1_MC_D2_PT_1_IN0,
      I1 => NlwInverterSignal_upper_enc_dis_func_prs_state_ffd1_MC_D2_PT_1_IN1,
      I2 => upper_enc_prs_state_fft1,
      O => upper_enc_dis_func_prs_state_ffd1_MC_D2_PT_1
    );
  upper_enc_dis_func_prs_state_ffd1_MC_D2_100 : X_OR2
    port map (
      I0 => upper_enc_dis_func_prs_state_ffd1_MC_D2_PT_0,
      I1 => upper_enc_dis_func_prs_state_ffd1_MC_D2_PT_1,
      O => upper_enc_dis_func_prs_state_ffd1_MC_D2
    );
  upper_enc_dis_func_prs_state_ffd1_MC_XOR : X_XOR2
    port map (
      I0 => upper_enc_dis_func_prs_state_ffd1_MC_D1,
      I1 => upper_enc_dis_func_prs_state_ffd1_MC_D2,
      O => upper_enc_dis_func_prs_state_ffd1_MC_D
    );
  upper_enc_prs_state_fft2_101 : X_BUF
    port map (
      I => upper_enc_prs_state_fft2_MC_Q,
      O => upper_enc_prs_state_fft2
    );
  upper_enc_prs_state_fft2_MC_R_OR_PRLD_102 : X_OR2
    port map (
      I0 => FOOBAR3_ctinst_7,
      I1 => PRLD,
      O => upper_enc_prs_state_fft2_MC_R_OR_PRLD
    );
  upper_enc_prs_state_fft2_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => upper_enc_prs_state_fft2_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => upper_enc_prs_state_fft2_MC_R_OR_PRLD,
      O => upper_enc_prs_state_fft2_MC_Q
    );
  upper_enc_prs_state_fft2_MC_D1_103 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => upper_enc_prs_state_fft2_MC_D1
    );
  upper_enc_prs_state_fft2_MC_D2_PT_0_104 : X_AND3
    port map (
      I0 => NlwInverterSignal_upper_enc_prs_state_fft2_MC_D2_PT_0_IN0,
      I1 => upper_enc_prs_state_fft2,
      I2 => upper_enc_prs_state_fft1,
      O => upper_enc_prs_state_fft2_MC_D2_PT_0
    );
  upper_enc_prs_state_fft2_MC_D2_PT_1_105 : X_AND5
    port map (
      I0 => NlwInverterSignal_upper_enc_prs_state_fft2_MC_D2_PT_1_IN0,
      I1 => upper_enc_prs_state_fft1,
      I2 => upper_enc_enc_8b_10b_prs_state_fft2,
      I3 => NlwInverterSignal_upper_enc_prs_state_fft2_MC_D2_PT_1_IN3,
      I4 => upper_enc_enc_8b_10b_prs_state_fft1,
      O => upper_enc_prs_state_fft2_MC_D2_PT_1
    );
  upper_enc_prs_state_fft2_MC_D2_106 : X_OR2
    port map (
      I0 => upper_enc_prs_state_fft2_MC_D2_PT_0,
      I1 => upper_enc_prs_state_fft2_MC_D2_PT_1,
      O => upper_enc_prs_state_fft2_MC_D2
    );
  upper_enc_prs_state_fft2_MC_D_107 : X_XOR2
    port map (
      I0 => upper_enc_prs_state_fft2_MC_D_TFF,
      I1 => upper_enc_prs_state_fft2_MC_Q,
      O => upper_enc_prs_state_fft2_MC_D
    );
  upper_enc_prs_state_fft2_MC_XOR : X_XOR2
    port map (
      I0 => upper_enc_prs_state_fft2_MC_D1,
      I1 => upper_enc_prs_state_fft2_MC_D2,
      O => upper_enc_prs_state_fft2_MC_D_TFF
    );
  upper_enc_prs_state_fft1_108 : X_BUF
    port map (
      I => upper_enc_prs_state_fft1_MC_Q,
      O => upper_enc_prs_state_fft1
    );
  upper_enc_prs_state_fft1_MC_R_OR_PRLD_109 : X_OR2
    port map (
      I0 => FOOBAR3_ctinst_7,
      I1 => PRLD,
      O => upper_enc_prs_state_fft1_MC_R_OR_PRLD
    );
  upper_enc_prs_state_fft1_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => upper_enc_prs_state_fft1_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => upper_enc_prs_state_fft1_MC_R_OR_PRLD,
      O => upper_enc_prs_state_fft1_MC_Q
    );
  upper_enc_prs_state_fft1_MC_D1_110 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => upper_enc_prs_state_fft1_MC_D1
    );
  upper_enc_prs_state_fft1_MC_D2_PT_0_111 : X_AND3
    port map (
      I0 => frame_in_enc_II_UIM,
      I1 => NlwInverterSignal_upper_enc_prs_state_fft1_MC_D2_PT_0_IN1,
      I2 => NlwInverterSignal_upper_enc_prs_state_fft1_MC_D2_PT_0_IN2,
      O => upper_enc_prs_state_fft1_MC_D2_PT_0
    );
  upper_enc_prs_state_fft1_MC_D2_PT_1_112 : X_AND3
    port map (
      I0 => NlwInverterSignal_upper_enc_prs_state_fft1_MC_D2_PT_1_IN0,
      I1 => upper_enc_prs_state_fft2,
      I2 => upper_enc_prs_state_fft1,
      O => upper_enc_prs_state_fft1_MC_D2_PT_1
    );
  upper_enc_prs_state_fft1_MC_D2_113 : X_OR2
    port map (
      I0 => upper_enc_prs_state_fft1_MC_D2_PT_0,
      I1 => upper_enc_prs_state_fft1_MC_D2_PT_1,
      O => upper_enc_prs_state_fft1_MC_D2
    );
  upper_enc_prs_state_fft1_MC_D_114 : X_XOR2
    port map (
      I0 => upper_enc_prs_state_fft1_MC_D_TFF,
      I1 => upper_enc_prs_state_fft1_MC_Q,
      O => upper_enc_prs_state_fft1_MC_D
    );
  upper_enc_prs_state_fft1_MC_XOR : X_XOR2
    port map (
      I0 => upper_enc_prs_state_fft1_MC_D1,
      I1 => upper_enc_prs_state_fft1_MC_D2,
      O => upper_enc_prs_state_fft1_MC_D_TFF
    );
  upper_enc_enc_8b_10b_prs_state_fft2_115 : X_BUF
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft2_MC_Q,
      O => upper_enc_enc_8b_10b_prs_state_fft2
    );
  upper_enc_enc_8b_10b_prs_state_fft2_MC_R_OR_PRLD_116 : X_OR2
    port map (
      I0 => FOOBAR3_ctinst_7,
      I1 => PRLD,
      O => upper_enc_enc_8b_10b_prs_state_fft2_MC_R_OR_PRLD
    );
  upper_enc_enc_8b_10b_prs_state_fft2_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft2_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => upper_enc_enc_8b_10b_prs_state_fft2_MC_R_OR_PRLD,
      O => upper_enc_enc_8b_10b_prs_state_fft2_MC_Q
    );
  upper_enc_enc_8b_10b_prs_state_fft2_MC_D1_PT_0_117 : X_AND2
    port map (
      I0 => NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft2_MC_D1_PT_0_IN0,
      I1 => upper_enc_enc_8b_10b_prs_state_fft1,
      O => upper_enc_enc_8b_10b_prs_state_fft2_MC_D1_PT_0
    );
  upper_enc_enc_8b_10b_prs_state_fft2_MC_D1_118 : X_OR2
    port map (
      I0 => upper_enc_enc_8b_10b_prs_state_fft2_MC_D1_PT_0,
      I1 => upper_enc_enc_8b_10b_prs_state_fft2_MC_D1_PT_0,
      O => upper_enc_enc_8b_10b_prs_state_fft2_MC_D1
    );
  upper_enc_enc_8b_10b_prs_state_fft2_MC_D2_119 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => upper_enc_enc_8b_10b_prs_state_fft2_MC_D2
    );
  upper_enc_enc_8b_10b_prs_state_fft2_MC_D_120 : X_XOR2
    port map (
      I0 => upper_enc_enc_8b_10b_prs_state_fft2_MC_D_TFF,
      I1 => upper_enc_enc_8b_10b_prs_state_fft2_MC_Q,
      O => upper_enc_enc_8b_10b_prs_state_fft2_MC_D
    );
  upper_enc_enc_8b_10b_prs_state_fft2_MC_XOR : X_XOR2
    port map (
      I0 => upper_enc_enc_8b_10b_prs_state_fft2_MC_D1,
      I1 => upper_enc_enc_8b_10b_prs_state_fft2_MC_D2,
      O => upper_enc_enc_8b_10b_prs_state_fft2_MC_D_TFF
    );
  upper_enc_enc_8b_10b_prs_state_fft3_121 : X_BUF
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft3_MC_Q,
      O => upper_enc_enc_8b_10b_prs_state_fft3
    );
  upper_enc_enc_8b_10b_prs_state_fft3_MC_R_OR_PRLD_122 : X_OR2
    port map (
      I0 => FOOBAR3_ctinst_7,
      I1 => PRLD,
      O => upper_enc_enc_8b_10b_prs_state_fft3_MC_R_OR_PRLD
    );
  upper_enc_enc_8b_10b_prs_state_fft3_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft3_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => upper_enc_enc_8b_10b_prs_state_fft3_MC_R_OR_PRLD,
      O => upper_enc_enc_8b_10b_prs_state_fft3_MC_Q
    );
  upper_enc_enc_8b_10b_prs_state_fft3_MC_D1_123 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => upper_enc_enc_8b_10b_prs_state_fft3_MC_D1
    );
  upper_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_0_124 : X_AND3
    port map (
      I0 => upper_enc_enc_8b_10b_prs_state_fft2,
      I1 => NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_0_IN1,
      I2 => upper_enc_enc_8b_10b_prs_state_fft1,
      O => upper_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_0
    );
  upper_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_1_125 : X_AND4
    port map (
      I0 => upper_enc_prs_state_fft2,
      I1 => NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_1_IN1,
      I2 => upper_enc_enc_8b_10b_prs_state_fft3,
      I3 => NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_1_IN3,
      O => upper_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_1
    );
  upper_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_2_126 : X_AND4
    port map (
      I0 => NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_2_IN0,
      I1 => NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_2_IN1,
      I2 => upper_enc_enc_8b_10b_prs_state_fft3,
      I3 => NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_2_IN3,
      O => upper_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_2
    );
  upper_enc_enc_8b_10b_prs_state_fft3_MC_D2_127 : X_OR3
    port map (
      I0 => upper_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_0,
      I1 => upper_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_1,
      I2 => upper_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_2,
      O => upper_enc_enc_8b_10b_prs_state_fft3_MC_D2
    );
  upper_enc_enc_8b_10b_prs_state_fft3_MC_D_128 : X_XOR2
    port map (
      I0 => upper_enc_enc_8b_10b_prs_state_fft3_MC_D_TFF,
      I1 => upper_enc_enc_8b_10b_prs_state_fft3_MC_Q,
      O => upper_enc_enc_8b_10b_prs_state_fft3_MC_D
    );
  upper_enc_enc_8b_10b_prs_state_fft3_MC_XOR : X_XOR2
    port map (
      I0 => upper_enc_enc_8b_10b_prs_state_fft3_MC_D1,
      I1 => upper_enc_enc_8b_10b_prs_state_fft3_MC_D2,
      O => upper_enc_enc_8b_10b_prs_state_fft3_MC_D_TFF
    );
  upper_enc_enc_8b_10b_prs_state_fft1_129 : X_BUF
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft1_MC_Q,
      O => upper_enc_enc_8b_10b_prs_state_fft1
    );
  upper_enc_enc_8b_10b_prs_state_fft1_MC_R_OR_PRLD_130 : X_OR2
    port map (
      I0 => FOOBAR3_ctinst_7,
      I1 => PRLD,
      O => upper_enc_enc_8b_10b_prs_state_fft1_MC_R_OR_PRLD
    );
  upper_enc_enc_8b_10b_prs_state_fft1_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft1_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => upper_enc_enc_8b_10b_prs_state_fft1_MC_R_OR_PRLD,
      O => upper_enc_enc_8b_10b_prs_state_fft1_MC_Q
    );
  upper_enc_enc_8b_10b_prs_state_fft1_MC_D1_131 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => upper_enc_enc_8b_10b_prs_state_fft1_MC_D1
    );
  upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_0_132 : X_AND2
    port map (
      I0 => NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_0_IN0,
      I1 => upper_enc_enc_8b_10b_prs_state_fft1,
      O => upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_0
    );
  upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_1_133 : X_AND5
    port map (
      I0 => NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_1_IN0,
      I1 => upper_enc_prs_state_fft1,
      I2 => NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_1_IN2,
      I3 => NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_1_IN3,
      I4 => NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_1_IN4,
      O => upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_1
    );
  upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_2_134 : X_AND5
    port map (
      I0 => upper_enc_enc_8b_10b_prs_state_fft2,
      I1 => NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_2_IN1,
      I2 => NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_2_IN2,
      I3 => NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_2_IN3,
      I4 => upper_enc_s_func_prs_state_ffd2,
      O => upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_2
    );
  upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_135 : X_OR3
    port map (
      I0 => upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_0,
      I1 => upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_1,
      I2 => upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_2,
      O => upper_enc_enc_8b_10b_prs_state_fft1_MC_D2
    );
  upper_enc_enc_8b_10b_prs_state_fft1_MC_D_136 : X_XOR2
    port map (
      I0 => upper_enc_enc_8b_10b_prs_state_fft1_MC_D_TFF,
      I1 => upper_enc_enc_8b_10b_prs_state_fft1_MC_Q,
      O => upper_enc_enc_8b_10b_prs_state_fft1_MC_D
    );
  upper_enc_enc_8b_10b_prs_state_fft1_MC_XOR : X_XOR2
    port map (
      I0 => upper_enc_enc_8b_10b_prs_state_fft1_MC_D1,
      I1 => upper_enc_enc_8b_10b_prs_state_fft1_MC_D2,
      O => upper_enc_enc_8b_10b_prs_state_fft1_MC_D_TFF
    );
  upper_enc_s_func_prs_state_ffd1_137 : X_BUF
    port map (
      I => upper_enc_s_func_prs_state_ffd1_MC_Q,
      O => upper_enc_s_func_prs_state_ffd1
    );
  upper_enc_s_func_prs_state_ffd1_MC_R_OR_PRLD_138 : X_OR2
    port map (
      I0 => FOOBAR3_ctinst_7,
      I1 => PRLD,
      O => upper_enc_s_func_prs_state_ffd1_MC_R_OR_PRLD
    );
  upper_enc_s_func_prs_state_ffd1_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => upper_enc_s_func_prs_state_ffd1_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => upper_enc_s_func_prs_state_ffd1_MC_R_OR_PRLD,
      O => upper_enc_s_func_prs_state_ffd1_MC_Q
    );
  upper_enc_s_func_prs_state_ffd1_MC_D1_139 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => upper_enc_s_func_prs_state_ffd1_MC_D1
    );
  upper_enc_s_func_prs_state_ffd1_MC_D2_PT_0_140 : X_AND2
    port map (
      I0 => NlwInverterSignal_upper_enc_s_func_prs_state_ffd1_MC_D2_PT_0_IN0,
      I1 => upper_enc_s_func_prs_state_ffd2,
      O => upper_enc_s_func_prs_state_ffd1_MC_D2_PT_0
    );
  upper_enc_s_func_prs_state_ffd1_MC_D2_PT_1_141 : X_AND4
    port map (
      I0 => NlwInverterSignal_upper_enc_s_func_prs_state_ffd1_MC_D2_PT_1_IN0,
      I1 => upper_enc_prs_state_fft1,
      I2 => upper_enc_s_func_prs_state_ffd1,
      I3 => NlwInverterSignal_upper_enc_s_func_prs_state_ffd1_MC_D2_PT_1_IN3,
      O => upper_enc_s_func_prs_state_ffd1_MC_D2_PT_1
    );
  upper_enc_s_func_prs_state_ffd1_MC_D2_142 : X_OR2
    port map (
      I0 => upper_enc_s_func_prs_state_ffd1_MC_D2_PT_0,
      I1 => upper_enc_s_func_prs_state_ffd1_MC_D2_PT_1,
      O => upper_enc_s_func_prs_state_ffd1_MC_D2
    );
  upper_enc_s_func_prs_state_ffd1_MC_XOR : X_XOR2
    port map (
      I0 => upper_enc_s_func_prs_state_ffd1_MC_D1,
      I1 => upper_enc_s_func_prs_state_ffd1_MC_D2,
      O => upper_enc_s_func_prs_state_ffd1_MC_D
    );
  upper_enc_s_func_prs_state_ffd2_143 : X_BUF
    port map (
      I => upper_enc_s_func_prs_state_ffd2_MC_Q,
      O => upper_enc_s_func_prs_state_ffd2
    );
  upper_enc_s_func_prs_state_ffd2_MC_R_OR_PRLD_144 : X_OR2
    port map (
      I0 => FOOBAR3_ctinst_7,
      I1 => PRLD,
      O => upper_enc_s_func_prs_state_ffd2_MC_R_OR_PRLD
    );
  upper_enc_s_func_prs_state_ffd2_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => upper_enc_s_func_prs_state_ffd2_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => upper_enc_s_func_prs_state_ffd2_MC_R_OR_PRLD,
      O => upper_enc_s_func_prs_state_ffd2_MC_Q
    );
  upper_enc_s_func_prs_state_ffd2_MC_D1_PT_0_145 : X_AND6
    port map (
      I0 => upper_enc_enc_8b_10b_prs_state_fft2,
      I1 => NlwInverterSignal_upper_enc_s_func_prs_state_ffd2_MC_D1_PT_0_IN1,
      I2 => NlwInverterSignal_upper_enc_s_func_prs_state_ffd2_MC_D1_PT_0_IN2,
      I3 => NlwInverterSignal_upper_enc_s_func_prs_state_ffd2_MC_D1_PT_0_IN3,
      I4 => NlwInverterSignal_upper_enc_s_func_prs_state_ffd2_MC_D1_PT_0_IN4,
      I5 => NlwInverterSignal_upper_enc_s_func_prs_state_ffd2_MC_D1_PT_0_IN5,
      O => upper_enc_s_func_prs_state_ffd2_MC_D1_PT_0
    );
  upper_enc_s_func_prs_state_ffd2_MC_D1_146 : X_OR2
    port map (
      I0 => upper_enc_s_func_prs_state_ffd2_MC_D1_PT_0,
      I1 => upper_enc_s_func_prs_state_ffd2_MC_D1_PT_0,
      O => upper_enc_s_func_prs_state_ffd2_MC_D1
    );
  upper_enc_s_func_prs_state_ffd2_MC_D2_147 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => upper_enc_s_func_prs_state_ffd2_MC_D2
    );
  upper_enc_s_func_prs_state_ffd2_MC_XOR : X_XOR2
    port map (
      I0 => upper_enc_s_func_prs_state_ffd2_MC_D1,
      I1 => upper_enc_s_func_prs_state_ffd2_MC_D2,
      O => upper_enc_s_func_prs_state_ffd2_MC_D
    );
  N_PZ_312_148 : X_BUF
    port map (
      I => N_PZ_312_MC_Q,
      O => N_PZ_312
    );
  N_PZ_312_MC_REG : X_BUF
    port map (
      I => N_PZ_312_MC_D,
      O => N_PZ_312_MC_Q
    );
  N_PZ_312_MC_D1_PT_0_149 : X_AND2
    port map (
      I0 => NlwInverterSignal_N_PZ_312_MC_D1_PT_0_IN0,
      I1 => NlwInverterSignal_N_PZ_312_MC_D1_PT_0_IN1,
      O => N_PZ_312_MC_D1_PT_0
    );
  N_PZ_312_MC_D1_150 : X_OR2
    port map (
      I0 => N_PZ_312_MC_D1_PT_0,
      I1 => N_PZ_312_MC_D1_PT_0,
      O => N_PZ_312_MC_D1
    );
  N_PZ_312_MC_D2_151 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => N_PZ_312_MC_D2
    );
  N_PZ_312_MC_XOR : X_XOR2
    port map (
      I0 => N_PZ_312_MC_D1,
      I1 => N_PZ_312_MC_D2,
      O => N_PZ_312_MC_D
    );
  lower_enc_dis_func_n0040_152 : X_BUF
    port map (
      I => lower_enc_dis_func_n0040_MC_Q,
      O => lower_enc_dis_func_n0040
    );
  lower_enc_dis_func_n0040_MC_REG : X_BUF
    port map (
      I => lower_enc_dis_func_n0040_MC_D,
      O => lower_enc_dis_func_n0040_MC_Q
    );
  lower_enc_dis_func_n0040_MC_D1_153 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => lower_enc_dis_func_n0040_MC_D1
    );
  lower_enc_dis_func_n0040_MC_D2_PT_0_154 : X_AND2
    port map (
      I0 => N_PZ_233,
      I1 => N_PZ_307,
      O => lower_enc_dis_func_n0040_MC_D2_PT_0
    );
  lower_enc_dis_func_n0040_MC_D2_PT_1_155 : X_AND2
    port map (
      I0 => lower_enc_nds6,
      I1 => lower_enc_pds6,
      O => lower_enc_dis_func_n0040_MC_D2_PT_1
    );
  lower_enc_dis_func_n0040_MC_D2_PT_2_156 : X_AND3
    port map (
      I0 => NlwInverterSignal_lower_enc_dis_func_n0040_MC_D2_PT_2_IN0,
      I1 => N_PZ_226,
      I2 => NlwInverterSignal_lower_enc_dis_func_n0040_MC_D2_PT_2_IN2,
      O => lower_enc_dis_func_n0040_MC_D2_PT_2
    );
  lower_enc_dis_func_n0040_MC_D2_PT_3_157 : X_AND4
    port map (
      I0 => data_trs_5_II_UIM,
      I1 => NlwInverterSignal_lower_enc_dis_func_n0040_MC_D2_PT_3_IN1,
      I2 => NlwInverterSignal_lower_enc_dis_func_n0040_MC_D2_PT_3_IN2,
      I3 => N_PZ_307,
      O => lower_enc_dis_func_n0040_MC_D2_PT_3
    );
  lower_enc_dis_func_n0040_MC_D2_PT_4_158 : X_AND4
    port map (
      I0 => data_trs_5_II_UIM,
      I1 => NlwInverterSignal_lower_enc_dis_func_n0040_MC_D2_PT_4_IN1,
      I2 => NlwInverterSignal_lower_enc_dis_func_n0040_MC_D2_PT_4_IN2,
      I3 => N_PZ_307,
      O => lower_enc_dis_func_n0040_MC_D2_PT_4
    );
  lower_enc_dis_func_n0040_MC_D2_PT_5_159 : X_AND4
    port map (
      I0 => NlwInverterSignal_lower_enc_dis_func_n0040_MC_D2_PT_5_IN0,
      I1 => data_trs_6_II_UIM,
      I2 => NlwInverterSignal_lower_enc_dis_func_n0040_MC_D2_PT_5_IN2,
      I3 => N_PZ_307,
      O => lower_enc_dis_func_n0040_MC_D2_PT_5
    );
  lower_enc_dis_func_n0040_MC_D2_PT_6_160 : X_AND4
    port map (
      I0 => NlwInverterSignal_lower_enc_dis_func_n0040_MC_D2_PT_6_IN0,
      I1 => NlwInverterSignal_lower_enc_dis_func_n0040_MC_D2_PT_6_IN1,
      I2 => NlwInverterSignal_lower_enc_dis_func_n0040_MC_D2_PT_6_IN2,
      I3 => NlwInverterSignal_lower_enc_dis_func_n0040_MC_D2_PT_6_IN3,
      O => lower_enc_dis_func_n0040_MC_D2_PT_6
    );
  lower_enc_dis_func_n0040_MC_D2_PT_7_161 : X_AND5
    port map (
      I0 => data_trs_5_II_UIM,
      I1 => data_trs_6_II_UIM,
      I2 => data_trs_7_II_UIM,
      I3 => NlwInverterSignal_lower_enc_dis_func_n0040_MC_D2_PT_7_IN3,
      I4 => NlwInverterSignal_lower_enc_dis_func_n0040_MC_D2_PT_7_IN4,
      O => lower_enc_dis_func_n0040_MC_D2_PT_7
    );
  lower_enc_dis_func_n0040_MC_D2_162 : X_OR8
    port map (
      I0 => lower_enc_dis_func_n0040_MC_D2_PT_0,
      I1 => lower_enc_dis_func_n0040_MC_D2_PT_1,
      I2 => lower_enc_dis_func_n0040_MC_D2_PT_2,
      I3 => lower_enc_dis_func_n0040_MC_D2_PT_3,
      I4 => lower_enc_dis_func_n0040_MC_D2_PT_4,
      I5 => lower_enc_dis_func_n0040_MC_D2_PT_5,
      I6 => lower_enc_dis_func_n0040_MC_D2_PT_6,
      I7 => lower_enc_dis_func_n0040_MC_D2_PT_7,
      O => lower_enc_dis_func_n0040_MC_D2
    );
  lower_enc_dis_func_n0040_MC_XOR : X_XOR2
    port map (
      I0 => lower_enc_dis_func_n0040_MC_D1,
      I1 => lower_enc_dis_func_n0040_MC_D2,
      O => lower_enc_dis_func_n0040_MC_D
    );
  N_PZ_307_163 : X_BUF
    port map (
      I => N_PZ_307_MC_Q,
      O => N_PZ_307
    );
  N_PZ_307_MC_REG : X_BUF
    port map (
      I => N_PZ_307_MC_D,
      O => N_PZ_307_MC_Q
    );
  N_PZ_307_MC_D1_PT_0_164 : X_AND2
    port map (
      I0 => run_disparity,
      I1 => run_disparity,
      O => N_PZ_307_MC_D1_PT_0
    );
  N_PZ_307_MC_D1_165 : X_OR2
    port map (
      I0 => N_PZ_307_MC_D1_PT_0,
      I1 => N_PZ_307_MC_D1_PT_0,
      O => N_PZ_307_MC_D1
    );
  N_PZ_307_MC_D2_PT_0_166 : X_AND2
    port map (
      I0 => NlwInverterSignal_N_PZ_307_MC_D2_PT_0_IN0,
      I1 => NlwInverterSignal_N_PZ_307_MC_D2_PT_0_IN1,
      O => N_PZ_307_MC_D2_PT_0
    );
  N_PZ_307_MC_D2_167 : X_OR2
    port map (
      I0 => N_PZ_307_MC_D2_PT_0,
      I1 => N_PZ_307_MC_D2_PT_0,
      O => N_PZ_307_MC_D2
    );
  N_PZ_307_MC_XOR : X_XOR2
    port map (
      I0 => N_PZ_307_MC_D1,
      I1 => N_PZ_307_MC_D2,
      O => N_PZ_307_MC_D
    );
  run_disparity_168 : X_BUF
    port map (
      I => run_disparity_MC_Q,
      O => run_disparity
    );
  run_disparity_MC_REG : X_BUF
    port map (
      I => run_disparity_MC_D,
      O => run_disparity_MC_Q
    );
  run_disparity_MC_D1_PT_0_169 : X_AND2
    port map (
      I0 => dis_in_II_UIM,
      I1 => disparity_rdy,
      O => run_disparity_MC_D1_PT_0
    );
  run_disparity_MC_D1_170 : X_OR2
    port map (
      I0 => run_disparity_MC_D1_PT_0,
      I1 => run_disparity_MC_D1_PT_0,
      O => run_disparity_MC_D1
    );
  run_disparity_MC_D2_PT_0_171 : X_AND4
    port map (
      I0 => dis_in_II_UIM,
      I1 => disparity_rdy,
      I2 => upper_enc_nds6,
      I3 => NlwInverterSignal_run_disparity_MC_D2_PT_0_IN3,
      O => run_disparity_MC_D2_PT_0
    );
  run_disparity_MC_D2_PT_1_172 : X_AND4
    port map (
      I0 => disparity_rdy,
      I1 => upper_enc_nds6,
      I2 => upper_enc_pds6,
      I3 => NlwInverterSignal_run_disparity_MC_D2_PT_1_IN3,
      O => run_disparity_MC_D2_PT_1
    );
  run_disparity_MC_D2_PT_2_173 : X_AND4
    port map (
      I0 => disparity_rdy,
      I1 => NlwInverterSignal_run_disparity_MC_D2_PT_2_IN1,
      I2 => upper_enc_pds6,
      I3 => N_PZ_327,
      O => run_disparity_MC_D2_PT_2
    );
  run_disparity_MC_D2_PT_3_174 : X_AND4
    port map (
      I0 => disparity_rdy,
      I1 => NlwInverterSignal_run_disparity_MC_D2_PT_3_IN1,
      I2 => NlwInverterSignal_run_disparity_MC_D2_PT_3_IN2,
      I3 => NlwInverterSignal_run_disparity_MC_D2_PT_3_IN3,
      O => run_disparity_MC_D2_PT_3
    );
  run_disparity_MC_D2_175 : X_OR4
    port map (
      I0 => run_disparity_MC_D2_PT_0,
      I1 => run_disparity_MC_D2_PT_1,
      I2 => run_disparity_MC_D2_PT_2,
      I3 => run_disparity_MC_D2_PT_3,
      O => run_disparity_MC_D2
    );
  run_disparity_MC_XOR : X_XOR2
    port map (
      I0 => run_disparity_MC_D1,
      I1 => run_disparity_MC_D2,
      O => run_disparity_MC_D
    );
  dis_in_II_UIM_176 : X_BUF
    port map (
      I => dis_in,
      O => dis_in_II_UIM
    );
  upper_enc_nds6_177 : X_BUF
    port map (
      I => upper_enc_nds6_MC_Q,
      O => upper_enc_nds6
    );
  upper_enc_nds6_MC_REG : X_BUF
    port map (
      I => upper_enc_nds6_MC_D,
      O => upper_enc_nds6_MC_Q
    );
  upper_enc_nds6_MC_D1_178 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => upper_enc_nds6_MC_D1
    );
  upper_enc_nds6_MC_D2_PT_0_179 : X_AND3
    port map (
      I0 => NlwInverterSignal_upper_enc_nds6_MC_D2_PT_0_IN0,
      I1 => NlwInverterSignal_upper_enc_nds6_MC_D2_PT_0_IN1,
      I2 => NlwInverterSignal_upper_enc_nds6_MC_D2_PT_0_IN2,
      O => upper_enc_nds6_MC_D2_PT_0
    );
  upper_enc_nds6_MC_D2_PT_1_180 : X_AND4
    port map (
      I0 => NlwInverterSignal_upper_enc_nds6_MC_D2_PT_1_IN0,
      I1 => NlwInverterSignal_upper_enc_nds6_MC_D2_PT_1_IN1,
      I2 => NlwInverterSignal_upper_enc_nds6_MC_D2_PT_1_IN2,
      I3 => N_PZ_246,
      O => upper_enc_nds6_MC_D2_PT_1
    );
  upper_enc_nds6_MC_D2_PT_2_181 : X_AND5
    port map (
      I0 => NlwInverterSignal_upper_enc_nds6_MC_D2_PT_2_IN0,
      I1 => data_trs_11_II_UIM,
      I2 => NlwInverterSignal_upper_enc_nds6_MC_D2_PT_2_IN2,
      I3 => NlwInverterSignal_upper_enc_nds6_MC_D2_PT_2_IN3,
      I4 => NlwInverterSignal_upper_enc_nds6_MC_D2_PT_2_IN4,
      O => upper_enc_nds6_MC_D2_PT_2
    );
  upper_enc_nds6_MC_D2_PT_3_182 : X_AND5
    port map (
      I0 => data_trs_11_II_UIM,
      I1 => NlwInverterSignal_upper_enc_nds6_MC_D2_PT_3_IN1,
      I2 => data_trs_9_II_UIM,
      I3 => NlwInverterSignal_upper_enc_nds6_MC_D2_PT_3_IN3,
      I4 => N_PZ_317,
      O => upper_enc_nds6_MC_D2_PT_3
    );
  upper_enc_nds6_MC_D2_183 : X_OR4
    port map (
      I0 => upper_enc_nds6_MC_D2_PT_0,
      I1 => upper_enc_nds6_MC_D2_PT_1,
      I2 => upper_enc_nds6_MC_D2_PT_2,
      I3 => upper_enc_nds6_MC_D2_PT_3,
      O => upper_enc_nds6_MC_D2
    );
  upper_enc_nds6_MC_XOR : X_XOR2
    port map (
      I0 => upper_enc_nds6_MC_D1,
      I1 => upper_enc_nds6_MC_D2,
      O => upper_enc_nds6_MC_D
    );
  data_trs_11_II_UIM_184 : X_BUF
    port map (
      I => data_trs(11),
      O => data_trs_11_II_UIM
    );
  data_trs_12_II_UIM_185 : X_BUF
    port map (
      I => data_trs(12),
      O => data_trs_12_II_UIM
    );
  N_PZ_246_186 : X_BUF
    port map (
      I => N_PZ_246_MC_Q,
      O => N_PZ_246
    );
  N_PZ_246_MC_REG : X_BUF
    port map (
      I => N_PZ_246_MC_D,
      O => N_PZ_246_MC_Q
    );
  N_PZ_246_MC_D1_187 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => N_PZ_246_MC_D1
    );
  N_PZ_246_MC_D2_PT_0_188 : X_AND2
    port map (
      I0 => NlwInverterSignal_N_PZ_246_MC_D2_PT_0_IN0,
      I1 => NlwInverterSignal_N_PZ_246_MC_D2_PT_0_IN1,
      O => N_PZ_246_MC_D2_PT_0
    );
  N_PZ_246_MC_D2_PT_1_189 : X_AND2
    port map (
      I0 => NlwInverterSignal_N_PZ_246_MC_D2_PT_1_IN0,
      I1 => NlwInverterSignal_N_PZ_246_MC_D2_PT_1_IN1,
      O => N_PZ_246_MC_D2_PT_1
    );
  N_PZ_246_MC_D2_190 : X_OR2
    port map (
      I0 => N_PZ_246_MC_D2_PT_0,
      I1 => N_PZ_246_MC_D2_PT_1,
      O => N_PZ_246_MC_D2
    );
  N_PZ_246_MC_XOR : X_XOR2
    port map (
      I0 => N_PZ_246_MC_D1,
      I1 => N_PZ_246_MC_D2,
      O => N_PZ_246_MC_D
    );
  data_trs_10_II_UIM_191 : X_BUF
    port map (
      I => data_trs(10),
      O => data_trs_10_II_UIM
    );
  data_trs_8_II_UIM_192 : X_BUF
    port map (
      I => data_trs(8),
      O => data_trs_8_II_UIM
    );
  data_trs_9_II_UIM_193 : X_BUF
    port map (
      I => data_trs(9),
      O => data_trs_9_II_UIM
    );
  N_PZ_317_194 : X_BUF
    port map (
      I => N_PZ_317_MC_Q,
      O => N_PZ_317
    );
  N_PZ_317_MC_REG : X_BUF
    port map (
      I => N_PZ_317_MC_D,
      O => N_PZ_317_MC_Q
    );
  N_PZ_317_MC_D1_PT_0_195 : X_AND2
    port map (
      I0 => data_trs_10_II_UIM,
      I1 => data_trs_8_II_UIM,
      O => N_PZ_317_MC_D1_PT_0
    );
  N_PZ_317_MC_D1_196 : X_OR2
    port map (
      I0 => N_PZ_317_MC_D1_PT_0,
      I1 => N_PZ_317_MC_D1_PT_0,
      O => N_PZ_317_MC_D1
    );
  N_PZ_317_MC_D2_197 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => N_PZ_317_MC_D2
    );
  N_PZ_317_MC_XOR : X_XOR2
    port map (
      I0 => N_PZ_317_MC_D1,
      I1 => N_PZ_317_MC_D2,
      O => N_PZ_317_MC_D
    );
  upper_enc_pds6_198 : X_BUF
    port map (
      I => upper_enc_pds6_MC_Q,
      O => upper_enc_pds6
    );
  upper_enc_pds6_MC_REG : X_BUF
    port map (
      I => upper_enc_pds6_MC_D,
      O => upper_enc_pds6_MC_Q
    );
  upper_enc_pds6_MC_D1_199 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => upper_enc_pds6_MC_D1
    );
  upper_enc_pds6_MC_D2_PT_0_200 : X_AND2
    port map (
      I0 => N_PZ_312,
      I1 => N_PZ_312,
      O => upper_enc_pds6_MC_D2_PT_0
    );
  upper_enc_pds6_MC_D2_PT_1_201 : X_AND2
    port map (
      I0 => NlwInverterSignal_upper_enc_pds6_MC_D2_PT_1_IN0,
      I1 => NlwInverterSignal_upper_enc_pds6_MC_D2_PT_1_IN1,
      O => upper_enc_pds6_MC_D2_PT_1
    );
  upper_enc_pds6_MC_D2_PT_2_202 : X_AND3
    port map (
      I0 => data_trs_10_II_UIM,
      I1 => N_PZ_246,
      I2 => NlwInverterSignal_upper_enc_pds6_MC_D2_PT_2_IN2,
      O => upper_enc_pds6_MC_D2_PT_2
    );
  upper_enc_pds6_MC_D2_PT_3_203 : X_AND3
    port map (
      I0 => data_trs_11_II_UIM,
      I1 => N_PZ_246,
      I2 => NlwInverterSignal_upper_enc_pds6_MC_D2_PT_3_IN2,
      O => upper_enc_pds6_MC_D2_PT_3
    );
  upper_enc_pds6_MC_D2_PT_4_204 : X_AND3
    port map (
      I0 => NlwInverterSignal_upper_enc_pds6_MC_D2_PT_4_IN0,
      I1 => NlwInverterSignal_upper_enc_pds6_MC_D2_PT_4_IN1,
      I2 => NlwInverterSignal_upper_enc_pds6_MC_D2_PT_4_IN2,
      O => upper_enc_pds6_MC_D2_PT_4
    );
  upper_enc_pds6_MC_D2_PT_5_205 : X_AND4
    port map (
      I0 => NlwInverterSignal_upper_enc_pds6_MC_D2_PT_5_IN0,
      I1 => data_trs_8_II_UIM,
      I2 => NlwInverterSignal_upper_enc_pds6_MC_D2_PT_5_IN2,
      I3 => NlwInverterSignal_upper_enc_pds6_MC_D2_PT_5_IN3,
      O => upper_enc_pds6_MC_D2_PT_5
    );
  upper_enc_pds6_MC_D2_PT_6_206 : X_AND4
    port map (
      I0 => NlwInverterSignal_upper_enc_pds6_MC_D2_PT_6_IN0,
      I1 => data_trs_9_II_UIM,
      I2 => NlwInverterSignal_upper_enc_pds6_MC_D2_PT_6_IN2,
      I3 => NlwInverterSignal_upper_enc_pds6_MC_D2_PT_6_IN3,
      O => upper_enc_pds6_MC_D2_PT_6
    );
  upper_enc_pds6_MC_D2_207 : X_OR7
    port map (
      I0 => upper_enc_pds6_MC_D2_PT_0,
      I1 => upper_enc_pds6_MC_D2_PT_1,
      I2 => upper_enc_pds6_MC_D2_PT_2,
      I3 => upper_enc_pds6_MC_D2_PT_3,
      I4 => upper_enc_pds6_MC_D2_PT_4,
      I5 => upper_enc_pds6_MC_D2_PT_5,
      I6 => upper_enc_pds6_MC_D2_PT_6,
      O => upper_enc_pds6_MC_D2
    );
  upper_enc_pds6_MC_XOR : X_XOR2
    port map (
      I0 => upper_enc_pds6_MC_D1,
      I1 => upper_enc_pds6_MC_D2,
      O => upper_enc_pds6_MC_D
    );
  k_char_II_UIM_208 : X_BUF
    port map (
      I => k_char,
      O => k_char_II_UIM
    );
  N_PZ_327_209 : X_BUF
    port map (
      I => N_PZ_327_MC_Q,
      O => N_PZ_327
    );
  N_PZ_327_MC_REG : X_BUF
    port map (
      I => N_PZ_327_MC_D,
      O => N_PZ_327_MC_Q
    );
  N_PZ_327_MC_D1_210 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => N_PZ_327_MC_D1
    );
  N_PZ_327_MC_D2_PT_0_211 : X_AND2
    port map (
      I0 => NlwInverterSignal_N_PZ_327_MC_D2_PT_0_IN0,
      I1 => NlwInverterSignal_N_PZ_327_MC_D2_PT_0_IN1,
      O => N_PZ_327_MC_D2_PT_0
    );
  N_PZ_327_MC_D2_PT_1_212 : X_AND2
    port map (
      I0 => NlwInverterSignal_N_PZ_327_MC_D2_PT_1_IN0,
      I1 => NlwInverterSignal_N_PZ_327_MC_D2_PT_1_IN1,
      O => N_PZ_327_MC_D2_PT_1
    );
  N_PZ_327_MC_D2_PT_2_213 : X_AND3
    port map (
      I0 => data_trs_13_II_UIM,
      I1 => data_trs_14_II_UIM,
      I2 => data_trs_15_II_UIM,
      O => N_PZ_327_MC_D2_PT_2
    );
  N_PZ_327_MC_D2_214 : X_OR3
    port map (
      I0 => N_PZ_327_MC_D2_PT_0,
      I1 => N_PZ_327_MC_D2_PT_1,
      I2 => N_PZ_327_MC_D2_PT_2,
      O => N_PZ_327_MC_D2
    );
  N_PZ_327_MC_XOR : X_XOR2
    port map (
      I0 => N_PZ_327_MC_D1,
      I1 => N_PZ_327_MC_D2,
      O => N_PZ_327_MC_D
    );
  data_trs_13_II_UIM_215 : X_BUF
    port map (
      I => data_trs(13),
      O => data_trs_13_II_UIM
    );
  data_trs_14_II_UIM_216 : X_BUF
    port map (
      I => data_trs(14),
      O => data_trs_14_II_UIM
    );
  data_trs_15_II_UIM_217 : X_BUF
    port map (
      I => data_trs(15),
      O => data_trs_15_II_UIM
    );
  lower_enc_nds6_218 : X_BUF
    port map (
      I => lower_enc_nds6_MC_Q,
      O => lower_enc_nds6
    );
  lower_enc_nds6_MC_REG : X_BUF
    port map (
      I => lower_enc_nds6_MC_D,
      O => lower_enc_nds6_MC_Q
    );
  lower_enc_nds6_MC_D1_219 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => lower_enc_nds6_MC_D1
    );
  lower_enc_nds6_MC_D2_PT_0_220 : X_AND2
    port map (
      I0 => NlwInverterSignal_lower_enc_nds6_MC_D2_PT_0_IN0,
      I1 => N_PZ_226,
      O => lower_enc_nds6_MC_D2_PT_0
    );
  lower_enc_nds6_MC_D2_PT_1_221 : X_AND4
    port map (
      I0 => NlwInverterSignal_lower_enc_nds6_MC_D2_PT_1_IN0,
      I1 => NlwInverterSignal_lower_enc_nds6_MC_D2_PT_1_IN1,
      I2 => NlwInverterSignal_lower_enc_nds6_MC_D2_PT_1_IN2,
      I3 => NlwInverterSignal_lower_enc_nds6_MC_D2_PT_1_IN3,
      O => lower_enc_nds6_MC_D2_PT_1
    );
  lower_enc_nds6_MC_D2_PT_2_222 : X_AND5
    port map (
      I0 => NlwInverterSignal_lower_enc_nds6_MC_D2_PT_2_IN0,
      I1 => NlwInverterSignal_lower_enc_nds6_MC_D2_PT_2_IN1,
      I2 => NlwInverterSignal_lower_enc_nds6_MC_D2_PT_2_IN2,
      I3 => data_trs_3_II_UIM,
      I4 => NlwInverterSignal_lower_enc_nds6_MC_D2_PT_2_IN4,
      O => lower_enc_nds6_MC_D2_PT_2
    );
  lower_enc_nds6_MC_D2_PT_3_223 : X_AND6
    port map (
      I0 => data_trs_0_II_UIM,
      I1 => data_trs_1_II_UIM,
      I2 => data_trs_2_II_UIM,
      I3 => data_trs_3_II_UIM,
      I4 => NlwInverterSignal_lower_enc_nds6_MC_D2_PT_3_IN4,
      I5 => NlwInverterSignal_lower_enc_nds6_MC_D2_PT_3_IN5,
      O => lower_enc_nds6_MC_D2_PT_3
    );
  lower_enc_nds6_MC_D2_224 : X_OR4
    port map (
      I0 => lower_enc_nds6_MC_D2_PT_0,
      I1 => lower_enc_nds6_MC_D2_PT_1,
      I2 => lower_enc_nds6_MC_D2_PT_2,
      I3 => lower_enc_nds6_MC_D2_PT_3,
      O => lower_enc_nds6_MC_D2
    );
  lower_enc_nds6_MC_XOR : X_XOR2
    port map (
      I0 => lower_enc_nds6_MC_D1,
      I1 => lower_enc_nds6_MC_D2,
      O => lower_enc_nds6_MC_D
    );
  data_trs_3_II_UIM_225 : X_BUF
    port map (
      I => data_trs(3),
      O => data_trs_3_II_UIM
    );
  data_trs_4_II_UIM_226 : X_BUF
    port map (
      I => data_trs(4),
      O => data_trs_4_II_UIM
    );
  N_PZ_342_227 : X_BUF
    port map (
      I => N_PZ_342_MC_Q,
      O => N_PZ_342
    );
  N_PZ_342_MC_REG : X_BUF
    port map (
      I => N_PZ_342_MC_D,
      O => N_PZ_342_MC_Q
    );
  N_PZ_342_MC_D1_228 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => N_PZ_342_MC_D1
    );
  N_PZ_342_MC_D2_PT_0_229 : X_AND2
    port map (
      I0 => data_trs_0_II_UIM,
      I1 => data_trs_1_II_UIM,
      O => N_PZ_342_MC_D2_PT_0
    );
  N_PZ_342_MC_D2_PT_1_230 : X_AND2
    port map (
      I0 => data_trs_0_II_UIM,
      I1 => data_trs_2_II_UIM,
      O => N_PZ_342_MC_D2_PT_1
    );
  N_PZ_342_MC_D2_PT_2_231 : X_AND2
    port map (
      I0 => data_trs_1_II_UIM,
      I1 => data_trs_2_II_UIM,
      O => N_PZ_342_MC_D2_PT_2
    );
  N_PZ_342_MC_D2_232 : X_OR3
    port map (
      I0 => N_PZ_342_MC_D2_PT_0,
      I1 => N_PZ_342_MC_D2_PT_1,
      I2 => N_PZ_342_MC_D2_PT_2,
      O => N_PZ_342_MC_D2
    );
  N_PZ_342_MC_XOR : X_XOR2
    port map (
      I0 => N_PZ_342_MC_D1,
      I1 => N_PZ_342_MC_D2,
      O => N_PZ_342_MC_D
    );
  data_trs_0_II_UIM_233 : X_BUF
    port map (
      I => data_trs(0),
      O => data_trs_0_II_UIM
    );
  data_trs_1_II_UIM_234 : X_BUF
    port map (
      I => data_trs(1),
      O => data_trs_1_II_UIM
    );
  data_trs_2_II_UIM_235 : X_BUF
    port map (
      I => data_trs(2),
      O => data_trs_2_II_UIM
    );
  lower_enc_pds6_236 : X_BUF
    port map (
      I => lower_enc_pds6_MC_Q,
      O => lower_enc_pds6
    );
  lower_enc_pds6_MC_REG : X_BUF
    port map (
      I => lower_enc_pds6_MC_D,
      O => lower_enc_pds6_MC_Q
    );
  lower_enc_pds6_MC_D1_237 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => lower_enc_pds6_MC_D1
    );
  lower_enc_pds6_MC_D2_PT_0_238 : X_AND2
    port map (
      I0 => NlwInverterSignal_lower_enc_pds6_MC_D2_PT_0_IN0,
      I1 => k_char_II_UIM,
      O => lower_enc_pds6_MC_D2_PT_0
    );
  lower_enc_pds6_MC_D2_PT_1_239 : X_AND5
    port map (
      I0 => data_trs_3_II_UIM,
      I1 => data_trs_4_II_UIM,
      I2 => NlwInverterSignal_lower_enc_pds6_MC_D2_PT_1_IN2,
      I3 => NlwInverterSignal_lower_enc_pds6_MC_D2_PT_1_IN3,
      I4 => N_PZ_342,
      O => lower_enc_pds6_MC_D2_PT_1
    );
  lower_enc_pds6_MC_D2_PT_2_240 : X_AND6
    port map (
      I0 => data_trs_0_II_UIM,
      I1 => data_trs_1_II_UIM,
      I2 => data_trs_2_II_UIM,
      I3 => data_trs_4_II_UIM,
      I4 => NlwInverterSignal_lower_enc_pds6_MC_D2_PT_2_IN4,
      I5 => NlwInverterSignal_lower_enc_pds6_MC_D2_PT_2_IN5,
      O => lower_enc_pds6_MC_D2_PT_2
    );
  lower_enc_pds6_MC_D2_PT_3_241 : X_AND7
    port map (
      I0 => NlwInverterSignal_lower_enc_pds6_MC_D2_PT_3_IN0,
      I1 => NlwInverterSignal_lower_enc_pds6_MC_D2_PT_3_IN1,
      I2 => NlwInverterSignal_lower_enc_pds6_MC_D2_PT_3_IN2,
      I3 => NlwInverterSignal_lower_enc_pds6_MC_D2_PT_3_IN3,
      I4 => data_trs_4_II_UIM,
      I5 => NlwInverterSignal_lower_enc_pds6_MC_D2_PT_3_IN5,
      I6 => NlwInverterSignal_lower_enc_pds6_MC_D2_PT_3_IN6,
      O => lower_enc_pds6_MC_D2_PT_3
    );
  lower_enc_pds6_MC_D2_242 : X_OR4
    port map (
      I0 => lower_enc_pds6_MC_D2_PT_0,
      I1 => lower_enc_pds6_MC_D2_PT_1,
      I2 => lower_enc_pds6_MC_D2_PT_2,
      I3 => lower_enc_pds6_MC_D2_PT_3,
      O => lower_enc_pds6_MC_D2
    );
  lower_enc_pds6_MC_XOR : X_XOR2
    port map (
      I0 => lower_enc_pds6_MC_D1,
      I1 => lower_enc_pds6_MC_D2,
      O => lower_enc_pds6_MC_D
    );
  data_trs_5_II_UIM_243 : X_BUF
    port map (
      I => data_trs(5),
      O => data_trs_5_II_UIM
    );
  data_trs_6_II_UIM_244 : X_BUF
    port map (
      I => data_trs(6),
      O => data_trs_6_II_UIM
    );
  data_trs_7_II_UIM_245 : X_BUF
    port map (
      I => data_trs(7),
      O => data_trs_7_II_UIM
    );
  frame_out_enc_246 : X_BUF
    port map (
      I => frame_out_enc_MC_Q,
      O => frame_out_enc
    );
  frame_out_enc_MC_Q_247 : X_BUF
    port map (
      I => frame_out_enc_MC_Q_tsim_ireg_Q,
      O => frame_out_enc_MC_Q
    );
  frame_out_enc_MC_REG : X_BUF
    port map (
      I => frame_out_enc_MC_D,
      O => frame_out_enc_MC_Q_tsim_ireg_Q
    );
  frame_out_enc_MC_D1_PT_0_248 : X_AND4
    port map (
      I0 => lower_enc_prs_state_fft2,
      I1 => lower_enc_prs_state_fft1,
      I2 => upper_enc_prs_state_fft2,
      I3 => upper_enc_prs_state_fft1,
      O => frame_out_enc_MC_D1_PT_0
    );
  frame_out_enc_MC_D1_249 : X_OR2
    port map (
      I0 => frame_out_enc_MC_D1_PT_0,
      I1 => frame_out_enc_MC_D1_PT_0,
      O => frame_out_enc_MC_D1
    );
  frame_out_enc_MC_D2_250 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => frame_out_enc_MC_D2
    );
  frame_out_enc_MC_XOR : X_XOR2
    port map (
      I0 => frame_out_enc_MC_D1,
      I1 => frame_out_enc_MC_D2,
      O => frame_out_enc_MC_D
    );
  serial_data_0_Q : X_BUF
    port map (
      I => serial_data_0_MC_Q,
      O => serial_data(0)
    );
  serial_data_0_MC_Q_251 : X_BUF
    port map (
      I => serial_data_0_MC_Q_tsim_ireg_Q,
      O => serial_data_0_MC_Q
    );
  serial_data_0_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => serial_data_0_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => serial_data_0_MC_Q_tsim_ireg_Q
    );
  serial_data_0_MC_D1_252 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => serial_data_0_MC_D1
    );
  serial_data_0_MC_D2_PT_0_253 : X_AND2
    port map (
      I0 => NlwInverterSignal_serial_data_0_MC_D2_PT_0_IN0,
      I1 => serial_data_0_MC_UIM,
      O => serial_data_0_MC_D2_PT_0
    );
  serial_data_0_MC_D2_PT_1_254 : X_AND8
    port map (
      I0 => data_trs_5_II_UIM,
      I1 => NlwInverterSignal_serial_data_0_MC_D2_PT_1_IN1,
      I2 => NlwInverterSignal_serial_data_0_MC_D2_PT_1_IN2,
      I3 => rst_II_UIM,
      I4 => lower_enc_enc_8b_10b_prs_state_fft2,
      I5 => NlwInverterSignal_serial_data_0_MC_D2_PT_1_IN5,
      I6 => lower_enc_enc_8b_10b_prs_state_fft1,
      I7 => NlwInverterSignal_serial_data_0_MC_D2_PT_1_IN7,
      O => serial_data_0_MC_D2_PT_1
    );
  serial_data_0_MC_D2_PT_2_255 : X_AND8
    port map (
      I0 => NlwInverterSignal_serial_data_0_MC_D2_PT_2_IN0,
      I1 => data_trs_6_II_UIM,
      I2 => NlwInverterSignal_serial_data_0_MC_D2_PT_2_IN2,
      I3 => rst_II_UIM,
      I4 => lower_enc_enc_8b_10b_prs_state_fft2,
      I5 => NlwInverterSignal_serial_data_0_MC_D2_PT_2_IN5,
      I6 => lower_enc_enc_8b_10b_prs_state_fft1,
      I7 => NlwInverterSignal_serial_data_0_MC_D2_PT_2_IN7,
      O => serial_data_0_MC_D2_PT_2
    );
  serial_data_0_MC_D2_PT_3_256 : X_AND16
    port map (
      I0 => data_trs_5_II_UIM,
      I1 => data_trs_6_II_UIM,
      I2 => data_trs_7_II_UIM,
      I3 => rst_II_UIM,
      I4 => lower_enc_enc_8b_10b_prs_state_fft2,
      I5 => NlwInverterSignal_serial_data_0_MC_D2_PT_3_IN5,
      I6 => lower_enc_enc_8b_10b_prs_state_fft1,
      I7 => NlwInverterSignal_serial_data_0_MC_D2_PT_3_IN7,
      I8 => k_char_II_UIM,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => serial_data_0_MC_D2_PT_3
    );
  serial_data_0_MC_D2_PT_4_257 : X_AND16
    port map (
      I0 => data_trs_5_II_UIM,
      I1 => data_trs_6_II_UIM,
      I2 => data_trs_7_II_UIM,
      I3 => rst_II_UIM,
      I4 => lower_enc_enc_8b_10b_prs_state_fft2,
      I5 => NlwInverterSignal_serial_data_0_MC_D2_PT_4_IN5,
      I6 => lower_enc_enc_8b_10b_prs_state_fft1,
      I7 => NlwInverterSignal_serial_data_0_MC_D2_PT_4_IN7,
      I8 => lower_enc_s_term,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => serial_data_0_MC_D2_PT_4
    );
  serial_data_0_MC_D2_258 : X_OR5
    port map (
      I0 => serial_data_0_MC_D2_PT_0,
      I1 => serial_data_0_MC_D2_PT_1,
      I2 => serial_data_0_MC_D2_PT_2,
      I3 => serial_data_0_MC_D2_PT_3,
      I4 => serial_data_0_MC_D2_PT_4,
      O => serial_data_0_MC_D2
    );
  serial_data_0_MC_XOR : X_XOR2
    port map (
      I0 => serial_data_0_MC_D1,
      I1 => serial_data_0_MC_D2,
      O => serial_data_0_MC_D
    );
  serial_data_0_MC_UIM_259 : X_BUF
    port map (
      I => serial_data_0_MC_Q_tsim_ireg_Q,
      O => serial_data_0_MC_UIM
    );
  lower_enc_s_term_260 : X_BUF
    port map (
      I => lower_enc_s_term_MC_Q,
      O => lower_enc_s_term
    );
  lower_enc_s_term_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => lower_enc_s_term_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => lower_enc_s_term_MC_Q
    );
  lower_enc_s_term_MC_D1_261 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => lower_enc_s_term_MC_D1
    );
  lower_enc_s_term_MC_D2_PT_0_262 : X_AND2
    port map (
      I0 => NlwInverterSignal_lower_enc_s_term_MC_D2_PT_0_IN0,
      I1 => NlwInverterSignal_lower_enc_s_term_MC_D2_PT_0_IN1,
      O => lower_enc_s_term_MC_D2_PT_0
    );
  lower_enc_s_term_MC_D2_PT_1_263 : X_AND2
    port map (
      I0 => rst_II_UIM,
      I1 => lower_enc_s_func_prs_state_ffd1,
      O => lower_enc_s_term_MC_D2_PT_1
    );
  lower_enc_s_term_MC_D2_PT_2_264 : X_AND2
    port map (
      I0 => rst_II_UIM,
      I1 => NlwInverterSignal_lower_enc_s_term_MC_D2_PT_2_IN1,
      O => lower_enc_s_term_MC_D2_PT_2
    );
  lower_enc_s_term_MC_D2_PT_3_265 : X_AND2
    port map (
      I0 => NlwInverterSignal_lower_enc_s_term_MC_D2_PT_3_IN0,
      I1 => NlwInverterSignal_lower_enc_s_term_MC_D2_PT_3_IN1,
      O => lower_enc_s_term_MC_D2_PT_3
    );
  lower_enc_s_term_MC_D2_PT_4_266 : X_AND3
    port map (
      I0 => data_trs_3_II_UIM,
      I1 => rst_II_UIM,
      I2 => NlwInverterSignal_lower_enc_s_term_MC_D2_PT_4_IN2,
      O => lower_enc_s_term_MC_D2_PT_4
    );
  lower_enc_s_term_MC_D2_PT_5_267 : X_AND3
    port map (
      I0 => NlwInverterSignal_lower_enc_s_term_MC_D2_PT_5_IN0,
      I1 => NlwInverterSignal_lower_enc_s_term_MC_D2_PT_5_IN1,
      I2 => rst_II_UIM,
      O => lower_enc_s_term_MC_D2_PT_5
    );
  lower_enc_s_term_MC_D2_PT_6_268 : X_AND3
    port map (
      I0 => data_trs_4_II_UIM,
      I1 => rst_II_UIM,
      I2 => N_PZ_342,
      O => lower_enc_s_term_MC_D2_PT_6
    );
  lower_enc_s_term_MC_D2_PT_7_269 : X_AND3
    port map (
      I0 => rst_II_UIM,
      I1 => N_PZ_307,
      I2 => NlwInverterSignal_lower_enc_s_term_MC_D2_PT_7_IN2,
      O => lower_enc_s_term_MC_D2_PT_7
    );
  lower_enc_s_term_MC_D2_PT_8_270 : X_AND3
    port map (
      I0 => rst_II_UIM,
      I1 => NlwInverterSignal_lower_enc_s_term_MC_D2_PT_8_IN1,
      I2 => NlwInverterSignal_lower_enc_s_term_MC_D2_PT_8_IN2,
      O => lower_enc_s_term_MC_D2_PT_8
    );
  lower_enc_s_term_MC_D2_PT_9_271 : X_AND4
    port map (
      I0 => data_trs_0_II_UIM,
      I1 => data_trs_1_II_UIM,
      I2 => data_trs_2_II_UIM,
      I3 => rst_II_UIM,
      O => lower_enc_s_term_MC_D2_PT_9
    );
  lower_enc_s_term_MC_D2_PT_10_272 : X_AND4
    port map (
      I0 => NlwInverterSignal_lower_enc_s_term_MC_D2_PT_10_IN0,
      I1 => NlwInverterSignal_lower_enc_s_term_MC_D2_PT_10_IN1,
      I2 => NlwInverterSignal_lower_enc_s_term_MC_D2_PT_10_IN2,
      I3 => rst_II_UIM,
      O => lower_enc_s_term_MC_D2_PT_10
    );
  lower_enc_s_term_MC_D2_PT_11_273 : X_AND4
    port map (
      I0 => rst_II_UIM,
      I1 => NlwInverterSignal_lower_enc_s_term_MC_D2_PT_11_IN1,
      I2 => run_disparity,
      I3 => N_PZ_342,
      O => lower_enc_s_term_MC_D2_PT_11
    );
  lower_enc_s_term_MC_D2_274 : X_OR16
    port map (
      I0 => lower_enc_s_term_MC_D2_PT_0,
      I1 => lower_enc_s_term_MC_D2_PT_1,
      I2 => lower_enc_s_term_MC_D2_PT_2,
      I3 => lower_enc_s_term_MC_D2_PT_3,
      I4 => lower_enc_s_term_MC_D2_PT_4,
      I5 => lower_enc_s_term_MC_D2_PT_5,
      I6 => lower_enc_s_term_MC_D2_PT_6,
      I7 => lower_enc_s_term_MC_D2_PT_7,
      I8 => lower_enc_s_term_MC_D2_PT_8,
      I9 => lower_enc_s_term_MC_D2_PT_9,
      I10 => lower_enc_s_term_MC_D2_PT_10,
      I11 => lower_enc_s_term_MC_D2_PT_11,
      I12 => GND,
      I13 => GND,
      I14 => GND,
      I15 => GND,
      O => lower_enc_s_term_MC_D2
    );
  lower_enc_s_term_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_lower_enc_s_term_MC_XOR_IN0,
      I1 => lower_enc_s_term_MC_D2,
      O => lower_enc_s_term_MC_D
    );
  N_PZ_377_275 : X_BUF
    port map (
      I => N_PZ_377_MC_Q,
      O => N_PZ_377
    );
  N_PZ_377_MC_REG : X_BUF
    port map (
      I => N_PZ_377_MC_D,
      O => N_PZ_377_MC_Q
    );
  N_PZ_377_MC_D1_276 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => N_PZ_377_MC_D1
    );
  N_PZ_377_MC_D2_PT_0_277 : X_AND2
    port map (
      I0 => NlwInverterSignal_N_PZ_377_MC_D2_PT_0_IN0,
      I1 => NlwInverterSignal_N_PZ_377_MC_D2_PT_0_IN1,
      O => N_PZ_377_MC_D2_PT_0
    );
  N_PZ_377_MC_D2_PT_1_278 : X_AND3
    port map (
      I0 => lower_enc_enc_8b_10b_prs_state_fft2,
      I1 => NlwInverterSignal_N_PZ_377_MC_D2_PT_1_IN1,
      I2 => NlwInverterSignal_N_PZ_377_MC_D2_PT_1_IN2,
      O => N_PZ_377_MC_D2_PT_1
    );
  N_PZ_377_MC_D2_279 : X_OR2
    port map (
      I0 => N_PZ_377_MC_D2_PT_0,
      I1 => N_PZ_377_MC_D2_PT_1,
      O => N_PZ_377_MC_D2
    );
  N_PZ_377_MC_XOR : X_XOR2
    port map (
      I0 => N_PZ_377_MC_D1,
      I1 => N_PZ_377_MC_D2,
      O => N_PZ_377_MC_D
    );
  serial_data_10_Q : X_BUF
    port map (
      I => serial_data_10_MC_Q,
      O => serial_data(10)
    );
  serial_data_10_MC_Q_280 : X_BUF
    port map (
      I => serial_data_10_MC_Q_tsim_ireg_Q,
      O => serial_data_10_MC_Q
    );
  serial_data_10_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => serial_data_10_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => serial_data_10_MC_Q_tsim_ireg_Q
    );
  serial_data_10_MC_D1_281 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => serial_data_10_MC_D1
    );
  serial_data_10_MC_D2_PT_0_282 : X_AND2
    port map (
      I0 => NlwInverterSignal_serial_data_10_MC_D2_PT_0_IN0,
      I1 => serial_data_10_MC_UIM,
      O => serial_data_10_MC_D2_PT_0
    );
  serial_data_10_MC_D2_PT_1_283 : X_AND6
    port map (
      I0 => data_trs_13_II_UIM,
      I1 => NlwInverterSignal_serial_data_10_MC_D2_PT_1_IN1,
      I2 => NlwInverterSignal_serial_data_10_MC_D2_PT_1_IN2,
      I3 => rst_II_UIM,
      I4 => upper_enc_enc_8b_10b_prs_state_fft1,
      I5 => NlwInverterSignal_serial_data_10_MC_D2_PT_1_IN5,
      O => serial_data_10_MC_D2_PT_1
    );
  serial_data_10_MC_D2_PT_2_284 : X_AND6
    port map (
      I0 => NlwInverterSignal_serial_data_10_MC_D2_PT_2_IN0,
      I1 => data_trs_14_II_UIM,
      I2 => NlwInverterSignal_serial_data_10_MC_D2_PT_2_IN2,
      I3 => rst_II_UIM,
      I4 => upper_enc_enc_8b_10b_prs_state_fft1,
      I5 => NlwInverterSignal_serial_data_10_MC_D2_PT_2_IN5,
      O => serial_data_10_MC_D2_PT_2
    );
  serial_data_10_MC_D2_PT_3_285 : X_AND7
    port map (
      I0 => data_trs_13_II_UIM,
      I1 => data_trs_14_II_UIM,
      I2 => data_trs_15_II_UIM,
      I3 => rst_II_UIM,
      I4 => upper_enc_enc_8b_10b_prs_state_fft1,
      I5 => k_char_II_UIM,
      I6 => NlwInverterSignal_serial_data_10_MC_D2_PT_3_IN6,
      O => serial_data_10_MC_D2_PT_3
    );
  serial_data_10_MC_D2_PT_4_286 : X_AND7
    port map (
      I0 => data_trs_13_II_UIM,
      I1 => data_trs_14_II_UIM,
      I2 => data_trs_15_II_UIM,
      I3 => rst_II_UIM,
      I4 => upper_enc_enc_8b_10b_prs_state_fft1,
      I5 => NlwInverterSignal_serial_data_10_MC_D2_PT_4_IN5,
      I6 => upper_enc_s_term,
      O => serial_data_10_MC_D2_PT_4
    );
  serial_data_10_MC_D2_287 : X_OR5
    port map (
      I0 => serial_data_10_MC_D2_PT_0,
      I1 => serial_data_10_MC_D2_PT_1,
      I2 => serial_data_10_MC_D2_PT_2,
      I3 => serial_data_10_MC_D2_PT_3,
      I4 => serial_data_10_MC_D2_PT_4,
      O => serial_data_10_MC_D2
    );
  serial_data_10_MC_XOR : X_XOR2
    port map (
      I0 => serial_data_10_MC_D1,
      I1 => serial_data_10_MC_D2,
      O => serial_data_10_MC_D
    );
  serial_data_10_MC_UIM_288 : X_BUF
    port map (
      I => serial_data_10_MC_Q_tsim_ireg_Q,
      O => serial_data_10_MC_UIM
    );
  N_PZ_302_289 : X_BUF
    port map (
      I => N_PZ_302_MC_Q,
      O => N_PZ_302
    );
  N_PZ_302_MC_REG : X_BUF
    port map (
      I => N_PZ_302_MC_D,
      O => N_PZ_302_MC_Q
    );
  N_PZ_302_MC_D1_290 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => N_PZ_302_MC_D1
    );
  N_PZ_302_MC_D2_PT_0_291 : X_AND2
    port map (
      I0 => rst_II_UIM,
      I1 => NlwInverterSignal_N_PZ_302_MC_D2_PT_0_IN1,
      O => N_PZ_302_MC_D2_PT_0
    );
  N_PZ_302_MC_D2_PT_1_292 : X_AND2
    port map (
      I0 => rst_II_UIM,
      I1 => upper_enc_enc_8b_10b_prs_state_fft3,
      O => N_PZ_302_MC_D2_PT_1
    );
  N_PZ_302_MC_D2_PT_2_293 : X_AND3
    port map (
      I0 => rst_II_UIM,
      I1 => NlwInverterSignal_N_PZ_302_MC_D2_PT_2_IN1,
      I2 => NlwInverterSignal_N_PZ_302_MC_D2_PT_2_IN2,
      O => N_PZ_302_MC_D2_PT_2
    );
  N_PZ_302_MC_D2_294 : X_OR3
    port map (
      I0 => N_PZ_302_MC_D2_PT_0,
      I1 => N_PZ_302_MC_D2_PT_1,
      I2 => N_PZ_302_MC_D2_PT_2,
      O => N_PZ_302_MC_D2
    );
  N_PZ_302_MC_XOR : X_XOR2
    port map (
      I0 => N_PZ_302_MC_D1,
      I1 => N_PZ_302_MC_D2,
      O => N_PZ_302_MC_D
    );
  upper_enc_s_term_295 : X_BUF
    port map (
      I => upper_enc_s_term_MC_Q,
      O => upper_enc_s_term
    );
  upper_enc_s_term_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => upper_enc_s_term_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => upper_enc_s_term_MC_Q
    );
  upper_enc_s_term_MC_D1_296 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => upper_enc_s_term_MC_D1
    );
  upper_enc_s_term_MC_D2_PT_0_297 : X_AND3
    port map (
      I0 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_0_IN0,
      I1 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_0_IN1,
      I2 => upper_enc_s_term,
      O => upper_enc_s_term_MC_D2_PT_0
    );
  upper_enc_s_term_MC_D2_PT_1_298 : X_AND16
    port map (
      I0 => data_trs_11_II_UIM,
      I1 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_1_IN1,
      I2 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_1_IN2,
      I3 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_1_IN3,
      I4 => rst_II_UIM,
      I5 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_1_IN5,
      I6 => upper_enc_s_func_prs_state_ffd2,
      I7 => N_PZ_317,
      I8 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_1_IN8,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => upper_enc_s_term_MC_D2_PT_1
    );
  upper_enc_s_term_MC_D2_PT_2_299 : X_AND16
    port map (
      I0 => data_trs_11_II_UIM,
      I1 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_2_IN1,
      I2 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_2_IN2,
      I3 => rst_II_UIM,
      I4 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_2_IN4,
      I5 => upper_enc_s_func_prs_state_ffd2,
      I6 => upper_enc_nds6,
      I7 => N_PZ_317,
      I8 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_2_IN8,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => upper_enc_s_term_MC_D2_PT_2
    );
  upper_enc_s_term_MC_D2_PT_3_300 : X_AND16
    port map (
      I0 => data_trs_11_II_UIM,
      I1 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_3_IN1,
      I2 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_3_IN2,
      I3 => rst_II_UIM,
      I4 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_3_IN4,
      I5 => upper_enc_s_func_prs_state_ffd2,
      I6 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_3_IN6,
      I7 => N_PZ_317,
      I8 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_3_IN8,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => upper_enc_s_term_MC_D2_PT_3
    );
  upper_enc_s_term_MC_D2_PT_4_301 : X_AND16
    port map (
      I0 => data_trs_11_II_UIM,
      I1 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_4_IN1,
      I2 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_4_IN2,
      I3 => rst_II_UIM,
      I4 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_4_IN4,
      I5 => upper_enc_s_func_prs_state_ffd2,
      I6 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_4_IN6,
      I7 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_4_IN7,
      I8 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_4_IN8,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => upper_enc_s_term_MC_D2_PT_4
    );
  upper_enc_s_term_MC_D2_PT_5_302 : X_AND16
    port map (
      I0 => data_trs_11_II_UIM,
      I1 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_5_IN1,
      I2 => rst_II_UIM,
      I3 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_5_IN3,
      I4 => upper_enc_s_func_prs_state_ffd2,
      I5 => upper_enc_nds6,
      I6 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_5_IN6,
      I7 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_5_IN7,
      I8 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_5_IN8,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => upper_enc_s_term_MC_D2_PT_5
    );
  upper_enc_s_term_MC_D2_PT_6_303 : X_AND16
    port map (
      I0 => data_trs_11_II_UIM,
      I1 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_6_IN1,
      I2 => rst_II_UIM,
      I3 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_6_IN3,
      I4 => upper_enc_s_func_prs_state_ffd2,
      I5 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_6_IN5,
      I6 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_6_IN6,
      I7 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_6_IN7,
      I8 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_6_IN8,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => upper_enc_s_term_MC_D2_PT_6
    );
  upper_enc_s_term_MC_D2_PT_7_304 : X_AND16
    port map (
      I0 => data_trs_10_II_UIM,
      I1 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_7_IN1,
      I2 => data_trs_12_II_UIM,
      I3 => dis_in_II_UIM,
      I4 => rst_II_UIM,
      I5 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_7_IN5,
      I6 => upper_enc_s_func_prs_state_ffd2,
      I7 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_7_IN7,
      I8 => upper_enc_pds6,
      I9 => N_PZ_246,
      I10 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_7_IN10,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => upper_enc_s_term_MC_D2_PT_7
    );
  upper_enc_s_term_MC_D2_PT_8_305 : X_AND16
    port map (
      I0 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_8_IN0,
      I1 => data_trs_12_II_UIM,
      I2 => data_trs_8_II_UIM,
      I3 => dis_in_II_UIM,
      I4 => rst_II_UIM,
      I5 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_8_IN5,
      I6 => upper_enc_s_func_prs_state_ffd2,
      I7 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_8_IN7,
      I8 => upper_enc_pds6,
      I9 => N_PZ_246,
      I10 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_8_IN10,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => upper_enc_s_term_MC_D2_PT_8
    );
  upper_enc_s_term_MC_D2_PT_9_306 : X_AND16
    port map (
      I0 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_9_IN0,
      I1 => data_trs_12_II_UIM,
      I2 => data_trs_9_II_UIM,
      I3 => dis_in_II_UIM,
      I4 => rst_II_UIM,
      I5 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_9_IN5,
      I6 => upper_enc_s_func_prs_state_ffd2,
      I7 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_9_IN7,
      I8 => upper_enc_pds6,
      I9 => N_PZ_246,
      I10 => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_9_IN10,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => upper_enc_s_term_MC_D2_PT_9
    );
  upper_enc_s_term_MC_D2_307 : X_OR16
    port map (
      I0 => upper_enc_s_term_MC_D2_PT_0,
      I1 => upper_enc_s_term_MC_D2_PT_1,
      I2 => upper_enc_s_term_MC_D2_PT_2,
      I3 => upper_enc_s_term_MC_D2_PT_3,
      I4 => upper_enc_s_term_MC_D2_PT_4,
      I5 => upper_enc_s_term_MC_D2_PT_5,
      I6 => upper_enc_s_term_MC_D2_PT_6,
      I7 => upper_enc_s_term_MC_D2_PT_7,
      I8 => upper_enc_s_term_MC_D2_PT_8,
      I9 => upper_enc_s_term_MC_D2_PT_9,
      I10 => GND,
      I11 => GND,
      I12 => GND,
      I13 => GND,
      I14 => GND,
      I15 => GND,
      O => upper_enc_s_term_MC_D2
    );
  upper_enc_s_term_MC_XOR : X_XOR2
    port map (
      I0 => upper_enc_s_term_MC_D1,
      I1 => upper_enc_s_term_MC_D2,
      O => upper_enc_s_term_MC_D
    );
  serial_data_11_Q : X_BUF
    port map (
      I => serial_data_11_MC_Q,
      O => serial_data(11)
    );
  serial_data_11_MC_Q_308 : X_BUF
    port map (
      I => serial_data_11_MC_Q_tsim_ireg_Q,
      O => serial_data_11_MC_Q
    );
  serial_data_11_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => serial_data_11_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => serial_data_11_MC_Q_tsim_ireg_Q
    );
  serial_data_11_MC_D1_309 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => serial_data_11_MC_D1
    );
  serial_data_11_MC_D2_PT_0_310 : X_AND2
    port map (
      I0 => NlwInverterSignal_serial_data_11_MC_D2_PT_0_IN0,
      I1 => serial_data_11_MC_UIM,
      O => serial_data_11_MC_D2_PT_0
    );
  serial_data_11_MC_D2_PT_1_311 : X_AND4
    port map (
      I0 => data_trs_15_II_UIM,
      I1 => rst_II_UIM,
      I2 => upper_enc_enc_8b_10b_prs_state_fft1,
      I3 => NlwInverterSignal_serial_data_11_MC_D2_PT_1_IN3,
      O => serial_data_11_MC_D2_PT_1
    );
  serial_data_11_MC_D2_312 : X_OR2
    port map (
      I0 => serial_data_11_MC_D2_PT_0,
      I1 => serial_data_11_MC_D2_PT_1,
      O => serial_data_11_MC_D2
    );
  serial_data_11_MC_XOR : X_XOR2
    port map (
      I0 => serial_data_11_MC_D1,
      I1 => serial_data_11_MC_D2,
      O => serial_data_11_MC_D
    );
  serial_data_11_MC_UIM_313 : X_BUF
    port map (
      I => serial_data_11_MC_Q_tsim_ireg_Q,
      O => serial_data_11_MC_UIM
    );
  serial_data_12_Q : X_BUF
    port map (
      I => serial_data_12_MC_Q,
      O => serial_data(12)
    );
  serial_data_12_MC_Q_314 : X_BUF
    port map (
      I => serial_data_12_MC_Q_tsim_ireg_Q,
      O => serial_data_12_MC_Q
    );
  serial_data_12_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => serial_data_12_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => serial_data_12_MC_Q_tsim_ireg_Q
    );
  serial_data_12_MC_D1_315 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => serial_data_12_MC_D1
    );
  serial_data_12_MC_D2_PT_0_316 : X_AND2
    port map (
      I0 => NlwInverterSignal_serial_data_12_MC_D2_PT_0_IN0,
      I1 => serial_data_12_MC_UIM,
      O => serial_data_12_MC_D2_PT_0
    );
  serial_data_12_MC_D2_PT_1_317 : X_AND5
    port map (
      I0 => data_trs_14_II_UIM,
      I1 => rst_II_UIM,
      I2 => upper_enc_enc_8b_10b_prs_state_fft2,
      I3 => NlwInverterSignal_serial_data_12_MC_D2_PT_1_IN3,
      I4 => upper_enc_enc_8b_10b_prs_state_fft1,
      O => serial_data_12_MC_D2_PT_1
    );
  serial_data_12_MC_D2_PT_2_318 : X_AND6
    port map (
      I0 => NlwInverterSignal_serial_data_12_MC_D2_PT_2_IN0,
      I1 => NlwInverterSignal_serial_data_12_MC_D2_PT_2_IN1,
      I2 => rst_II_UIM,
      I3 => upper_enc_enc_8b_10b_prs_state_fft2,
      I4 => NlwInverterSignal_serial_data_12_MC_D2_PT_2_IN4,
      I5 => upper_enc_enc_8b_10b_prs_state_fft1,
      O => serial_data_12_MC_D2_PT_2
    );
  serial_data_12_MC_D2_PT_3_319 : X_AND6
    port map (
      I0 => rst_II_UIM,
      I1 => NlwInverterSignal_serial_data_12_MC_D2_PT_3_IN1,
      I2 => NlwInverterSignal_serial_data_12_MC_D2_PT_3_IN2,
      I3 => upper_enc_enc_8b_10b_prs_state_fft2,
      I4 => NlwInverterSignal_serial_data_12_MC_D2_PT_3_IN4,
      I5 => upper_enc_enc_8b_10b_prs_state_fft1,
      O => serial_data_12_MC_D2_PT_3
    );
  serial_data_12_MC_D2_320 : X_OR4
    port map (
      I0 => serial_data_12_MC_D2_PT_0,
      I1 => serial_data_12_MC_D2_PT_1,
      I2 => serial_data_12_MC_D2_PT_2,
      I3 => serial_data_12_MC_D2_PT_3,
      O => serial_data_12_MC_D2
    );
  serial_data_12_MC_XOR : X_XOR2
    port map (
      I0 => serial_data_12_MC_D1,
      I1 => serial_data_12_MC_D2,
      O => serial_data_12_MC_D
    );
  serial_data_12_MC_UIM_321 : X_BUF
    port map (
      I => serial_data_12_MC_Q_tsim_ireg_Q,
      O => serial_data_12_MC_UIM
    );
  serial_data_13_Q : X_BUF
    port map (
      I => serial_data_13_MC_Q,
      O => serial_data(13)
    );
  serial_data_13_MC_Q_322 : X_BUF
    port map (
      I => serial_data_13_MC_Q_tsim_ireg_Q,
      O => serial_data_13_MC_Q
    );
  serial_data_13_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => serial_data_13_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => serial_data_13_MC_Q_tsim_ireg_Q
    );
  serial_data_13_MC_D1_323 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => serial_data_13_MC_D1
    );
  serial_data_13_MC_D2_PT_0_324 : X_AND2
    port map (
      I0 => NlwInverterSignal_serial_data_13_MC_D2_PT_0_IN0,
      I1 => serial_data_13_MC_UIM,
      O => serial_data_13_MC_D2_PT_0
    );
  serial_data_13_MC_D2_PT_1_325 : X_AND5
    port map (
      I0 => data_trs_13_II_UIM,
      I1 => NlwInverterSignal_serial_data_13_MC_D2_PT_1_IN1,
      I2 => rst_II_UIM,
      I3 => upper_enc_enc_8b_10b_prs_state_fft1,
      I4 => NlwInverterSignal_serial_data_13_MC_D2_PT_1_IN4,
      O => serial_data_13_MC_D2_PT_1
    );
  serial_data_13_MC_D2_PT_2_326 : X_AND5
    port map (
      I0 => data_trs_13_II_UIM,
      I1 => NlwInverterSignal_serial_data_13_MC_D2_PT_2_IN1,
      I2 => rst_II_UIM,
      I3 => upper_enc_enc_8b_10b_prs_state_fft1,
      I4 => NlwInverterSignal_serial_data_13_MC_D2_PT_2_IN4,
      O => serial_data_13_MC_D2_PT_2
    );
  serial_data_13_MC_D2_PT_3_327 : X_AND6
    port map (
      I0 => data_trs_13_II_UIM,
      I1 => rst_II_UIM,
      I2 => upper_enc_enc_8b_10b_prs_state_fft1,
      I3 => NlwInverterSignal_serial_data_13_MC_D2_PT_3_IN3,
      I4 => NlwInverterSignal_serial_data_13_MC_D2_PT_3_IN4,
      I5 => NlwInverterSignal_serial_data_13_MC_D2_PT_3_IN5,
      O => serial_data_13_MC_D2_PT_3
    );
  serial_data_13_MC_D2_328 : X_OR4
    port map (
      I0 => serial_data_13_MC_D2_PT_0,
      I1 => serial_data_13_MC_D2_PT_1,
      I2 => serial_data_13_MC_D2_PT_2,
      I3 => serial_data_13_MC_D2_PT_3,
      O => serial_data_13_MC_D2
    );
  serial_data_13_MC_XOR : X_XOR2
    port map (
      I0 => serial_data_13_MC_D1,
      I1 => serial_data_13_MC_D2,
      O => serial_data_13_MC_D
    );
  serial_data_13_MC_UIM_329 : X_BUF
    port map (
      I => serial_data_13_MC_Q_tsim_ireg_Q,
      O => serial_data_13_MC_UIM
    );
  serial_data_14_Q : X_BUF
    port map (
      I => serial_data_14_MC_Q,
      O => serial_data(14)
    );
  serial_data_14_MC_Q_330 : X_BUF
    port map (
      I => serial_data_14_MC_Q_tsim_ireg_Q,
      O => serial_data_14_MC_Q
    );
  serial_data_14_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => serial_data_14_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => serial_data_14_MC_Q_tsim_ireg_Q
    );
  serial_data_14_MC_D1_331 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => serial_data_14_MC_D1
    );
  serial_data_14_MC_D2_PT_0_332 : X_AND2
    port map (
      I0 => N_PZ_302,
      I1 => N_PZ_302,
      O => serial_data_14_MC_D2_PT_0
    );
  serial_data_14_MC_D2_PT_1_333 : X_AND2
    port map (
      I0 => rst_II_UIM,
      I1 => NlwInverterSignal_serial_data_14_MC_D2_PT_1_IN1,
      O => serial_data_14_MC_D2_PT_1
    );
  serial_data_14_MC_D2_PT_2_334 : X_AND2
    port map (
      I0 => NlwInverterSignal_serial_data_14_MC_D2_PT_2_IN0,
      I1 => NlwInverterSignal_serial_data_14_MC_D2_PT_2_IN1,
      O => serial_data_14_MC_D2_PT_2
    );
  serial_data_14_MC_D2_PT_3_335 : X_AND4
    port map (
      I0 => data_trs_11_II_UIM,
      I1 => NlwInverterSignal_serial_data_14_MC_D2_PT_3_IN1,
      I2 => rst_II_UIM,
      I3 => NlwInverterSignal_serial_data_14_MC_D2_PT_3_IN3,
      O => serial_data_14_MC_D2_PT_3
    );
  serial_data_14_MC_D2_PT_4_336 : X_AND4
    port map (
      I0 => data_trs_11_II_UIM,
      I1 => NlwInverterSignal_serial_data_14_MC_D2_PT_4_IN1,
      I2 => rst_II_UIM,
      I3 => NlwInverterSignal_serial_data_14_MC_D2_PT_4_IN3,
      O => serial_data_14_MC_D2_PT_4
    );
  serial_data_14_MC_D2_PT_5_337 : X_AND4
    port map (
      I0 => data_trs_11_II_UIM,
      I1 => rst_II_UIM,
      I2 => NlwInverterSignal_serial_data_14_MC_D2_PT_5_IN2,
      I3 => NlwInverterSignal_serial_data_14_MC_D2_PT_5_IN3,
      O => serial_data_14_MC_D2_PT_5
    );
  serial_data_14_MC_D2_PT_6_338 : X_AND4
    port map (
      I0 => NlwInverterSignal_serial_data_14_MC_D2_PT_6_IN0,
      I1 => NlwInverterSignal_serial_data_14_MC_D2_PT_6_IN1,
      I2 => rst_II_UIM,
      I3 => N_PZ_246,
      O => serial_data_14_MC_D2_PT_6
    );
  serial_data_14_MC_D2_PT_7_339 : X_AND4
    port map (
      I0 => NlwInverterSignal_serial_data_14_MC_D2_PT_7_IN0,
      I1 => data_trs_9_II_UIM,
      I2 => rst_II_UIM,
      I3 => N_PZ_317,
      O => serial_data_14_MC_D2_PT_7
    );
  serial_data_14_MC_D2_PT_8_340 : X_AND5
    port map (
      I0 => NlwInverterSignal_serial_data_14_MC_D2_PT_8_IN0,
      I1 => data_trs_11_II_UIM,
      I2 => NlwInverterSignal_serial_data_14_MC_D2_PT_8_IN2,
      I3 => NlwInverterSignal_serial_data_14_MC_D2_PT_8_IN3,
      I4 => rst_II_UIM,
      O => serial_data_14_MC_D2_PT_8
    );
  serial_data_14_MC_D2_PT_9_341 : X_AND5
    port map (
      I0 => data_trs_11_II_UIM,
      I1 => data_trs_12_II_UIM,
      I2 => rst_II_UIM,
      I3 => N_PZ_246,
      I4 => NlwInverterSignal_serial_data_14_MC_D2_PT_9_IN4,
      O => serial_data_14_MC_D2_PT_9
    );
  serial_data_14_MC_D2_PT_10_342 : X_AND5
    port map (
      I0 => NlwInverterSignal_serial_data_14_MC_D2_PT_10_IN0,
      I1 => data_trs_12_II_UIM,
      I2 => rst_II_UIM,
      I3 => NlwInverterSignal_serial_data_14_MC_D2_PT_10_IN3,
      I4 => NlwInverterSignal_serial_data_14_MC_D2_PT_10_IN4,
      O => serial_data_14_MC_D2_PT_10
    );
  serial_data_14_MC_D2_343 : X_OR16
    port map (
      I0 => serial_data_14_MC_D2_PT_0,
      I1 => serial_data_14_MC_D2_PT_1,
      I2 => serial_data_14_MC_D2_PT_2,
      I3 => serial_data_14_MC_D2_PT_3,
      I4 => serial_data_14_MC_D2_PT_4,
      I5 => serial_data_14_MC_D2_PT_5,
      I6 => serial_data_14_MC_D2_PT_6,
      I7 => serial_data_14_MC_D2_PT_7,
      I8 => serial_data_14_MC_D2_PT_8,
      I9 => serial_data_14_MC_D2_PT_9,
      I10 => serial_data_14_MC_D2_PT_10,
      I11 => GND,
      I12 => GND,
      I13 => GND,
      I14 => GND,
      I15 => GND,
      O => serial_data_14_MC_D2
    );
  serial_data_14_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_serial_data_14_MC_XOR_IN0,
      I1 => serial_data_14_MC_D2,
      O => serial_data_14_MC_D
    );
  serial_data_14_MC_UIM_344 : X_BUF
    port map (
      I => serial_data_14_MC_Q_tsim_ireg_Q,
      O => serial_data_14_MC_UIM
    );
  serial_data_15_Q : X_BUF
    port map (
      I => serial_data_15_MC_Q,
      O => serial_data(15)
    );
  serial_data_15_MC_Q_345 : X_BUF
    port map (
      I => serial_data_15_MC_Q_tsim_ireg_Q,
      O => serial_data_15_MC_Q
    );
  serial_data_15_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => serial_data_15_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => serial_data_15_MC_Q_tsim_ireg_Q
    );
  serial_data_15_MC_D1_346 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => serial_data_15_MC_D1
    );
  serial_data_15_MC_D2_PT_0_347 : X_AND2
    port map (
      I0 => NlwInverterSignal_serial_data_15_MC_D2_PT_0_IN0,
      I1 => serial_data_15_MC_UIM,
      O => serial_data_15_MC_D2_PT_0
    );
  serial_data_15_MC_D2_PT_1_348 : X_AND5
    port map (
      I0 => rst_II_UIM,
      I1 => upper_enc_enc_8b_10b_prs_state_fft2,
      I2 => NlwInverterSignal_serial_data_15_MC_D2_PT_1_IN2,
      I3 => upper_enc_enc_8b_10b_prs_state_fft1,
      I4 => upper_enc_enc_8b_10b_e_prel,
      O => serial_data_15_MC_D2_PT_1
    );
  serial_data_15_MC_D2_349 : X_OR2
    port map (
      I0 => serial_data_15_MC_D2_PT_0,
      I1 => serial_data_15_MC_D2_PT_1,
      O => serial_data_15_MC_D2
    );
  serial_data_15_MC_XOR : X_XOR2
    port map (
      I0 => serial_data_15_MC_D1,
      I1 => serial_data_15_MC_D2,
      O => serial_data_15_MC_D
    );
  serial_data_15_MC_UIM_350 : X_BUF
    port map (
      I => serial_data_15_MC_Q_tsim_ireg_Q,
      O => serial_data_15_MC_UIM
    );
  upper_enc_enc_8b_10b_e_prel_351 : X_BUF
    port map (
      I => upper_enc_enc_8b_10b_e_prel_MC_Q,
      O => upper_enc_enc_8b_10b_e_prel
    );
  upper_enc_enc_8b_10b_e_prel_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => upper_enc_enc_8b_10b_e_prel_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => upper_enc_enc_8b_10b_e_prel_MC_Q
    );
  upper_enc_enc_8b_10b_e_prel_MC_D1_352 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => upper_enc_enc_8b_10b_e_prel_MC_D1
    );
  upper_enc_enc_8b_10b_e_prel_MC_D2_PT_0_353 : X_AND2
    port map (
      I0 => N_PZ_302,
      I1 => N_PZ_302,
      O => upper_enc_enc_8b_10b_e_prel_MC_D2_PT_0
    );
  upper_enc_enc_8b_10b_e_prel_MC_D2_PT_1_354 : X_AND2
    port map (
      I0 => rst_II_UIM,
      I1 => upper_enc_enc_8b_10b_prs_state_fft1,
      O => upper_enc_enc_8b_10b_e_prel_MC_D2_PT_1
    );
  upper_enc_enc_8b_10b_e_prel_MC_D2_PT_2_355 : X_AND2
    port map (
      I0 => NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_2_IN0,
      I1 => NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_2_IN1,
      O => upper_enc_enc_8b_10b_e_prel_MC_D2_PT_2
    );
  upper_enc_enc_8b_10b_e_prel_MC_D2_PT_3_356 : X_AND3
    port map (
      I0 => NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_3_IN0,
      I1 => rst_II_UIM,
      I2 => NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_3_IN2,
      O => upper_enc_enc_8b_10b_e_prel_MC_D2_PT_3
    );
  upper_enc_enc_8b_10b_e_prel_MC_D2_PT_4_357 : X_AND4
    port map (
      I0 => data_trs_10_II_UIM,
      I1 => data_trs_11_II_UIM,
      I2 => NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_4_IN2,
      I3 => rst_II_UIM,
      O => upper_enc_enc_8b_10b_e_prel_MC_D2_PT_4
    );
  upper_enc_enc_8b_10b_e_prel_MC_D2_PT_5_358 : X_AND4
    port map (
      I0 => data_trs_11_II_UIM,
      I1 => NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_5_IN1,
      I2 => data_trs_8_II_UIM,
      I3 => rst_II_UIM,
      O => upper_enc_enc_8b_10b_e_prel_MC_D2_PT_5
    );
  upper_enc_enc_8b_10b_e_prel_MC_D2_PT_6_359 : X_AND4
    port map (
      I0 => data_trs_11_II_UIM,
      I1 => NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_6_IN1,
      I2 => data_trs_9_II_UIM,
      I3 => rst_II_UIM,
      O => upper_enc_enc_8b_10b_e_prel_MC_D2_PT_6
    );
  upper_enc_enc_8b_10b_e_prel_MC_D2_PT_7_360 : X_AND6
    port map (
      I0 => NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_7_IN0,
      I1 => data_trs_11_II_UIM,
      I2 => data_trs_12_II_UIM,
      I3 => NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_7_IN3,
      I4 => NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_7_IN4,
      I5 => rst_II_UIM,
      O => upper_enc_enc_8b_10b_e_prel_MC_D2_PT_7
    );
  upper_enc_enc_8b_10b_e_prel_MC_D2_PT_8_361 : X_AND6
    port map (
      I0 => NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_8_IN0,
      I1 => NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_8_IN1,
      I2 => NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_8_IN2,
      I3 => NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_8_IN3,
      I4 => NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_8_IN4,
      I5 => rst_II_UIM,
      O => upper_enc_enc_8b_10b_e_prel_MC_D2_PT_8
    );
  upper_enc_enc_8b_10b_e_prel_MC_D2_362 : X_OR16
    port map (
      I0 => upper_enc_enc_8b_10b_e_prel_MC_D2_PT_0,
      I1 => upper_enc_enc_8b_10b_e_prel_MC_D2_PT_1,
      I2 => upper_enc_enc_8b_10b_e_prel_MC_D2_PT_2,
      I3 => upper_enc_enc_8b_10b_e_prel_MC_D2_PT_3,
      I4 => upper_enc_enc_8b_10b_e_prel_MC_D2_PT_4,
      I5 => upper_enc_enc_8b_10b_e_prel_MC_D2_PT_5,
      I6 => upper_enc_enc_8b_10b_e_prel_MC_D2_PT_6,
      I7 => upper_enc_enc_8b_10b_e_prel_MC_D2_PT_7,
      I8 => upper_enc_enc_8b_10b_e_prel_MC_D2_PT_8,
      I9 => GND,
      I10 => GND,
      I11 => GND,
      I12 => GND,
      I13 => GND,
      I14 => GND,
      I15 => GND,
      O => upper_enc_enc_8b_10b_e_prel_MC_D2
    );
  upper_enc_enc_8b_10b_e_prel_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_XOR_IN0,
      I1 => upper_enc_enc_8b_10b_e_prel_MC_D2,
      O => upper_enc_enc_8b_10b_e_prel_MC_D
    );
  serial_data_16_Q : X_BUF
    port map (
      I => serial_data_16_MC_Q,
      O => serial_data(16)
    );
  serial_data_16_MC_Q_363 : X_BUF
    port map (
      I => serial_data_16_MC_Q_tsim_ireg_Q,
      O => serial_data_16_MC_Q
    );
  serial_data_16_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => serial_data_16_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => serial_data_16_MC_Q_tsim_ireg_Q
    );
  serial_data_16_MC_D1_364 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => serial_data_16_MC_D1
    );
  serial_data_16_MC_D2_PT_0_365 : X_AND2
    port map (
      I0 => NlwInverterSignal_serial_data_16_MC_D2_PT_0_IN0,
      I1 => serial_data_16_MC_UIM,
      O => serial_data_16_MC_D2_PT_0
    );
  serial_data_16_MC_D2_PT_1_366 : X_AND5
    port map (
      I0 => rst_II_UIM,
      I1 => upper_enc_enc_8b_10b_prs_state_fft2,
      I2 => NlwInverterSignal_serial_data_16_MC_D2_PT_1_IN2,
      I3 => upper_enc_enc_8b_10b_prs_state_fft1,
      I4 => upper_enc_enc_8b_10b_d_prel,
      O => serial_data_16_MC_D2_PT_1
    );
  serial_data_16_MC_D2_367 : X_OR2
    port map (
      I0 => serial_data_16_MC_D2_PT_0,
      I1 => serial_data_16_MC_D2_PT_1,
      O => serial_data_16_MC_D2
    );
  serial_data_16_MC_XOR : X_XOR2
    port map (
      I0 => serial_data_16_MC_D1,
      I1 => serial_data_16_MC_D2,
      O => serial_data_16_MC_D
    );
  serial_data_16_MC_UIM_368 : X_BUF
    port map (
      I => serial_data_16_MC_Q_tsim_ireg_Q,
      O => serial_data_16_MC_UIM
    );
  upper_enc_enc_8b_10b_d_prel_369 : X_BUF
    port map (
      I => upper_enc_enc_8b_10b_d_prel_MC_Q,
      O => upper_enc_enc_8b_10b_d_prel
    );
  upper_enc_enc_8b_10b_d_prel_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => upper_enc_enc_8b_10b_d_prel_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => upper_enc_enc_8b_10b_d_prel_MC_Q
    );
  upper_enc_enc_8b_10b_d_prel_MC_D1_370 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => upper_enc_enc_8b_10b_d_prel_MC_D1
    );
  upper_enc_enc_8b_10b_d_prel_MC_D2_PT_0_371 : X_AND2
    port map (
      I0 => NlwInverterSignal_upper_enc_enc_8b_10b_d_prel_MC_D2_PT_0_IN0,
      I1 => upper_enc_enc_8b_10b_d_prel,
      O => upper_enc_enc_8b_10b_d_prel_MC_D2_PT_0
    );
  upper_enc_enc_8b_10b_d_prel_MC_D2_PT_1_372 : X_AND5
    port map (
      I0 => data_trs_11_II_UIM,
      I1 => NlwInverterSignal_upper_enc_enc_8b_10b_d_prel_MC_D2_PT_1_IN1,
      I2 => rst_II_UIM,
      I3 => NlwInverterSignal_upper_enc_enc_8b_10b_d_prel_MC_D2_PT_1_IN3,
      I4 => NlwInverterSignal_upper_enc_enc_8b_10b_d_prel_MC_D2_PT_1_IN4,
      O => upper_enc_enc_8b_10b_d_prel_MC_D2_PT_1
    );
  upper_enc_enc_8b_10b_d_prel_MC_D2_PT_2_373 : X_AND5
    port map (
      I0 => data_trs_11_II_UIM,
      I1 => rst_II_UIM,
      I2 => NlwInverterSignal_upper_enc_enc_8b_10b_d_prel_MC_D2_PT_2_IN2,
      I3 => NlwInverterSignal_upper_enc_enc_8b_10b_d_prel_MC_D2_PT_2_IN3,
      I4 => NlwInverterSignal_upper_enc_enc_8b_10b_d_prel_MC_D2_PT_2_IN4,
      O => upper_enc_enc_8b_10b_d_prel_MC_D2_PT_2
    );
  upper_enc_enc_8b_10b_d_prel_MC_D2_374 : X_OR3
    port map (
      I0 => upper_enc_enc_8b_10b_d_prel_MC_D2_PT_0,
      I1 => upper_enc_enc_8b_10b_d_prel_MC_D2_PT_1,
      I2 => upper_enc_enc_8b_10b_d_prel_MC_D2_PT_2,
      O => upper_enc_enc_8b_10b_d_prel_MC_D2
    );
  upper_enc_enc_8b_10b_d_prel_MC_XOR : X_XOR2
    port map (
      I0 => upper_enc_enc_8b_10b_d_prel_MC_D1,
      I1 => upper_enc_enc_8b_10b_d_prel_MC_D2,
      O => upper_enc_enc_8b_10b_d_prel_MC_D
    );
  serial_data_17_Q : X_BUF
    port map (
      I => serial_data_17_MC_Q,
      O => serial_data(17)
    );
  serial_data_17_MC_Q_375 : X_BUF
    port map (
      I => serial_data_17_MC_Q_tsim_ireg_Q,
      O => serial_data_17_MC_Q
    );
  serial_data_17_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => serial_data_17_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => serial_data_17_MC_Q_tsim_ireg_Q
    );
  serial_data_17_MC_D1_376 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => serial_data_17_MC_D1
    );
  serial_data_17_MC_D2_PT_0_377 : X_AND2
    port map (
      I0 => NlwInverterSignal_serial_data_17_MC_D2_PT_0_IN0,
      I1 => serial_data_17_MC_UIM,
      O => serial_data_17_MC_D2_PT_0
    );
  serial_data_17_MC_D2_PT_1_378 : X_AND5
    port map (
      I0 => rst_II_UIM,
      I1 => upper_enc_enc_8b_10b_prs_state_fft2,
      I2 => NlwInverterSignal_serial_data_17_MC_D2_PT_1_IN2,
      I3 => upper_enc_enc_8b_10b_prs_state_fft1,
      I4 => upper_enc_enc_8b_10b_c_prel,
      O => serial_data_17_MC_D2_PT_1
    );
  serial_data_17_MC_D2_379 : X_OR2
    port map (
      I0 => serial_data_17_MC_D2_PT_0,
      I1 => serial_data_17_MC_D2_PT_1,
      O => serial_data_17_MC_D2
    );
  serial_data_17_MC_XOR : X_XOR2
    port map (
      I0 => serial_data_17_MC_D1,
      I1 => serial_data_17_MC_D2,
      O => serial_data_17_MC_D
    );
  serial_data_17_MC_UIM_380 : X_BUF
    port map (
      I => serial_data_17_MC_Q_tsim_ireg_Q,
      O => serial_data_17_MC_UIM
    );
  upper_enc_enc_8b_10b_c_prel_381 : X_BUF
    port map (
      I => upper_enc_enc_8b_10b_c_prel_MC_Q,
      O => upper_enc_enc_8b_10b_c_prel
    );
  upper_enc_enc_8b_10b_c_prel_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => upper_enc_enc_8b_10b_c_prel_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => upper_enc_enc_8b_10b_c_prel_MC_Q
    );
  upper_enc_enc_8b_10b_c_prel_MC_D1_382 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => upper_enc_enc_8b_10b_c_prel_MC_D1
    );
  upper_enc_enc_8b_10b_c_prel_MC_D2_PT_0_383 : X_AND2
    port map (
      I0 => NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_0_IN0,
      I1 => upper_enc_enc_8b_10b_c_prel,
      O => upper_enc_enc_8b_10b_c_prel_MC_D2_PT_0
    );
  upper_enc_enc_8b_10b_c_prel_MC_D2_PT_1_384 : X_AND5
    port map (
      I0 => data_trs_10_II_UIM,
      I1 => rst_II_UIM,
      I2 => upper_enc_enc_8b_10b_prs_state_fft2,
      I3 => NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_1_IN3,
      I4 => NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_1_IN4,
      O => upper_enc_enc_8b_10b_c_prel_MC_D2_PT_1
    );
  upper_enc_enc_8b_10b_c_prel_MC_D2_PT_2_385 : X_AND6
    port map (
      I0 => rst_II_UIM,
      I1 => NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_2_IN1,
      I2 => NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_2_IN2,
      I3 => upper_enc_enc_8b_10b_prs_state_fft2,
      I4 => NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_2_IN4,
      I5 => NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_2_IN5,
      O => upper_enc_enc_8b_10b_c_prel_MC_D2_PT_2
    );
  upper_enc_enc_8b_10b_c_prel_MC_D2_PT_3_386 : X_AND7
    port map (
      I0 => NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_3_IN0,
      I1 => NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_3_IN1,
      I2 => NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_3_IN2,
      I3 => rst_II_UIM,
      I4 => upper_enc_enc_8b_10b_prs_state_fft2,
      I5 => NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_3_IN5,
      I6 => NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_3_IN6,
      O => upper_enc_enc_8b_10b_c_prel_MC_D2_PT_3
    );
  upper_enc_enc_8b_10b_c_prel_MC_D2_PT_4_387 : X_AND7
    port map (
      I0 => data_trs_12_II_UIM,
      I1 => NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_4_IN1,
      I2 => NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_4_IN2,
      I3 => rst_II_UIM,
      I4 => upper_enc_enc_8b_10b_prs_state_fft2,
      I5 => NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_4_IN5,
      I6 => NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_4_IN6,
      O => upper_enc_enc_8b_10b_c_prel_MC_D2_PT_4
    );
  upper_enc_enc_8b_10b_c_prel_MC_D2_388 : X_OR5
    port map (
      I0 => upper_enc_enc_8b_10b_c_prel_MC_D2_PT_0,
      I1 => upper_enc_enc_8b_10b_c_prel_MC_D2_PT_1,
      I2 => upper_enc_enc_8b_10b_c_prel_MC_D2_PT_2,
      I3 => upper_enc_enc_8b_10b_c_prel_MC_D2_PT_3,
      I4 => upper_enc_enc_8b_10b_c_prel_MC_D2_PT_4,
      O => upper_enc_enc_8b_10b_c_prel_MC_D2
    );
  upper_enc_enc_8b_10b_c_prel_MC_XOR : X_XOR2
    port map (
      I0 => upper_enc_enc_8b_10b_c_prel_MC_D1,
      I1 => upper_enc_enc_8b_10b_c_prel_MC_D2,
      O => upper_enc_enc_8b_10b_c_prel_MC_D
    );
  serial_data_18_Q : X_BUF
    port map (
      I => serial_data_18_MC_Q,
      O => serial_data(18)
    );
  serial_data_18_MC_Q_389 : X_BUF
    port map (
      I => serial_data_18_MC_Q_tsim_ireg_Q,
      O => serial_data_18_MC_Q
    );
  serial_data_18_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => serial_data_18_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => serial_data_18_MC_Q_tsim_ireg_Q
    );
  serial_data_18_MC_D1_390 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => serial_data_18_MC_D1
    );
  serial_data_18_MC_D2_PT_0_391 : X_AND2
    port map (
      I0 => NlwInverterSignal_serial_data_18_MC_D2_PT_0_IN0,
      I1 => serial_data_18_MC_UIM,
      O => serial_data_18_MC_D2_PT_0
    );
  serial_data_18_MC_D2_PT_1_392 : X_AND5
    port map (
      I0 => rst_II_UIM,
      I1 => upper_enc_enc_8b_10b_prs_state_fft2,
      I2 => NlwInverterSignal_serial_data_18_MC_D2_PT_1_IN2,
      I3 => upper_enc_enc_8b_10b_prs_state_fft1,
      I4 => upper_enc_enc_8b_10b_b_prel,
      O => serial_data_18_MC_D2_PT_1
    );
  serial_data_18_MC_D2_393 : X_OR2
    port map (
      I0 => serial_data_18_MC_D2_PT_0,
      I1 => serial_data_18_MC_D2_PT_1,
      O => serial_data_18_MC_D2
    );
  serial_data_18_MC_XOR : X_XOR2
    port map (
      I0 => serial_data_18_MC_D1,
      I1 => serial_data_18_MC_D2,
      O => serial_data_18_MC_D
    );
  serial_data_18_MC_UIM_394 : X_BUF
    port map (
      I => serial_data_18_MC_Q_tsim_ireg_Q,
      O => serial_data_18_MC_UIM
    );
  upper_enc_enc_8b_10b_b_prel_395 : X_BUF
    port map (
      I => upper_enc_enc_8b_10b_b_prel_MC_Q,
      O => upper_enc_enc_8b_10b_b_prel
    );
  upper_enc_enc_8b_10b_b_prel_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => upper_enc_enc_8b_10b_b_prel_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => upper_enc_enc_8b_10b_b_prel_MC_Q
    );
  upper_enc_enc_8b_10b_b_prel_MC_D1_396 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => upper_enc_enc_8b_10b_b_prel_MC_D1
    );
  upper_enc_enc_8b_10b_b_prel_MC_D2_PT_0_397 : X_AND2
    port map (
      I0 => NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_0_IN0,
      I1 => upper_enc_enc_8b_10b_b_prel,
      O => upper_enc_enc_8b_10b_b_prel_MC_D2_PT_0
    );
  upper_enc_enc_8b_10b_b_prel_MC_D2_PT_1_398 : X_AND6
    port map (
      I0 => NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_1_IN0,
      I1 => data_trs_9_II_UIM,
      I2 => rst_II_UIM,
      I3 => upper_enc_enc_8b_10b_prs_state_fft2,
      I4 => NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_1_IN4,
      I5 => NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_1_IN5,
      O => upper_enc_enc_8b_10b_b_prel_MC_D2_PT_1
    );
  upper_enc_enc_8b_10b_b_prel_MC_D2_PT_2_399 : X_AND6
    port map (
      I0 => data_trs_9_II_UIM,
      I1 => rst_II_UIM,
      I2 => upper_enc_enc_8b_10b_prs_state_fft2,
      I3 => NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_2_IN3,
      I4 => NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_2_IN4,
      I5 => NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_2_IN5,
      O => upper_enc_enc_8b_10b_b_prel_MC_D2_PT_2
    );
  upper_enc_enc_8b_10b_b_prel_MC_D2_PT_3_400 : X_AND6
    port map (
      I0 => rst_II_UIM,
      I1 => NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_3_IN1,
      I2 => NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_3_IN2,
      I3 => upper_enc_enc_8b_10b_prs_state_fft2,
      I4 => NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_3_IN4,
      I5 => NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_3_IN5,
      O => upper_enc_enc_8b_10b_b_prel_MC_D2_PT_3
    );
  upper_enc_enc_8b_10b_b_prel_MC_D2_PT_4_401 : X_AND7
    port map (
      I0 => NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_4_IN0,
      I1 => NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_4_IN1,
      I2 => NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_4_IN2,
      I3 => rst_II_UIM,
      I4 => upper_enc_enc_8b_10b_prs_state_fft2,
      I5 => NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_4_IN5,
      I6 => NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_4_IN6,
      O => upper_enc_enc_8b_10b_b_prel_MC_D2_PT_4
    );
  upper_enc_enc_8b_10b_b_prel_MC_D2_402 : X_OR5
    port map (
      I0 => upper_enc_enc_8b_10b_b_prel_MC_D2_PT_0,
      I1 => upper_enc_enc_8b_10b_b_prel_MC_D2_PT_1,
      I2 => upper_enc_enc_8b_10b_b_prel_MC_D2_PT_2,
      I3 => upper_enc_enc_8b_10b_b_prel_MC_D2_PT_3,
      I4 => upper_enc_enc_8b_10b_b_prel_MC_D2_PT_4,
      O => upper_enc_enc_8b_10b_b_prel_MC_D2
    );
  upper_enc_enc_8b_10b_b_prel_MC_XOR : X_XOR2
    port map (
      I0 => upper_enc_enc_8b_10b_b_prel_MC_D1,
      I1 => upper_enc_enc_8b_10b_b_prel_MC_D2,
      O => upper_enc_enc_8b_10b_b_prel_MC_D
    );
  serial_data_19_Q : X_BUF
    port map (
      I => serial_data_19_MC_Q,
      O => serial_data(19)
    );
  serial_data_19_MC_Q_403 : X_BUF
    port map (
      I => serial_data_19_MC_Q_tsim_ireg_Q,
      O => serial_data_19_MC_Q
    );
  serial_data_19_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => serial_data_19_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => serial_data_19_MC_Q_tsim_ireg_Q
    );
  serial_data_19_MC_D1_404 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => serial_data_19_MC_D1
    );
  serial_data_19_MC_D2_PT_0_405 : X_AND2
    port map (
      I0 => NlwInverterSignal_serial_data_19_MC_D2_PT_0_IN0,
      I1 => serial_data_19_MC_UIM,
      O => serial_data_19_MC_D2_PT_0
    );
  serial_data_19_MC_D2_PT_1_406 : X_AND4
    port map (
      I0 => data_trs_8_II_UIM,
      I1 => rst_II_UIM,
      I2 => upper_enc_enc_8b_10b_prs_state_fft1,
      I3 => NlwInverterSignal_serial_data_19_MC_D2_PT_1_IN3,
      O => serial_data_19_MC_D2_PT_1
    );
  serial_data_19_MC_D2_407 : X_OR2
    port map (
      I0 => serial_data_19_MC_D2_PT_0,
      I1 => serial_data_19_MC_D2_PT_1,
      O => serial_data_19_MC_D2
    );
  serial_data_19_MC_XOR : X_XOR2
    port map (
      I0 => serial_data_19_MC_D1,
      I1 => serial_data_19_MC_D2,
      O => serial_data_19_MC_D
    );
  serial_data_19_MC_UIM_408 : X_BUF
    port map (
      I => serial_data_19_MC_Q_tsim_ireg_Q,
      O => serial_data_19_MC_UIM
    );
  serial_data_1_Q : X_BUF
    port map (
      I => serial_data_1_MC_Q,
      O => serial_data(1)
    );
  serial_data_1_MC_Q_409 : X_BUF
    port map (
      I => serial_data_1_MC_Q_tsim_ireg_Q,
      O => serial_data_1_MC_Q
    );
  serial_data_1_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => serial_data_1_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => serial_data_1_MC_Q_tsim_ireg_Q
    );
  serial_data_1_MC_D1_410 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => serial_data_1_MC_D1
    );
  serial_data_1_MC_D2_PT_0_411 : X_AND2
    port map (
      I0 => NlwInverterSignal_serial_data_1_MC_D2_PT_0_IN0,
      I1 => serial_data_1_MC_UIM,
      O => serial_data_1_MC_D2_PT_0
    );
  serial_data_1_MC_D2_PT_1_412 : X_AND6
    port map (
      I0 => data_trs_7_II_UIM,
      I1 => rst_II_UIM,
      I2 => lower_enc_enc_8b_10b_prs_state_fft2,
      I3 => NlwInverterSignal_serial_data_1_MC_D2_PT_1_IN3,
      I4 => lower_enc_enc_8b_10b_prs_state_fft1,
      I5 => NlwInverterSignal_serial_data_1_MC_D2_PT_1_IN5,
      O => serial_data_1_MC_D2_PT_1
    );
  serial_data_1_MC_D2_413 : X_OR2
    port map (
      I0 => serial_data_1_MC_D2_PT_0,
      I1 => serial_data_1_MC_D2_PT_1,
      O => serial_data_1_MC_D2
    );
  serial_data_1_MC_XOR : X_XOR2
    port map (
      I0 => serial_data_1_MC_D1,
      I1 => serial_data_1_MC_D2,
      O => serial_data_1_MC_D
    );
  serial_data_1_MC_UIM_414 : X_BUF
    port map (
      I => serial_data_1_MC_Q_tsim_ireg_Q,
      O => serial_data_1_MC_UIM
    );
  serial_data_2_Q : X_BUF
    port map (
      I => serial_data_2_MC_Q,
      O => serial_data(2)
    );
  serial_data_2_MC_Q_415 : X_BUF
    port map (
      I => serial_data_2_MC_Q_tsim_ireg_Q,
      O => serial_data_2_MC_Q
    );
  serial_data_2_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => serial_data_2_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => serial_data_2_MC_Q_tsim_ireg_Q
    );
  serial_data_2_MC_D1_416 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => serial_data_2_MC_D1
    );
  serial_data_2_MC_D2_PT_0_417 : X_AND2
    port map (
      I0 => NlwInverterSignal_serial_data_2_MC_D2_PT_0_IN0,
      I1 => serial_data_2_MC_UIM,
      O => serial_data_2_MC_D2_PT_0
    );
  serial_data_2_MC_D2_PT_1_418 : X_AND5
    port map (
      I0 => data_trs_6_II_UIM,
      I1 => rst_II_UIM,
      I2 => lower_enc_enc_8b_10b_prs_state_fft2,
      I3 => NlwInverterSignal_serial_data_2_MC_D2_PT_1_IN3,
      I4 => lower_enc_enc_8b_10b_prs_state_fft1,
      O => serial_data_2_MC_D2_PT_1
    );
  serial_data_2_MC_D2_PT_2_419 : X_AND5
    port map (
      I0 => rst_II_UIM,
      I1 => lower_enc_enc_8b_10b_prs_state_fft2,
      I2 => NlwInverterSignal_serial_data_2_MC_D2_PT_2_IN2,
      I3 => lower_enc_enc_8b_10b_prs_state_fft1,
      I4 => N_PZ_226,
      O => serial_data_2_MC_D2_PT_2
    );
  serial_data_2_MC_D2_PT_3_420 : X_AND6
    port map (
      I0 => NlwInverterSignal_serial_data_2_MC_D2_PT_3_IN0,
      I1 => NlwInverterSignal_serial_data_2_MC_D2_PT_3_IN1,
      I2 => rst_II_UIM,
      I3 => lower_enc_enc_8b_10b_prs_state_fft2,
      I4 => NlwInverterSignal_serial_data_2_MC_D2_PT_3_IN4,
      I5 => lower_enc_enc_8b_10b_prs_state_fft1,
      O => serial_data_2_MC_D2_PT_3
    );
  serial_data_2_MC_D2_421 : X_OR4
    port map (
      I0 => serial_data_2_MC_D2_PT_0,
      I1 => serial_data_2_MC_D2_PT_1,
      I2 => serial_data_2_MC_D2_PT_2,
      I3 => serial_data_2_MC_D2_PT_3,
      O => serial_data_2_MC_D2
    );
  serial_data_2_MC_XOR : X_XOR2
    port map (
      I0 => serial_data_2_MC_D1,
      I1 => serial_data_2_MC_D2,
      O => serial_data_2_MC_D
    );
  serial_data_2_MC_UIM_422 : X_BUF
    port map (
      I => serial_data_2_MC_Q_tsim_ireg_Q,
      O => serial_data_2_MC_UIM
    );
  serial_data_3_Q : X_BUF
    port map (
      I => serial_data_3_MC_Q,
      O => serial_data(3)
    );
  serial_data_3_MC_Q_423 : X_BUF
    port map (
      I => serial_data_3_MC_Q_tsim_ireg_Q,
      O => serial_data_3_MC_Q
    );
  serial_data_3_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => serial_data_3_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => serial_data_3_MC_Q_tsim_ireg_Q
    );
  serial_data_3_MC_D1_424 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => serial_data_3_MC_D1
    );
  serial_data_3_MC_D2_PT_0_425 : X_AND2
    port map (
      I0 => NlwInverterSignal_serial_data_3_MC_D2_PT_0_IN0,
      I1 => serial_data_3_MC_UIM,
      O => serial_data_3_MC_D2_PT_0
    );
  serial_data_3_MC_D2_PT_1_426 : X_AND7
    port map (
      I0 => data_trs_5_II_UIM,
      I1 => NlwInverterSignal_serial_data_3_MC_D2_PT_1_IN1,
      I2 => rst_II_UIM,
      I3 => lower_enc_enc_8b_10b_prs_state_fft2,
      I4 => NlwInverterSignal_serial_data_3_MC_D2_PT_1_IN4,
      I5 => lower_enc_enc_8b_10b_prs_state_fft1,
      I6 => NlwInverterSignal_serial_data_3_MC_D2_PT_1_IN6,
      O => serial_data_3_MC_D2_PT_1
    );
  serial_data_3_MC_D2_PT_2_427 : X_AND7
    port map (
      I0 => data_trs_5_II_UIM,
      I1 => NlwInverterSignal_serial_data_3_MC_D2_PT_2_IN1,
      I2 => rst_II_UIM,
      I3 => lower_enc_enc_8b_10b_prs_state_fft2,
      I4 => NlwInverterSignal_serial_data_3_MC_D2_PT_2_IN4,
      I5 => lower_enc_enc_8b_10b_prs_state_fft1,
      I6 => NlwInverterSignal_serial_data_3_MC_D2_PT_2_IN6,
      O => serial_data_3_MC_D2_PT_2
    );
  serial_data_3_MC_D2_PT_3_428 : X_AND8
    port map (
      I0 => data_trs_5_II_UIM,
      I1 => rst_II_UIM,
      I2 => lower_enc_enc_8b_10b_prs_state_fft2,
      I3 => NlwInverterSignal_serial_data_3_MC_D2_PT_3_IN3,
      I4 => lower_enc_enc_8b_10b_prs_state_fft1,
      I5 => NlwInverterSignal_serial_data_3_MC_D2_PT_3_IN5,
      I6 => NlwInverterSignal_serial_data_3_MC_D2_PT_3_IN6,
      I7 => NlwInverterSignal_serial_data_3_MC_D2_PT_3_IN7,
      O => serial_data_3_MC_D2_PT_3
    );
  serial_data_3_MC_D2_429 : X_OR4
    port map (
      I0 => serial_data_3_MC_D2_PT_0,
      I1 => serial_data_3_MC_D2_PT_1,
      I2 => serial_data_3_MC_D2_PT_2,
      I3 => serial_data_3_MC_D2_PT_3,
      O => serial_data_3_MC_D2
    );
  serial_data_3_MC_XOR : X_XOR2
    port map (
      I0 => serial_data_3_MC_D1,
      I1 => serial_data_3_MC_D2,
      O => serial_data_3_MC_D
    );
  serial_data_3_MC_UIM_430 : X_BUF
    port map (
      I => serial_data_3_MC_Q_tsim_ireg_Q,
      O => serial_data_3_MC_UIM
    );
  serial_data_4_Q : X_BUF
    port map (
      I => serial_data_4_MC_Q,
      O => serial_data(4)
    );
  serial_data_4_MC_Q_431 : X_BUF
    port map (
      I => serial_data_4_MC_Q_tsim_ireg_Q,
      O => serial_data_4_MC_Q
    );
  serial_data_4_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => serial_data_4_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => serial_data_4_MC_Q_tsim_ireg_Q
    );
  serial_data_4_MC_D1_432 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => serial_data_4_MC_D1
    );
  serial_data_4_MC_D2_PT_0_433 : X_AND2
    port map (
      I0 => NlwInverterSignal_serial_data_4_MC_D2_PT_0_IN0,
      I1 => NlwInverterSignal_serial_data_4_MC_D2_PT_0_IN1,
      O => serial_data_4_MC_D2_PT_0
    );
  serial_data_4_MC_D2_PT_1_434 : X_AND2
    port map (
      I0 => rst_II_UIM,
      I1 => NlwInverterSignal_serial_data_4_MC_D2_PT_1_IN1,
      O => serial_data_4_MC_D2_PT_1
    );
  serial_data_4_MC_D2_PT_2_435 : X_AND2
    port map (
      I0 => NlwInverterSignal_serial_data_4_MC_D2_PT_2_IN0,
      I1 => NlwInverterSignal_serial_data_4_MC_D2_PT_2_IN1,
      O => serial_data_4_MC_D2_PT_2
    );
  serial_data_4_MC_D2_PT_3_436 : X_AND4
    port map (
      I0 => NlwInverterSignal_serial_data_4_MC_D2_PT_3_IN0,
      I1 => data_trs_3_II_UIM,
      I2 => rst_II_UIM,
      I3 => N_PZ_342,
      O => serial_data_4_MC_D2_PT_3
    );
  serial_data_4_MC_D2_PT_4_437 : X_AND4
    port map (
      I0 => NlwInverterSignal_serial_data_4_MC_D2_PT_4_IN0,
      I1 => data_trs_3_II_UIM,
      I2 => rst_II_UIM,
      I3 => N_PZ_342,
      O => serial_data_4_MC_D2_PT_4
    );
  serial_data_4_MC_D2_PT_5_438 : X_AND4
    port map (
      I0 => NlwInverterSignal_serial_data_4_MC_D2_PT_5_IN0,
      I1 => data_trs_3_II_UIM,
      I2 => rst_II_UIM,
      I3 => N_PZ_342,
      O => serial_data_4_MC_D2_PT_5
    );
  serial_data_4_MC_D2_PT_6_439 : X_AND4
    port map (
      I0 => data_trs_3_II_UIM,
      I1 => NlwInverterSignal_serial_data_4_MC_D2_PT_6_IN1,
      I2 => rst_II_UIM,
      I3 => N_PZ_342,
      O => serial_data_4_MC_D2_PT_6
    );
  serial_data_4_MC_D2_PT_7_440 : X_AND4
    port map (
      I0 => NlwInverterSignal_serial_data_4_MC_D2_PT_7_IN0,
      I1 => NlwInverterSignal_serial_data_4_MC_D2_PT_7_IN1,
      I2 => rst_II_UIM,
      I3 => NlwInverterSignal_serial_data_4_MC_D2_PT_7_IN3,
      O => serial_data_4_MC_D2_PT_7
    );
  serial_data_4_MC_D2_PT_8_441 : X_AND5
    port map (
      I0 => data_trs_0_II_UIM,
      I1 => data_trs_1_II_UIM,
      I2 => data_trs_2_II_UIM,
      I3 => NlwInverterSignal_serial_data_4_MC_D2_PT_8_IN3,
      I4 => rst_II_UIM,
      O => serial_data_4_MC_D2_PT_8
    );
  serial_data_4_MC_D2_PT_9_442 : X_AND5
    port map (
      I0 => NlwInverterSignal_serial_data_4_MC_D2_PT_9_IN0,
      I1 => NlwInverterSignal_serial_data_4_MC_D2_PT_9_IN1,
      I2 => NlwInverterSignal_serial_data_4_MC_D2_PT_9_IN2,
      I3 => data_trs_3_II_UIM,
      I4 => rst_II_UIM,
      O => serial_data_4_MC_D2_PT_9
    );
  serial_data_4_MC_D2_PT_10_443 : X_AND5
    port map (
      I0 => data_trs_3_II_UIM,
      I1 => data_trs_4_II_UIM,
      I2 => rst_II_UIM,
      I3 => NlwInverterSignal_serial_data_4_MC_D2_PT_10_IN3,
      I4 => NlwInverterSignal_serial_data_4_MC_D2_PT_10_IN4,
      O => serial_data_4_MC_D2_PT_10
    );
  serial_data_4_MC_D2_PT_11_444 : X_AND5
    port map (
      I0 => NlwInverterSignal_serial_data_4_MC_D2_PT_11_IN0,
      I1 => data_trs_4_II_UIM,
      I2 => rst_II_UIM,
      I3 => NlwInverterSignal_serial_data_4_MC_D2_PT_11_IN3,
      I4 => N_PZ_342,
      O => serial_data_4_MC_D2_PT_11
    );
  serial_data_4_MC_D2_445 : X_OR16
    port map (
      I0 => serial_data_4_MC_D2_PT_0,
      I1 => serial_data_4_MC_D2_PT_1,
      I2 => serial_data_4_MC_D2_PT_2,
      I3 => serial_data_4_MC_D2_PT_3,
      I4 => serial_data_4_MC_D2_PT_4,
      I5 => serial_data_4_MC_D2_PT_5,
      I6 => serial_data_4_MC_D2_PT_6,
      I7 => serial_data_4_MC_D2_PT_7,
      I8 => serial_data_4_MC_D2_PT_8,
      I9 => serial_data_4_MC_D2_PT_9,
      I10 => serial_data_4_MC_D2_PT_10,
      I11 => serial_data_4_MC_D2_PT_11,
      I12 => GND,
      I13 => GND,
      I14 => GND,
      I15 => GND,
      O => serial_data_4_MC_D2
    );
  serial_data_4_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_serial_data_4_MC_XOR_IN0,
      I1 => serial_data_4_MC_D2,
      O => serial_data_4_MC_D
    );
  serial_data_4_MC_UIM_446 : X_BUF
    port map (
      I => serial_data_4_MC_Q_tsim_ireg_Q,
      O => serial_data_4_MC_UIM
    );
  serial_data_5_Q : X_BUF
    port map (
      I => serial_data_5_MC_Q,
      O => serial_data(5)
    );
  serial_data_5_MC_Q_447 : X_BUF
    port map (
      I => serial_data_5_MC_Q_tsim_ireg_Q,
      O => serial_data_5_MC_Q
    );
  serial_data_5_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => serial_data_5_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => serial_data_5_MC_Q_tsim_ireg_Q
    );
  serial_data_5_MC_D1_448 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => serial_data_5_MC_D1
    );
  serial_data_5_MC_D2_PT_0_449 : X_AND2
    port map (
      I0 => NlwInverterSignal_serial_data_5_MC_D2_PT_0_IN0,
      I1 => serial_data_5_MC_UIM,
      O => serial_data_5_MC_D2_PT_0
    );
  serial_data_5_MC_D2_PT_1_450 : X_AND5
    port map (
      I0 => rst_II_UIM,
      I1 => lower_enc_enc_8b_10b_prs_state_fft2,
      I2 => NlwInverterSignal_serial_data_5_MC_D2_PT_1_IN2,
      I3 => lower_enc_enc_8b_10b_prs_state_fft1,
      I4 => lower_enc_enc_8b_10b_e_prel,
      O => serial_data_5_MC_D2_PT_1
    );
  serial_data_5_MC_D2_451 : X_OR2
    port map (
      I0 => serial_data_5_MC_D2_PT_0,
      I1 => serial_data_5_MC_D2_PT_1,
      O => serial_data_5_MC_D2
    );
  serial_data_5_MC_XOR : X_XOR2
    port map (
      I0 => serial_data_5_MC_D1,
      I1 => serial_data_5_MC_D2,
      O => serial_data_5_MC_D
    );
  serial_data_5_MC_UIM_452 : X_BUF
    port map (
      I => serial_data_5_MC_Q_tsim_ireg_Q,
      O => serial_data_5_MC_UIM
    );
  lower_enc_enc_8b_10b_e_prel_453 : X_BUF
    port map (
      I => lower_enc_enc_8b_10b_e_prel_MC_Q,
      O => lower_enc_enc_8b_10b_e_prel
    );
  lower_enc_enc_8b_10b_e_prel_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => lower_enc_enc_8b_10b_e_prel_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => lower_enc_enc_8b_10b_e_prel_MC_Q
    );
  lower_enc_enc_8b_10b_e_prel_MC_D1_454 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => lower_enc_enc_8b_10b_e_prel_MC_D1
    );
  lower_enc_enc_8b_10b_e_prel_MC_D2_PT_0_455 : X_AND2
    port map (
      I0 => NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_0_IN0,
      I1 => NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_0_IN1,
      O => lower_enc_enc_8b_10b_e_prel_MC_D2_PT_0
    );
  lower_enc_enc_8b_10b_e_prel_MC_D2_PT_1_456 : X_AND2
    port map (
      I0 => rst_II_UIM,
      I1 => lower_enc_enc_8b_10b_prs_state_fft1,
      O => lower_enc_enc_8b_10b_e_prel_MC_D2_PT_1
    );
  lower_enc_enc_8b_10b_e_prel_MC_D2_PT_2_457 : X_AND2
    port map (
      I0 => NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_2_IN0,
      I1 => NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_2_IN1,
      O => lower_enc_enc_8b_10b_e_prel_MC_D2_PT_2
    );
  lower_enc_enc_8b_10b_e_prel_MC_D2_PT_3_458 : X_AND3
    port map (
      I0 => NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_3_IN0,
      I1 => rst_II_UIM,
      I2 => N_PZ_342,
      O => lower_enc_enc_8b_10b_e_prel_MC_D2_PT_3
    );
  lower_enc_enc_8b_10b_e_prel_MC_D2_PT_4_459 : X_AND4
    port map (
      I0 => data_trs_0_II_UIM,
      I1 => data_trs_3_II_UIM,
      I2 => NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_4_IN2,
      I3 => rst_II_UIM,
      O => lower_enc_enc_8b_10b_e_prel_MC_D2_PT_4
    );
  lower_enc_enc_8b_10b_e_prel_MC_D2_PT_5_460 : X_AND4
    port map (
      I0 => data_trs_1_II_UIM,
      I1 => data_trs_3_II_UIM,
      I2 => NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_5_IN2,
      I3 => rst_II_UIM,
      O => lower_enc_enc_8b_10b_e_prel_MC_D2_PT_5
    );
  lower_enc_enc_8b_10b_e_prel_MC_D2_PT_6_461 : X_AND4
    port map (
      I0 => data_trs_2_II_UIM,
      I1 => data_trs_3_II_UIM,
      I2 => NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_6_IN2,
      I3 => rst_II_UIM,
      O => lower_enc_enc_8b_10b_e_prel_MC_D2_PT_6
    );
  lower_enc_enc_8b_10b_e_prel_MC_D2_PT_7_462 : X_AND6
    port map (
      I0 => NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_7_IN0,
      I1 => NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_7_IN1,
      I2 => NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_7_IN2,
      I3 => data_trs_3_II_UIM,
      I4 => data_trs_4_II_UIM,
      I5 => rst_II_UIM,
      O => lower_enc_enc_8b_10b_e_prel_MC_D2_PT_7
    );
  lower_enc_enc_8b_10b_e_prel_MC_D2_PT_8_463 : X_AND6
    port map (
      I0 => NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_8_IN0,
      I1 => NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_8_IN1,
      I2 => NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_8_IN2,
      I3 => NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_8_IN3,
      I4 => NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_8_IN4,
      I5 => rst_II_UIM,
      O => lower_enc_enc_8b_10b_e_prel_MC_D2_PT_8
    );
  lower_enc_enc_8b_10b_e_prel_MC_D2_464 : X_OR16
    port map (
      I0 => lower_enc_enc_8b_10b_e_prel_MC_D2_PT_0,
      I1 => lower_enc_enc_8b_10b_e_prel_MC_D2_PT_1,
      I2 => lower_enc_enc_8b_10b_e_prel_MC_D2_PT_2,
      I3 => lower_enc_enc_8b_10b_e_prel_MC_D2_PT_3,
      I4 => lower_enc_enc_8b_10b_e_prel_MC_D2_PT_4,
      I5 => lower_enc_enc_8b_10b_e_prel_MC_D2_PT_5,
      I6 => lower_enc_enc_8b_10b_e_prel_MC_D2_PT_6,
      I7 => lower_enc_enc_8b_10b_e_prel_MC_D2_PT_7,
      I8 => lower_enc_enc_8b_10b_e_prel_MC_D2_PT_8,
      I9 => GND,
      I10 => GND,
      I11 => GND,
      I12 => GND,
      I13 => GND,
      I14 => GND,
      I15 => GND,
      O => lower_enc_enc_8b_10b_e_prel_MC_D2
    );
  lower_enc_enc_8b_10b_e_prel_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_XOR_IN0,
      I1 => lower_enc_enc_8b_10b_e_prel_MC_D2,
      O => lower_enc_enc_8b_10b_e_prel_MC_D
    );
  serial_data_6_Q : X_BUF
    port map (
      I => serial_data_6_MC_Q,
      O => serial_data(6)
    );
  serial_data_6_MC_Q_465 : X_BUF
    port map (
      I => serial_data_6_MC_Q_tsim_ireg_Q,
      O => serial_data_6_MC_Q
    );
  serial_data_6_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => serial_data_6_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => serial_data_6_MC_Q_tsim_ireg_Q
    );
  serial_data_6_MC_D1_466 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => serial_data_6_MC_D1
    );
  serial_data_6_MC_D2_PT_0_467 : X_AND2
    port map (
      I0 => NlwInverterSignal_serial_data_6_MC_D2_PT_0_IN0,
      I1 => serial_data_6_MC_UIM,
      O => serial_data_6_MC_D2_PT_0
    );
  serial_data_6_MC_D2_PT_1_468 : X_AND5
    port map (
      I0 => rst_II_UIM,
      I1 => lower_enc_enc_8b_10b_prs_state_fft2,
      I2 => NlwInverterSignal_serial_data_6_MC_D2_PT_1_IN2,
      I3 => lower_enc_enc_8b_10b_prs_state_fft1,
      I4 => lower_enc_enc_8b_10b_d_prel,
      O => serial_data_6_MC_D2_PT_1
    );
  serial_data_6_MC_D2_469 : X_OR2
    port map (
      I0 => serial_data_6_MC_D2_PT_0,
      I1 => serial_data_6_MC_D2_PT_1,
      O => serial_data_6_MC_D2
    );
  serial_data_6_MC_XOR : X_XOR2
    port map (
      I0 => serial_data_6_MC_D1,
      I1 => serial_data_6_MC_D2,
      O => serial_data_6_MC_D
    );
  serial_data_6_MC_UIM_470 : X_BUF
    port map (
      I => serial_data_6_MC_Q_tsim_ireg_Q,
      O => serial_data_6_MC_UIM
    );
  lower_enc_enc_8b_10b_d_prel_471 : X_BUF
    port map (
      I => lower_enc_enc_8b_10b_d_prel_MC_Q,
      O => lower_enc_enc_8b_10b_d_prel
    );
  lower_enc_enc_8b_10b_d_prel_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => lower_enc_enc_8b_10b_d_prel_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => lower_enc_enc_8b_10b_d_prel_MC_Q
    );
  lower_enc_enc_8b_10b_d_prel_MC_D1_472 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => lower_enc_enc_8b_10b_d_prel_MC_D1
    );
  lower_enc_enc_8b_10b_d_prel_MC_D2_PT_0_473 : X_AND2
    port map (
      I0 => NlwInverterSignal_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_0_IN0,
      I1 => lower_enc_enc_8b_10b_d_prel,
      O => lower_enc_enc_8b_10b_d_prel_MC_D2_PT_0
    );
  lower_enc_enc_8b_10b_d_prel_MC_D2_PT_1_474 : X_AND7
    port map (
      I0 => NlwInverterSignal_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_1_IN0,
      I1 => data_trs_3_II_UIM,
      I2 => rst_II_UIM,
      I3 => lower_enc_enc_8b_10b_prs_state_fft2,
      I4 => NlwInverterSignal_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_1_IN4,
      I5 => NlwInverterSignal_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_1_IN5,
      I6 => NlwInverterSignal_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_1_IN6,
      O => lower_enc_enc_8b_10b_d_prel_MC_D2_PT_1
    );
  lower_enc_enc_8b_10b_d_prel_MC_D2_PT_2_475 : X_AND7
    port map (
      I0 => NlwInverterSignal_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_2_IN0,
      I1 => data_trs_3_II_UIM,
      I2 => rst_II_UIM,
      I3 => lower_enc_enc_8b_10b_prs_state_fft2,
      I4 => NlwInverterSignal_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_2_IN4,
      I5 => NlwInverterSignal_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_2_IN5,
      I6 => NlwInverterSignal_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_2_IN6,
      O => lower_enc_enc_8b_10b_d_prel_MC_D2_PT_2
    );
  lower_enc_enc_8b_10b_d_prel_MC_D2_PT_3_476 : X_AND7
    port map (
      I0 => NlwInverterSignal_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_3_IN0,
      I1 => data_trs_3_II_UIM,
      I2 => rst_II_UIM,
      I3 => lower_enc_enc_8b_10b_prs_state_fft2,
      I4 => NlwInverterSignal_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_3_IN4,
      I5 => NlwInverterSignal_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_3_IN5,
      I6 => NlwInverterSignal_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_3_IN6,
      O => lower_enc_enc_8b_10b_d_prel_MC_D2_PT_3
    );
  lower_enc_enc_8b_10b_d_prel_MC_D2_477 : X_OR4
    port map (
      I0 => lower_enc_enc_8b_10b_d_prel_MC_D2_PT_0,
      I1 => lower_enc_enc_8b_10b_d_prel_MC_D2_PT_1,
      I2 => lower_enc_enc_8b_10b_d_prel_MC_D2_PT_2,
      I3 => lower_enc_enc_8b_10b_d_prel_MC_D2_PT_3,
      O => lower_enc_enc_8b_10b_d_prel_MC_D2
    );
  lower_enc_enc_8b_10b_d_prel_MC_XOR : X_XOR2
    port map (
      I0 => lower_enc_enc_8b_10b_d_prel_MC_D1,
      I1 => lower_enc_enc_8b_10b_d_prel_MC_D2,
      O => lower_enc_enc_8b_10b_d_prel_MC_D
    );
  serial_data_7_Q : X_BUF
    port map (
      I => serial_data_7_MC_Q,
      O => serial_data(7)
    );
  serial_data_7_MC_Q_478 : X_BUF
    port map (
      I => serial_data_7_MC_Q_tsim_ireg_Q,
      O => serial_data_7_MC_Q
    );
  serial_data_7_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => serial_data_7_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => serial_data_7_MC_Q_tsim_ireg_Q
    );
  serial_data_7_MC_D1_479 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => serial_data_7_MC_D1
    );
  serial_data_7_MC_D2_PT_0_480 : X_AND2
    port map (
      I0 => NlwInverterSignal_serial_data_7_MC_D2_PT_0_IN0,
      I1 => serial_data_7_MC_UIM,
      O => serial_data_7_MC_D2_PT_0
    );
  serial_data_7_MC_D2_PT_1_481 : X_AND5
    port map (
      I0 => rst_II_UIM,
      I1 => lower_enc_enc_8b_10b_prs_state_fft2,
      I2 => NlwInverterSignal_serial_data_7_MC_D2_PT_1_IN2,
      I3 => lower_enc_enc_8b_10b_prs_state_fft1,
      I4 => lower_enc_enc_8b_10b_c_prel,
      O => serial_data_7_MC_D2_PT_1
    );
  serial_data_7_MC_D2_482 : X_OR2
    port map (
      I0 => serial_data_7_MC_D2_PT_0,
      I1 => serial_data_7_MC_D2_PT_1,
      O => serial_data_7_MC_D2
    );
  serial_data_7_MC_XOR : X_XOR2
    port map (
      I0 => serial_data_7_MC_D1,
      I1 => serial_data_7_MC_D2,
      O => serial_data_7_MC_D
    );
  serial_data_7_MC_UIM_483 : X_BUF
    port map (
      I => serial_data_7_MC_Q_tsim_ireg_Q,
      O => serial_data_7_MC_UIM
    );
  lower_enc_enc_8b_10b_c_prel_484 : X_BUF
    port map (
      I => lower_enc_enc_8b_10b_c_prel_MC_Q,
      O => lower_enc_enc_8b_10b_c_prel
    );
  lower_enc_enc_8b_10b_c_prel_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => lower_enc_enc_8b_10b_c_prel_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => lower_enc_enc_8b_10b_c_prel_MC_Q
    );
  lower_enc_enc_8b_10b_c_prel_MC_D1_485 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => lower_enc_enc_8b_10b_c_prel_MC_D1
    );
  lower_enc_enc_8b_10b_c_prel_MC_D2_PT_0_486 : X_AND2
    port map (
      I0 => NlwInverterSignal_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_0_IN0,
      I1 => lower_enc_enc_8b_10b_c_prel,
      O => lower_enc_enc_8b_10b_c_prel_MC_D2_PT_0
    );
  lower_enc_enc_8b_10b_c_prel_MC_D2_PT_1_487 : X_AND5
    port map (
      I0 => data_trs_2_II_UIM,
      I1 => rst_II_UIM,
      I2 => lower_enc_enc_8b_10b_prs_state_fft2,
      I3 => NlwInverterSignal_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_1_IN3,
      I4 => NlwInverterSignal_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_1_IN4,
      O => lower_enc_enc_8b_10b_c_prel_MC_D2_PT_1
    );
  lower_enc_enc_8b_10b_c_prel_MC_D2_PT_2_488 : X_AND5
    port map (
      I0 => rst_II_UIM,
      I1 => lower_enc_enc_8b_10b_prs_state_fft2,
      I2 => NlwInverterSignal_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_2_IN2,
      I3 => NlwInverterSignal_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_2_IN3,
      I4 => N_PZ_226,
      O => lower_enc_enc_8b_10b_c_prel_MC_D2_PT_2
    );
  lower_enc_enc_8b_10b_c_prel_MC_D2_PT_3_489 : X_AND7
    port map (
      I0 => NlwInverterSignal_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_3_IN0,
      I1 => NlwInverterSignal_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_3_IN1,
      I2 => NlwInverterSignal_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_3_IN2,
      I3 => rst_II_UIM,
      I4 => lower_enc_enc_8b_10b_prs_state_fft2,
      I5 => NlwInverterSignal_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_3_IN5,
      I6 => NlwInverterSignal_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_3_IN6,
      O => lower_enc_enc_8b_10b_c_prel_MC_D2_PT_3
    );
  lower_enc_enc_8b_10b_c_prel_MC_D2_PT_4_490 : X_AND7
    port map (
      I0 => NlwInverterSignal_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_4_IN0,
      I1 => NlwInverterSignal_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_4_IN1,
      I2 => data_trs_4_II_UIM,
      I3 => rst_II_UIM,
      I4 => lower_enc_enc_8b_10b_prs_state_fft2,
      I5 => NlwInverterSignal_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_4_IN5,
      I6 => NlwInverterSignal_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_4_IN6,
      O => lower_enc_enc_8b_10b_c_prel_MC_D2_PT_4
    );
  lower_enc_enc_8b_10b_c_prel_MC_D2_491 : X_OR5
    port map (
      I0 => lower_enc_enc_8b_10b_c_prel_MC_D2_PT_0,
      I1 => lower_enc_enc_8b_10b_c_prel_MC_D2_PT_1,
      I2 => lower_enc_enc_8b_10b_c_prel_MC_D2_PT_2,
      I3 => lower_enc_enc_8b_10b_c_prel_MC_D2_PT_3,
      I4 => lower_enc_enc_8b_10b_c_prel_MC_D2_PT_4,
      O => lower_enc_enc_8b_10b_c_prel_MC_D2
    );
  lower_enc_enc_8b_10b_c_prel_MC_XOR : X_XOR2
    port map (
      I0 => lower_enc_enc_8b_10b_c_prel_MC_D1,
      I1 => lower_enc_enc_8b_10b_c_prel_MC_D2,
      O => lower_enc_enc_8b_10b_c_prel_MC_D
    );
  serial_data_8_Q : X_BUF
    port map (
      I => serial_data_8_MC_Q,
      O => serial_data(8)
    );
  serial_data_8_MC_Q_492 : X_BUF
    port map (
      I => serial_data_8_MC_Q_tsim_ireg_Q,
      O => serial_data_8_MC_Q
    );
  serial_data_8_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => serial_data_8_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => serial_data_8_MC_Q_tsim_ireg_Q
    );
  serial_data_8_MC_D1_493 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => serial_data_8_MC_D1
    );
  serial_data_8_MC_D2_PT_0_494 : X_AND2
    port map (
      I0 => NlwInverterSignal_serial_data_8_MC_D2_PT_0_IN0,
      I1 => serial_data_8_MC_UIM,
      O => serial_data_8_MC_D2_PT_0
    );
  serial_data_8_MC_D2_PT_1_495 : X_AND5
    port map (
      I0 => rst_II_UIM,
      I1 => lower_enc_enc_8b_10b_prs_state_fft2,
      I2 => NlwInverterSignal_serial_data_8_MC_D2_PT_1_IN2,
      I3 => lower_enc_enc_8b_10b_prs_state_fft1,
      I4 => lower_enc_enc_8b_10b_b_prel,
      O => serial_data_8_MC_D2_PT_1
    );
  serial_data_8_MC_D2_496 : X_OR2
    port map (
      I0 => serial_data_8_MC_D2_PT_0,
      I1 => serial_data_8_MC_D2_PT_1,
      O => serial_data_8_MC_D2
    );
  serial_data_8_MC_XOR : X_XOR2
    port map (
      I0 => serial_data_8_MC_D1,
      I1 => serial_data_8_MC_D2,
      O => serial_data_8_MC_D
    );
  serial_data_8_MC_UIM_497 : X_BUF
    port map (
      I => serial_data_8_MC_Q_tsim_ireg_Q,
      O => serial_data_8_MC_UIM
    );
  lower_enc_enc_8b_10b_b_prel_498 : X_BUF
    port map (
      I => lower_enc_enc_8b_10b_b_prel_MC_Q,
      O => lower_enc_enc_8b_10b_b_prel
    );
  lower_enc_enc_8b_10b_b_prel_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => lower_enc_enc_8b_10b_b_prel_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => lower_enc_enc_8b_10b_b_prel_MC_Q
    );
  lower_enc_enc_8b_10b_b_prel_MC_D1_499 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => lower_enc_enc_8b_10b_b_prel_MC_D1
    );
  lower_enc_enc_8b_10b_b_prel_MC_D2_PT_0_500 : X_AND2
    port map (
      I0 => NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_0_IN0,
      I1 => lower_enc_enc_8b_10b_b_prel,
      O => lower_enc_enc_8b_10b_b_prel_MC_D2_PT_0
    );
  lower_enc_enc_8b_10b_b_prel_MC_D2_PT_1_501 : X_AND5
    port map (
      I0 => rst_II_UIM,
      I1 => lower_enc_enc_8b_10b_prs_state_fft2,
      I2 => NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_1_IN2,
      I3 => NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_1_IN3,
      I4 => N_PZ_226,
      O => lower_enc_enc_8b_10b_b_prel_MC_D2_PT_1
    );
  lower_enc_enc_8b_10b_b_prel_MC_D2_PT_2_502 : X_AND6
    port map (
      I0 => NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_2_IN0,
      I1 => data_trs_1_II_UIM,
      I2 => rst_II_UIM,
      I3 => lower_enc_enc_8b_10b_prs_state_fft2,
      I4 => NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_2_IN4,
      I5 => NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_2_IN5,
      O => lower_enc_enc_8b_10b_b_prel_MC_D2_PT_2
    );
  lower_enc_enc_8b_10b_b_prel_MC_D2_PT_3_503 : X_AND6
    port map (
      I0 => data_trs_1_II_UIM,
      I1 => NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_3_IN1,
      I2 => rst_II_UIM,
      I3 => lower_enc_enc_8b_10b_prs_state_fft2,
      I4 => NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_3_IN4,
      I5 => NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_3_IN5,
      O => lower_enc_enc_8b_10b_b_prel_MC_D2_PT_3
    );
  lower_enc_enc_8b_10b_b_prel_MC_D2_PT_4_504 : X_AND6
    port map (
      I0 => data_trs_1_II_UIM,
      I1 => NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_4_IN1,
      I2 => rst_II_UIM,
      I3 => lower_enc_enc_8b_10b_prs_state_fft2,
      I4 => NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_4_IN4,
      I5 => NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_4_IN5,
      O => lower_enc_enc_8b_10b_b_prel_MC_D2_PT_4
    );
  lower_enc_enc_8b_10b_b_prel_MC_D2_PT_5_505 : X_AND7
    port map (
      I0 => NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_5_IN0,
      I1 => NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_5_IN1,
      I2 => NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_5_IN2,
      I3 => rst_II_UIM,
      I4 => lower_enc_enc_8b_10b_prs_state_fft2,
      I5 => NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_5_IN5,
      I6 => NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_5_IN6,
      O => lower_enc_enc_8b_10b_b_prel_MC_D2_PT_5
    );
  lower_enc_enc_8b_10b_b_prel_MC_D2_506 : X_OR6
    port map (
      I0 => lower_enc_enc_8b_10b_b_prel_MC_D2_PT_0,
      I1 => lower_enc_enc_8b_10b_b_prel_MC_D2_PT_1,
      I2 => lower_enc_enc_8b_10b_b_prel_MC_D2_PT_2,
      I3 => lower_enc_enc_8b_10b_b_prel_MC_D2_PT_3,
      I4 => lower_enc_enc_8b_10b_b_prel_MC_D2_PT_4,
      I5 => lower_enc_enc_8b_10b_b_prel_MC_D2_PT_5,
      O => lower_enc_enc_8b_10b_b_prel_MC_D2
    );
  lower_enc_enc_8b_10b_b_prel_MC_XOR : X_XOR2
    port map (
      I0 => lower_enc_enc_8b_10b_b_prel_MC_D1,
      I1 => lower_enc_enc_8b_10b_b_prel_MC_D2,
      O => lower_enc_enc_8b_10b_b_prel_MC_D
    );
  serial_data_9_Q : X_BUF
    port map (
      I => serial_data_9_MC_Q,
      O => serial_data(9)
    );
  serial_data_9_MC_Q_507 : X_BUF
    port map (
      I => serial_data_9_MC_Q_tsim_ireg_Q,
      O => serial_data_9_MC_Q
    );
  serial_data_9_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => serial_data_9_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => serial_data_9_MC_Q_tsim_ireg_Q
    );
  serial_data_9_MC_D1_508 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => serial_data_9_MC_D1
    );
  serial_data_9_MC_D2_PT_0_509 : X_AND2
    port map (
      I0 => NlwInverterSignal_serial_data_9_MC_D2_PT_0_IN0,
      I1 => serial_data_9_MC_UIM,
      O => serial_data_9_MC_D2_PT_0
    );
  serial_data_9_MC_D2_PT_1_510 : X_AND6
    port map (
      I0 => data_trs_0_II_UIM,
      I1 => rst_II_UIM,
      I2 => lower_enc_enc_8b_10b_prs_state_fft2,
      I3 => NlwInverterSignal_serial_data_9_MC_D2_PT_1_IN3,
      I4 => lower_enc_enc_8b_10b_prs_state_fft1,
      I5 => NlwInverterSignal_serial_data_9_MC_D2_PT_1_IN5,
      O => serial_data_9_MC_D2_PT_1
    );
  serial_data_9_MC_D2_511 : X_OR2
    port map (
      I0 => serial_data_9_MC_D2_PT_0,
      I1 => serial_data_9_MC_D2_PT_1,
      O => serial_data_9_MC_D2
    );
  serial_data_9_MC_XOR : X_XOR2
    port map (
      I0 => serial_data_9_MC_D1,
      I1 => serial_data_9_MC_D2,
      O => serial_data_9_MC_D
    );
  serial_data_9_MC_UIM_512 : X_BUF
    port map (
      I => serial_data_9_MC_Q_tsim_ireg_Q,
      O => serial_data_9_MC_UIM
    );
  NlwInverterBlock_dis_out_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_dis_out_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_dis_out_MC_D2_PT_1_IN2 : X_INV
    port map (
      I => lower_enc_dis_func_prs_state_fft3,
      O => NlwInverterSignal_dis_out_MC_D2_PT_1_IN2
    );
  NlwInverterBlock_dis_out_MC_D2_PT_1_IN4 : X_INV
    port map (
      I => lower_enc_dis_func_n0040,
      O => NlwInverterSignal_dis_out_MC_D2_PT_1_IN4
    );
  NlwInverterBlock_dis_out_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => lower_enc_dis_func_prs_state_fft1,
      O => NlwInverterSignal_dis_out_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_dis_out_MC_D2_PT_2_IN3 : X_INV
    port map (
      I => lower_enc_dis_func_prs_state_fft2,
      O => NlwInverterSignal_dis_out_MC_D2_PT_2_IN3
    );
  NlwInverterBlock_dis_out_MC_D2_PT_2_IN4 : X_INV
    port map (
      I => lower_enc_dis_func_n0040,
      O => NlwInverterSignal_dis_out_MC_D2_PT_2_IN4
    );
  NlwInverterBlock_FOOBAR3_ctinst_7_OUT : X_INV
    port map (
      I => NlwInverterSignal_FOOBAR3_ctinst_7_OUT,
      O => FOOBAR3_ctinst_7
    );
  NlwInverterBlock_lower_enc_dis_func_prs_state_fft1_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => lower_enc_dis_func_prs_state_fft3,
      O => NlwInverterSignal_lower_enc_dis_func_prs_state_fft1_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_lower_enc_dis_func_prs_state_fft1_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => lower_enc_prs_state_fft2,
      O => NlwInverterSignal_lower_enc_dis_func_prs_state_fft1_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_lower_enc_dis_func_prs_state_fft1_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => lower_enc_dis_func_prs_state_fft1,
      O => NlwInverterSignal_lower_enc_dis_func_prs_state_fft1_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_lower_enc_dis_func_prs_state_fft1_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => lower_enc_dis_func_prs_state_fft3,
      O => NlwInverterSignal_lower_enc_dis_func_prs_state_fft1_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_lower_enc_dis_func_prs_state_fft3_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => lower_enc_dis_func_prs_state_fft3,
      O => NlwInverterSignal_lower_enc_dis_func_prs_state_fft3_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_lower_enc_dis_func_prs_state_fft3_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => lower_enc_dis_func_prs_state_fft1,
      O => NlwInverterSignal_lower_enc_dis_func_prs_state_fft3_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_lower_enc_dis_func_prs_state_fft3_MC_D2_PT_1_IN2 : X_INV
    port map (
      I => lower_enc_dis_func_prs_state_fft2,
      O => NlwInverterSignal_lower_enc_dis_func_prs_state_fft3_MC_D2_PT_1_IN2
    );
  NlwInverterBlock_lower_enc_dis_func_prs_state_fft3_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => lower_enc_dis_func_prs_state_fft1,
      O => NlwInverterSignal_lower_enc_dis_func_prs_state_fft3_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_lower_enc_dis_func_prs_state_fft3_MC_D2_PT_2_IN2 : X_INV
    port map (
      I => lower_enc_dis_func_prs_state_fft2,
      O => NlwInverterSignal_lower_enc_dis_func_prs_state_fft3_MC_D2_PT_2_IN2
    );
  NlwInverterBlock_lower_enc_dis_func_prs_state_fft3_MC_D2_PT_2_IN3 : X_INV
    port map (
      I => lower_enc_prs_state_fft1,
      O => NlwInverterSignal_lower_enc_dis_func_prs_state_fft3_MC_D2_PT_2_IN3
    );
  NlwInverterBlock_lower_enc_dis_func_prs_state_fft2_MC_D1_PT_0_IN1 : X_INV
    port map (
      I => lower_enc_dis_func_prs_state_fft3,
      O => NlwInverterSignal_lower_enc_dis_func_prs_state_fft2_MC_D1_PT_0_IN1
    );
  NlwInverterBlock_lower_enc_prs_state_fft2_MC_D2_PT_0_IN2 : X_INV
    port map (
      I => frame_in_enc_II_UIM,
      O => NlwInverterSignal_lower_enc_prs_state_fft2_MC_D2_PT_0_IN2
    );
  NlwInverterBlock_lower_enc_prs_state_fft2_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => lower_enc_prs_state_fft2,
      O => NlwInverterSignal_lower_enc_prs_state_fft2_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_lower_enc_prs_state_fft2_MC_D2_PT_1_IN3 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_lower_enc_prs_state_fft2_MC_D2_PT_1_IN3
    );
  NlwInverterBlock_lower_enc_prs_state_fft1_MC_D2_PT_1_IN2 : X_INV
    port map (
      I => frame_in_enc_II_UIM,
      O => NlwInverterSignal_lower_enc_prs_state_fft1_MC_D2_PT_1_IN2
    );
  NlwInverterBlock_N_PZ_226_MC_D1_PT_0_IN0 : X_INV
    port map (
      I => lower_enc_prs_state_fft2,
      O => NlwInverterSignal_N_PZ_226_MC_D1_PT_0_IN0
    );
  NlwInverterBlock_N_PZ_226_MC_D1_PT_0_IN1 : X_INV
    port map (
      I => lower_enc_prs_state_fft1,
      O => NlwInverterSignal_N_PZ_226_MC_D1_PT_0_IN1
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_prs_state_fft2_MC_D1_PT_0_IN0 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft2_MC_D1_PT_0_IN0
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft2,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_1_IN3 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft1,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_1_IN3
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => lower_enc_prs_state_fft1,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft2,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_2_IN3 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft1,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_2_IN3
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => lower_enc_prs_state_fft2,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_1_IN2 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft2,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_1_IN2
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_1_IN3 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_1_IN3
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_1_IN4 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft1,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_1_IN4
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_2_IN2 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft1,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_2_IN2
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_2_IN3 : X_INV
    port map (
      I => lower_enc_s_func_prs_state_ffd1,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_2_IN3
    );
  NlwInverterBlock_lower_enc_s_func_prs_state_ffd1_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => lower_enc_s_func_prs_state_ffd1,
      O => NlwInverterSignal_lower_enc_s_func_prs_state_ffd1_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_lower_enc_s_func_prs_state_ffd1_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => lower_enc_prs_state_fft2,
      O => NlwInverterSignal_lower_enc_s_func_prs_state_ffd1_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_lower_enc_s_func_prs_state_ffd1_MC_D2_PT_1_IN3 : X_INV
    port map (
      I => lower_enc_s_func_prs_state_ffd2,
      O => NlwInverterSignal_lower_enc_s_func_prs_state_ffd1_MC_D2_PT_1_IN3
    );
  NlwInverterBlock_lower_enc_s_func_prs_state_ffd2_MC_D1_PT_0_IN0 : X_INV
    port map (
      I => N_PZ_233,
      O => NlwInverterSignal_lower_enc_s_func_prs_state_ffd2_MC_D1_PT_0_IN0
    );
  NlwInverterBlock_lower_enc_s_func_prs_state_ffd2_MC_D1_PT_0_IN2 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_lower_enc_s_func_prs_state_ffd2_MC_D1_PT_0_IN2
    );
  NlwInverterBlock_lower_enc_s_func_prs_state_ffd2_MC_D1_PT_0_IN3 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft1,
      O => NlwInverterSignal_lower_enc_s_func_prs_state_ffd2_MC_D1_PT_0_IN3
    );
  NlwInverterBlock_lower_enc_s_func_prs_state_ffd2_MC_D1_PT_0_IN4 : X_INV
    port map (
      I => lower_enc_s_func_prs_state_ffd1,
      O => NlwInverterSignal_lower_enc_s_func_prs_state_ffd2_MC_D1_PT_0_IN4
    );
  NlwInverterBlock_lower_enc_s_func_prs_state_ffd2_MC_D1_PT_0_IN5 : X_INV
    port map (
      I => lower_enc_s_func_prs_state_ffd2,
      O => NlwInverterSignal_lower_enc_s_func_prs_state_ffd2_MC_D1_PT_0_IN5
    );
  NlwInverterBlock_N_PZ_233_MC_D1_PT_0_IN0 : X_INV
    port map (
      I => lower_enc_dis_func_prs_state_fft1,
      O => NlwInverterSignal_N_PZ_233_MC_D1_PT_0_IN0
    );
  NlwInverterBlock_N_PZ_233_MC_D1_PT_0_IN1 : X_INV
    port map (
      I => lower_enc_dis_func_prs_state_fft3,
      O => NlwInverterSignal_N_PZ_233_MC_D1_PT_0_IN1
    );
  NlwInverterBlock_N_PZ_233_MC_D1_PT_0_IN2 : X_INV
    port map (
      I => lower_enc_dis_func_prs_state_fft2,
      O => NlwInverterSignal_N_PZ_233_MC_D1_PT_0_IN2
    );
  NlwInverterBlock_disparity_rdy_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => upper_enc_prs_state_fft2,
      O => NlwInverterSignal_disparity_rdy_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_upper_enc_dis_func_prs_state_ffd1_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => disparity_rdy,
      O => NlwInverterSignal_upper_enc_dis_func_prs_state_ffd1_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_upper_enc_dis_func_prs_state_ffd1_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => disparity_rdy,
      O => NlwInverterSignal_upper_enc_dis_func_prs_state_ffd1_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_upper_enc_dis_func_prs_state_ffd1_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => upper_enc_prs_state_fft2,
      O => NlwInverterSignal_upper_enc_dis_func_prs_state_ffd1_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_upper_enc_prs_state_fft2_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => frame_in_enc_II_UIM,
      O => NlwInverterSignal_upper_enc_prs_state_fft2_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_upper_enc_prs_state_fft2_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => upper_enc_prs_state_fft2,
      O => NlwInverterSignal_upper_enc_prs_state_fft2_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_upper_enc_prs_state_fft2_MC_D2_PT_1_IN3 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_upper_enc_prs_state_fft2_MC_D2_PT_1_IN3
    );
  NlwInverterBlock_upper_enc_prs_state_fft1_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => upper_enc_prs_state_fft2,
      O => NlwInverterSignal_upper_enc_prs_state_fft1_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_upper_enc_prs_state_fft1_MC_D2_PT_0_IN2 : X_INV
    port map (
      I => upper_enc_prs_state_fft1,
      O => NlwInverterSignal_upper_enc_prs_state_fft1_MC_D2_PT_0_IN2
    );
  NlwInverterBlock_upper_enc_prs_state_fft1_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => frame_in_enc_II_UIM,
      O => NlwInverterSignal_upper_enc_prs_state_fft1_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_prs_state_fft2_MC_D1_PT_0_IN0 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft2_MC_D1_PT_0_IN0
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft2,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_1_IN3 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft1,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_1_IN3
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => upper_enc_prs_state_fft1,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft2,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_2_IN3 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft1,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft3_MC_D2_PT_2_IN3
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => upper_enc_prs_state_fft2,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_1_IN2 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft2,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_1_IN2
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_1_IN3 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_1_IN3
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_1_IN4 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft1,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_1_IN4
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_2_IN2 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft1,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_2_IN2
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_2_IN3 : X_INV
    port map (
      I => upper_enc_s_func_prs_state_ffd1,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_prs_state_fft1_MC_D2_PT_2_IN3
    );
  NlwInverterBlock_upper_enc_s_func_prs_state_ffd1_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => upper_enc_s_func_prs_state_ffd1,
      O => NlwInverterSignal_upper_enc_s_func_prs_state_ffd1_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_upper_enc_s_func_prs_state_ffd1_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => upper_enc_prs_state_fft2,
      O => NlwInverterSignal_upper_enc_s_func_prs_state_ffd1_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_upper_enc_s_func_prs_state_ffd1_MC_D2_PT_1_IN3 : X_INV
    port map (
      I => upper_enc_s_func_prs_state_ffd2,
      O => NlwInverterSignal_upper_enc_s_func_prs_state_ffd1_MC_D2_PT_1_IN3
    );
  NlwInverterBlock_upper_enc_s_func_prs_state_ffd2_MC_D1_PT_0_IN1 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_upper_enc_s_func_prs_state_ffd2_MC_D1_PT_0_IN1
    );
  NlwInverterBlock_upper_enc_s_func_prs_state_ffd2_MC_D1_PT_0_IN2 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft1,
      O => NlwInverterSignal_upper_enc_s_func_prs_state_ffd2_MC_D1_PT_0_IN2
    );
  NlwInverterBlock_upper_enc_s_func_prs_state_ffd2_MC_D1_PT_0_IN3 : X_INV
    port map (
      I => upper_enc_s_func_prs_state_ffd1,
      O => NlwInverterSignal_upper_enc_s_func_prs_state_ffd2_MC_D1_PT_0_IN3
    );
  NlwInverterBlock_upper_enc_s_func_prs_state_ffd2_MC_D1_PT_0_IN4 : X_INV
    port map (
      I => upper_enc_s_func_prs_state_ffd2,
      O => NlwInverterSignal_upper_enc_s_func_prs_state_ffd2_MC_D1_PT_0_IN4
    );
  NlwInverterBlock_upper_enc_s_func_prs_state_ffd2_MC_D1_PT_0_IN5 : X_INV
    port map (
      I => N_PZ_312,
      O => NlwInverterSignal_upper_enc_s_func_prs_state_ffd2_MC_D1_PT_0_IN5
    );
  NlwInverterBlock_N_PZ_312_MC_D1_PT_0_IN0 : X_INV
    port map (
      I => disparity_rdy,
      O => NlwInverterSignal_N_PZ_312_MC_D1_PT_0_IN0
    );
  NlwInverterBlock_N_PZ_312_MC_D1_PT_0_IN1 : X_INV
    port map (
      I => upper_enc_dis_func_prs_state_ffd1,
      O => NlwInverterSignal_N_PZ_312_MC_D1_PT_0_IN1
    );
  NlwInverterBlock_lower_enc_dis_func_n0040_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => N_PZ_233,
      O => NlwInverterSignal_lower_enc_dis_func_n0040_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_lower_enc_dis_func_n0040_MC_D2_PT_2_IN2 : X_INV
    port map (
      I => N_PZ_307,
      O => NlwInverterSignal_lower_enc_dis_func_n0040_MC_D2_PT_2_IN2
    );
  NlwInverterBlock_lower_enc_dis_func_n0040_MC_D2_PT_3_IN1 : X_INV
    port map (
      I => data_trs_6_II_UIM,
      O => NlwInverterSignal_lower_enc_dis_func_n0040_MC_D2_PT_3_IN1
    );
  NlwInverterBlock_lower_enc_dis_func_n0040_MC_D2_PT_3_IN2 : X_INV
    port map (
      I => N_PZ_226,
      O => NlwInverterSignal_lower_enc_dis_func_n0040_MC_D2_PT_3_IN2
    );
  NlwInverterBlock_lower_enc_dis_func_n0040_MC_D2_PT_4_IN1 : X_INV
    port map (
      I => data_trs_7_II_UIM,
      O => NlwInverterSignal_lower_enc_dis_func_n0040_MC_D2_PT_4_IN1
    );
  NlwInverterBlock_lower_enc_dis_func_n0040_MC_D2_PT_4_IN2 : X_INV
    port map (
      I => N_PZ_226,
      O => NlwInverterSignal_lower_enc_dis_func_n0040_MC_D2_PT_4_IN2
    );
  NlwInverterBlock_lower_enc_dis_func_n0040_MC_D2_PT_5_IN0 : X_INV
    port map (
      I => data_trs_5_II_UIM,
      O => NlwInverterSignal_lower_enc_dis_func_n0040_MC_D2_PT_5_IN0
    );
  NlwInverterBlock_lower_enc_dis_func_n0040_MC_D2_PT_5_IN2 : X_INV
    port map (
      I => N_PZ_226,
      O => NlwInverterSignal_lower_enc_dis_func_n0040_MC_D2_PT_5_IN2
    );
  NlwInverterBlock_lower_enc_dis_func_n0040_MC_D2_PT_6_IN0 : X_INV
    port map (
      I => data_trs_5_II_UIM,
      O => NlwInverterSignal_lower_enc_dis_func_n0040_MC_D2_PT_6_IN0
    );
  NlwInverterBlock_lower_enc_dis_func_n0040_MC_D2_PT_6_IN1 : X_INV
    port map (
      I => data_trs_6_II_UIM,
      O => NlwInverterSignal_lower_enc_dis_func_n0040_MC_D2_PT_6_IN1
    );
  NlwInverterBlock_lower_enc_dis_func_n0040_MC_D2_PT_6_IN2 : X_INV
    port map (
      I => N_PZ_233,
      O => NlwInverterSignal_lower_enc_dis_func_n0040_MC_D2_PT_6_IN2
    );
  NlwInverterBlock_lower_enc_dis_func_n0040_MC_D2_PT_6_IN3 : X_INV
    port map (
      I => N_PZ_307,
      O => NlwInverterSignal_lower_enc_dis_func_n0040_MC_D2_PT_6_IN3
    );
  NlwInverterBlock_lower_enc_dis_func_n0040_MC_D2_PT_7_IN3 : X_INV
    port map (
      I => N_PZ_233,
      O => NlwInverterSignal_lower_enc_dis_func_n0040_MC_D2_PT_7_IN3
    );
  NlwInverterBlock_lower_enc_dis_func_n0040_MC_D2_PT_7_IN4 : X_INV
    port map (
      I => N_PZ_307,
      O => NlwInverterSignal_lower_enc_dis_func_n0040_MC_D2_PT_7_IN4
    );
  NlwInverterBlock_N_PZ_307_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => lower_enc_nds6,
      O => NlwInverterSignal_N_PZ_307_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_N_PZ_307_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => lower_enc_pds6,
      O => NlwInverterSignal_N_PZ_307_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_run_disparity_MC_D2_PT_0_IN3 : X_INV
    port map (
      I => upper_enc_pds6,
      O => NlwInverterSignal_run_disparity_MC_D2_PT_0_IN3
    );
  NlwInverterBlock_run_disparity_MC_D2_PT_1_IN3 : X_INV
    port map (
      I => N_PZ_327,
      O => NlwInverterSignal_run_disparity_MC_D2_PT_1_IN3
    );
  NlwInverterBlock_run_disparity_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => upper_enc_nds6,
      O => NlwInverterSignal_run_disparity_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_run_disparity_MC_D2_PT_3_IN1 : X_INV
    port map (
      I => upper_enc_nds6,
      O => NlwInverterSignal_run_disparity_MC_D2_PT_3_IN1
    );
  NlwInverterBlock_run_disparity_MC_D2_PT_3_IN2 : X_INV
    port map (
      I => upper_enc_pds6,
      O => NlwInverterSignal_run_disparity_MC_D2_PT_3_IN2
    );
  NlwInverterBlock_run_disparity_MC_D2_PT_3_IN3 : X_INV
    port map (
      I => N_PZ_327,
      O => NlwInverterSignal_run_disparity_MC_D2_PT_3_IN3
    );
  NlwInverterBlock_upper_enc_nds6_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => upper_enc_prs_state_fft2,
      O => NlwInverterSignal_upper_enc_nds6_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_upper_enc_nds6_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => upper_enc_prs_state_fft1,
      O => NlwInverterSignal_upper_enc_nds6_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_upper_enc_nds6_MC_D2_PT_0_IN2 : X_INV
    port map (
      I => N_PZ_312,
      O => NlwInverterSignal_upper_enc_nds6_MC_D2_PT_0_IN2
    );
  NlwInverterBlock_upper_enc_nds6_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => data_trs_11_II_UIM,
      O => NlwInverterSignal_upper_enc_nds6_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_upper_enc_nds6_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => data_trs_12_II_UIM,
      O => NlwInverterSignal_upper_enc_nds6_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_upper_enc_nds6_MC_D2_PT_1_IN2 : X_INV
    port map (
      I => N_PZ_312,
      O => NlwInverterSignal_upper_enc_nds6_MC_D2_PT_1_IN2
    );
  NlwInverterBlock_upper_enc_nds6_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => data_trs_10_II_UIM,
      O => NlwInverterSignal_upper_enc_nds6_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_upper_enc_nds6_MC_D2_PT_2_IN2 : X_INV
    port map (
      I => data_trs_8_II_UIM,
      O => NlwInverterSignal_upper_enc_nds6_MC_D2_PT_2_IN2
    );
  NlwInverterBlock_upper_enc_nds6_MC_D2_PT_2_IN3 : X_INV
    port map (
      I => data_trs_9_II_UIM,
      O => NlwInverterSignal_upper_enc_nds6_MC_D2_PT_2_IN3
    );
  NlwInverterBlock_upper_enc_nds6_MC_D2_PT_2_IN4 : X_INV
    port map (
      I => N_PZ_312,
      O => NlwInverterSignal_upper_enc_nds6_MC_D2_PT_2_IN4
    );
  NlwInverterBlock_upper_enc_nds6_MC_D2_PT_3_IN1 : X_INV
    port map (
      I => data_trs_12_II_UIM,
      O => NlwInverterSignal_upper_enc_nds6_MC_D2_PT_3_IN1
    );
  NlwInverterBlock_upper_enc_nds6_MC_D2_PT_3_IN3 : X_INV
    port map (
      I => N_PZ_312,
      O => NlwInverterSignal_upper_enc_nds6_MC_D2_PT_3_IN3
    );
  NlwInverterBlock_N_PZ_246_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => data_trs_10_II_UIM,
      O => NlwInverterSignal_N_PZ_246_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_N_PZ_246_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => data_trs_8_II_UIM,
      O => NlwInverterSignal_N_PZ_246_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_N_PZ_246_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => data_trs_9_II_UIM,
      O => NlwInverterSignal_N_PZ_246_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_N_PZ_246_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => N_PZ_317,
      O => NlwInverterSignal_N_PZ_246_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_upper_enc_pds6_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => data_trs_12_II_UIM,
      O => NlwInverterSignal_upper_enc_pds6_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_upper_enc_pds6_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => k_char_II_UIM,
      O => NlwInverterSignal_upper_enc_pds6_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_upper_enc_pds6_MC_D2_PT_2_IN2 : X_INV
    port map (
      I => k_char_II_UIM,
      O => NlwInverterSignal_upper_enc_pds6_MC_D2_PT_2_IN2
    );
  NlwInverterBlock_upper_enc_pds6_MC_D2_PT_3_IN2 : X_INV
    port map (
      I => k_char_II_UIM,
      O => NlwInverterSignal_upper_enc_pds6_MC_D2_PT_3_IN2
    );
  NlwInverterBlock_upper_enc_pds6_MC_D2_PT_4_IN0 : X_INV
    port map (
      I => upper_enc_prs_state_fft2,
      O => NlwInverterSignal_upper_enc_pds6_MC_D2_PT_4_IN0
    );
  NlwInverterBlock_upper_enc_pds6_MC_D2_PT_4_IN1 : X_INV
    port map (
      I => upper_enc_prs_state_fft1,
      O => NlwInverterSignal_upper_enc_pds6_MC_D2_PT_4_IN1
    );
  NlwInverterBlock_upper_enc_pds6_MC_D2_PT_4_IN2 : X_INV
    port map (
      I => k_char_II_UIM,
      O => NlwInverterSignal_upper_enc_pds6_MC_D2_PT_4_IN2
    );
  NlwInverterBlock_upper_enc_pds6_MC_D2_PT_5_IN0 : X_INV
    port map (
      I => data_trs_11_II_UIM,
      O => NlwInverterSignal_upper_enc_pds6_MC_D2_PT_5_IN0
    );
  NlwInverterBlock_upper_enc_pds6_MC_D2_PT_5_IN2 : X_INV
    port map (
      I => data_trs_9_II_UIM,
      O => NlwInverterSignal_upper_enc_pds6_MC_D2_PT_5_IN2
    );
  NlwInverterBlock_upper_enc_pds6_MC_D2_PT_5_IN3 : X_INV
    port map (
      I => k_char_II_UIM,
      O => NlwInverterSignal_upper_enc_pds6_MC_D2_PT_5_IN3
    );
  NlwInverterBlock_upper_enc_pds6_MC_D2_PT_6_IN0 : X_INV
    port map (
      I => data_trs_11_II_UIM,
      O => NlwInverterSignal_upper_enc_pds6_MC_D2_PT_6_IN0
    );
  NlwInverterBlock_upper_enc_pds6_MC_D2_PT_6_IN2 : X_INV
    port map (
      I => N_PZ_317,
      O => NlwInverterSignal_upper_enc_pds6_MC_D2_PT_6_IN2
    );
  NlwInverterBlock_upper_enc_pds6_MC_D2_PT_6_IN3 : X_INV
    port map (
      I => k_char_II_UIM,
      O => NlwInverterSignal_upper_enc_pds6_MC_D2_PT_6_IN3
    );
  NlwInverterBlock_N_PZ_327_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => data_trs_13_II_UIM,
      O => NlwInverterSignal_N_PZ_327_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_N_PZ_327_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => data_trs_14_II_UIM,
      O => NlwInverterSignal_N_PZ_327_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_N_PZ_327_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => upper_enc_prs_state_fft2,
      O => NlwInverterSignal_N_PZ_327_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_N_PZ_327_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => upper_enc_prs_state_fft1,
      O => NlwInverterSignal_N_PZ_327_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_lower_enc_nds6_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => N_PZ_233,
      O => NlwInverterSignal_lower_enc_nds6_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_lower_enc_nds6_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => data_trs_3_II_UIM,
      O => NlwInverterSignal_lower_enc_nds6_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_lower_enc_nds6_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => data_trs_4_II_UIM,
      O => NlwInverterSignal_lower_enc_nds6_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_lower_enc_nds6_MC_D2_PT_1_IN2 : X_INV
    port map (
      I => N_PZ_233,
      O => NlwInverterSignal_lower_enc_nds6_MC_D2_PT_1_IN2
    );
  NlwInverterBlock_lower_enc_nds6_MC_D2_PT_1_IN3 : X_INV
    port map (
      I => N_PZ_342,
      O => NlwInverterSignal_lower_enc_nds6_MC_D2_PT_1_IN3
    );
  NlwInverterBlock_lower_enc_nds6_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => data_trs_0_II_UIM,
      O => NlwInverterSignal_lower_enc_nds6_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_lower_enc_nds6_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => data_trs_1_II_UIM,
      O => NlwInverterSignal_lower_enc_nds6_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_lower_enc_nds6_MC_D2_PT_2_IN2 : X_INV
    port map (
      I => data_trs_2_II_UIM,
      O => NlwInverterSignal_lower_enc_nds6_MC_D2_PT_2_IN2
    );
  NlwInverterBlock_lower_enc_nds6_MC_D2_PT_2_IN4 : X_INV
    port map (
      I => N_PZ_233,
      O => NlwInverterSignal_lower_enc_nds6_MC_D2_PT_2_IN4
    );
  NlwInverterBlock_lower_enc_nds6_MC_D2_PT_3_IN4 : X_INV
    port map (
      I => data_trs_4_II_UIM,
      O => NlwInverterSignal_lower_enc_nds6_MC_D2_PT_3_IN4
    );
  NlwInverterBlock_lower_enc_nds6_MC_D2_PT_3_IN5 : X_INV
    port map (
      I => N_PZ_233,
      O => NlwInverterSignal_lower_enc_nds6_MC_D2_PT_3_IN5
    );
  NlwInverterBlock_lower_enc_pds6_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => N_PZ_233,
      O => NlwInverterSignal_lower_enc_pds6_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_lower_enc_pds6_MC_D2_PT_1_IN2 : X_INV
    port map (
      I => N_PZ_233,
      O => NlwInverterSignal_lower_enc_pds6_MC_D2_PT_1_IN2
    );
  NlwInverterBlock_lower_enc_pds6_MC_D2_PT_1_IN3 : X_INV
    port map (
      I => N_PZ_226,
      O => NlwInverterSignal_lower_enc_pds6_MC_D2_PT_1_IN3
    );
  NlwInverterBlock_lower_enc_pds6_MC_D2_PT_2_IN4 : X_INV
    port map (
      I => N_PZ_233,
      O => NlwInverterSignal_lower_enc_pds6_MC_D2_PT_2_IN4
    );
  NlwInverterBlock_lower_enc_pds6_MC_D2_PT_2_IN5 : X_INV
    port map (
      I => N_PZ_226,
      O => NlwInverterSignal_lower_enc_pds6_MC_D2_PT_2_IN5
    );
  NlwInverterBlock_lower_enc_pds6_MC_D2_PT_3_IN0 : X_INV
    port map (
      I => data_trs_0_II_UIM,
      O => NlwInverterSignal_lower_enc_pds6_MC_D2_PT_3_IN0
    );
  NlwInverterBlock_lower_enc_pds6_MC_D2_PT_3_IN1 : X_INV
    port map (
      I => data_trs_1_II_UIM,
      O => NlwInverterSignal_lower_enc_pds6_MC_D2_PT_3_IN1
    );
  NlwInverterBlock_lower_enc_pds6_MC_D2_PT_3_IN2 : X_INV
    port map (
      I => data_trs_2_II_UIM,
      O => NlwInverterSignal_lower_enc_pds6_MC_D2_PT_3_IN2
    );
  NlwInverterBlock_lower_enc_pds6_MC_D2_PT_3_IN3 : X_INV
    port map (
      I => data_trs_3_II_UIM,
      O => NlwInverterSignal_lower_enc_pds6_MC_D2_PT_3_IN3
    );
  NlwInverterBlock_lower_enc_pds6_MC_D2_PT_3_IN5 : X_INV
    port map (
      I => N_PZ_233,
      O => NlwInverterSignal_lower_enc_pds6_MC_D2_PT_3_IN5
    );
  NlwInverterBlock_lower_enc_pds6_MC_D2_PT_3_IN6 : X_INV
    port map (
      I => N_PZ_226,
      O => NlwInverterSignal_lower_enc_pds6_MC_D2_PT_3_IN6
    );
  NlwInverterBlock_serial_data_0_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_serial_data_0_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_serial_data_0_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => data_trs_6_II_UIM,
      O => NlwInverterSignal_serial_data_0_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_serial_data_0_MC_D2_PT_1_IN2 : X_INV
    port map (
      I => data_trs_7_II_UIM,
      O => NlwInverterSignal_serial_data_0_MC_D2_PT_1_IN2
    );
  NlwInverterBlock_serial_data_0_MC_D2_PT_1_IN5 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_serial_data_0_MC_D2_PT_1_IN5
    );
  NlwInverterBlock_serial_data_0_MC_D2_PT_1_IN7 : X_INV
    port map (
      I => N_PZ_226,
      O => NlwInverterSignal_serial_data_0_MC_D2_PT_1_IN7
    );
  NlwInverterBlock_serial_data_0_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => data_trs_5_II_UIM,
      O => NlwInverterSignal_serial_data_0_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_serial_data_0_MC_D2_PT_2_IN2 : X_INV
    port map (
      I => data_trs_7_II_UIM,
      O => NlwInverterSignal_serial_data_0_MC_D2_PT_2_IN2
    );
  NlwInverterBlock_serial_data_0_MC_D2_PT_2_IN5 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_serial_data_0_MC_D2_PT_2_IN5
    );
  NlwInverterBlock_serial_data_0_MC_D2_PT_2_IN7 : X_INV
    port map (
      I => N_PZ_226,
      O => NlwInverterSignal_serial_data_0_MC_D2_PT_2_IN7
    );
  NlwInverterBlock_serial_data_0_MC_D2_PT_3_IN5 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_serial_data_0_MC_D2_PT_3_IN5
    );
  NlwInverterBlock_serial_data_0_MC_D2_PT_3_IN7 : X_INV
    port map (
      I => N_PZ_226,
      O => NlwInverterSignal_serial_data_0_MC_D2_PT_3_IN7
    );
  NlwInverterBlock_serial_data_0_MC_D2_PT_4_IN5 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_serial_data_0_MC_D2_PT_4_IN5
    );
  NlwInverterBlock_serial_data_0_MC_D2_PT_4_IN7 : X_INV
    port map (
      I => N_PZ_226,
      O => NlwInverterSignal_serial_data_0_MC_D2_PT_4_IN7
    );
  NlwInverterBlock_lower_enc_s_term_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => N_PZ_377,
      O => NlwInverterSignal_lower_enc_s_term_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_lower_enc_s_term_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => N_PZ_377,
      O => NlwInverterSignal_lower_enc_s_term_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_lower_enc_s_term_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => lower_enc_s_func_prs_state_ffd2,
      O => NlwInverterSignal_lower_enc_s_term_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_lower_enc_s_term_MC_D2_PT_3_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_lower_enc_s_term_MC_D2_PT_3_IN0
    );
  NlwInverterBlock_lower_enc_s_term_MC_D2_PT_3_IN1 : X_INV
    port map (
      I => lower_enc_s_term,
      O => NlwInverterSignal_lower_enc_s_term_MC_D2_PT_3_IN1
    );
  NlwInverterBlock_lower_enc_s_term_MC_D2_PT_4_IN2 : X_INV
    port map (
      I => N_PZ_342,
      O => NlwInverterSignal_lower_enc_s_term_MC_D2_PT_4_IN2
    );
  NlwInverterBlock_lower_enc_s_term_MC_D2_PT_5_IN0 : X_INV
    port map (
      I => data_trs_3_II_UIM,
      O => NlwInverterSignal_lower_enc_s_term_MC_D2_PT_5_IN0
    );
  NlwInverterBlock_lower_enc_s_term_MC_D2_PT_5_IN1 : X_INV
    port map (
      I => data_trs_4_II_UIM,
      O => NlwInverterSignal_lower_enc_s_term_MC_D2_PT_5_IN1
    );
  NlwInverterBlock_lower_enc_s_term_MC_D2_PT_7_IN2 : X_INV
    port map (
      I => N_PZ_342,
      O => NlwInverterSignal_lower_enc_s_term_MC_D2_PT_7_IN2
    );
  NlwInverterBlock_lower_enc_s_term_MC_D2_PT_8_IN1 : X_INV
    port map (
      I => run_disparity,
      O => NlwInverterSignal_lower_enc_s_term_MC_D2_PT_8_IN1
    );
  NlwInverterBlock_lower_enc_s_term_MC_D2_PT_8_IN2 : X_INV
    port map (
      I => N_PZ_342,
      O => NlwInverterSignal_lower_enc_s_term_MC_D2_PT_8_IN2
    );
  NlwInverterBlock_lower_enc_s_term_MC_D2_PT_10_IN0 : X_INV
    port map (
      I => data_trs_0_II_UIM,
      O => NlwInverterSignal_lower_enc_s_term_MC_D2_PT_10_IN0
    );
  NlwInverterBlock_lower_enc_s_term_MC_D2_PT_10_IN1 : X_INV
    port map (
      I => data_trs_1_II_UIM,
      O => NlwInverterSignal_lower_enc_s_term_MC_D2_PT_10_IN1
    );
  NlwInverterBlock_lower_enc_s_term_MC_D2_PT_10_IN2 : X_INV
    port map (
      I => data_trs_2_II_UIM,
      O => NlwInverterSignal_lower_enc_s_term_MC_D2_PT_10_IN2
    );
  NlwInverterBlock_lower_enc_s_term_MC_D2_PT_11_IN1 : X_INV
    port map (
      I => N_PZ_307,
      O => NlwInverterSignal_lower_enc_s_term_MC_D2_PT_11_IN1
    );
  NlwInverterBlock_lower_enc_s_term_MC_XOR_IN0 : X_INV
    port map (
      I => lower_enc_s_term_MC_D1,
      O => NlwInverterSignal_lower_enc_s_term_MC_XOR_IN0
    );
  NlwInverterBlock_N_PZ_377_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_N_PZ_377_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_N_PZ_377_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_N_PZ_377_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_N_PZ_377_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_N_PZ_377_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_N_PZ_377_MC_D2_PT_1_IN2 : X_INV
    port map (
      I => N_PZ_226,
      O => NlwInverterSignal_N_PZ_377_MC_D2_PT_1_IN2
    );
  NlwInverterBlock_serial_data_10_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_serial_data_10_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_serial_data_10_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => data_trs_14_II_UIM,
      O => NlwInverterSignal_serial_data_10_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_serial_data_10_MC_D2_PT_1_IN2 : X_INV
    port map (
      I => data_trs_15_II_UIM,
      O => NlwInverterSignal_serial_data_10_MC_D2_PT_1_IN2
    );
  NlwInverterBlock_serial_data_10_MC_D2_PT_1_IN5 : X_INV
    port map (
      I => N_PZ_302,
      O => NlwInverterSignal_serial_data_10_MC_D2_PT_1_IN5
    );
  NlwInverterBlock_serial_data_10_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => data_trs_13_II_UIM,
      O => NlwInverterSignal_serial_data_10_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_serial_data_10_MC_D2_PT_2_IN2 : X_INV
    port map (
      I => data_trs_15_II_UIM,
      O => NlwInverterSignal_serial_data_10_MC_D2_PT_2_IN2
    );
  NlwInverterBlock_serial_data_10_MC_D2_PT_2_IN5 : X_INV
    port map (
      I => N_PZ_302,
      O => NlwInverterSignal_serial_data_10_MC_D2_PT_2_IN5
    );
  NlwInverterBlock_serial_data_10_MC_D2_PT_3_IN6 : X_INV
    port map (
      I => N_PZ_302,
      O => NlwInverterSignal_serial_data_10_MC_D2_PT_3_IN6
    );
  NlwInverterBlock_serial_data_10_MC_D2_PT_4_IN5 : X_INV
    port map (
      I => N_PZ_302,
      O => NlwInverterSignal_serial_data_10_MC_D2_PT_4_IN5
    );
  NlwInverterBlock_N_PZ_302_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft2,
      O => NlwInverterSignal_N_PZ_302_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_N_PZ_302_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => upper_enc_prs_state_fft2,
      O => NlwInverterSignal_N_PZ_302_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_N_PZ_302_MC_D2_PT_2_IN2 : X_INV
    port map (
      I => upper_enc_prs_state_fft1,
      O => NlwInverterSignal_N_PZ_302_MC_D2_PT_2_IN2
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => N_PZ_302,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => data_trs_12_II_UIM,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_1_IN2 : X_INV
    port map (
      I => data_trs_9_II_UIM,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_1_IN2
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_1_IN3 : X_INV
    port map (
      I => dis_in_II_UIM,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_1_IN3
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_1_IN5 : X_INV
    port map (
      I => upper_enc_s_func_prs_state_ffd1,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_1_IN5
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_1_IN8 : X_INV
    port map (
      I => N_PZ_302,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_1_IN8
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => data_trs_12_II_UIM,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_2_IN2 : X_INV
    port map (
      I => data_trs_9_II_UIM,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_2_IN2
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_2_IN4 : X_INV
    port map (
      I => upper_enc_s_func_prs_state_ffd1,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_2_IN4
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_2_IN8 : X_INV
    port map (
      I => N_PZ_302,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_2_IN8
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_3_IN1 : X_INV
    port map (
      I => data_trs_12_II_UIM,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_3_IN1
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_3_IN2 : X_INV
    port map (
      I => data_trs_9_II_UIM,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_3_IN2
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_3_IN4 : X_INV
    port map (
      I => upper_enc_s_func_prs_state_ffd1,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_3_IN4
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_3_IN6 : X_INV
    port map (
      I => upper_enc_pds6,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_3_IN6
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_3_IN8 : X_INV
    port map (
      I => N_PZ_302,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_3_IN8
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_4_IN1 : X_INV
    port map (
      I => data_trs_12_II_UIM,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_4_IN1
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_4_IN2 : X_INV
    port map (
      I => dis_in_II_UIM,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_4_IN2
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_4_IN4 : X_INV
    port map (
      I => upper_enc_s_func_prs_state_ffd1,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_4_IN4
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_4_IN6 : X_INV
    port map (
      I => N_PZ_246,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_4_IN6
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_4_IN7 : X_INV
    port map (
      I => N_PZ_317,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_4_IN7
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_4_IN8 : X_INV
    port map (
      I => N_PZ_302,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_4_IN8
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_5_IN1 : X_INV
    port map (
      I => data_trs_12_II_UIM,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_5_IN1
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_5_IN3 : X_INV
    port map (
      I => upper_enc_s_func_prs_state_ffd1,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_5_IN3
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_5_IN6 : X_INV
    port map (
      I => N_PZ_246,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_5_IN6
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_5_IN7 : X_INV
    port map (
      I => N_PZ_317,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_5_IN7
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_5_IN8 : X_INV
    port map (
      I => N_PZ_302,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_5_IN8
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_6_IN1 : X_INV
    port map (
      I => data_trs_12_II_UIM,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_6_IN1
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_6_IN3 : X_INV
    port map (
      I => upper_enc_s_func_prs_state_ffd1,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_6_IN3
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_6_IN5 : X_INV
    port map (
      I => upper_enc_pds6,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_6_IN5
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_6_IN6 : X_INV
    port map (
      I => N_PZ_246,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_6_IN6
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_6_IN7 : X_INV
    port map (
      I => N_PZ_317,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_6_IN7
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_6_IN8 : X_INV
    port map (
      I => N_PZ_302,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_6_IN8
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_7_IN1 : X_INV
    port map (
      I => data_trs_11_II_UIM,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_7_IN1
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_7_IN5 : X_INV
    port map (
      I => upper_enc_s_func_prs_state_ffd1,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_7_IN5
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_7_IN7 : X_INV
    port map (
      I => upper_enc_nds6,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_7_IN7
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_7_IN10 : X_INV
    port map (
      I => N_PZ_302,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_7_IN10
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_8_IN0 : X_INV
    port map (
      I => data_trs_11_II_UIM,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_8_IN0
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_8_IN5 : X_INV
    port map (
      I => upper_enc_s_func_prs_state_ffd1,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_8_IN5
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_8_IN7 : X_INV
    port map (
      I => upper_enc_nds6,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_8_IN7
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_8_IN10 : X_INV
    port map (
      I => N_PZ_302,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_8_IN10
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_9_IN0 : X_INV
    port map (
      I => data_trs_11_II_UIM,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_9_IN0
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_9_IN5 : X_INV
    port map (
      I => upper_enc_s_func_prs_state_ffd1,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_9_IN5
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_9_IN7 : X_INV
    port map (
      I => upper_enc_nds6,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_9_IN7
    );
  NlwInverterBlock_upper_enc_s_term_MC_D2_PT_9_IN10 : X_INV
    port map (
      I => N_PZ_302,
      O => NlwInverterSignal_upper_enc_s_term_MC_D2_PT_9_IN10
    );
  NlwInverterBlock_serial_data_11_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_serial_data_11_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_serial_data_11_MC_D2_PT_1_IN3 : X_INV
    port map (
      I => N_PZ_302,
      O => NlwInverterSignal_serial_data_11_MC_D2_PT_1_IN3
    );
  NlwInverterBlock_serial_data_12_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_serial_data_12_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_serial_data_12_MC_D2_PT_1_IN3 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_serial_data_12_MC_D2_PT_1_IN3
    );
  NlwInverterBlock_serial_data_12_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => data_trs_13_II_UIM,
      O => NlwInverterSignal_serial_data_12_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_serial_data_12_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => data_trs_15_II_UIM,
      O => NlwInverterSignal_serial_data_12_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_serial_data_12_MC_D2_PT_2_IN4 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_serial_data_12_MC_D2_PT_2_IN4
    );
  NlwInverterBlock_serial_data_12_MC_D2_PT_3_IN1 : X_INV
    port map (
      I => upper_enc_prs_state_fft2,
      O => NlwInverterSignal_serial_data_12_MC_D2_PT_3_IN1
    );
  NlwInverterBlock_serial_data_12_MC_D2_PT_3_IN2 : X_INV
    port map (
      I => upper_enc_prs_state_fft1,
      O => NlwInverterSignal_serial_data_12_MC_D2_PT_3_IN2
    );
  NlwInverterBlock_serial_data_12_MC_D2_PT_3_IN4 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_serial_data_12_MC_D2_PT_3_IN4
    );
  NlwInverterBlock_serial_data_13_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_serial_data_13_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_serial_data_13_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => data_trs_14_II_UIM,
      O => NlwInverterSignal_serial_data_13_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_serial_data_13_MC_D2_PT_1_IN4 : X_INV
    port map (
      I => N_PZ_302,
      O => NlwInverterSignal_serial_data_13_MC_D2_PT_1_IN4
    );
  NlwInverterBlock_serial_data_13_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => data_trs_15_II_UIM,
      O => NlwInverterSignal_serial_data_13_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_serial_data_13_MC_D2_PT_2_IN4 : X_INV
    port map (
      I => N_PZ_302,
      O => NlwInverterSignal_serial_data_13_MC_D2_PT_2_IN4
    );
  NlwInverterBlock_serial_data_13_MC_D2_PT_3_IN3 : X_INV
    port map (
      I => k_char_II_UIM,
      O => NlwInverterSignal_serial_data_13_MC_D2_PT_3_IN3
    );
  NlwInverterBlock_serial_data_13_MC_D2_PT_3_IN4 : X_INV
    port map (
      I => N_PZ_302,
      O => NlwInverterSignal_serial_data_13_MC_D2_PT_3_IN4
    );
  NlwInverterBlock_serial_data_13_MC_D2_PT_3_IN5 : X_INV
    port map (
      I => upper_enc_s_term,
      O => NlwInverterSignal_serial_data_13_MC_D2_PT_3_IN5
    );
  NlwInverterBlock_serial_data_14_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft1,
      O => NlwInverterSignal_serial_data_14_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_serial_data_14_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_serial_data_14_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_serial_data_14_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => serial_data_14_MC_UIM,
      O => NlwInverterSignal_serial_data_14_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_serial_data_14_MC_D2_PT_3_IN1 : X_INV
    port map (
      I => data_trs_12_II_UIM,
      O => NlwInverterSignal_serial_data_14_MC_D2_PT_3_IN1
    );
  NlwInverterBlock_serial_data_14_MC_D2_PT_3_IN3 : X_INV
    port map (
      I => N_PZ_246,
      O => NlwInverterSignal_serial_data_14_MC_D2_PT_3_IN3
    );
  NlwInverterBlock_serial_data_14_MC_D2_PT_4_IN1 : X_INV
    port map (
      I => data_trs_9_II_UIM,
      O => NlwInverterSignal_serial_data_14_MC_D2_PT_4_IN1
    );
  NlwInverterBlock_serial_data_14_MC_D2_PT_4_IN3 : X_INV
    port map (
      I => N_PZ_246,
      O => NlwInverterSignal_serial_data_14_MC_D2_PT_4_IN3
    );
  NlwInverterBlock_serial_data_14_MC_D2_PT_5_IN2 : X_INV
    port map (
      I => N_PZ_246,
      O => NlwInverterSignal_serial_data_14_MC_D2_PT_5_IN2
    );
  NlwInverterBlock_serial_data_14_MC_D2_PT_5_IN3 : X_INV
    port map (
      I => N_PZ_317,
      O => NlwInverterSignal_serial_data_14_MC_D2_PT_5_IN3
    );
  NlwInverterBlock_serial_data_14_MC_D2_PT_6_IN0 : X_INV
    port map (
      I => data_trs_11_II_UIM,
      O => NlwInverterSignal_serial_data_14_MC_D2_PT_6_IN0
    );
  NlwInverterBlock_serial_data_14_MC_D2_PT_6_IN1 : X_INV
    port map (
      I => data_trs_12_II_UIM,
      O => NlwInverterSignal_serial_data_14_MC_D2_PT_6_IN1
    );
  NlwInverterBlock_serial_data_14_MC_D2_PT_7_IN0 : X_INV
    port map (
      I => data_trs_11_II_UIM,
      O => NlwInverterSignal_serial_data_14_MC_D2_PT_7_IN0
    );
  NlwInverterBlock_serial_data_14_MC_D2_PT_8_IN0 : X_INV
    port map (
      I => data_trs_10_II_UIM,
      O => NlwInverterSignal_serial_data_14_MC_D2_PT_8_IN0
    );
  NlwInverterBlock_serial_data_14_MC_D2_PT_8_IN2 : X_INV
    port map (
      I => data_trs_8_II_UIM,
      O => NlwInverterSignal_serial_data_14_MC_D2_PT_8_IN2
    );
  NlwInverterBlock_serial_data_14_MC_D2_PT_8_IN3 : X_INV
    port map (
      I => data_trs_9_II_UIM,
      O => NlwInverterSignal_serial_data_14_MC_D2_PT_8_IN3
    );
  NlwInverterBlock_serial_data_14_MC_D2_PT_9_IN4 : X_INV
    port map (
      I => k_char_II_UIM,
      O => NlwInverterSignal_serial_data_14_MC_D2_PT_9_IN4
    );
  NlwInverterBlock_serial_data_14_MC_D2_PT_10_IN0 : X_INV
    port map (
      I => data_trs_11_II_UIM,
      O => NlwInverterSignal_serial_data_14_MC_D2_PT_10_IN0
    );
  NlwInverterBlock_serial_data_14_MC_D2_PT_10_IN3 : X_INV
    port map (
      I => N_PZ_246,
      O => NlwInverterSignal_serial_data_14_MC_D2_PT_10_IN3
    );
  NlwInverterBlock_serial_data_14_MC_D2_PT_10_IN4 : X_INV
    port map (
      I => k_char_II_UIM,
      O => NlwInverterSignal_serial_data_14_MC_D2_PT_10_IN4
    );
  NlwInverterBlock_serial_data_14_MC_XOR_IN0 : X_INV
    port map (
      I => serial_data_14_MC_D1,
      O => NlwInverterSignal_serial_data_14_MC_XOR_IN0
    );
  NlwInverterBlock_serial_data_15_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_serial_data_15_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_serial_data_15_MC_D2_PT_1_IN2 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_serial_data_15_MC_D2_PT_1_IN2
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_e_prel,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_3_IN0 : X_INV
    port map (
      I => data_trs_12_II_UIM,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_3_IN0
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_3_IN2 : X_INV
    port map (
      I => N_PZ_246,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_3_IN2
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_4_IN2 : X_INV
    port map (
      I => data_trs_12_II_UIM,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_4_IN2
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_5_IN1 : X_INV
    port map (
      I => data_trs_12_II_UIM,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_5_IN1
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_6_IN1 : X_INV
    port map (
      I => data_trs_12_II_UIM,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_6_IN1
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_7_IN0 : X_INV
    port map (
      I => data_trs_10_II_UIM,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_7_IN0
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_7_IN3 : X_INV
    port map (
      I => data_trs_8_II_UIM,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_7_IN3
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_7_IN4 : X_INV
    port map (
      I => data_trs_9_II_UIM,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_7_IN4
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_8_IN0 : X_INV
    port map (
      I => data_trs_10_II_UIM,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_8_IN0
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_8_IN1 : X_INV
    port map (
      I => data_trs_11_II_UIM,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_8_IN1
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_8_IN2 : X_INV
    port map (
      I => data_trs_12_II_UIM,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_8_IN2
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_8_IN3 : X_INV
    port map (
      I => data_trs_8_II_UIM,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_8_IN3
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_8_IN4 : X_INV
    port map (
      I => data_trs_9_II_UIM,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_D2_PT_8_IN4
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_e_prel_MC_XOR_IN0 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_e_prel_MC_D1,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_e_prel_MC_XOR_IN0
    );
  NlwInverterBlock_serial_data_16_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_serial_data_16_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_serial_data_16_MC_D2_PT_1_IN2 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_serial_data_16_MC_D2_PT_1_IN2
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_d_prel_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_d_prel_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_d_prel_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => data_trs_9_II_UIM,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_d_prel_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_d_prel_MC_D2_PT_1_IN3 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft1,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_d_prel_MC_D2_PT_1_IN3
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_d_prel_MC_D2_PT_1_IN4 : X_INV
    port map (
      I => N_PZ_302,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_d_prel_MC_D2_PT_1_IN4
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_d_prel_MC_D2_PT_2_IN2 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft1,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_d_prel_MC_D2_PT_2_IN2
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_d_prel_MC_D2_PT_2_IN3 : X_INV
    port map (
      I => N_PZ_317,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_d_prel_MC_D2_PT_2_IN3
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_d_prel_MC_D2_PT_2_IN4 : X_INV
    port map (
      I => N_PZ_302,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_d_prel_MC_D2_PT_2_IN4
    );
  NlwInverterBlock_serial_data_17_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_serial_data_17_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_serial_data_17_MC_D2_PT_1_IN2 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_serial_data_17_MC_D2_PT_1_IN2
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_1_IN3 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_1_IN3
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_1_IN4 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft1,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_1_IN4
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => upper_enc_prs_state_fft2,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_2_IN2 : X_INV
    port map (
      I => upper_enc_prs_state_fft1,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_2_IN2
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_2_IN4 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_2_IN4
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_2_IN5 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft1,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_2_IN5
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_3_IN0 : X_INV
    port map (
      I => data_trs_11_II_UIM,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_3_IN0
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_3_IN1 : X_INV
    port map (
      I => data_trs_8_II_UIM,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_3_IN1
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_3_IN2 : X_INV
    port map (
      I => data_trs_9_II_UIM,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_3_IN2
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_3_IN5 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_3_IN5
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_3_IN6 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft1,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_3_IN6
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_4_IN1 : X_INV
    port map (
      I => data_trs_8_II_UIM,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_4_IN1
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_4_IN2 : X_INV
    port map (
      I => data_trs_9_II_UIM,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_4_IN2
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_4_IN5 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_4_IN5
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_4_IN6 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft1,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_c_prel_MC_D2_PT_4_IN6
    );
  NlwInverterBlock_serial_data_18_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_serial_data_18_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_serial_data_18_MC_D2_PT_1_IN2 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_serial_data_18_MC_D2_PT_1_IN2
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => data_trs_11_II_UIM,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_1_IN4 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_1_IN4
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_1_IN5 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft1,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_1_IN5
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_2_IN3 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_2_IN3
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_2_IN4 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft1,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_2_IN4
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_2_IN5 : X_INV
    port map (
      I => N_PZ_317,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_2_IN5
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_3_IN1 : X_INV
    port map (
      I => upper_enc_prs_state_fft2,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_3_IN1
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_3_IN2 : X_INV
    port map (
      I => upper_enc_prs_state_fft1,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_3_IN2
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_3_IN4 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_3_IN4
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_3_IN5 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft1,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_3_IN5
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_4_IN0 : X_INV
    port map (
      I => data_trs_10_II_UIM,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_4_IN0
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_4_IN1 : X_INV
    port map (
      I => data_trs_11_II_UIM,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_4_IN1
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_4_IN2 : X_INV
    port map (
      I => data_trs_8_II_UIM,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_4_IN2
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_4_IN5 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_4_IN5
    );
  NlwInverterBlock_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_4_IN6 : X_INV
    port map (
      I => upper_enc_enc_8b_10b_prs_state_fft1,
      O => NlwInverterSignal_upper_enc_enc_8b_10b_b_prel_MC_D2_PT_4_IN6
    );
  NlwInverterBlock_serial_data_19_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_serial_data_19_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_serial_data_19_MC_D2_PT_1_IN3 : X_INV
    port map (
      I => N_PZ_302,
      O => NlwInverterSignal_serial_data_19_MC_D2_PT_1_IN3
    );
  NlwInverterBlock_serial_data_1_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_serial_data_1_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_serial_data_1_MC_D2_PT_1_IN3 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_serial_data_1_MC_D2_PT_1_IN3
    );
  NlwInverterBlock_serial_data_1_MC_D2_PT_1_IN5 : X_INV
    port map (
      I => N_PZ_226,
      O => NlwInverterSignal_serial_data_1_MC_D2_PT_1_IN5
    );
  NlwInverterBlock_serial_data_2_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_serial_data_2_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_serial_data_2_MC_D2_PT_1_IN3 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_serial_data_2_MC_D2_PT_1_IN3
    );
  NlwInverterBlock_serial_data_2_MC_D2_PT_2_IN2 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_serial_data_2_MC_D2_PT_2_IN2
    );
  NlwInverterBlock_serial_data_2_MC_D2_PT_3_IN0 : X_INV
    port map (
      I => data_trs_5_II_UIM,
      O => NlwInverterSignal_serial_data_2_MC_D2_PT_3_IN0
    );
  NlwInverterBlock_serial_data_2_MC_D2_PT_3_IN1 : X_INV
    port map (
      I => data_trs_7_II_UIM,
      O => NlwInverterSignal_serial_data_2_MC_D2_PT_3_IN1
    );
  NlwInverterBlock_serial_data_2_MC_D2_PT_3_IN4 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_serial_data_2_MC_D2_PT_3_IN4
    );
  NlwInverterBlock_serial_data_3_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_serial_data_3_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_serial_data_3_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => data_trs_6_II_UIM,
      O => NlwInverterSignal_serial_data_3_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_serial_data_3_MC_D2_PT_1_IN4 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_serial_data_3_MC_D2_PT_1_IN4
    );
  NlwInverterBlock_serial_data_3_MC_D2_PT_1_IN6 : X_INV
    port map (
      I => N_PZ_226,
      O => NlwInverterSignal_serial_data_3_MC_D2_PT_1_IN6
    );
  NlwInverterBlock_serial_data_3_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => data_trs_7_II_UIM,
      O => NlwInverterSignal_serial_data_3_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_serial_data_3_MC_D2_PT_2_IN4 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_serial_data_3_MC_D2_PT_2_IN4
    );
  NlwInverterBlock_serial_data_3_MC_D2_PT_2_IN6 : X_INV
    port map (
      I => N_PZ_226,
      O => NlwInverterSignal_serial_data_3_MC_D2_PT_2_IN6
    );
  NlwInverterBlock_serial_data_3_MC_D2_PT_3_IN3 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_serial_data_3_MC_D2_PT_3_IN3
    );
  NlwInverterBlock_serial_data_3_MC_D2_PT_3_IN5 : X_INV
    port map (
      I => N_PZ_226,
      O => NlwInverterSignal_serial_data_3_MC_D2_PT_3_IN5
    );
  NlwInverterBlock_serial_data_3_MC_D2_PT_3_IN6 : X_INV
    port map (
      I => k_char_II_UIM,
      O => NlwInverterSignal_serial_data_3_MC_D2_PT_3_IN6
    );
  NlwInverterBlock_serial_data_3_MC_D2_PT_3_IN7 : X_INV
    port map (
      I => lower_enc_s_term,
      O => NlwInverterSignal_serial_data_3_MC_D2_PT_3_IN7
    );
  NlwInverterBlock_serial_data_4_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => N_PZ_377,
      O => NlwInverterSignal_serial_data_4_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_serial_data_4_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => N_PZ_377,
      O => NlwInverterSignal_serial_data_4_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_serial_data_4_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft1,
      O => NlwInverterSignal_serial_data_4_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_serial_data_4_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_serial_data_4_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_serial_data_4_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => serial_data_4_MC_UIM,
      O => NlwInverterSignal_serial_data_4_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_serial_data_4_MC_D2_PT_3_IN0 : X_INV
    port map (
      I => data_trs_0_II_UIM,
      O => NlwInverterSignal_serial_data_4_MC_D2_PT_3_IN0
    );
  NlwInverterBlock_serial_data_4_MC_D2_PT_4_IN0 : X_INV
    port map (
      I => data_trs_1_II_UIM,
      O => NlwInverterSignal_serial_data_4_MC_D2_PT_4_IN0
    );
  NlwInverterBlock_serial_data_4_MC_D2_PT_5_IN0 : X_INV
    port map (
      I => data_trs_2_II_UIM,
      O => NlwInverterSignal_serial_data_4_MC_D2_PT_5_IN0
    );
  NlwInverterBlock_serial_data_4_MC_D2_PT_6_IN1 : X_INV
    port map (
      I => data_trs_4_II_UIM,
      O => NlwInverterSignal_serial_data_4_MC_D2_PT_6_IN1
    );
  NlwInverterBlock_serial_data_4_MC_D2_PT_7_IN0 : X_INV
    port map (
      I => data_trs_3_II_UIM,
      O => NlwInverterSignal_serial_data_4_MC_D2_PT_7_IN0
    );
  NlwInverterBlock_serial_data_4_MC_D2_PT_7_IN1 : X_INV
    port map (
      I => data_trs_4_II_UIM,
      O => NlwInverterSignal_serial_data_4_MC_D2_PT_7_IN1
    );
  NlwInverterBlock_serial_data_4_MC_D2_PT_7_IN3 : X_INV
    port map (
      I => N_PZ_342,
      O => NlwInverterSignal_serial_data_4_MC_D2_PT_7_IN3
    );
  NlwInverterBlock_serial_data_4_MC_D2_PT_8_IN3 : X_INV
    port map (
      I => data_trs_3_II_UIM,
      O => NlwInverterSignal_serial_data_4_MC_D2_PT_8_IN3
    );
  NlwInverterBlock_serial_data_4_MC_D2_PT_9_IN0 : X_INV
    port map (
      I => data_trs_0_II_UIM,
      O => NlwInverterSignal_serial_data_4_MC_D2_PT_9_IN0
    );
  NlwInverterBlock_serial_data_4_MC_D2_PT_9_IN1 : X_INV
    port map (
      I => data_trs_1_II_UIM,
      O => NlwInverterSignal_serial_data_4_MC_D2_PT_9_IN1
    );
  NlwInverterBlock_serial_data_4_MC_D2_PT_9_IN2 : X_INV
    port map (
      I => data_trs_2_II_UIM,
      O => NlwInverterSignal_serial_data_4_MC_D2_PT_9_IN2
    );
  NlwInverterBlock_serial_data_4_MC_D2_PT_10_IN3 : X_INV
    port map (
      I => k_char_II_UIM,
      O => NlwInverterSignal_serial_data_4_MC_D2_PT_10_IN3
    );
  NlwInverterBlock_serial_data_4_MC_D2_PT_10_IN4 : X_INV
    port map (
      I => N_PZ_342,
      O => NlwInverterSignal_serial_data_4_MC_D2_PT_10_IN4
    );
  NlwInverterBlock_serial_data_4_MC_D2_PT_11_IN0 : X_INV
    port map (
      I => data_trs_3_II_UIM,
      O => NlwInverterSignal_serial_data_4_MC_D2_PT_11_IN0
    );
  NlwInverterBlock_serial_data_4_MC_D2_PT_11_IN3 : X_INV
    port map (
      I => k_char_II_UIM,
      O => NlwInverterSignal_serial_data_4_MC_D2_PT_11_IN3
    );
  NlwInverterBlock_serial_data_4_MC_XOR_IN0 : X_INV
    port map (
      I => serial_data_4_MC_D1,
      O => NlwInverterSignal_serial_data_4_MC_XOR_IN0
    );
  NlwInverterBlock_serial_data_5_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_serial_data_5_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_serial_data_5_MC_D2_PT_1_IN2 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_serial_data_5_MC_D2_PT_1_IN2
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => N_PZ_377,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => N_PZ_377,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_e_prel,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_3_IN0 : X_INV
    port map (
      I => data_trs_4_II_UIM,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_3_IN0
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_4_IN2 : X_INV
    port map (
      I => data_trs_4_II_UIM,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_4_IN2
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_5_IN2 : X_INV
    port map (
      I => data_trs_4_II_UIM,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_5_IN2
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_6_IN2 : X_INV
    port map (
      I => data_trs_4_II_UIM,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_6_IN2
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_7_IN0 : X_INV
    port map (
      I => data_trs_0_II_UIM,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_7_IN0
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_7_IN1 : X_INV
    port map (
      I => data_trs_1_II_UIM,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_7_IN1
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_7_IN2 : X_INV
    port map (
      I => data_trs_2_II_UIM,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_7_IN2
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_8_IN0 : X_INV
    port map (
      I => data_trs_0_II_UIM,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_8_IN0
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_8_IN1 : X_INV
    port map (
      I => data_trs_1_II_UIM,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_8_IN1
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_8_IN2 : X_INV
    port map (
      I => data_trs_2_II_UIM,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_8_IN2
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_8_IN3 : X_INV
    port map (
      I => data_trs_3_II_UIM,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_8_IN3
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_8_IN4 : X_INV
    port map (
      I => data_trs_4_II_UIM,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_D2_PT_8_IN4
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_e_prel_MC_XOR_IN0 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_e_prel_MC_D1,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_e_prel_MC_XOR_IN0
    );
  NlwInverterBlock_serial_data_6_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_serial_data_6_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_serial_data_6_MC_D2_PT_1_IN2 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_serial_data_6_MC_D2_PT_1_IN2
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => data_trs_0_II_UIM,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_1_IN4 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_1_IN4
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_1_IN5 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft1,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_1_IN5
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_1_IN6 : X_INV
    port map (
      I => N_PZ_226,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_1_IN6
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => data_trs_1_II_UIM,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_2_IN4 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_2_IN4
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_2_IN5 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft1,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_2_IN5
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_2_IN6 : X_INV
    port map (
      I => N_PZ_226,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_2_IN6
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_3_IN0 : X_INV
    port map (
      I => data_trs_2_II_UIM,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_3_IN0
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_3_IN4 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_3_IN4
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_3_IN5 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft1,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_3_IN5
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_3_IN6 : X_INV
    port map (
      I => N_PZ_226,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_d_prel_MC_D2_PT_3_IN6
    );
  NlwInverterBlock_serial_data_7_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_serial_data_7_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_serial_data_7_MC_D2_PT_1_IN2 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_serial_data_7_MC_D2_PT_1_IN2
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_1_IN3 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_1_IN3
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_1_IN4 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft1,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_1_IN4
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_2_IN2 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_2_IN2
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_2_IN3 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft1,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_2_IN3
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_3_IN0 : X_INV
    port map (
      I => data_trs_0_II_UIM,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_3_IN0
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_3_IN1 : X_INV
    port map (
      I => data_trs_1_II_UIM,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_3_IN1
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_3_IN2 : X_INV
    port map (
      I => data_trs_3_II_UIM,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_3_IN2
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_3_IN5 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_3_IN5
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_3_IN6 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft1,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_3_IN6
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_4_IN0 : X_INV
    port map (
      I => data_trs_0_II_UIM,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_4_IN0
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_4_IN1 : X_INV
    port map (
      I => data_trs_1_II_UIM,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_4_IN1
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_4_IN5 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_4_IN5
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_4_IN6 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft1,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_c_prel_MC_D2_PT_4_IN6
    );
  NlwInverterBlock_serial_data_8_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_serial_data_8_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_serial_data_8_MC_D2_PT_1_IN2 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_serial_data_8_MC_D2_PT_1_IN2
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_1_IN2 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_1_IN2
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_1_IN3 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft1,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_1_IN3
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => data_trs_0_II_UIM,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_2_IN4 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_2_IN4
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_2_IN5 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft1,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_2_IN5
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_3_IN1 : X_INV
    port map (
      I => data_trs_2_II_UIM,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_3_IN1
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_3_IN4 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_3_IN4
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_3_IN5 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft1,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_3_IN5
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_4_IN1 : X_INV
    port map (
      I => data_trs_3_II_UIM,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_4_IN1
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_4_IN4 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_4_IN4
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_4_IN5 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft1,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_4_IN5
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_5_IN0 : X_INV
    port map (
      I => data_trs_0_II_UIM,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_5_IN0
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_5_IN1 : X_INV
    port map (
      I => data_trs_2_II_UIM,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_5_IN1
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_5_IN2 : X_INV
    port map (
      I => data_trs_3_II_UIM,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_5_IN2
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_5_IN5 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_5_IN5
    );
  NlwInverterBlock_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_5_IN6 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft1,
      O => NlwInverterSignal_lower_enc_enc_8b_10b_b_prel_MC_D2_PT_5_IN6
    );
  NlwInverterBlock_serial_data_9_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_serial_data_9_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_serial_data_9_MC_D2_PT_1_IN3 : X_INV
    port map (
      I => lower_enc_enc_8b_10b_prs_state_fft3,
      O => NlwInverterSignal_serial_data_9_MC_D2_PT_1_IN3
    );
  NlwInverterBlock_serial_data_9_MC_D2_PT_1_IN5 : X_INV
    port map (
      I => N_PZ_226,
      O => NlwInverterSignal_serial_data_9_MC_D2_PT_1_IN5
    );
  NlwBlockROC : ROC generic map ( WIDTH => 100 ns)
     port map (O => PRLD);
end Structure;

