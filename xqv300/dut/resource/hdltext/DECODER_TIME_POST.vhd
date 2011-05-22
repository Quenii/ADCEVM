-- Xilinx Vhdl produced by program ngd2vhdl F.23
-- Command: -rpw 100 -ar Structure -te DECODER_TIME_POST -xon false -w -log __projnav/ngd2vhdl.log dec_16b20b.nga DECODER_TIME_POST.vhd 
-- Input file: dec_16b20b.nga
-- Output file: DECODER_TIME_POST.vhd
-- Design name: dec_16b20b
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
entity DECODER_TIME_POST is
  port (
    clk : in STD_LOGIC := 'X'; 
    frame_in_dec : in STD_LOGIC := 'X'; 
    rst : in STD_LOGIC := 'X'; 
    frame_out_dec : out STD_LOGIC; 
    ill_char_det : out STD_LOGIC; 
    serial_data : in STD_LOGIC_VECTOR ( 19 downto 0 ); 
    decoded_data : out STD_LOGIC_VECTOR ( 15 downto 0 ) 
  );
end DECODER_TIME_POST;

architecture Structure of DECODER_TIME_POST is
  component ROC
    generic (InstancePath: STRING := "*";
             WIDTH : Time := 100 ns);
    port (O : out STD_ULOGIC := '1');
  end component;
  signal decoded_data_0_MC_Q : STD_LOGIC; 
  signal decoded_data_0_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal decoded_data_0_MC_D : STD_LOGIC; 
  signal lower_dec_prs_state_fft2 : STD_LOGIC; 
  signal lower_dec_prs_state_fft1 : STD_LOGIC; 
  signal lower_dec_hout : STD_LOGIC; 
  signal decoded_data_0_MC_D1_PT_0 : STD_LOGIC; 
  signal decoded_data_0_MC_D1 : STD_LOGIC; 
  signal decoded_data_0_MC_D2 : STD_LOGIC; 
  signal decoded_data_0_MC_UIM : STD_LOGIC; 
  signal lower_dec_prs_state_fft2_MC_Q : STD_LOGIC; 
  signal FOOBAR1_ctinst_0 : STD_LOGIC; 
  signal lower_dec_prs_state_fft2_MC_R_OR_PRLD : STD_LOGIC; 
  signal lower_dec_prs_state_fft2_MC_D : STD_LOGIC; 
  signal clk_II_FCLK : STD_LOGIC; 
  signal rst_II_UIM : STD_LOGIC; 
  signal lower_dec_prs_state_fft2_MC_D1 : STD_LOGIC; 
  signal frame_in_dec_II_UIM : STD_LOGIC; 
  signal lower_dec_prs_state_fft2_MC_D2_PT_0 : STD_LOGIC; 
  signal lower_dec_dec_8b10b_prs_state_ffd1 : STD_LOGIC; 
  signal lower_dec_dec_8b10b_prs_state_ffd2 : STD_LOGIC; 
  signal lower_dec_err_chk_prs_state_ffd1 : STD_LOGIC; 
  signal lower_dec_err_chk_prs_state_ffd2 : STD_LOGIC; 
  signal lower_dec_prs_state_fft2_MC_D2_PT_1 : STD_LOGIC; 
  signal lower_dec_prs_state_fft2_MC_D2 : STD_LOGIC; 
  signal lower_dec_prs_state_fft2_MC_D_TFF : STD_LOGIC; 
  signal lower_dec_prs_state_fft1_MC_Q : STD_LOGIC; 
  signal lower_dec_prs_state_fft1_MC_R_OR_PRLD : STD_LOGIC; 
  signal lower_dec_prs_state_fft1_MC_D : STD_LOGIC; 
  signal lower_dec_prs_state_fft1_MC_D1 : STD_LOGIC; 
  signal lower_dec_prs_state_fft1_MC_D2_PT_0 : STD_LOGIC; 
  signal lower_dec_prs_state_fft1_MC_D2_PT_1 : STD_LOGIC; 
  signal lower_dec_prs_state_fft1_MC_D2 : STD_LOGIC; 
  signal lower_dec_prs_state_fft1_MC_D_TFF : STD_LOGIC; 
  signal lower_dec_dec_8b10b_prs_state_ffd1_MC_Q : STD_LOGIC; 
  signal lower_dec_dec_8b10b_prs_state_ffd1_MC_R_OR_PRLD : STD_LOGIC; 
  signal lower_dec_dec_8b10b_prs_state_ffd1_MC_D : STD_LOGIC; 
  signal lower_dec_dec_8b10b_prs_state_ffd1_MC_D1 : STD_LOGIC; 
  signal lower_dec_dec_8b10b_prs_state_ffd1_MC_D2_PT_0 : STD_LOGIC; 
  signal lower_dec_dec_8b10b_prs_state_ffd1_MC_D2_PT_1 : STD_LOGIC; 
  signal lower_dec_dec_8b10b_prs_state_ffd1_MC_D2 : STD_LOGIC; 
  signal lower_dec_dec_8b10b_prs_state_ffd2_MC_Q : STD_LOGIC; 
  signal lower_dec_dec_8b10b_prs_state_ffd2_MC_R_OR_PRLD : STD_LOGIC; 
  signal lower_dec_dec_8b10b_prs_state_ffd2_MC_D : STD_LOGIC; 
  signal lower_dec_dec_8b10b_prs_state_ffd2_MC_D1 : STD_LOGIC; 
  signal lower_dec_dec_8b10b_prs_state_ffd2_MC_D2_PT_0 : STD_LOGIC; 
  signal lower_dec_dec_8b10b_prs_state_ffd2_MC_D2_PT_1 : STD_LOGIC; 
  signal lower_dec_dec_8b10b_prs_state_ffd2_MC_D2 : STD_LOGIC; 
  signal lower_dec_err_chk_prs_state_ffd1_MC_Q : STD_LOGIC; 
  signal lower_dec_err_chk_prs_state_ffd1_MC_R_OR_PRLD : STD_LOGIC; 
  signal lower_dec_err_chk_prs_state_ffd1_MC_D : STD_LOGIC; 
  signal lower_dec_err_chk_prs_state_ffd1_MC_D1 : STD_LOGIC; 
  signal lower_dec_err_chk_prs_state_ffd1_MC_D2_PT_0 : STD_LOGIC; 
  signal lower_dec_err_chk_prs_state_ffd1_MC_D2_PT_1 : STD_LOGIC; 
  signal lower_dec_err_chk_prs_state_ffd1_MC_D2 : STD_LOGIC; 
  signal lower_dec_err_chk_prs_state_ffd2_MC_Q : STD_LOGIC; 
  signal lower_dec_err_chk_prs_state_ffd2_MC_R_OR_PRLD : STD_LOGIC; 
  signal lower_dec_err_chk_prs_state_ffd2_MC_D : STD_LOGIC; 
  signal lower_dec_err_chk_prs_state_ffd2_MC_D1 : STD_LOGIC; 
  signal lower_dec_err_chk_prs_state_ffd2_MC_D2_PT_0 : STD_LOGIC; 
  signal lower_dec_err_chk_prs_state_ffd2_MC_D2_PT_1 : STD_LOGIC; 
  signal lower_dec_err_chk_prs_state_ffd2_MC_D2 : STD_LOGIC; 
  signal lower_dec_hout_MC_Q : STD_LOGIC; 
  signal lower_dec_hout_MC_D : STD_LOGIC; 
  signal lower_dec_hout_MC_D1 : STD_LOGIC; 
  signal lower_dec_hout_MC_D2_PT_0 : STD_LOGIC; 
  signal serial_data_1_II_UIM : STD_LOGIC; 
  signal serial_data_0_II_UIM : STD_LOGIC; 
  signal N_PZ_188 : STD_LOGIC; 
  signal lower_dec_hout_MC_D2_PT_1 : STD_LOGIC; 
  signal lower_dec_hout_MC_D2_PT_2 : STD_LOGIC; 
  signal serial_data_3_II_UIM : STD_LOGIC; 
  signal serial_data_2_II_UIM : STD_LOGIC; 
  signal lower_dec_hout_MC_D2_PT_3 : STD_LOGIC; 
  signal lower_dec_hout_MC_D2_PT_4 : STD_LOGIC; 
  signal lower_dec_hout_MC_D2_PT_5 : STD_LOGIC; 
  signal lower_dec_hout_MC_D2_PT_6 : STD_LOGIC; 
  signal lower_dec_hout_MC_D2_PT_7 : STD_LOGIC; 
  signal lower_dec_hout_MC_D2_PT_8 : STD_LOGIC; 
  signal lower_dec_hout_MC_D2 : STD_LOGIC; 
  signal N_PZ_188_MC_Q : STD_LOGIC; 
  signal N_PZ_188_MC_D : STD_LOGIC; 
  signal serial_data_5_II_UIM : STD_LOGIC; 
  signal serial_data_4_II_UIM : STD_LOGIC; 
  signal N_PZ_309 : STD_LOGIC; 
  signal N_PZ_188_MC_D1_PT_0 : STD_LOGIC; 
  signal N_PZ_188_MC_D1 : STD_LOGIC; 
  signal N_PZ_188_MC_D2 : STD_LOGIC; 
  signal N_PZ_309_MC_Q : STD_LOGIC; 
  signal N_PZ_309_MC_D : STD_LOGIC; 
  signal serial_data_7_II_UIM : STD_LOGIC; 
  signal serial_data_6_II_UIM : STD_LOGIC; 
  signal N_PZ_309_MC_D1_PT_0 : STD_LOGIC; 
  signal N_PZ_309_MC_D1 : STD_LOGIC; 
  signal N_PZ_309_MC_D2 : STD_LOGIC; 
  signal decoded_data_10_MC_Q : STD_LOGIC; 
  signal decoded_data_10_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal decoded_data_10_MC_D : STD_LOGIC; 
  signal upper_dec_prs_state_fft2 : STD_LOGIC; 
  signal upper_dec_prs_state_fft1 : STD_LOGIC; 
  signal upper_dec_fout : STD_LOGIC; 
  signal decoded_data_10_MC_D1_PT_0 : STD_LOGIC; 
  signal decoded_data_10_MC_D1 : STD_LOGIC; 
  signal decoded_data_10_MC_D2 : STD_LOGIC; 
  signal decoded_data_10_MC_UIM : STD_LOGIC; 
  signal upper_dec_prs_state_fft2_MC_Q : STD_LOGIC; 
  signal upper_dec_prs_state_fft2_MC_R_OR_PRLD : STD_LOGIC; 
  signal upper_dec_prs_state_fft2_MC_D : STD_LOGIC; 
  signal upper_dec_prs_state_fft2_MC_D1 : STD_LOGIC; 
  signal upper_dec_prs_state_fft2_MC_D2_PT_0 : STD_LOGIC; 
  signal upper_dec_dec_8b10b_prs_state_ffd1 : STD_LOGIC; 
  signal upper_dec_dec_8b10b_prs_state_ffd2 : STD_LOGIC; 
  signal upper_dec_err_chk_prs_state_ffd1 : STD_LOGIC; 
  signal upper_dec_err_chk_prs_state_ffd2 : STD_LOGIC; 
  signal upper_dec_prs_state_fft2_MC_D2_PT_1 : STD_LOGIC; 
  signal upper_dec_prs_state_fft2_MC_D2 : STD_LOGIC; 
  signal upper_dec_prs_state_fft2_MC_D_TFF : STD_LOGIC; 
  signal upper_dec_prs_state_fft1_MC_Q : STD_LOGIC; 
  signal upper_dec_prs_state_fft1_MC_R_OR_PRLD : STD_LOGIC; 
  signal upper_dec_prs_state_fft1_MC_D : STD_LOGIC; 
  signal upper_dec_prs_state_fft1_MC_D1 : STD_LOGIC; 
  signal upper_dec_prs_state_fft1_MC_D2_PT_0 : STD_LOGIC; 
  signal upper_dec_prs_state_fft1_MC_D2_PT_1 : STD_LOGIC; 
  signal upper_dec_prs_state_fft1_MC_D2 : STD_LOGIC; 
  signal upper_dec_prs_state_fft1_MC_D_TFF : STD_LOGIC; 
  signal upper_dec_dec_8b10b_prs_state_ffd1_MC_Q : STD_LOGIC; 
  signal upper_dec_dec_8b10b_prs_state_ffd1_MC_R_OR_PRLD : STD_LOGIC; 
  signal upper_dec_dec_8b10b_prs_state_ffd1_MC_D : STD_LOGIC; 
  signal upper_dec_dec_8b10b_prs_state_ffd1_MC_D1 : STD_LOGIC; 
  signal upper_dec_dec_8b10b_prs_state_ffd1_MC_D2_PT_0 : STD_LOGIC; 
  signal upper_dec_dec_8b10b_prs_state_ffd1_MC_D2_PT_1 : STD_LOGIC; 
  signal upper_dec_dec_8b10b_prs_state_ffd1_MC_D2 : STD_LOGIC; 
  signal upper_dec_dec_8b10b_prs_state_ffd2_MC_Q : STD_LOGIC; 
  signal upper_dec_dec_8b10b_prs_state_ffd2_MC_R_OR_PRLD : STD_LOGIC; 
  signal upper_dec_dec_8b10b_prs_state_ffd2_MC_D : STD_LOGIC; 
  signal upper_dec_dec_8b10b_prs_state_ffd2_MC_D1 : STD_LOGIC; 
  signal upper_dec_dec_8b10b_prs_state_ffd2_MC_D2_PT_0 : STD_LOGIC; 
  signal upper_dec_dec_8b10b_prs_state_ffd2_MC_D2_PT_1 : STD_LOGIC; 
  signal upper_dec_dec_8b10b_prs_state_ffd2_MC_D2 : STD_LOGIC; 
  signal upper_dec_err_chk_prs_state_ffd1_MC_Q : STD_LOGIC; 
  signal upper_dec_err_chk_prs_state_ffd1_MC_R_OR_PRLD : STD_LOGIC; 
  signal upper_dec_err_chk_prs_state_ffd1_MC_D : STD_LOGIC; 
  signal upper_dec_err_chk_prs_state_ffd1_MC_D1 : STD_LOGIC; 
  signal upper_dec_err_chk_prs_state_ffd1_MC_D2_PT_0 : STD_LOGIC; 
  signal upper_dec_err_chk_prs_state_ffd1_MC_D2_PT_1 : STD_LOGIC; 
  signal upper_dec_err_chk_prs_state_ffd1_MC_D2 : STD_LOGIC; 
  signal upper_dec_err_chk_prs_state_ffd2_MC_Q : STD_LOGIC; 
  signal upper_dec_err_chk_prs_state_ffd2_MC_R_OR_PRLD : STD_LOGIC; 
  signal upper_dec_err_chk_prs_state_ffd2_MC_D : STD_LOGIC; 
  signal upper_dec_err_chk_prs_state_ffd2_MC_D1 : STD_LOGIC; 
  signal upper_dec_err_chk_prs_state_ffd2_MC_D2_PT_0 : STD_LOGIC; 
  signal upper_dec_err_chk_prs_state_ffd2_MC_D2_PT_1 : STD_LOGIC; 
  signal upper_dec_err_chk_prs_state_ffd2_MC_D2 : STD_LOGIC; 
  signal upper_dec_fout_MC_Q : STD_LOGIC; 
  signal upper_dec_fout_MC_D : STD_LOGIC; 
  signal upper_dec_fout_MC_D1 : STD_LOGIC; 
  signal upper_dec_fout_MC_D2_PT_0 : STD_LOGIC; 
  signal upper_dec_hin : STD_LOGIC; 
  signal upper_dec_jin : STD_LOGIC; 
  signal upper_dec_fin : STD_LOGIC; 
  signal upper_dec_fout_MC_D2_PT_1 : STD_LOGIC; 
  signal upper_dec_fout_MC_D2_PT_2 : STD_LOGIC; 
  signal N_PZ_189 : STD_LOGIC; 
  signal upper_dec_fout_MC_D2_PT_3 : STD_LOGIC; 
  signal upper_dec_fout_MC_D2_PT_4 : STD_LOGIC; 
  signal upper_dec_gin : STD_LOGIC; 
  signal upper_dec_fout_MC_D2_PT_5 : STD_LOGIC; 
  signal upper_dec_fout_MC_D2_PT_6 : STD_LOGIC; 
  signal upper_dec_fout_MC_D2 : STD_LOGIC; 
  signal upper_dec_hin_MC_Q : STD_LOGIC; 
  signal upper_dec_hin_MC_D : STD_LOGIC; 
  signal serial_data_11_II_UIM : STD_LOGIC; 
  signal upper_dec_hin_MC_D1_PT_0 : STD_LOGIC; 
  signal upper_dec_hin_MC_D1 : STD_LOGIC; 
  signal upper_dec_hin_MC_D2 : STD_LOGIC; 
  signal upper_dec_jin_MC_Q : STD_LOGIC; 
  signal upper_dec_jin_MC_D : STD_LOGIC; 
  signal serial_data_10_II_UIM : STD_LOGIC; 
  signal upper_dec_jin_MC_D1_PT_0 : STD_LOGIC; 
  signal upper_dec_jin_MC_D1 : STD_LOGIC; 
  signal upper_dec_jin_MC_D2 : STD_LOGIC; 
  signal upper_dec_fin_MC_Q : STD_LOGIC; 
  signal upper_dec_fin_MC_D : STD_LOGIC; 
  signal serial_data_13_II_UIM : STD_LOGIC; 
  signal upper_dec_fin_MC_D1_PT_0 : STD_LOGIC; 
  signal upper_dec_fin_MC_D1 : STD_LOGIC; 
  signal upper_dec_fin_MC_D2 : STD_LOGIC; 
  signal N_PZ_189_MC_Q : STD_LOGIC; 
  signal N_PZ_189_MC_D : STD_LOGIC; 
  signal upper_dec_iin : STD_LOGIC; 
  signal upper_dec_ein : STD_LOGIC; 
  signal N_PZ_305 : STD_LOGIC; 
  signal N_PZ_189_MC_D1_PT_0 : STD_LOGIC; 
  signal N_PZ_189_MC_D1 : STD_LOGIC; 
  signal N_PZ_189_MC_D2 : STD_LOGIC; 
  signal upper_dec_iin_MC_Q : STD_LOGIC; 
  signal upper_dec_iin_MC_D : STD_LOGIC; 
  signal serial_data_14_II_UIM : STD_LOGIC; 
  signal upper_dec_iin_MC_D1_PT_0 : STD_LOGIC; 
  signal upper_dec_iin_MC_D1 : STD_LOGIC; 
  signal upper_dec_iin_MC_D2 : STD_LOGIC; 
  signal upper_dec_ein_MC_Q : STD_LOGIC; 
  signal upper_dec_ein_MC_D : STD_LOGIC; 
  signal serial_data_15_II_UIM : STD_LOGIC; 
  signal upper_dec_ein_MC_D1_PT_0 : STD_LOGIC; 
  signal upper_dec_ein_MC_D1 : STD_LOGIC; 
  signal upper_dec_ein_MC_D2 : STD_LOGIC; 
  signal N_PZ_305_MC_Q : STD_LOGIC; 
  signal N_PZ_305_MC_D : STD_LOGIC; 
  signal upper_dec_din : STD_LOGIC; 
  signal upper_dec_cin : STD_LOGIC; 
  signal N_PZ_305_MC_D1_PT_0 : STD_LOGIC; 
  signal N_PZ_305_MC_D1 : STD_LOGIC; 
  signal N_PZ_305_MC_D2 : STD_LOGIC; 
  signal upper_dec_din_MC_Q : STD_LOGIC; 
  signal upper_dec_din_MC_D : STD_LOGIC; 
  signal serial_data_16_II_UIM : STD_LOGIC; 
  signal upper_dec_din_MC_D1_PT_0 : STD_LOGIC; 
  signal upper_dec_din_MC_D1 : STD_LOGIC; 
  signal upper_dec_din_MC_D2 : STD_LOGIC; 
  signal upper_dec_cin_MC_Q : STD_LOGIC; 
  signal upper_dec_cin_MC_D : STD_LOGIC; 
  signal serial_data_17_II_UIM : STD_LOGIC; 
  signal upper_dec_cin_MC_D1_PT_0 : STD_LOGIC; 
  signal upper_dec_cin_MC_D1 : STD_LOGIC; 
  signal upper_dec_cin_MC_D2 : STD_LOGIC; 
  signal upper_dec_gin_MC_Q : STD_LOGIC; 
  signal upper_dec_gin_MC_D : STD_LOGIC; 
  signal serial_data_12_II_UIM : STD_LOGIC; 
  signal upper_dec_gin_MC_D1_PT_0 : STD_LOGIC; 
  signal upper_dec_gin_MC_D1 : STD_LOGIC; 
  signal upper_dec_gin_MC_D2 : STD_LOGIC; 
  signal decoded_data_11_MC_Q : STD_LOGIC; 
  signal decoded_data_11_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal decoded_data_11_MC_D : STD_LOGIC; 
  signal upper_dec_eout : STD_LOGIC; 
  signal decoded_data_11_MC_D1_PT_0 : STD_LOGIC; 
  signal decoded_data_11_MC_D1 : STD_LOGIC; 
  signal decoded_data_11_MC_D2 : STD_LOGIC; 
  signal decoded_data_11_MC_UIM : STD_LOGIC; 
  signal upper_dec_eout_MC_Q : STD_LOGIC; 
  signal upper_dec_eout_MC_D : STD_LOGIC; 
  signal upper_dec_eout_MC_D1 : STD_LOGIC; 
  signal upper_dec_eout_MC_D2_PT_0 : STD_LOGIC; 
  signal N_PZ_298 : STD_LOGIC; 
  signal N_PZ_308 : STD_LOGIC; 
  signal N_PZ_302 : STD_LOGIC; 
  signal upper_dec_eout_MC_D2_PT_1 : STD_LOGIC; 
  signal upper_dec_ain : STD_LOGIC; 
  signal upper_dec_eout_MC_D2_PT_2 : STD_LOGIC; 
  signal N_PZ_343 : STD_LOGIC; 
  signal upper_dec_eout_MC_D2_PT_3 : STD_LOGIC; 
  signal upper_dec_bin : STD_LOGIC; 
  signal N_PZ_348 : STD_LOGIC; 
  signal upper_dec_eout_MC_D2_PT_4 : STD_LOGIC; 
  signal upper_dec_eout_MC_D2_PT_5 : STD_LOGIC; 
  signal upper_dec_eout_MC_D2_PT_6 : STD_LOGIC; 
  signal upper_dec_eout_MC_D2_PT_7 : STD_LOGIC; 
  signal upper_dec_eout_MC_D2_PT_8 : STD_LOGIC; 
  signal upper_dec_eout_MC_D2_PT_9 : STD_LOGIC; 
  signal upper_dec_eout_MC_D2 : STD_LOGIC; 
  signal N_PZ_298_MC_Q : STD_LOGIC; 
  signal N_PZ_298_MC_D : STD_LOGIC; 
  signal N_PZ_298_MC_D1 : STD_LOGIC; 
  signal N_PZ_298_MC_D2_PT_0 : STD_LOGIC; 
  signal N_PZ_298_MC_D2_PT_1 : STD_LOGIC; 
  signal N_PZ_298_MC_D2 : STD_LOGIC; 
  signal upper_dec_bin_MC_Q : STD_LOGIC; 
  signal upper_dec_bin_MC_D : STD_LOGIC; 
  signal serial_data_18_II_UIM : STD_LOGIC; 
  signal upper_dec_bin_MC_D1_PT_0 : STD_LOGIC; 
  signal upper_dec_bin_MC_D1 : STD_LOGIC; 
  signal upper_dec_bin_MC_D2 : STD_LOGIC; 
  signal N_PZ_308_MC_Q : STD_LOGIC; 
  signal N_PZ_308_MC_D : STD_LOGIC; 
  signal N_PZ_308_MC_D1 : STD_LOGIC; 
  signal N_PZ_308_MC_D2_PT_0 : STD_LOGIC; 
  signal N_PZ_308_MC_D2_PT_1 : STD_LOGIC; 
  signal N_PZ_308_MC_D2 : STD_LOGIC; 
  signal upper_dec_ain_MC_Q : STD_LOGIC; 
  signal upper_dec_ain_MC_D : STD_LOGIC; 
  signal serial_data_19_II_UIM : STD_LOGIC; 
  signal upper_dec_ain_MC_D1_PT_0 : STD_LOGIC; 
  signal upper_dec_ain_MC_D1 : STD_LOGIC; 
  signal upper_dec_ain_MC_D2 : STD_LOGIC; 
  signal N_PZ_302_MC_Q : STD_LOGIC; 
  signal N_PZ_302_MC_D : STD_LOGIC; 
  signal N_PZ_302_MC_D1_PT_0 : STD_LOGIC; 
  signal N_PZ_302_MC_D1 : STD_LOGIC; 
  signal N_PZ_302_MC_D2 : STD_LOGIC; 
  signal N_PZ_343_MC_Q : STD_LOGIC; 
  signal N_PZ_343_MC_D : STD_LOGIC; 
  signal N_PZ_343_MC_D1 : STD_LOGIC; 
  signal N_PZ_343_MC_D2_PT_0 : STD_LOGIC; 
  signal N_PZ_343_MC_D2_PT_1 : STD_LOGIC; 
  signal N_PZ_343_MC_D2 : STD_LOGIC; 
  signal N_PZ_348_MC_Q : STD_LOGIC; 
  signal N_PZ_348_MC_D : STD_LOGIC; 
  signal N_PZ_348_MC_D1 : STD_LOGIC; 
  signal N_PZ_348_MC_D2_PT_0 : STD_LOGIC; 
  signal N_PZ_348_MC_D2_PT_1 : STD_LOGIC; 
  signal N_PZ_348_MC_D2 : STD_LOGIC; 
  signal decoded_data_12_MC_Q : STD_LOGIC; 
  signal decoded_data_12_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal decoded_data_12_MC_D : STD_LOGIC; 
  signal upper_dec_dout : STD_LOGIC; 
  signal decoded_data_12_MC_D1_PT_0 : STD_LOGIC; 
  signal decoded_data_12_MC_D1 : STD_LOGIC; 
  signal decoded_data_12_MC_D2 : STD_LOGIC; 
  signal decoded_data_12_MC_UIM : STD_LOGIC; 
  signal upper_dec_dout_MC_Q : STD_LOGIC; 
  signal upper_dec_dout_MC_D : STD_LOGIC; 
  signal upper_dec_dout_MC_D1 : STD_LOGIC; 
  signal upper_dec_dout_MC_D2_PT_0 : STD_LOGIC; 
  signal upper_dec_dout_MC_D2_PT_1 : STD_LOGIC; 
  signal upper_dec_dout_MC_D2_PT_2 : STD_LOGIC; 
  signal upper_dec_dout_MC_D2_PT_3 : STD_LOGIC; 
  signal upper_dec_dout_MC_D2_PT_4 : STD_LOGIC; 
  signal upper_dec_dout_MC_D2_PT_5 : STD_LOGIC; 
  signal upper_dec_dout_MC_D2_PT_6 : STD_LOGIC; 
  signal upper_dec_dout_MC_D2 : STD_LOGIC; 
  signal decoded_data_13_MC_Q : STD_LOGIC; 
  signal decoded_data_13_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal decoded_data_13_MC_D : STD_LOGIC; 
  signal upper_dec_cout : STD_LOGIC; 
  signal decoded_data_13_MC_D1_PT_0 : STD_LOGIC; 
  signal decoded_data_13_MC_D1 : STD_LOGIC; 
  signal decoded_data_13_MC_D2 : STD_LOGIC; 
  signal decoded_data_13_MC_UIM : STD_LOGIC; 
  signal upper_dec_cout_MC_Q : STD_LOGIC; 
  signal upper_dec_cout_MC_D : STD_LOGIC; 
  signal upper_dec_cout_MC_D1 : STD_LOGIC; 
  signal upper_dec_cout_MC_D2_PT_0 : STD_LOGIC; 
  signal upper_dec_cout_MC_D2_PT_1 : STD_LOGIC; 
  signal upper_dec_cout_MC_D2_PT_2 : STD_LOGIC; 
  signal upper_dec_cout_MC_D2_PT_3 : STD_LOGIC; 
  signal upper_dec_cout_MC_D2_PT_4 : STD_LOGIC; 
  signal upper_dec_cout_MC_D2_PT_5 : STD_LOGIC; 
  signal upper_dec_cout_MC_D2_PT_6 : STD_LOGIC; 
  signal upper_dec_cout_MC_D2_PT_7 : STD_LOGIC; 
  signal upper_dec_cout_MC_D2_PT_8 : STD_LOGIC; 
  signal upper_dec_cout_MC_D2 : STD_LOGIC; 
  signal decoded_data_14_MC_Q : STD_LOGIC; 
  signal decoded_data_14_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal decoded_data_14_MC_D : STD_LOGIC; 
  signal upper_dec_bout : STD_LOGIC; 
  signal decoded_data_14_MC_D1_PT_0 : STD_LOGIC; 
  signal decoded_data_14_MC_D1 : STD_LOGIC; 
  signal decoded_data_14_MC_D2 : STD_LOGIC; 
  signal decoded_data_14_MC_UIM : STD_LOGIC; 
  signal upper_dec_bout_MC_Q : STD_LOGIC; 
  signal upper_dec_bout_MC_D : STD_LOGIC; 
  signal upper_dec_bout_MC_D1 : STD_LOGIC; 
  signal upper_dec_bout_MC_D2_PT_0 : STD_LOGIC; 
  signal upper_dec_bout_MC_D2_PT_1 : STD_LOGIC; 
  signal upper_dec_bout_MC_D2_PT_2 : STD_LOGIC; 
  signal upper_dec_bout_MC_D2_PT_3 : STD_LOGIC; 
  signal upper_dec_bout_MC_D2_PT_4 : STD_LOGIC; 
  signal upper_dec_bout_MC_D2_PT_5 : STD_LOGIC; 
  signal upper_dec_bout_MC_D2_PT_6 : STD_LOGIC; 
  signal upper_dec_bout_MC_D2_PT_7 : STD_LOGIC; 
  signal upper_dec_bout_MC_D2_PT_8 : STD_LOGIC; 
  signal upper_dec_bout_MC_D2 : STD_LOGIC; 
  signal decoded_data_15_MC_Q : STD_LOGIC; 
  signal decoded_data_15_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal decoded_data_15_MC_D : STD_LOGIC; 
  signal upper_dec_aout : STD_LOGIC; 
  signal decoded_data_15_MC_D1_PT_0 : STD_LOGIC; 
  signal decoded_data_15_MC_D1 : STD_LOGIC; 
  signal decoded_data_15_MC_D2 : STD_LOGIC; 
  signal decoded_data_15_MC_UIM : STD_LOGIC; 
  signal upper_dec_aout_MC_Q : STD_LOGIC; 
  signal upper_dec_aout_MC_D : STD_LOGIC; 
  signal upper_dec_aout_MC_D1 : STD_LOGIC; 
  signal upper_dec_aout_MC_D2_PT_0 : STD_LOGIC; 
  signal upper_dec_aout_MC_D2_PT_1 : STD_LOGIC; 
  signal upper_dec_aout_MC_D2_PT_2 : STD_LOGIC; 
  signal upper_dec_aout_MC_D2_PT_3 : STD_LOGIC; 
  signal upper_dec_aout_MC_D2_PT_4 : STD_LOGIC; 
  signal upper_dec_aout_MC_D2_PT_5 : STD_LOGIC; 
  signal upper_dec_aout_MC_D2_PT_6 : STD_LOGIC; 
  signal upper_dec_aout_MC_D2_PT_7 : STD_LOGIC; 
  signal upper_dec_aout_MC_D2 : STD_LOGIC; 
  signal decoded_data_1_MC_Q : STD_LOGIC; 
  signal decoded_data_1_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal decoded_data_1_MC_D : STD_LOGIC; 
  signal lower_dec_gout : STD_LOGIC; 
  signal decoded_data_1_MC_D1_PT_0 : STD_LOGIC; 
  signal decoded_data_1_MC_D1 : STD_LOGIC; 
  signal decoded_data_1_MC_D2 : STD_LOGIC; 
  signal decoded_data_1_MC_UIM : STD_LOGIC; 
  signal lower_dec_gout_MC_Q : STD_LOGIC; 
  signal lower_dec_gout_MC_D : STD_LOGIC; 
  signal lower_dec_gout_MC_D1 : STD_LOGIC; 
  signal lower_dec_gout_MC_D2_PT_0 : STD_LOGIC; 
  signal lower_dec_gout_MC_D2_PT_1 : STD_LOGIC; 
  signal lower_dec_gout_MC_D2_PT_2 : STD_LOGIC; 
  signal lower_dec_gout_MC_D2_PT_3 : STD_LOGIC; 
  signal lower_dec_gout_MC_D2_PT_4 : STD_LOGIC; 
  signal lower_dec_gout_MC_D2_PT_5 : STD_LOGIC; 
  signal lower_dec_gout_MC_D2_PT_6 : STD_LOGIC; 
  signal lower_dec_gout_MC_D2 : STD_LOGIC; 
  signal decoded_data_2_MC_Q : STD_LOGIC; 
  signal decoded_data_2_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal decoded_data_2_MC_D : STD_LOGIC; 
  signal lower_dec_fout : STD_LOGIC; 
  signal decoded_data_2_MC_D1_PT_0 : STD_LOGIC; 
  signal decoded_data_2_MC_D1 : STD_LOGIC; 
  signal decoded_data_2_MC_D2 : STD_LOGIC; 
  signal decoded_data_2_MC_UIM : STD_LOGIC; 
  signal lower_dec_fout_MC_Q : STD_LOGIC; 
  signal lower_dec_fout_MC_D : STD_LOGIC; 
  signal lower_dec_fout_MC_D1 : STD_LOGIC; 
  signal lower_dec_fout_MC_D2_PT_0 : STD_LOGIC; 
  signal lower_dec_fout_MC_D2_PT_1 : STD_LOGIC; 
  signal lower_dec_fout_MC_D2_PT_2 : STD_LOGIC; 
  signal lower_dec_fout_MC_D2_PT_3 : STD_LOGIC; 
  signal lower_dec_fout_MC_D2_PT_4 : STD_LOGIC; 
  signal lower_dec_fout_MC_D2_PT_5 : STD_LOGIC; 
  signal lower_dec_fout_MC_D2_PT_6 : STD_LOGIC; 
  signal lower_dec_fout_MC_D2 : STD_LOGIC; 
  signal decoded_data_3_MC_Q : STD_LOGIC; 
  signal decoded_data_3_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal decoded_data_3_MC_D : STD_LOGIC; 
  signal lower_dec_eout : STD_LOGIC; 
  signal decoded_data_3_MC_D1_PT_0 : STD_LOGIC; 
  signal decoded_data_3_MC_D1 : STD_LOGIC; 
  signal decoded_data_3_MC_D2 : STD_LOGIC; 
  signal decoded_data_3_MC_UIM : STD_LOGIC; 
  signal lower_dec_eout_MC_Q : STD_LOGIC; 
  signal lower_dec_eout_MC_D : STD_LOGIC; 
  signal lower_dec_eout_MC_D1 : STD_LOGIC; 
  signal lower_dec_eout_MC_D2_PT_0 : STD_LOGIC; 
  signal lower_dec_err_chk_n003561 : STD_LOGIC; 
  signal N_PZ_180 : STD_LOGIC; 
  signal lower_dec_eout_MC_D2_PT_1 : STD_LOGIC; 
  signal lower_dec_eout_MC_D2_PT_2 : STD_LOGIC; 
  signal lower_dec_eout_MC_D2_PT_3 : STD_LOGIC; 
  signal N_PZ_304 : STD_LOGIC; 
  signal lower_dec_err_chk_n003564 : STD_LOGIC; 
  signal lower_dec_err_chk_n003574 : STD_LOGIC; 
  signal lower_dec_eout_MC_D2_PT_4 : STD_LOGIC; 
  signal lower_dec_eout_MC_D2_PT_5 : STD_LOGIC; 
  signal serial_data_9_II_UIM : STD_LOGIC; 
  signal lower_dec_eout_MC_D2_PT_6 : STD_LOGIC; 
  signal serial_data_8_II_UIM : STD_LOGIC; 
  signal lower_dec_eout_MC_D2_PT_7 : STD_LOGIC; 
  signal lower_dec_eout_MC_D2_PT_8 : STD_LOGIC; 
  signal lower_dec_eout_MC_D2_PT_9 : STD_LOGIC; 
  signal lower_dec_eout_MC_D2 : STD_LOGIC; 
  signal lower_dec_err_chk_n003561_MC_Q : STD_LOGIC; 
  signal lower_dec_err_chk_n003561_MC_D : STD_LOGIC; 
  signal lower_dec_err_chk_n003561_MC_D1 : STD_LOGIC; 
  signal lower_dec_err_chk_n003561_MC_D2_PT_0 : STD_LOGIC; 
  signal lower_dec_err_chk_n003561_MC_D2_PT_1 : STD_LOGIC; 
  signal lower_dec_err_chk_n003561_MC_D2_PT_2 : STD_LOGIC; 
  signal lower_dec_err_chk_n003561_MC_D2 : STD_LOGIC; 
  signal N_PZ_304_MC_Q : STD_LOGIC; 
  signal N_PZ_304_MC_D : STD_LOGIC; 
  signal N_PZ_304_MC_D1_PT_0 : STD_LOGIC; 
  signal N_PZ_304_MC_D1 : STD_LOGIC; 
  signal N_PZ_304_MC_D2 : STD_LOGIC; 
  signal N_PZ_180_MC_Q : STD_LOGIC; 
  signal N_PZ_180_MC_D : STD_LOGIC; 
  signal N_PZ_180_MC_D1 : STD_LOGIC; 
  signal N_PZ_180_MC_D2_PT_0 : STD_LOGIC; 
  signal N_PZ_180_MC_D2_PT_1 : STD_LOGIC; 
  signal N_PZ_180_MC_D2 : STD_LOGIC; 
  signal lower_dec_err_chk_n003564_MC_Q : STD_LOGIC; 
  signal lower_dec_err_chk_n003564_MC_D : STD_LOGIC; 
  signal lower_dec_err_chk_n003564_MC_D1 : STD_LOGIC; 
  signal lower_dec_err_chk_n003564_MC_D2_PT_0 : STD_LOGIC; 
  signal lower_dec_err_chk_n003564_MC_D2_PT_1 : STD_LOGIC; 
  signal lower_dec_err_chk_n003564_MC_D2 : STD_LOGIC; 
  signal lower_dec_err_chk_n003574_MC_Q : STD_LOGIC; 
  signal lower_dec_err_chk_n003574_MC_D : STD_LOGIC; 
  signal lower_dec_err_chk_n003574_MC_D1 : STD_LOGIC; 
  signal lower_dec_err_chk_n003574_MC_D2_PT_0 : STD_LOGIC; 
  signal lower_dec_err_chk_n003574_MC_D2_PT_1 : STD_LOGIC; 
  signal lower_dec_err_chk_n003574_MC_D2 : STD_LOGIC; 
  signal decoded_data_4_MC_Q : STD_LOGIC; 
  signal decoded_data_4_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal decoded_data_4_MC_D : STD_LOGIC; 
  signal lower_dec_dout : STD_LOGIC; 
  signal decoded_data_4_MC_D1_PT_0 : STD_LOGIC; 
  signal decoded_data_4_MC_D1 : STD_LOGIC; 
  signal decoded_data_4_MC_D2 : STD_LOGIC; 
  signal decoded_data_4_MC_UIM : STD_LOGIC; 
  signal lower_dec_dout_MC_Q : STD_LOGIC; 
  signal lower_dec_dout_MC_D : STD_LOGIC; 
  signal lower_dec_dout_MC_D1 : STD_LOGIC; 
  signal lower_dec_dout_MC_D2_PT_0 : STD_LOGIC; 
  signal lower_dec_dout_MC_D2_PT_1 : STD_LOGIC; 
  signal lower_dec_dout_MC_D2_PT_2 : STD_LOGIC; 
  signal lower_dec_dout_MC_D2_PT_3 : STD_LOGIC; 
  signal lower_dec_dout_MC_D2_PT_4 : STD_LOGIC; 
  signal lower_dec_dout_MC_D2_PT_5 : STD_LOGIC; 
  signal lower_dec_dout_MC_D2_PT_6 : STD_LOGIC; 
  signal lower_dec_dout_MC_D2_PT_7 : STD_LOGIC; 
  signal lower_dec_dout_MC_D2_PT_8 : STD_LOGIC; 
  signal lower_dec_dout_MC_D2_PT_9 : STD_LOGIC; 
  signal lower_dec_dout_MC_D2_PT_10 : STD_LOGIC; 
  signal lower_dec_dout_MC_D2 : STD_LOGIC; 
  signal decoded_data_5_MC_Q : STD_LOGIC; 
  signal decoded_data_5_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal decoded_data_5_MC_D : STD_LOGIC; 
  signal lower_dec_cout : STD_LOGIC; 
  signal decoded_data_5_MC_D1_PT_0 : STD_LOGIC; 
  signal decoded_data_5_MC_D1 : STD_LOGIC; 
  signal decoded_data_5_MC_D2 : STD_LOGIC; 
  signal decoded_data_5_MC_UIM : STD_LOGIC; 
  signal lower_dec_cout_MC_Q : STD_LOGIC; 
  signal lower_dec_cout_MC_D : STD_LOGIC; 
  signal lower_dec_cout_MC_D1 : STD_LOGIC; 
  signal lower_dec_cout_MC_D2_PT_0 : STD_LOGIC; 
  signal lower_dec_cout_MC_D2_PT_1 : STD_LOGIC; 
  signal lower_dec_cout_MC_D2_PT_2 : STD_LOGIC; 
  signal lower_dec_cout_MC_D2_PT_3 : STD_LOGIC; 
  signal lower_dec_cout_MC_D2_PT_4 : STD_LOGIC; 
  signal lower_dec_cout_MC_D2_PT_5 : STD_LOGIC; 
  signal lower_dec_cout_MC_D2_PT_6 : STD_LOGIC; 
  signal lower_dec_cout_MC_D2_PT_7 : STD_LOGIC; 
  signal lower_dec_cout_MC_D2_PT_8 : STD_LOGIC; 
  signal lower_dec_cout_MC_D2 : STD_LOGIC; 
  signal decoded_data_6_MC_Q : STD_LOGIC; 
  signal decoded_data_6_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal decoded_data_6_MC_D : STD_LOGIC; 
  signal lower_dec_bout : STD_LOGIC; 
  signal decoded_data_6_MC_D1_PT_0 : STD_LOGIC; 
  signal decoded_data_6_MC_D1 : STD_LOGIC; 
  signal decoded_data_6_MC_D2 : STD_LOGIC; 
  signal decoded_data_6_MC_UIM : STD_LOGIC; 
  signal lower_dec_bout_MC_Q : STD_LOGIC; 
  signal lower_dec_bout_MC_D : STD_LOGIC; 
  signal lower_dec_bout_MC_D1 : STD_LOGIC; 
  signal lower_dec_bout_MC_D2_PT_0 : STD_LOGIC; 
  signal lower_dec_bout_MC_D2_PT_1 : STD_LOGIC; 
  signal lower_dec_bout_MC_D2_PT_2 : STD_LOGIC; 
  signal lower_dec_bout_MC_D2_PT_3 : STD_LOGIC; 
  signal lower_dec_bout_MC_D2_PT_4 : STD_LOGIC; 
  signal lower_dec_bout_MC_D2_PT_5 : STD_LOGIC; 
  signal lower_dec_bout_MC_D2_PT_6 : STD_LOGIC; 
  signal lower_dec_bout_MC_D2_PT_7 : STD_LOGIC; 
  signal lower_dec_bout_MC_D2_PT_8 : STD_LOGIC; 
  signal lower_dec_bout_MC_D2_PT_9 : STD_LOGIC; 
  signal lower_dec_bout_MC_D2 : STD_LOGIC; 
  signal decoded_data_7_MC_Q : STD_LOGIC; 
  signal decoded_data_7_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal decoded_data_7_MC_D : STD_LOGIC; 
  signal lower_dec_aout : STD_LOGIC; 
  signal decoded_data_7_MC_D1_PT_0 : STD_LOGIC; 
  signal decoded_data_7_MC_D1 : STD_LOGIC; 
  signal decoded_data_7_MC_D2 : STD_LOGIC; 
  signal decoded_data_7_MC_UIM : STD_LOGIC; 
  signal lower_dec_aout_MC_Q : STD_LOGIC; 
  signal lower_dec_aout_MC_D : STD_LOGIC; 
  signal lower_dec_aout_MC_D1 : STD_LOGIC; 
  signal lower_dec_aout_MC_D2_PT_0 : STD_LOGIC; 
  signal lower_dec_aout_MC_D2_PT_1 : STD_LOGIC; 
  signal lower_dec_aout_MC_D2_PT_2 : STD_LOGIC; 
  signal lower_dec_aout_MC_D2_PT_3 : STD_LOGIC; 
  signal lower_dec_aout_MC_D2_PT_4 : STD_LOGIC; 
  signal lower_dec_aout_MC_D2_PT_5 : STD_LOGIC; 
  signal lower_dec_aout_MC_D2_PT_6 : STD_LOGIC; 
  signal lower_dec_aout_MC_D2_PT_7 : STD_LOGIC; 
  signal lower_dec_aout_MC_D2_PT_8 : STD_LOGIC; 
  signal lower_dec_aout_MC_D2_PT_9 : STD_LOGIC; 
  signal lower_dec_aout_MC_D2 : STD_LOGIC; 
  signal decoded_data_8_MC_Q : STD_LOGIC; 
  signal decoded_data_8_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal decoded_data_8_MC_D : STD_LOGIC; 
  signal upper_dec_hout : STD_LOGIC; 
  signal decoded_data_8_MC_D1_PT_0 : STD_LOGIC; 
  signal decoded_data_8_MC_D1 : STD_LOGIC; 
  signal decoded_data_8_MC_D2 : STD_LOGIC; 
  signal decoded_data_8_MC_UIM : STD_LOGIC; 
  signal upper_dec_hout_MC_Q : STD_LOGIC; 
  signal upper_dec_hout_MC_D : STD_LOGIC; 
  signal upper_dec_hout_MC_D1 : STD_LOGIC; 
  signal upper_dec_hout_MC_D2_PT_0 : STD_LOGIC; 
  signal upper_dec_hout_MC_D2_PT_1 : STD_LOGIC; 
  signal upper_dec_hout_MC_D2_PT_2 : STD_LOGIC; 
  signal upper_dec_hout_MC_D2_PT_3 : STD_LOGIC; 
  signal upper_dec_hout_MC_D2_PT_4 : STD_LOGIC; 
  signal upper_dec_hout_MC_D2_PT_5 : STD_LOGIC; 
  signal upper_dec_hout_MC_D2_PT_6 : STD_LOGIC; 
  signal upper_dec_hout_MC_D2_PT_7 : STD_LOGIC; 
  signal upper_dec_hout_MC_D2_PT_8 : STD_LOGIC; 
  signal upper_dec_hout_MC_D2 : STD_LOGIC; 
  signal decoded_data_9_MC_Q : STD_LOGIC; 
  signal decoded_data_9_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal decoded_data_9_MC_D : STD_LOGIC; 
  signal upper_dec_gout : STD_LOGIC; 
  signal decoded_data_9_MC_D1_PT_0 : STD_LOGIC; 
  signal decoded_data_9_MC_D1 : STD_LOGIC; 
  signal decoded_data_9_MC_D2 : STD_LOGIC; 
  signal decoded_data_9_MC_UIM : STD_LOGIC; 
  signal upper_dec_gout_MC_Q : STD_LOGIC; 
  signal upper_dec_gout_MC_D : STD_LOGIC; 
  signal upper_dec_gout_MC_D1 : STD_LOGIC; 
  signal upper_dec_gout_MC_D2_PT_0 : STD_LOGIC; 
  signal upper_dec_gout_MC_D2_PT_1 : STD_LOGIC; 
  signal upper_dec_gout_MC_D2_PT_2 : STD_LOGIC; 
  signal upper_dec_gout_MC_D2_PT_3 : STD_LOGIC; 
  signal upper_dec_gout_MC_D2_PT_4 : STD_LOGIC; 
  signal upper_dec_gout_MC_D2_PT_5 : STD_LOGIC; 
  signal upper_dec_gout_MC_D2_PT_6 : STD_LOGIC; 
  signal upper_dec_gout_MC_D2 : STD_LOGIC; 
  signal frame_out_dec_MC_Q : STD_LOGIC; 
  signal frame_out_dec_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal frame_out_dec_MC_D : STD_LOGIC; 
  signal frame_out_dec_MC_D1_PT_0 : STD_LOGIC; 
  signal frame_out_dec_MC_D1 : STD_LOGIC; 
  signal frame_out_dec_MC_D2 : STD_LOGIC; 
  signal ill_char_det_MC_Q : STD_LOGIC; 
  signal ill_char_det_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal ill_char_det_MC_D : STD_LOGIC; 
  signal err_prs_state_ffd1 : STD_LOGIC; 
  signal err_prs_state_ffd2 : STD_LOGIC; 
  signal err_ill_char_det7 : STD_LOGIC; 
  signal ill_char_det_MC_D1_PT_0 : STD_LOGIC; 
  signal ill_char_det_MC_D1 : STD_LOGIC; 
  signal ill_char_det_MC_D2 : STD_LOGIC; 
  signal err_prs_state_ffd1_MC_Q : STD_LOGIC; 
  signal err_prs_state_ffd1_MC_R_OR_PRLD : STD_LOGIC; 
  signal err_prs_state_ffd1_MC_D : STD_LOGIC; 
  signal err_prs_state_ffd1_MC_D1 : STD_LOGIC; 
  signal err_prs_state_ffd1_MC_D2_PT_0 : STD_LOGIC; 
  signal err_prs_state_ffd1_MC_D2_PT_1 : STD_LOGIC; 
  signal err_prs_state_ffd1_MC_D2 : STD_LOGIC; 
  signal err_prs_state_ffd2_MC_Q : STD_LOGIC; 
  signal err_prs_state_ffd2_MC_R_OR_PRLD : STD_LOGIC; 
  signal err_prs_state_ffd2_MC_D : STD_LOGIC; 
  signal err_prs_state_ffd2_MC_D1 : STD_LOGIC; 
  signal err_prs_state_ffd2_MC_D2_PT_0 : STD_LOGIC; 
  signal err_prs_state_ffd2_MC_D2_PT_1 : STD_LOGIC; 
  signal err_prs_state_ffd2_MC_D2 : STD_LOGIC; 
  signal err_ill_char_det7_MC_Q : STD_LOGIC; 
  signal err_ill_char_det7_MC_D : STD_LOGIC; 
  signal err_ill_char_det7_MC_D1 : STD_LOGIC; 
  signal err_n0020 : STD_LOGIC; 
  signal error_u : STD_LOGIC; 
  signal err_ill_char_det5 : STD_LOGIC; 
  signal err_ill_char_det7_MC_D2_PT_0 : STD_LOGIC; 
  signal err_ill_char_det7_MC_D2_PT_1 : STD_LOGIC; 
  signal N_PZ_217 : STD_LOGIC; 
  signal err_ill_char_det7_MC_D2_PT_2 : STD_LOGIC; 
  signal err_ill_char_det7_MC_D2_PT_3 : STD_LOGIC; 
  signal err_ill_char_det7_MC_D2_PT_4 : STD_LOGIC; 
  signal err_ill_char_det7_MC_D2_PT_5 : STD_LOGIC; 
  signal err_ill_char_det7_MC_D2_PT_6 : STD_LOGIC; 
  signal err_ill_char_det7_MC_D2_PT_7 : STD_LOGIC; 
  signal err_ill_char_det7_MC_D2_PT_8 : STD_LOGIC; 
  signal err_ill_char_det7_MC_D2_PT_9 : STD_LOGIC; 
  signal err_ill_char_det7_MC_D2_PT_10 : STD_LOGIC; 
  signal err_ill_char_det7_MC_D2_PT_11 : STD_LOGIC; 
  signal err_ill_char_det7_MC_D2_PT_12 : STD_LOGIC; 
  signal err_ill_char_det7_MC_D2_PT_13 : STD_LOGIC; 
  signal err_ill_char_det7_MC_D2_PT_14 : STD_LOGIC; 
  signal err_ill_char_det7_MC_D2_PT_15 : STD_LOGIC; 
  signal err_ill_char_det7_MC_D2_PT_16 : STD_LOGIC; 
  signal err_ill_char_det7_MC_D2_PT_17 : STD_LOGIC; 
  signal err_ill_char_det7_MC_D2_PT_18 : STD_LOGIC; 
  signal err_ill_char_det7_MC_D2_PT_19 : STD_LOGIC; 
  signal err_ill_char_det7_MC_D2 : STD_LOGIC; 
  signal err_n0020_MC_Q : STD_LOGIC; 
  signal err_n0020_MC_D : STD_LOGIC; 
  signal lower_dec_k_dec : STD_LOGIC; 
  signal err_n0020_MC_D1_PT_0 : STD_LOGIC; 
  signal err_n0020_MC_D1 : STD_LOGIC; 
  signal upper_dec_k_dec : STD_LOGIC; 
  signal err_n0020_MC_D2_PT_0 : STD_LOGIC; 
  signal err_n0020_MC_D2 : STD_LOGIC; 
  signal lower_dec_k_dec_MC_Q : STD_LOGIC; 
  signal lower_dec_k_dec_MC_D : STD_LOGIC; 
  signal lower_dec_k_dec_MC_D1 : STD_LOGIC; 
  signal lower_dec_k_dec_MC_D2_PT_0 : STD_LOGIC; 
  signal lower_dec_k_dec_MC_D2_PT_1 : STD_LOGIC; 
  signal lower_dec_k_dec_MC_D2_PT_2 : STD_LOGIC; 
  signal lower_dec_k_dec_MC_D2_PT_3 : STD_LOGIC; 
  signal lower_dec_k_dec_MC_D2_PT_4 : STD_LOGIC; 
  signal lower_dec_k_dec_MC_D2_PT_5 : STD_LOGIC; 
  signal lower_dec_k_dec_MC_D2_PT_6 : STD_LOGIC; 
  signal lower_dec_k_dec_MC_D2_PT_7 : STD_LOGIC; 
  signal lower_dec_k_dec_MC_D2_PT_8 : STD_LOGIC; 
  signal lower_dec_k_dec_MC_D2 : STD_LOGIC; 
  signal upper_dec_k_dec_MC_Q : STD_LOGIC; 
  signal upper_dec_k_dec_MC_D : STD_LOGIC; 
  signal upper_dec_k_dec_MC_D1 : STD_LOGIC; 
  signal upper_dec_k_dec_MC_D2_PT_0 : STD_LOGIC; 
  signal upper_dec_k_dec_MC_D2_PT_1 : STD_LOGIC; 
  signal upper_dec_k_dec_MC_D2_PT_2 : STD_LOGIC; 
  signal upper_dec_k_dec_MC_D2_PT_3 : STD_LOGIC; 
  signal upper_dec_k_dec_MC_D2_PT_4 : STD_LOGIC; 
  signal upper_dec_k_dec_MC_D2_PT_5 : STD_LOGIC; 
  signal upper_dec_k_dec_MC_D2_PT_6 : STD_LOGIC; 
  signal upper_dec_k_dec_MC_D2_PT_7 : STD_LOGIC; 
  signal upper_dec_k_dec_MC_D2_PT_8 : STD_LOGIC; 
  signal upper_dec_k_dec_MC_D2 : STD_LOGIC; 
  signal error_u_MC_Q : STD_LOGIC; 
  signal error_u_MC_D : STD_LOGIC; 
  signal error_u_MC_D1 : STD_LOGIC; 
  signal error_u_MC_D2_PT_0 : STD_LOGIC; 
  signal error_u_MC_D2_PT_1 : STD_LOGIC; 
  signal error_u_MC_D2_PT_2 : STD_LOGIC; 
  signal error_u_MC_D2_PT_3 : STD_LOGIC; 
  signal error_u_MC_D2_PT_4 : STD_LOGIC; 
  signal error_u_MC_D2_PT_5 : STD_LOGIC; 
  signal error_u_MC_D2_PT_6 : STD_LOGIC; 
  signal error_u_MC_D2_PT_7 : STD_LOGIC; 
  signal error_u_MC_D2_PT_8 : STD_LOGIC; 
  signal error_u_MC_D2_PT_9 : STD_LOGIC; 
  signal error_u_MC_D2_PT_10 : STD_LOGIC; 
  signal error_u_MC_D2_PT_11 : STD_LOGIC; 
  signal error_u_MC_D2_PT_12 : STD_LOGIC; 
  signal error_u_MC_D2_PT_13 : STD_LOGIC; 
  signal error_u_MC_D2_PT_14 : STD_LOGIC; 
  signal error_u_MC_D2_PT_15 : STD_LOGIC; 
  signal error_u_MC_D2_PT_16 : STD_LOGIC; 
  signal error_u_MC_D2_PT_17 : STD_LOGIC; 
  signal error_u_MC_D2_PT_18 : STD_LOGIC; 
  signal error_u_MC_D2_PT_19 : STD_LOGIC; 
  signal error_u_MC_D2 : STD_LOGIC; 
  signal err_ill_char_det5_MC_Q : STD_LOGIC; 
  signal err_ill_char_det5_MC_D : STD_LOGIC; 
  signal err_ill_char_det5_MC_D1 : STD_LOGIC; 
  signal err_ill_char_det5_MC_D2_PT_0 : STD_LOGIC; 
  signal err_ill_char_det5_MC_D2_PT_1 : STD_LOGIC; 
  signal err_ill_char_det5_MC_D2_PT_2 : STD_LOGIC; 
  signal err_ill_char_det5_MC_D2_PT_3 : STD_LOGIC; 
  signal err_ill_char_det5_MC_D2_PT_4 : STD_LOGIC; 
  signal err_ill_char_det5_MC_D2_PT_5 : STD_LOGIC; 
  signal err_ill_char_det5_MC_D2_PT_6 : STD_LOGIC; 
  signal err_ill_char_det5_MC_D2_PT_7 : STD_LOGIC; 
  signal err_ill_char_det5_MC_D2_PT_8 : STD_LOGIC; 
  signal err_ill_char_det5_MC_D2_PT_9 : STD_LOGIC; 
  signal err_ill_char_det5_MC_D2_PT_10 : STD_LOGIC; 
  signal err_ill_char_det5_MC_D2_PT_11 : STD_LOGIC; 
  signal err_ill_char_det5_MC_D2_PT_12 : STD_LOGIC; 
  signal err_ill_char_det5_MC_D2_PT_13 : STD_LOGIC; 
  signal err_ill_char_det5_MC_D2_PT_14 : STD_LOGIC; 
  signal err_ill_char_det5_MC_D2_PT_15 : STD_LOGIC; 
  signal err_ill_char_det5_MC_D2 : STD_LOGIC; 
  signal N_PZ_217_MC_Q : STD_LOGIC; 
  signal N_PZ_217_MC_D : STD_LOGIC; 
  signal N_PZ_217_MC_D1 : STD_LOGIC; 
  signal N_PZ_217_MC_D2_PT_0 : STD_LOGIC; 
  signal N_PZ_217_MC_D2_PT_1 : STD_LOGIC; 
  signal N_PZ_217_MC_D2_PT_2 : STD_LOGIC; 
  signal N_PZ_217_MC_D2 : STD_LOGIC; 
  signal GND : STD_LOGIC; 
  signal VCC : STD_LOGIC; 
  signal PRLD : STD_LOGIC; 
  signal NlwInverterSignal_FOOBAR1_ctinst_0_OUT : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_prs_state_fft2_MC_D2_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_prs_state_fft2_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_prs_state_fft1_MC_D2_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_prs_state_fft1_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_prs_state_fft1_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_dec_8b10b_prs_state_ffd1_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_dec_8b10b_prs_state_ffd1_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_dec_8b10b_prs_state_ffd1_MC_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_dec_8b10b_prs_state_ffd2_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_err_chk_prs_state_ffd1_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_err_chk_prs_state_ffd1_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_err_chk_prs_state_ffd1_MC_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_err_chk_prs_state_ffd2_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_hout_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_hout_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_hout_MC_D2_PT_1_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_hout_MC_D2_PT_1_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_hout_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_hout_MC_D2_PT_2_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_hout_MC_D2_PT_3_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_hout_MC_D2_PT_3_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_hout_MC_D2_PT_4_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_hout_MC_D2_PT_4_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_hout_MC_D2_PT_5_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_hout_MC_D2_PT_5_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_hout_MC_D2_PT_5_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_hout_MC_D2_PT_5_IN8 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_hout_MC_D2_PT_6_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_hout_MC_D2_PT_6_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_hout_MC_D2_PT_7_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_hout_MC_D2_PT_7_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_hout_MC_D2_PT_7_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_hout_MC_D2_PT_7_IN8 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_hout_MC_D2_PT_8_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_hout_MC_D2_PT_8_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_hout_MC_D2_PT_8_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_hout_MC_D2_PT_8_IN8 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_188_MC_D1_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_188_MC_D1_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_309_MC_D1_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_309_MC_D1_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_prs_state_fft2_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_prs_state_fft2_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_prs_state_fft1_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_prs_state_fft1_MC_D2_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_prs_state_fft1_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_dec_8b10b_prs_state_ffd1_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_dec_8b10b_prs_state_ffd1_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_dec_8b10b_prs_state_ffd1_MC_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_dec_8b10b_prs_state_ffd2_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_err_chk_prs_state_ffd1_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_err_chk_prs_state_ffd1_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_err_chk_prs_state_ffd1_MC_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_err_chk_prs_state_ffd2_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_fout_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_fout_MC_D2_PT_1_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_fout_MC_D2_PT_2_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_fout_MC_D2_PT_2_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_fout_MC_D2_PT_3_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_fout_MC_D2_PT_4_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_fout_MC_D2_PT_4_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_fout_MC_D2_PT_5_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_fout_MC_D2_PT_6_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_fout_MC_D2_PT_6_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_fout_MC_D2_PT_6_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_hin_MC_D1_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_jin_MC_D1_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_fin_MC_D1_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_189_MC_D1_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_189_MC_D1_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_iin_MC_D1_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_ein_MC_D1_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_305_MC_D1_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_305_MC_D1_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_din_MC_D1_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_cin_MC_D1_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_gin_MC_D1_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_eout_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_eout_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_eout_MC_D2_PT_2_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_eout_MC_D2_PT_3_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_eout_MC_D2_PT_3_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_eout_MC_D2_PT_4_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_eout_MC_D2_PT_4_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_eout_MC_D2_PT_5_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_eout_MC_D2_PT_5_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_eout_MC_D2_PT_5_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_eout_MC_D2_PT_7_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_eout_MC_D2_PT_8_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_eout_MC_D2_PT_8_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_eout_MC_D2_PT_9_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_eout_MC_D2_PT_9_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_eout_MC_D2_PT_9_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_298_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_298_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_bin_MC_D1_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_308_MC_D2_PT_0_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_308_MC_D2_PT_1_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_ain_MC_D1_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_343_MC_D2_PT_0_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_343_MC_D2_PT_1_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_348_MC_D2_PT_0_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_348_MC_D2_PT_0_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_348_MC_D2_PT_1_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_348_MC_D2_PT_1_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_dout_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_dout_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_dout_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_dout_MC_D2_PT_3_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_dout_MC_D2_PT_4_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_dout_MC_D2_PT_4_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_dout_MC_D2_PT_5_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_dout_MC_D2_PT_5_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_dout_MC_D2_PT_6_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_dout_MC_D2_PT_6_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_dout_MC_D2_PT_6_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_dout_MC_D2_PT_6_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_cout_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_cout_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_cout_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_cout_MC_D2_PT_3_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_cout_MC_D2_PT_3_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_cout_MC_D2_PT_4_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_cout_MC_D2_PT_5_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_cout_MC_D2_PT_5_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_cout_MC_D2_PT_6_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_cout_MC_D2_PT_7_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_cout_MC_D2_PT_7_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_cout_MC_D2_PT_8_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_cout_MC_D2_PT_8_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_cout_MC_D2_PT_8_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_cout_MC_D2_PT_8_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_bout_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_bout_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_bout_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_bout_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_bout_MC_D2_PT_3_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_bout_MC_D2_PT_4_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_bout_MC_D2_PT_4_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_bout_MC_D2_PT_5_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_bout_MC_D2_PT_5_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_bout_MC_D2_PT_6_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_bout_MC_D2_PT_6_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_bout_MC_D2_PT_7_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_bout_MC_D2_PT_7_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_bout_MC_D2_PT_8_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_bout_MC_D2_PT_8_IN8 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_aout_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_aout_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_aout_MC_D2_PT_2_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_aout_MC_D2_PT_3_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_aout_MC_D2_PT_4_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_aout_MC_D2_PT_5_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_aout_MC_D2_PT_5_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_aout_MC_D2_PT_6_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_aout_MC_D2_PT_6_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_aout_MC_D2_PT_7_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_aout_MC_D2_PT_7_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_gout_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_gout_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_gout_MC_D2_PT_1_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_gout_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_gout_MC_D2_PT_2_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_gout_MC_D2_PT_2_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_gout_MC_D2_PT_3_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_gout_MC_D2_PT_3_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_gout_MC_D2_PT_3_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_gout_MC_D2_PT_4_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_gout_MC_D2_PT_4_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_gout_MC_D2_PT_5_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_gout_MC_D2_PT_5_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_gout_MC_D2_PT_5_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_gout_MC_D2_PT_6_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_gout_MC_D2_PT_6_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_gout_MC_D2_PT_6_IN8 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_fout_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_fout_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_fout_MC_D2_PT_1_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_fout_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_fout_MC_D2_PT_2_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_fout_MC_D2_PT_2_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_fout_MC_D2_PT_3_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_fout_MC_D2_PT_3_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_fout_MC_D2_PT_4_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_fout_MC_D2_PT_4_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_fout_MC_D2_PT_4_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_fout_MC_D2_PT_5_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_fout_MC_D2_PT_5_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_fout_MC_D2_PT_6_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_fout_MC_D2_PT_6_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_fout_MC_D2_PT_6_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_fout_MC_D2_PT_6_IN8 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_eout_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_eout_MC_D2_PT_1_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_eout_MC_D2_PT_1_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_eout_MC_D2_PT_2_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_eout_MC_D2_PT_3_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_eout_MC_D2_PT_3_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_eout_MC_D2_PT_4_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_eout_MC_D2_PT_4_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_eout_MC_D2_PT_4_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_eout_MC_D2_PT_5_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_eout_MC_D2_PT_5_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_eout_MC_D2_PT_5_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_eout_MC_D2_PT_6_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_eout_MC_D2_PT_6_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_eout_MC_D2_PT_6_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_eout_MC_D2_PT_6_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_eout_MC_D2_PT_7_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_eout_MC_D2_PT_7_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_eout_MC_D2_PT_7_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_eout_MC_D2_PT_7_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_eout_MC_D2_PT_8_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_eout_MC_D2_PT_8_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_eout_MC_D2_PT_8_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_eout_MC_D2_PT_8_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_eout_MC_D2_PT_8_IN8 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_eout_MC_D2_PT_9_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_eout_MC_D2_PT_9_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_eout_MC_D2_PT_9_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_eout_MC_D2_PT_9_IN8 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_err_chk_n003561_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_err_chk_n003561_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_err_chk_n003561_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_err_chk_n003561_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_err_chk_n003561_MC_D2_PT_2_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_err_chk_n003561_MC_D2_PT_2_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_err_chk_n003561_MC_D2_PT_2_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_180_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_180_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_err_chk_n003564_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_err_chk_n003564_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_err_chk_n003574_MC_D2_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_err_chk_n003574_MC_D2_PT_1_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_err_chk_n003574_MC_D2_PT_1_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_dout_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_dout_MC_D2_PT_1_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_dout_MC_D2_PT_1_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_dout_MC_D2_PT_2_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_dout_MC_D2_PT_2_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_dout_MC_D2_PT_2_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_dout_MC_D2_PT_3_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_dout_MC_D2_PT_3_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_dout_MC_D2_PT_3_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_dout_MC_D2_PT_4_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_dout_MC_D2_PT_4_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_dout_MC_D2_PT_4_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_dout_MC_D2_PT_5_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_dout_MC_D2_PT_5_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_dout_MC_D2_PT_5_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_dout_MC_D2_PT_5_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_dout_MC_D2_PT_6_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_dout_MC_D2_PT_6_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_dout_MC_D2_PT_6_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_dout_MC_D2_PT_7_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_dout_MC_D2_PT_7_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_dout_MC_D2_PT_7_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_dout_MC_D2_PT_8_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_dout_MC_D2_PT_8_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_dout_MC_D2_PT_9_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_dout_MC_D2_PT_9_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_dout_MC_D2_PT_10_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_dout_MC_D2_PT_10_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_dout_MC_D2_PT_10_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_dout_MC_D2_PT_10_IN8 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_cout_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_cout_MC_D2_PT_1_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_cout_MC_D2_PT_1_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_cout_MC_D2_PT_1_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_cout_MC_D2_PT_2_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_cout_MC_D2_PT_2_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_cout_MC_D2_PT_2_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_cout_MC_D2_PT_3_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_cout_MC_D2_PT_3_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_cout_MC_D2_PT_3_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_cout_MC_D2_PT_4_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_cout_MC_D2_PT_4_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_cout_MC_D2_PT_4_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_cout_MC_D2_PT_4_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_cout_MC_D2_PT_4_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_cout_MC_D2_PT_5_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_cout_MC_D2_PT_5_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_cout_MC_D2_PT_5_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_cout_MC_D2_PT_6_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_cout_MC_D2_PT_6_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_cout_MC_D2_PT_6_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_cout_MC_D2_PT_7_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_cout_MC_D2_PT_7_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_cout_MC_D2_PT_7_IN8 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_cout_MC_D2_PT_8_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_cout_MC_D2_PT_8_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_cout_MC_D2_PT_8_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_bout_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_bout_MC_D2_PT_1_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_bout_MC_D2_PT_1_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_bout_MC_D2_PT_1_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_bout_MC_D2_PT_2_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_bout_MC_D2_PT_2_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_bout_MC_D2_PT_2_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_bout_MC_D2_PT_3_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_bout_MC_D2_PT_3_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_bout_MC_D2_PT_4_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_bout_MC_D2_PT_4_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_bout_MC_D2_PT_4_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_bout_MC_D2_PT_5_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_bout_MC_D2_PT_5_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_bout_MC_D2_PT_5_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_bout_MC_D2_PT_6_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_bout_MC_D2_PT_6_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_bout_MC_D2_PT_6_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_bout_MC_D2_PT_6_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_bout_MC_D2_PT_6_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_bout_MC_D2_PT_7_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_bout_MC_D2_PT_7_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_bout_MC_D2_PT_8_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_bout_MC_D2_PT_8_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_bout_MC_D2_PT_8_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_bout_MC_D2_PT_8_IN8 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_bout_MC_D2_PT_9_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_bout_MC_D2_PT_9_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_bout_MC_D2_PT_9_IN8 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_aout_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_aout_MC_D2_PT_1_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_aout_MC_D2_PT_1_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_aout_MC_D2_PT_1_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_aout_MC_D2_PT_2_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_aout_MC_D2_PT_2_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_aout_MC_D2_PT_2_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_aout_MC_D2_PT_3_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_aout_MC_D2_PT_3_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_aout_MC_D2_PT_3_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_aout_MC_D2_PT_4_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_aout_MC_D2_PT_4_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_aout_MC_D2_PT_4_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_aout_MC_D2_PT_4_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_aout_MC_D2_PT_5_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_aout_MC_D2_PT_5_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_aout_MC_D2_PT_5_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_aout_MC_D2_PT_6_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_aout_MC_D2_PT_6_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_aout_MC_D2_PT_6_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_aout_MC_D2_PT_6_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_aout_MC_D2_PT_6_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_aout_MC_D2_PT_7_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_aout_MC_D2_PT_7_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_aout_MC_D2_PT_7_IN8 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_aout_MC_D2_PT_8_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_aout_MC_D2_PT_8_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_aout_MC_D2_PT_8_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_aout_MC_D2_PT_8_IN8 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_aout_MC_D2_PT_9_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_aout_MC_D2_PT_9_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_hout_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_hout_MC_D2_PT_1_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_hout_MC_D2_PT_1_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_hout_MC_D2_PT_2_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_hout_MC_D2_PT_3_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_hout_MC_D2_PT_4_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_hout_MC_D2_PT_5_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_hout_MC_D2_PT_5_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_hout_MC_D2_PT_5_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_hout_MC_D2_PT_6_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_hout_MC_D2_PT_7_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_hout_MC_D2_PT_7_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_hout_MC_D2_PT_7_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_hout_MC_D2_PT_8_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_hout_MC_D2_PT_8_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_hout_MC_D2_PT_8_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_gout_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_gout_MC_D2_PT_1_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_gout_MC_D2_PT_2_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_gout_MC_D2_PT_2_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_gout_MC_D2_PT_3_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_gout_MC_D2_PT_3_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_gout_MC_D2_PT_4_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_gout_MC_D2_PT_5_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_gout_MC_D2_PT_5_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_gout_MC_D2_PT_6_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_gout_MC_D2_PT_6_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_ill_char_det_MC_D1_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_err_prs_state_ffd1_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_err_prs_state_ffd1_MC_D2_PT_1_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_0_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_1_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_2_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_3_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_4_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_5_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_5_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_6_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_7_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_8_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_8_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_8_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_9_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_9_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_9_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_10_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_10_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_10_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_11_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_11_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_12_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_13_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_13_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_13_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_13_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_14_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_15_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_16_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_16_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_16_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_16_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_17_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_17_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_17_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_18_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_18_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_18_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_18_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_18_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_18_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_19_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_19_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_19_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_19_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det7_MC_D2_PT_19_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_4_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_5_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_5_IN8 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_6_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_6_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_6_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_6_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_7_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_7_IN8 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_7_IN10 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_7_IN11 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_7_IN12 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_7_IN13 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_8_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_8_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_8_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_8_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_8_IN9 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_8_IN10 : STD_LOGIC; 
  signal NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_8_IN11 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_3_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_3_IN9 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_4_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_4_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_4_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_4_IN9 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_5_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_5_IN8 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_5_IN10 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_6_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_6_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_6_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_6_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_6_IN9 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_7_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_7_IN9 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_7_IN10 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_7_IN11 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_8_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_8_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_8_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_8_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_8_IN8 : STD_LOGIC; 
  signal NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_8_IN9 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_0_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_0_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_3_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_3_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_3_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_3_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_6_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_7_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_9_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_9_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_9_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_9_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_10_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_10_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_10_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_11_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_11_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_11_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_11_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_11_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_12_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_13_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_13_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_13_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_13_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_13_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_14_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_14_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_15_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_15_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_16_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_16_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_16_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_16_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_16_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_17_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_17_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_17_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_17_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_17_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_18_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_19_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_19_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_19_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_19_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_19_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_error_u_MC_D2_PT_19_IN8 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det5_MC_D2_PT_0_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det5_MC_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det5_MC_D2_PT_2_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det5_MC_D2_PT_3_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det5_MC_D2_PT_4_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det5_MC_D2_PT_5_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det5_MC_D2_PT_6_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det5_MC_D2_PT_7_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det5_MC_D2_PT_8_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det5_MC_D2_PT_9_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det5_MC_D2_PT_10_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det5_MC_D2_PT_11_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det5_MC_D2_PT_12_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det5_MC_D2_PT_13_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det5_MC_D2_PT_14_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_err_ill_char_det5_MC_D2_PT_15_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_217_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_217_MC_D2_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_217_MC_D2_PT_0_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_217_MC_D2_PT_0_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_217_MC_D2_PT_0_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_217_MC_D2_PT_0_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_217_MC_D2_PT_0_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_217_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_217_MC_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_217_MC_D2_PT_1_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_217_MC_D2_PT_1_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_217_MC_D2_PT_1_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_217_MC_D2_PT_1_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_217_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_217_MC_D2_PT_2_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_217_MC_D2_PT_2_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_217_MC_D2_PT_2_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_217_MC_D2_PT_2_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_217_MC_D2_PT_2_IN7 : STD_LOGIC; 
begin
  decoded_data_0_Q : X_BUF
    port map (
      I => decoded_data_0_MC_Q,
      O => decoded_data(0)
    );
  decoded_data_0_MC_Q_0 : X_BUF
    port map (
      I => decoded_data_0_MC_Q_tsim_ireg_Q,
      O => decoded_data_0_MC_Q
    );
  decoded_data_0_MC_REG : X_BUF
    port map (
      I => decoded_data_0_MC_D,
      O => decoded_data_0_MC_Q_tsim_ireg_Q
    );
  decoded_data_0_MC_D1_PT_0_1 : X_AND3
    port map (
      I0 => lower_dec_prs_state_fft2,
      I1 => lower_dec_prs_state_fft1,
      I2 => lower_dec_hout,
      O => decoded_data_0_MC_D1_PT_0
    );
  decoded_data_0_MC_D1_2 : X_OR2
    port map (
      I0 => decoded_data_0_MC_D1_PT_0,
      I1 => decoded_data_0_MC_D1_PT_0,
      O => decoded_data_0_MC_D1
    );
  GND_ZERO : X_ZERO
    port map (
      O => GND
    );
  decoded_data_0_MC_D2_3 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => decoded_data_0_MC_D2
    );
  decoded_data_0_MC_XOR : X_XOR2
    port map (
      I0 => decoded_data_0_MC_D1,
      I1 => decoded_data_0_MC_D2,
      O => decoded_data_0_MC_D
    );
  decoded_data_0_MC_UIM_4 : X_BUF
    port map (
      I => decoded_data_0_MC_Q_tsim_ireg_Q,
      O => decoded_data_0_MC_UIM
    );
  lower_dec_prs_state_fft2_5 : X_BUF
    port map (
      I => lower_dec_prs_state_fft2_MC_Q,
      O => lower_dec_prs_state_fft2
    );
  lower_dec_prs_state_fft2_MC_R_OR_PRLD_6 : X_OR2
    port map (
      I0 => FOOBAR1_ctinst_0,
      I1 => PRLD,
      O => lower_dec_prs_state_fft2_MC_R_OR_PRLD
    );
  lower_dec_prs_state_fft2_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => lower_dec_prs_state_fft2_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => lower_dec_prs_state_fft2_MC_R_OR_PRLD,
      O => lower_dec_prs_state_fft2_MC_Q
    );
  VCC_ONE : X_ONE
    port map (
      O => VCC
    );
  FOOBAR1_ctinst_0_7 : X_AND2
    port map (
      I0 => rst_II_UIM,
      I1 => rst_II_UIM,
      O => NlwInverterSignal_FOOBAR1_ctinst_0_OUT
    );
  rst_II_UIM_8 : X_BUF
    port map (
      I => rst,
      O => rst_II_UIM
    );
  lower_dec_prs_state_fft2_MC_D1_9 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => lower_dec_prs_state_fft2_MC_D1
    );
  lower_dec_prs_state_fft2_MC_D2_PT_0_10 : X_AND3
    port map (
      I0 => lower_dec_prs_state_fft2,
      I1 => lower_dec_prs_state_fft1,
      I2 => NlwInverterSignal_lower_dec_prs_state_fft2_MC_D2_PT_0_IN2,
      O => lower_dec_prs_state_fft2_MC_D2_PT_0
    );
  lower_dec_prs_state_fft2_MC_D2_PT_1_11 : X_AND6
    port map (
      I0 => NlwInverterSignal_lower_dec_prs_state_fft2_MC_D2_PT_1_IN0,
      I1 => lower_dec_prs_state_fft1,
      I2 => lower_dec_dec_8b10b_prs_state_ffd1,
      I3 => lower_dec_dec_8b10b_prs_state_ffd2,
      I4 => lower_dec_err_chk_prs_state_ffd1,
      I5 => lower_dec_err_chk_prs_state_ffd2,
      O => lower_dec_prs_state_fft2_MC_D2_PT_1
    );
  lower_dec_prs_state_fft2_MC_D2_12 : X_OR2
    port map (
      I0 => lower_dec_prs_state_fft2_MC_D2_PT_0,
      I1 => lower_dec_prs_state_fft2_MC_D2_PT_1,
      O => lower_dec_prs_state_fft2_MC_D2
    );
  lower_dec_prs_state_fft2_MC_D_13 : X_XOR2
    port map (
      I0 => lower_dec_prs_state_fft2_MC_D_TFF,
      I1 => lower_dec_prs_state_fft2_MC_Q,
      O => lower_dec_prs_state_fft2_MC_D
    );
  lower_dec_prs_state_fft2_MC_XOR : X_XOR2
    port map (
      I0 => lower_dec_prs_state_fft2_MC_D1,
      I1 => lower_dec_prs_state_fft2_MC_D2,
      O => lower_dec_prs_state_fft2_MC_D_TFF
    );
  lower_dec_prs_state_fft1_14 : X_BUF
    port map (
      I => lower_dec_prs_state_fft1_MC_Q,
      O => lower_dec_prs_state_fft1
    );
  lower_dec_prs_state_fft1_MC_R_OR_PRLD_15 : X_OR2
    port map (
      I0 => FOOBAR1_ctinst_0,
      I1 => PRLD,
      O => lower_dec_prs_state_fft1_MC_R_OR_PRLD
    );
  lower_dec_prs_state_fft1_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => lower_dec_prs_state_fft1_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => lower_dec_prs_state_fft1_MC_R_OR_PRLD,
      O => lower_dec_prs_state_fft1_MC_Q
    );
  lower_dec_prs_state_fft1_MC_D1_16 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => lower_dec_prs_state_fft1_MC_D1
    );
  lower_dec_prs_state_fft1_MC_D2_PT_0_17 : X_AND3
    port map (
      I0 => lower_dec_prs_state_fft2,
      I1 => lower_dec_prs_state_fft1,
      I2 => NlwInverterSignal_lower_dec_prs_state_fft1_MC_D2_PT_0_IN2,
      O => lower_dec_prs_state_fft1_MC_D2_PT_0
    );
  lower_dec_prs_state_fft1_MC_D2_PT_1_18 : X_AND3
    port map (
      I0 => NlwInverterSignal_lower_dec_prs_state_fft1_MC_D2_PT_1_IN0,
      I1 => NlwInverterSignal_lower_dec_prs_state_fft1_MC_D2_PT_1_IN1,
      I2 => frame_in_dec_II_UIM,
      O => lower_dec_prs_state_fft1_MC_D2_PT_1
    );
  lower_dec_prs_state_fft1_MC_D2_19 : X_OR2
    port map (
      I0 => lower_dec_prs_state_fft1_MC_D2_PT_0,
      I1 => lower_dec_prs_state_fft1_MC_D2_PT_1,
      O => lower_dec_prs_state_fft1_MC_D2
    );
  lower_dec_prs_state_fft1_MC_D_20 : X_XOR2
    port map (
      I0 => lower_dec_prs_state_fft1_MC_D_TFF,
      I1 => lower_dec_prs_state_fft1_MC_Q,
      O => lower_dec_prs_state_fft1_MC_D
    );
  lower_dec_prs_state_fft1_MC_XOR : X_XOR2
    port map (
      I0 => lower_dec_prs_state_fft1_MC_D1,
      I1 => lower_dec_prs_state_fft1_MC_D2,
      O => lower_dec_prs_state_fft1_MC_D_TFF
    );
  frame_in_dec_II_UIM_21 : X_BUF
    port map (
      I => frame_in_dec,
      O => frame_in_dec_II_UIM
    );
  clk_II_FCLK_22 : X_BUF
    port map (
      I => clk,
      O => clk_II_FCLK
    );
  lower_dec_dec_8b10b_prs_state_ffd1_23 : X_BUF
    port map (
      I => lower_dec_dec_8b10b_prs_state_ffd1_MC_Q,
      O => lower_dec_dec_8b10b_prs_state_ffd1
    );
  lower_dec_dec_8b10b_prs_state_ffd1_MC_R_OR_PRLD_24 : X_OR2
    port map (
      I0 => FOOBAR1_ctinst_0,
      I1 => PRLD,
      O => lower_dec_dec_8b10b_prs_state_ffd1_MC_R_OR_PRLD
    );
  lower_dec_dec_8b10b_prs_state_ffd1_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => lower_dec_dec_8b10b_prs_state_ffd1_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => lower_dec_dec_8b10b_prs_state_ffd1_MC_R_OR_PRLD,
      O => lower_dec_dec_8b10b_prs_state_ffd1_MC_Q
    );
  lower_dec_dec_8b10b_prs_state_ffd1_MC_D1_25 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => lower_dec_dec_8b10b_prs_state_ffd1_MC_D1
    );
  lower_dec_dec_8b10b_prs_state_ffd1_MC_D2_PT_0_26 : X_AND2
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => NlwInverterSignal_lower_dec_dec_8b10b_prs_state_ffd1_MC_D2_PT_0_IN1,
      O => lower_dec_dec_8b10b_prs_state_ffd1_MC_D2_PT_0
    );
  lower_dec_dec_8b10b_prs_state_ffd1_MC_D2_PT_1_27 : X_AND3
    port map (
      I0 => NlwInverterSignal_lower_dec_dec_8b10b_prs_state_ffd1_MC_D2_PT_1_IN0,
      I1 => lower_dec_prs_state_fft1,
      I2 => NlwInverterSignal_lower_dec_dec_8b10b_prs_state_ffd1_MC_D2_PT_1_IN2,
      O => lower_dec_dec_8b10b_prs_state_ffd1_MC_D2_PT_1
    );
  lower_dec_dec_8b10b_prs_state_ffd1_MC_D2_28 : X_OR2
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1_MC_D2_PT_0,
      I1 => lower_dec_dec_8b10b_prs_state_ffd1_MC_D2_PT_1,
      O => lower_dec_dec_8b10b_prs_state_ffd1_MC_D2
    );
  lower_dec_dec_8b10b_prs_state_ffd1_MC_XOR : X_XOR2
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1_MC_D1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd1_MC_D2,
      O => lower_dec_dec_8b10b_prs_state_ffd1_MC_D
    );
  lower_dec_dec_8b10b_prs_state_ffd2_29 : X_BUF
    port map (
      I => lower_dec_dec_8b10b_prs_state_ffd2_MC_Q,
      O => lower_dec_dec_8b10b_prs_state_ffd2
    );
  lower_dec_dec_8b10b_prs_state_ffd2_MC_R_OR_PRLD_30 : X_OR2
    port map (
      I0 => FOOBAR1_ctinst_0,
      I1 => PRLD,
      O => lower_dec_dec_8b10b_prs_state_ffd2_MC_R_OR_PRLD
    );
  lower_dec_dec_8b10b_prs_state_ffd2_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => lower_dec_dec_8b10b_prs_state_ffd2_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => lower_dec_dec_8b10b_prs_state_ffd2_MC_R_OR_PRLD,
      O => lower_dec_dec_8b10b_prs_state_ffd2_MC_Q
    );
  lower_dec_dec_8b10b_prs_state_ffd2_MC_D1_31 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => lower_dec_dec_8b10b_prs_state_ffd2_MC_D1
    );
  lower_dec_dec_8b10b_prs_state_ffd2_MC_D2_PT_0_32 : X_AND2
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd1,
      O => lower_dec_dec_8b10b_prs_state_ffd2_MC_D2_PT_0
    );
  lower_dec_dec_8b10b_prs_state_ffd2_MC_D2_PT_1_33 : X_AND3
    port map (
      I0 => NlwInverterSignal_lower_dec_dec_8b10b_prs_state_ffd2_MC_D2_PT_1_IN0,
      I1 => lower_dec_prs_state_fft1,
      I2 => lower_dec_dec_8b10b_prs_state_ffd2,
      O => lower_dec_dec_8b10b_prs_state_ffd2_MC_D2_PT_1
    );
  lower_dec_dec_8b10b_prs_state_ffd2_MC_D2_34 : X_OR2
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd2_MC_D2_PT_0,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2_MC_D2_PT_1,
      O => lower_dec_dec_8b10b_prs_state_ffd2_MC_D2
    );
  lower_dec_dec_8b10b_prs_state_ffd2_MC_XOR : X_XOR2
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd2_MC_D1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2_MC_D2,
      O => lower_dec_dec_8b10b_prs_state_ffd2_MC_D
    );
  lower_dec_err_chk_prs_state_ffd1_35 : X_BUF
    port map (
      I => lower_dec_err_chk_prs_state_ffd1_MC_Q,
      O => lower_dec_err_chk_prs_state_ffd1
    );
  lower_dec_err_chk_prs_state_ffd1_MC_R_OR_PRLD_36 : X_OR2
    port map (
      I0 => FOOBAR1_ctinst_0,
      I1 => PRLD,
      O => lower_dec_err_chk_prs_state_ffd1_MC_R_OR_PRLD
    );
  lower_dec_err_chk_prs_state_ffd1_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => lower_dec_err_chk_prs_state_ffd1_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => lower_dec_err_chk_prs_state_ffd1_MC_R_OR_PRLD,
      O => lower_dec_err_chk_prs_state_ffd1_MC_Q
    );
  lower_dec_err_chk_prs_state_ffd1_MC_D1_37 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => lower_dec_err_chk_prs_state_ffd1_MC_D1
    );
  lower_dec_err_chk_prs_state_ffd1_MC_D2_PT_0_38 : X_AND2
    port map (
      I0 => lower_dec_err_chk_prs_state_ffd1,
      I1 => NlwInverterSignal_lower_dec_err_chk_prs_state_ffd1_MC_D2_PT_0_IN1,
      O => lower_dec_err_chk_prs_state_ffd1_MC_D2_PT_0
    );
  lower_dec_err_chk_prs_state_ffd1_MC_D2_PT_1_39 : X_AND3
    port map (
      I0 => NlwInverterSignal_lower_dec_err_chk_prs_state_ffd1_MC_D2_PT_1_IN0,
      I1 => lower_dec_prs_state_fft1,
      I2 => NlwInverterSignal_lower_dec_err_chk_prs_state_ffd1_MC_D2_PT_1_IN2,
      O => lower_dec_err_chk_prs_state_ffd1_MC_D2_PT_1
    );
  lower_dec_err_chk_prs_state_ffd1_MC_D2_40 : X_OR2
    port map (
      I0 => lower_dec_err_chk_prs_state_ffd1_MC_D2_PT_0,
      I1 => lower_dec_err_chk_prs_state_ffd1_MC_D2_PT_1,
      O => lower_dec_err_chk_prs_state_ffd1_MC_D2
    );
  lower_dec_err_chk_prs_state_ffd1_MC_XOR : X_XOR2
    port map (
      I0 => lower_dec_err_chk_prs_state_ffd1_MC_D1,
      I1 => lower_dec_err_chk_prs_state_ffd1_MC_D2,
      O => lower_dec_err_chk_prs_state_ffd1_MC_D
    );
  lower_dec_err_chk_prs_state_ffd2_41 : X_BUF
    port map (
      I => lower_dec_err_chk_prs_state_ffd2_MC_Q,
      O => lower_dec_err_chk_prs_state_ffd2
    );
  lower_dec_err_chk_prs_state_ffd2_MC_R_OR_PRLD_42 : X_OR2
    port map (
      I0 => FOOBAR1_ctinst_0,
      I1 => PRLD,
      O => lower_dec_err_chk_prs_state_ffd2_MC_R_OR_PRLD
    );
  lower_dec_err_chk_prs_state_ffd2_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => lower_dec_err_chk_prs_state_ffd2_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => lower_dec_err_chk_prs_state_ffd2_MC_R_OR_PRLD,
      O => lower_dec_err_chk_prs_state_ffd2_MC_Q
    );
  lower_dec_err_chk_prs_state_ffd2_MC_D1_43 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => lower_dec_err_chk_prs_state_ffd2_MC_D1
    );
  lower_dec_err_chk_prs_state_ffd2_MC_D2_PT_0_44 : X_AND2
    port map (
      I0 => lower_dec_err_chk_prs_state_ffd1,
      I1 => lower_dec_err_chk_prs_state_ffd1,
      O => lower_dec_err_chk_prs_state_ffd2_MC_D2_PT_0
    );
  lower_dec_err_chk_prs_state_ffd2_MC_D2_PT_1_45 : X_AND3
    port map (
      I0 => NlwInverterSignal_lower_dec_err_chk_prs_state_ffd2_MC_D2_PT_1_IN0,
      I1 => lower_dec_prs_state_fft1,
      I2 => lower_dec_err_chk_prs_state_ffd2,
      O => lower_dec_err_chk_prs_state_ffd2_MC_D2_PT_1
    );
  lower_dec_err_chk_prs_state_ffd2_MC_D2_46 : X_OR2
    port map (
      I0 => lower_dec_err_chk_prs_state_ffd2_MC_D2_PT_0,
      I1 => lower_dec_err_chk_prs_state_ffd2_MC_D2_PT_1,
      O => lower_dec_err_chk_prs_state_ffd2_MC_D2
    );
  lower_dec_err_chk_prs_state_ffd2_MC_XOR : X_XOR2
    port map (
      I0 => lower_dec_err_chk_prs_state_ffd2_MC_D1,
      I1 => lower_dec_err_chk_prs_state_ffd2_MC_D2,
      O => lower_dec_err_chk_prs_state_ffd2_MC_D
    );
  lower_dec_hout_47 : X_BUF
    port map (
      I => lower_dec_hout_MC_Q,
      O => lower_dec_hout
    );
  lower_dec_hout_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => lower_dec_hout_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => lower_dec_hout_MC_Q
    );
  lower_dec_hout_MC_D1_48 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => lower_dec_hout_MC_D1
    );
  lower_dec_hout_MC_D2_PT_0_49 : X_AND2
    port map (
      I0 => lower_dec_hout,
      I1 => NlwInverterSignal_lower_dec_hout_MC_D2_PT_0_IN1,
      O => lower_dec_hout_MC_D2_PT_0
    );
  lower_dec_hout_MC_D2_PT_1_50 : X_AND8
    port map (
      I0 => NlwInverterSignal_lower_dec_hout_MC_D2_PT_1_IN0,
      I1 => lower_dec_prs_state_fft1,
      I2 => lower_dec_dec_8b10b_prs_state_ffd1,
      I3 => lower_dec_dec_8b10b_prs_state_ffd2,
      I4 => rst_II_UIM,
      I5 => serial_data_1_II_UIM,
      I6 => NlwInverterSignal_lower_dec_hout_MC_D2_PT_1_IN6,
      I7 => NlwInverterSignal_lower_dec_hout_MC_D2_PT_1_IN7,
      O => lower_dec_hout_MC_D2_PT_1
    );
  lower_dec_hout_MC_D2_PT_2_51 : X_AND8
    port map (
      I0 => NlwInverterSignal_lower_dec_hout_MC_D2_PT_2_IN0,
      I1 => lower_dec_prs_state_fft1,
      I2 => lower_dec_dec_8b10b_prs_state_ffd1,
      I3 => lower_dec_dec_8b10b_prs_state_ffd2,
      I4 => rst_II_UIM,
      I5 => NlwInverterSignal_lower_dec_hout_MC_D2_PT_2_IN5,
      I6 => serial_data_0_II_UIM,
      I7 => N_PZ_188,
      O => lower_dec_hout_MC_D2_PT_2
    );
  lower_dec_hout_MC_D2_PT_3_52 : X_AND16
    port map (
      I0 => NlwInverterSignal_lower_dec_hout_MC_D2_PT_3_IN0,
      I1 => lower_dec_prs_state_fft1,
      I2 => lower_dec_dec_8b10b_prs_state_ffd1,
      I3 => lower_dec_dec_8b10b_prs_state_ffd2,
      I4 => rst_II_UIM,
      I5 => serial_data_1_II_UIM,
      I6 => serial_data_0_II_UIM,
      I7 => NlwInverterSignal_lower_dec_hout_MC_D2_PT_3_IN7,
      I8 => serial_data_2_II_UIM,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => lower_dec_hout_MC_D2_PT_3
    );
  lower_dec_hout_MC_D2_PT_4_53 : X_AND16
    port map (
      I0 => NlwInverterSignal_lower_dec_hout_MC_D2_PT_4_IN0,
      I1 => lower_dec_prs_state_fft1,
      I2 => lower_dec_dec_8b10b_prs_state_ffd1,
      I3 => lower_dec_dec_8b10b_prs_state_ffd2,
      I4 => rst_II_UIM,
      I5 => serial_data_1_II_UIM,
      I6 => NlwInverterSignal_lower_dec_hout_MC_D2_PT_4_IN6,
      I7 => serial_data_3_II_UIM,
      I8 => serial_data_2_II_UIM,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => lower_dec_hout_MC_D2_PT_4
    );
  lower_dec_hout_MC_D2_PT_5_54 : X_AND16
    port map (
      I0 => NlwInverterSignal_lower_dec_hout_MC_D2_PT_5_IN0,
      I1 => lower_dec_prs_state_fft1,
      I2 => lower_dec_dec_8b10b_prs_state_ffd1,
      I3 => lower_dec_dec_8b10b_prs_state_ffd2,
      I4 => rst_II_UIM,
      I5 => serial_data_1_II_UIM,
      I6 => NlwInverterSignal_lower_dec_hout_MC_D2_PT_5_IN6,
      I7 => NlwInverterSignal_lower_dec_hout_MC_D2_PT_5_IN7,
      I8 => NlwInverterSignal_lower_dec_hout_MC_D2_PT_5_IN8,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => lower_dec_hout_MC_D2_PT_5
    );
  lower_dec_hout_MC_D2_PT_6_55 : X_AND16
    port map (
      I0 => NlwInverterSignal_lower_dec_hout_MC_D2_PT_6_IN0,
      I1 => lower_dec_prs_state_fft1,
      I2 => lower_dec_dec_8b10b_prs_state_ffd1,
      I3 => lower_dec_dec_8b10b_prs_state_ffd2,
      I4 => rst_II_UIM,
      I5 => NlwInverterSignal_lower_dec_hout_MC_D2_PT_6_IN5,
      I6 => serial_data_0_II_UIM,
      I7 => serial_data_3_II_UIM,
      I8 => serial_data_2_II_UIM,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => lower_dec_hout_MC_D2_PT_6
    );
  lower_dec_hout_MC_D2_PT_7_56 : X_AND16
    port map (
      I0 => NlwInverterSignal_lower_dec_hout_MC_D2_PT_7_IN0,
      I1 => lower_dec_prs_state_fft1,
      I2 => lower_dec_dec_8b10b_prs_state_ffd1,
      I3 => lower_dec_dec_8b10b_prs_state_ffd2,
      I4 => rst_II_UIM,
      I5 => NlwInverterSignal_lower_dec_hout_MC_D2_PT_7_IN5,
      I6 => serial_data_0_II_UIM,
      I7 => NlwInverterSignal_lower_dec_hout_MC_D2_PT_7_IN7,
      I8 => NlwInverterSignal_lower_dec_hout_MC_D2_PT_7_IN8,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => lower_dec_hout_MC_D2_PT_7
    );
  lower_dec_hout_MC_D2_PT_8_57 : X_AND16
    port map (
      I0 => NlwInverterSignal_lower_dec_hout_MC_D2_PT_8_IN0,
      I1 => lower_dec_prs_state_fft1,
      I2 => lower_dec_dec_8b10b_prs_state_ffd1,
      I3 => lower_dec_dec_8b10b_prs_state_ffd2,
      I4 => rst_II_UIM,
      I5 => NlwInverterSignal_lower_dec_hout_MC_D2_PT_8_IN5,
      I6 => NlwInverterSignal_lower_dec_hout_MC_D2_PT_8_IN6,
      I7 => serial_data_3_II_UIM,
      I8 => NlwInverterSignal_lower_dec_hout_MC_D2_PT_8_IN8,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => lower_dec_hout_MC_D2_PT_8
    );
  lower_dec_hout_MC_D2_58 : X_OR16
    port map (
      I0 => lower_dec_hout_MC_D2_PT_0,
      I1 => lower_dec_hout_MC_D2_PT_1,
      I2 => lower_dec_hout_MC_D2_PT_2,
      I3 => lower_dec_hout_MC_D2_PT_3,
      I4 => lower_dec_hout_MC_D2_PT_4,
      I5 => lower_dec_hout_MC_D2_PT_5,
      I6 => lower_dec_hout_MC_D2_PT_6,
      I7 => lower_dec_hout_MC_D2_PT_7,
      I8 => lower_dec_hout_MC_D2_PT_8,
      I9 => GND,
      I10 => GND,
      I11 => GND,
      I12 => GND,
      I13 => GND,
      I14 => GND,
      I15 => GND,
      O => lower_dec_hout_MC_D2
    );
  lower_dec_hout_MC_XOR : X_XOR2
    port map (
      I0 => lower_dec_hout_MC_D1,
      I1 => lower_dec_hout_MC_D2,
      O => lower_dec_hout_MC_D
    );
  serial_data_1_II_UIM_59 : X_BUF
    port map (
      I => serial_data(1),
      O => serial_data_1_II_UIM
    );
  serial_data_0_II_UIM_60 : X_BUF
    port map (
      I => serial_data(0),
      O => serial_data_0_II_UIM
    );
  N_PZ_188_61 : X_BUF
    port map (
      I => N_PZ_188_MC_Q,
      O => N_PZ_188
    );
  N_PZ_188_MC_REG : X_BUF
    port map (
      I => N_PZ_188_MC_D,
      O => N_PZ_188_MC_Q
    );
  N_PZ_188_MC_D1_PT_0_62 : X_AND3
    port map (
      I0 => NlwInverterSignal_N_PZ_188_MC_D1_PT_0_IN0,
      I1 => NlwInverterSignal_N_PZ_188_MC_D1_PT_0_IN1,
      I2 => N_PZ_309,
      O => N_PZ_188_MC_D1_PT_0
    );
  N_PZ_188_MC_D1_63 : X_OR2
    port map (
      I0 => N_PZ_188_MC_D1_PT_0,
      I1 => N_PZ_188_MC_D1_PT_0,
      O => N_PZ_188_MC_D1
    );
  N_PZ_188_MC_D2_64 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => N_PZ_188_MC_D2
    );
  N_PZ_188_MC_XOR : X_XOR2
    port map (
      I0 => N_PZ_188_MC_D1,
      I1 => N_PZ_188_MC_D2,
      O => N_PZ_188_MC_D
    );
  serial_data_5_II_UIM_65 : X_BUF
    port map (
      I => serial_data(5),
      O => serial_data_5_II_UIM
    );
  serial_data_4_II_UIM_66 : X_BUF
    port map (
      I => serial_data(4),
      O => serial_data_4_II_UIM
    );
  N_PZ_309_67 : X_BUF
    port map (
      I => N_PZ_309_MC_Q,
      O => N_PZ_309
    );
  N_PZ_309_MC_REG : X_BUF
    port map (
      I => N_PZ_309_MC_D,
      O => N_PZ_309_MC_Q
    );
  N_PZ_309_MC_D1_PT_0_68 : X_AND2
    port map (
      I0 => NlwInverterSignal_N_PZ_309_MC_D1_PT_0_IN0,
      I1 => NlwInverterSignal_N_PZ_309_MC_D1_PT_0_IN1,
      O => N_PZ_309_MC_D1_PT_0
    );
  N_PZ_309_MC_D1_69 : X_OR2
    port map (
      I0 => N_PZ_309_MC_D1_PT_0,
      I1 => N_PZ_309_MC_D1_PT_0,
      O => N_PZ_309_MC_D1
    );
  N_PZ_309_MC_D2_70 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => N_PZ_309_MC_D2
    );
  N_PZ_309_MC_XOR : X_XOR2
    port map (
      I0 => N_PZ_309_MC_D1,
      I1 => N_PZ_309_MC_D2,
      O => N_PZ_309_MC_D
    );
  serial_data_7_II_UIM_71 : X_BUF
    port map (
      I => serial_data(7),
      O => serial_data_7_II_UIM
    );
  serial_data_6_II_UIM_72 : X_BUF
    port map (
      I => serial_data(6),
      O => serial_data_6_II_UIM
    );
  serial_data_3_II_UIM_73 : X_BUF
    port map (
      I => serial_data(3),
      O => serial_data_3_II_UIM
    );
  serial_data_2_II_UIM_74 : X_BUF
    port map (
      I => serial_data(2),
      O => serial_data_2_II_UIM
    );
  decoded_data_10_Q : X_BUF
    port map (
      I => decoded_data_10_MC_Q,
      O => decoded_data(10)
    );
  decoded_data_10_MC_Q_75 : X_BUF
    port map (
      I => decoded_data_10_MC_Q_tsim_ireg_Q,
      O => decoded_data_10_MC_Q
    );
  decoded_data_10_MC_REG : X_BUF
    port map (
      I => decoded_data_10_MC_D,
      O => decoded_data_10_MC_Q_tsim_ireg_Q
    );
  decoded_data_10_MC_D1_PT_0_76 : X_AND3
    port map (
      I0 => upper_dec_prs_state_fft2,
      I1 => upper_dec_prs_state_fft1,
      I2 => upper_dec_fout,
      O => decoded_data_10_MC_D1_PT_0
    );
  decoded_data_10_MC_D1_77 : X_OR2
    port map (
      I0 => decoded_data_10_MC_D1_PT_0,
      I1 => decoded_data_10_MC_D1_PT_0,
      O => decoded_data_10_MC_D1
    );
  decoded_data_10_MC_D2_78 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => decoded_data_10_MC_D2
    );
  decoded_data_10_MC_XOR : X_XOR2
    port map (
      I0 => decoded_data_10_MC_D1,
      I1 => decoded_data_10_MC_D2,
      O => decoded_data_10_MC_D
    );
  decoded_data_10_MC_UIM_79 : X_BUF
    port map (
      I => decoded_data_10_MC_Q_tsim_ireg_Q,
      O => decoded_data_10_MC_UIM
    );
  upper_dec_prs_state_fft2_80 : X_BUF
    port map (
      I => upper_dec_prs_state_fft2_MC_Q,
      O => upper_dec_prs_state_fft2
    );
  upper_dec_prs_state_fft2_MC_R_OR_PRLD_81 : X_OR2
    port map (
      I0 => FOOBAR1_ctinst_0,
      I1 => PRLD,
      O => upper_dec_prs_state_fft2_MC_R_OR_PRLD
    );
  upper_dec_prs_state_fft2_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => upper_dec_prs_state_fft2_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => upper_dec_prs_state_fft2_MC_R_OR_PRLD,
      O => upper_dec_prs_state_fft2_MC_Q
    );
  upper_dec_prs_state_fft2_MC_D1_82 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => upper_dec_prs_state_fft2_MC_D1
    );
  upper_dec_prs_state_fft2_MC_D2_PT_0_83 : X_AND3
    port map (
      I0 => NlwInverterSignal_upper_dec_prs_state_fft2_MC_D2_PT_0_IN0,
      I1 => upper_dec_prs_state_fft2,
      I2 => upper_dec_prs_state_fft1,
      O => upper_dec_prs_state_fft2_MC_D2_PT_0
    );
  upper_dec_prs_state_fft2_MC_D2_PT_1_84 : X_AND6
    port map (
      I0 => NlwInverterSignal_upper_dec_prs_state_fft2_MC_D2_PT_1_IN0,
      I1 => upper_dec_prs_state_fft1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd1,
      I3 => upper_dec_dec_8b10b_prs_state_ffd2,
      I4 => upper_dec_err_chk_prs_state_ffd1,
      I5 => upper_dec_err_chk_prs_state_ffd2,
      O => upper_dec_prs_state_fft2_MC_D2_PT_1
    );
  upper_dec_prs_state_fft2_MC_D2_85 : X_OR2
    port map (
      I0 => upper_dec_prs_state_fft2_MC_D2_PT_0,
      I1 => upper_dec_prs_state_fft2_MC_D2_PT_1,
      O => upper_dec_prs_state_fft2_MC_D2
    );
  upper_dec_prs_state_fft2_MC_D_86 : X_XOR2
    port map (
      I0 => upper_dec_prs_state_fft2_MC_D_TFF,
      I1 => upper_dec_prs_state_fft2_MC_Q,
      O => upper_dec_prs_state_fft2_MC_D
    );
  upper_dec_prs_state_fft2_MC_XOR : X_XOR2
    port map (
      I0 => upper_dec_prs_state_fft2_MC_D1,
      I1 => upper_dec_prs_state_fft2_MC_D2,
      O => upper_dec_prs_state_fft2_MC_D_TFF
    );
  upper_dec_prs_state_fft1_87 : X_BUF
    port map (
      I => upper_dec_prs_state_fft1_MC_Q,
      O => upper_dec_prs_state_fft1
    );
  upper_dec_prs_state_fft1_MC_R_OR_PRLD_88 : X_OR2
    port map (
      I0 => FOOBAR1_ctinst_0,
      I1 => PRLD,
      O => upper_dec_prs_state_fft1_MC_R_OR_PRLD
    );
  upper_dec_prs_state_fft1_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => upper_dec_prs_state_fft1_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => upper_dec_prs_state_fft1_MC_R_OR_PRLD,
      O => upper_dec_prs_state_fft1_MC_Q
    );
  upper_dec_prs_state_fft1_MC_D1_89 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => upper_dec_prs_state_fft1_MC_D1
    );
  upper_dec_prs_state_fft1_MC_D2_PT_0_90 : X_AND3
    port map (
      I0 => frame_in_dec_II_UIM,
      I1 => NlwInverterSignal_upper_dec_prs_state_fft1_MC_D2_PT_0_IN1,
      I2 => NlwInverterSignal_upper_dec_prs_state_fft1_MC_D2_PT_0_IN2,
      O => upper_dec_prs_state_fft1_MC_D2_PT_0
    );
  upper_dec_prs_state_fft1_MC_D2_PT_1_91 : X_AND3
    port map (
      I0 => NlwInverterSignal_upper_dec_prs_state_fft1_MC_D2_PT_1_IN0,
      I1 => upper_dec_prs_state_fft2,
      I2 => upper_dec_prs_state_fft1,
      O => upper_dec_prs_state_fft1_MC_D2_PT_1
    );
  upper_dec_prs_state_fft1_MC_D2_92 : X_OR2
    port map (
      I0 => upper_dec_prs_state_fft1_MC_D2_PT_0,
      I1 => upper_dec_prs_state_fft1_MC_D2_PT_1,
      O => upper_dec_prs_state_fft1_MC_D2
    );
  upper_dec_prs_state_fft1_MC_D_93 : X_XOR2
    port map (
      I0 => upper_dec_prs_state_fft1_MC_D_TFF,
      I1 => upper_dec_prs_state_fft1_MC_Q,
      O => upper_dec_prs_state_fft1_MC_D
    );
  upper_dec_prs_state_fft1_MC_XOR : X_XOR2
    port map (
      I0 => upper_dec_prs_state_fft1_MC_D1,
      I1 => upper_dec_prs_state_fft1_MC_D2,
      O => upper_dec_prs_state_fft1_MC_D_TFF
    );
  upper_dec_dec_8b10b_prs_state_ffd1_94 : X_BUF
    port map (
      I => upper_dec_dec_8b10b_prs_state_ffd1_MC_Q,
      O => upper_dec_dec_8b10b_prs_state_ffd1
    );
  upper_dec_dec_8b10b_prs_state_ffd1_MC_R_OR_PRLD_95 : X_OR2
    port map (
      I0 => FOOBAR1_ctinst_0,
      I1 => PRLD,
      O => upper_dec_dec_8b10b_prs_state_ffd1_MC_R_OR_PRLD
    );
  upper_dec_dec_8b10b_prs_state_ffd1_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => upper_dec_dec_8b10b_prs_state_ffd1_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => upper_dec_dec_8b10b_prs_state_ffd1_MC_R_OR_PRLD,
      O => upper_dec_dec_8b10b_prs_state_ffd1_MC_Q
    );
  upper_dec_dec_8b10b_prs_state_ffd1_MC_D1_96 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => upper_dec_dec_8b10b_prs_state_ffd1_MC_D1
    );
  upper_dec_dec_8b10b_prs_state_ffd1_MC_D2_PT_0_97 : X_AND2
    port map (
      I0 => upper_dec_dec_8b10b_prs_state_ffd1,
      I1 => NlwInverterSignal_upper_dec_dec_8b10b_prs_state_ffd1_MC_D2_PT_0_IN1,
      O => upper_dec_dec_8b10b_prs_state_ffd1_MC_D2_PT_0
    );
  upper_dec_dec_8b10b_prs_state_ffd1_MC_D2_PT_1_98 : X_AND3
    port map (
      I0 => NlwInverterSignal_upper_dec_dec_8b10b_prs_state_ffd1_MC_D2_PT_1_IN0,
      I1 => upper_dec_prs_state_fft1,
      I2 => NlwInverterSignal_upper_dec_dec_8b10b_prs_state_ffd1_MC_D2_PT_1_IN2,
      O => upper_dec_dec_8b10b_prs_state_ffd1_MC_D2_PT_1
    );
  upper_dec_dec_8b10b_prs_state_ffd1_MC_D2_99 : X_OR2
    port map (
      I0 => upper_dec_dec_8b10b_prs_state_ffd1_MC_D2_PT_0,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1_MC_D2_PT_1,
      O => upper_dec_dec_8b10b_prs_state_ffd1_MC_D2
    );
  upper_dec_dec_8b10b_prs_state_ffd1_MC_XOR : X_XOR2
    port map (
      I0 => upper_dec_dec_8b10b_prs_state_ffd1_MC_D1,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1_MC_D2,
      O => upper_dec_dec_8b10b_prs_state_ffd1_MC_D
    );
  upper_dec_dec_8b10b_prs_state_ffd2_100 : X_BUF
    port map (
      I => upper_dec_dec_8b10b_prs_state_ffd2_MC_Q,
      O => upper_dec_dec_8b10b_prs_state_ffd2
    );
  upper_dec_dec_8b10b_prs_state_ffd2_MC_R_OR_PRLD_101 : X_OR2
    port map (
      I0 => FOOBAR1_ctinst_0,
      I1 => PRLD,
      O => upper_dec_dec_8b10b_prs_state_ffd2_MC_R_OR_PRLD
    );
  upper_dec_dec_8b10b_prs_state_ffd2_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => upper_dec_dec_8b10b_prs_state_ffd2_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => upper_dec_dec_8b10b_prs_state_ffd2_MC_R_OR_PRLD,
      O => upper_dec_dec_8b10b_prs_state_ffd2_MC_Q
    );
  upper_dec_dec_8b10b_prs_state_ffd2_MC_D1_102 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => upper_dec_dec_8b10b_prs_state_ffd2_MC_D1
    );
  upper_dec_dec_8b10b_prs_state_ffd2_MC_D2_PT_0_103 : X_AND2
    port map (
      I0 => upper_dec_dec_8b10b_prs_state_ffd1,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      O => upper_dec_dec_8b10b_prs_state_ffd2_MC_D2_PT_0
    );
  upper_dec_dec_8b10b_prs_state_ffd2_MC_D2_PT_1_104 : X_AND3
    port map (
      I0 => NlwInverterSignal_upper_dec_dec_8b10b_prs_state_ffd2_MC_D2_PT_1_IN0,
      I1 => upper_dec_prs_state_fft1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      O => upper_dec_dec_8b10b_prs_state_ffd2_MC_D2_PT_1
    );
  upper_dec_dec_8b10b_prs_state_ffd2_MC_D2_105 : X_OR2
    port map (
      I0 => upper_dec_dec_8b10b_prs_state_ffd2_MC_D2_PT_0,
      I1 => upper_dec_dec_8b10b_prs_state_ffd2_MC_D2_PT_1,
      O => upper_dec_dec_8b10b_prs_state_ffd2_MC_D2
    );
  upper_dec_dec_8b10b_prs_state_ffd2_MC_XOR : X_XOR2
    port map (
      I0 => upper_dec_dec_8b10b_prs_state_ffd2_MC_D1,
      I1 => upper_dec_dec_8b10b_prs_state_ffd2_MC_D2,
      O => upper_dec_dec_8b10b_prs_state_ffd2_MC_D
    );
  upper_dec_err_chk_prs_state_ffd1_106 : X_BUF
    port map (
      I => upper_dec_err_chk_prs_state_ffd1_MC_Q,
      O => upper_dec_err_chk_prs_state_ffd1
    );
  upper_dec_err_chk_prs_state_ffd1_MC_R_OR_PRLD_107 : X_OR2
    port map (
      I0 => FOOBAR1_ctinst_0,
      I1 => PRLD,
      O => upper_dec_err_chk_prs_state_ffd1_MC_R_OR_PRLD
    );
  upper_dec_err_chk_prs_state_ffd1_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => upper_dec_err_chk_prs_state_ffd1_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => upper_dec_err_chk_prs_state_ffd1_MC_R_OR_PRLD,
      O => upper_dec_err_chk_prs_state_ffd1_MC_Q
    );
  upper_dec_err_chk_prs_state_ffd1_MC_D1_108 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => upper_dec_err_chk_prs_state_ffd1_MC_D1
    );
  upper_dec_err_chk_prs_state_ffd1_MC_D2_PT_0_109 : X_AND2
    port map (
      I0 => upper_dec_err_chk_prs_state_ffd1,
      I1 => NlwInverterSignal_upper_dec_err_chk_prs_state_ffd1_MC_D2_PT_0_IN1,
      O => upper_dec_err_chk_prs_state_ffd1_MC_D2_PT_0
    );
  upper_dec_err_chk_prs_state_ffd1_MC_D2_PT_1_110 : X_AND3
    port map (
      I0 => NlwInverterSignal_upper_dec_err_chk_prs_state_ffd1_MC_D2_PT_1_IN0,
      I1 => upper_dec_prs_state_fft1,
      I2 => NlwInverterSignal_upper_dec_err_chk_prs_state_ffd1_MC_D2_PT_1_IN2,
      O => upper_dec_err_chk_prs_state_ffd1_MC_D2_PT_1
    );
  upper_dec_err_chk_prs_state_ffd1_MC_D2_111 : X_OR2
    port map (
      I0 => upper_dec_err_chk_prs_state_ffd1_MC_D2_PT_0,
      I1 => upper_dec_err_chk_prs_state_ffd1_MC_D2_PT_1,
      O => upper_dec_err_chk_prs_state_ffd1_MC_D2
    );
  upper_dec_err_chk_prs_state_ffd1_MC_XOR : X_XOR2
    port map (
      I0 => upper_dec_err_chk_prs_state_ffd1_MC_D1,
      I1 => upper_dec_err_chk_prs_state_ffd1_MC_D2,
      O => upper_dec_err_chk_prs_state_ffd1_MC_D
    );
  upper_dec_err_chk_prs_state_ffd2_112 : X_BUF
    port map (
      I => upper_dec_err_chk_prs_state_ffd2_MC_Q,
      O => upper_dec_err_chk_prs_state_ffd2
    );
  upper_dec_err_chk_prs_state_ffd2_MC_R_OR_PRLD_113 : X_OR2
    port map (
      I0 => FOOBAR1_ctinst_0,
      I1 => PRLD,
      O => upper_dec_err_chk_prs_state_ffd2_MC_R_OR_PRLD
    );
  upper_dec_err_chk_prs_state_ffd2_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => upper_dec_err_chk_prs_state_ffd2_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => upper_dec_err_chk_prs_state_ffd2_MC_R_OR_PRLD,
      O => upper_dec_err_chk_prs_state_ffd2_MC_Q
    );
  upper_dec_err_chk_prs_state_ffd2_MC_D1_114 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => upper_dec_err_chk_prs_state_ffd2_MC_D1
    );
  upper_dec_err_chk_prs_state_ffd2_MC_D2_PT_0_115 : X_AND2
    port map (
      I0 => upper_dec_err_chk_prs_state_ffd1,
      I1 => upper_dec_err_chk_prs_state_ffd1,
      O => upper_dec_err_chk_prs_state_ffd2_MC_D2_PT_0
    );
  upper_dec_err_chk_prs_state_ffd2_MC_D2_PT_1_116 : X_AND3
    port map (
      I0 => NlwInverterSignal_upper_dec_err_chk_prs_state_ffd2_MC_D2_PT_1_IN0,
      I1 => upper_dec_prs_state_fft1,
      I2 => upper_dec_err_chk_prs_state_ffd2,
      O => upper_dec_err_chk_prs_state_ffd2_MC_D2_PT_1
    );
  upper_dec_err_chk_prs_state_ffd2_MC_D2_117 : X_OR2
    port map (
      I0 => upper_dec_err_chk_prs_state_ffd2_MC_D2_PT_0,
      I1 => upper_dec_err_chk_prs_state_ffd2_MC_D2_PT_1,
      O => upper_dec_err_chk_prs_state_ffd2_MC_D2
    );
  upper_dec_err_chk_prs_state_ffd2_MC_XOR : X_XOR2
    port map (
      I0 => upper_dec_err_chk_prs_state_ffd2_MC_D1,
      I1 => upper_dec_err_chk_prs_state_ffd2_MC_D2,
      O => upper_dec_err_chk_prs_state_ffd2_MC_D
    );
  upper_dec_fout_118 : X_BUF
    port map (
      I => upper_dec_fout_MC_Q,
      O => upper_dec_fout
    );
  upper_dec_fout_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => upper_dec_fout_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => upper_dec_fout_MC_Q
    );
  upper_dec_fout_MC_D1_119 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => upper_dec_fout_MC_D1
    );
  upper_dec_fout_MC_D2_PT_0_120 : X_AND2
    port map (
      I0 => NlwInverterSignal_upper_dec_fout_MC_D2_PT_0_IN0,
      I1 => upper_dec_fout,
      O => upper_dec_fout_MC_D2_PT_0
    );
  upper_dec_fout_MC_D2_PT_1_121 : X_AND6
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => upper_dec_hin,
      I4 => upper_dec_jin,
      I5 => NlwInverterSignal_upper_dec_fout_MC_D2_PT_1_IN5,
      O => upper_dec_fout_MC_D2_PT_1
    );
  upper_dec_fout_MC_D2_PT_2_122 : X_AND6
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => NlwInverterSignal_upper_dec_fout_MC_D2_PT_2_IN3,
      I4 => NlwInverterSignal_upper_dec_fout_MC_D2_PT_2_IN4,
      I5 => upper_dec_fin,
      O => upper_dec_fout_MC_D2_PT_2
    );
  upper_dec_fout_MC_D2_PT_3_123 : X_AND6
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => upper_dec_jin,
      I4 => NlwInverterSignal_upper_dec_fout_MC_D2_PT_3_IN4,
      I5 => N_PZ_189,
      O => upper_dec_fout_MC_D2_PT_3
    );
  upper_dec_fout_MC_D2_PT_4_124 : X_AND6
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => NlwInverterSignal_upper_dec_fout_MC_D2_PT_4_IN3,
      I4 => upper_dec_fin,
      I5 => NlwInverterSignal_upper_dec_fout_MC_D2_PT_4_IN5,
      O => upper_dec_fout_MC_D2_PT_4
    );
  upper_dec_fout_MC_D2_PT_5_125 : X_AND7
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => upper_dec_hin,
      I4 => NlwInverterSignal_upper_dec_fout_MC_D2_PT_5_IN4,
      I5 => N_PZ_189,
      I6 => upper_dec_gin,
      O => upper_dec_fout_MC_D2_PT_5
    );
  upper_dec_fout_MC_D2_PT_6_126 : X_AND7
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => NlwInverterSignal_upper_dec_fout_MC_D2_PT_6_IN3,
      I4 => upper_dec_jin,
      I5 => NlwInverterSignal_upper_dec_fout_MC_D2_PT_6_IN5,
      I6 => NlwInverterSignal_upper_dec_fout_MC_D2_PT_6_IN6,
      O => upper_dec_fout_MC_D2_PT_6
    );
  upper_dec_fout_MC_D2_127 : X_OR7
    port map (
      I0 => upper_dec_fout_MC_D2_PT_0,
      I1 => upper_dec_fout_MC_D2_PT_1,
      I2 => upper_dec_fout_MC_D2_PT_2,
      I3 => upper_dec_fout_MC_D2_PT_3,
      I4 => upper_dec_fout_MC_D2_PT_4,
      I5 => upper_dec_fout_MC_D2_PT_5,
      I6 => upper_dec_fout_MC_D2_PT_6,
      O => upper_dec_fout_MC_D2
    );
  upper_dec_fout_MC_XOR : X_XOR2
    port map (
      I0 => upper_dec_fout_MC_D1,
      I1 => upper_dec_fout_MC_D2,
      O => upper_dec_fout_MC_D
    );
  upper_dec_hin_128 : X_BUF
    port map (
      I => upper_dec_hin_MC_Q,
      O => upper_dec_hin
    );
  upper_dec_hin_MC_REG : X_BUF
    port map (
      I => upper_dec_hin_MC_D,
      O => upper_dec_hin_MC_Q
    );
  upper_dec_hin_MC_D1_PT_0_129 : X_AND3
    port map (
      I0 => NlwInverterSignal_upper_dec_hin_MC_D1_PT_0_IN0,
      I1 => upper_dec_prs_state_fft1,
      I2 => serial_data_11_II_UIM,
      O => upper_dec_hin_MC_D1_PT_0
    );
  upper_dec_hin_MC_D1_130 : X_OR2
    port map (
      I0 => upper_dec_hin_MC_D1_PT_0,
      I1 => upper_dec_hin_MC_D1_PT_0,
      O => upper_dec_hin_MC_D1
    );
  upper_dec_hin_MC_D2_131 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => upper_dec_hin_MC_D2
    );
  upper_dec_hin_MC_XOR : X_XOR2
    port map (
      I0 => upper_dec_hin_MC_D1,
      I1 => upper_dec_hin_MC_D2,
      O => upper_dec_hin_MC_D
    );
  serial_data_11_II_UIM_132 : X_BUF
    port map (
      I => serial_data(11),
      O => serial_data_11_II_UIM
    );
  upper_dec_jin_133 : X_BUF
    port map (
      I => upper_dec_jin_MC_Q,
      O => upper_dec_jin
    );
  upper_dec_jin_MC_REG : X_BUF
    port map (
      I => upper_dec_jin_MC_D,
      O => upper_dec_jin_MC_Q
    );
  upper_dec_jin_MC_D1_PT_0_134 : X_AND3
    port map (
      I0 => NlwInverterSignal_upper_dec_jin_MC_D1_PT_0_IN0,
      I1 => upper_dec_prs_state_fft1,
      I2 => serial_data_10_II_UIM,
      O => upper_dec_jin_MC_D1_PT_0
    );
  upper_dec_jin_MC_D1_135 : X_OR2
    port map (
      I0 => upper_dec_jin_MC_D1_PT_0,
      I1 => upper_dec_jin_MC_D1_PT_0,
      O => upper_dec_jin_MC_D1
    );
  upper_dec_jin_MC_D2_136 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => upper_dec_jin_MC_D2
    );
  upper_dec_jin_MC_XOR : X_XOR2
    port map (
      I0 => upper_dec_jin_MC_D1,
      I1 => upper_dec_jin_MC_D2,
      O => upper_dec_jin_MC_D
    );
  serial_data_10_II_UIM_137 : X_BUF
    port map (
      I => serial_data(10),
      O => serial_data_10_II_UIM
    );
  upper_dec_fin_138 : X_BUF
    port map (
      I => upper_dec_fin_MC_Q,
      O => upper_dec_fin
    );
  upper_dec_fin_MC_REG : X_BUF
    port map (
      I => upper_dec_fin_MC_D,
      O => upper_dec_fin_MC_Q
    );
  upper_dec_fin_MC_D1_PT_0_139 : X_AND3
    port map (
      I0 => NlwInverterSignal_upper_dec_fin_MC_D1_PT_0_IN0,
      I1 => upper_dec_prs_state_fft1,
      I2 => serial_data_13_II_UIM,
      O => upper_dec_fin_MC_D1_PT_0
    );
  upper_dec_fin_MC_D1_140 : X_OR2
    port map (
      I0 => upper_dec_fin_MC_D1_PT_0,
      I1 => upper_dec_fin_MC_D1_PT_0,
      O => upper_dec_fin_MC_D1
    );
  upper_dec_fin_MC_D2_141 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => upper_dec_fin_MC_D2
    );
  upper_dec_fin_MC_XOR : X_XOR2
    port map (
      I0 => upper_dec_fin_MC_D1,
      I1 => upper_dec_fin_MC_D2,
      O => upper_dec_fin_MC_D
    );
  serial_data_13_II_UIM_142 : X_BUF
    port map (
      I => serial_data(13),
      O => serial_data_13_II_UIM
    );
  N_PZ_189_143 : X_BUF
    port map (
      I => N_PZ_189_MC_Q,
      O => N_PZ_189
    );
  N_PZ_189_MC_REG : X_BUF
    port map (
      I => N_PZ_189_MC_D,
      O => N_PZ_189_MC_Q
    );
  N_PZ_189_MC_D1_PT_0_144 : X_AND3
    port map (
      I0 => NlwInverterSignal_N_PZ_189_MC_D1_PT_0_IN0,
      I1 => NlwInverterSignal_N_PZ_189_MC_D1_PT_0_IN1,
      I2 => N_PZ_305,
      O => N_PZ_189_MC_D1_PT_0
    );
  N_PZ_189_MC_D1_145 : X_OR2
    port map (
      I0 => N_PZ_189_MC_D1_PT_0,
      I1 => N_PZ_189_MC_D1_PT_0,
      O => N_PZ_189_MC_D1
    );
  N_PZ_189_MC_D2_146 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => N_PZ_189_MC_D2
    );
  N_PZ_189_MC_XOR : X_XOR2
    port map (
      I0 => N_PZ_189_MC_D1,
      I1 => N_PZ_189_MC_D2,
      O => N_PZ_189_MC_D
    );
  upper_dec_iin_147 : X_BUF
    port map (
      I => upper_dec_iin_MC_Q,
      O => upper_dec_iin
    );
  upper_dec_iin_MC_REG : X_BUF
    port map (
      I => upper_dec_iin_MC_D,
      O => upper_dec_iin_MC_Q
    );
  upper_dec_iin_MC_D1_PT_0_148 : X_AND3
    port map (
      I0 => NlwInverterSignal_upper_dec_iin_MC_D1_PT_0_IN0,
      I1 => upper_dec_prs_state_fft1,
      I2 => serial_data_14_II_UIM,
      O => upper_dec_iin_MC_D1_PT_0
    );
  upper_dec_iin_MC_D1_149 : X_OR2
    port map (
      I0 => upper_dec_iin_MC_D1_PT_0,
      I1 => upper_dec_iin_MC_D1_PT_0,
      O => upper_dec_iin_MC_D1
    );
  upper_dec_iin_MC_D2_150 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => upper_dec_iin_MC_D2
    );
  upper_dec_iin_MC_XOR : X_XOR2
    port map (
      I0 => upper_dec_iin_MC_D1,
      I1 => upper_dec_iin_MC_D2,
      O => upper_dec_iin_MC_D
    );
  serial_data_14_II_UIM_151 : X_BUF
    port map (
      I => serial_data(14),
      O => serial_data_14_II_UIM
    );
  upper_dec_ein_152 : X_BUF
    port map (
      I => upper_dec_ein_MC_Q,
      O => upper_dec_ein
    );
  upper_dec_ein_MC_REG : X_BUF
    port map (
      I => upper_dec_ein_MC_D,
      O => upper_dec_ein_MC_Q
    );
  upper_dec_ein_MC_D1_PT_0_153 : X_AND3
    port map (
      I0 => NlwInverterSignal_upper_dec_ein_MC_D1_PT_0_IN0,
      I1 => upper_dec_prs_state_fft1,
      I2 => serial_data_15_II_UIM,
      O => upper_dec_ein_MC_D1_PT_0
    );
  upper_dec_ein_MC_D1_154 : X_OR2
    port map (
      I0 => upper_dec_ein_MC_D1_PT_0,
      I1 => upper_dec_ein_MC_D1_PT_0,
      O => upper_dec_ein_MC_D1
    );
  upper_dec_ein_MC_D2_155 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => upper_dec_ein_MC_D2
    );
  upper_dec_ein_MC_XOR : X_XOR2
    port map (
      I0 => upper_dec_ein_MC_D1,
      I1 => upper_dec_ein_MC_D2,
      O => upper_dec_ein_MC_D
    );
  serial_data_15_II_UIM_156 : X_BUF
    port map (
      I => serial_data(15),
      O => serial_data_15_II_UIM
    );
  N_PZ_305_157 : X_BUF
    port map (
      I => N_PZ_305_MC_Q,
      O => N_PZ_305
    );
  N_PZ_305_MC_REG : X_BUF
    port map (
      I => N_PZ_305_MC_D,
      O => N_PZ_305_MC_Q
    );
  N_PZ_305_MC_D1_PT_0_158 : X_AND2
    port map (
      I0 => NlwInverterSignal_N_PZ_305_MC_D1_PT_0_IN0,
      I1 => NlwInverterSignal_N_PZ_305_MC_D1_PT_0_IN1,
      O => N_PZ_305_MC_D1_PT_0
    );
  N_PZ_305_MC_D1_159 : X_OR2
    port map (
      I0 => N_PZ_305_MC_D1_PT_0,
      I1 => N_PZ_305_MC_D1_PT_0,
      O => N_PZ_305_MC_D1
    );
  N_PZ_305_MC_D2_160 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => N_PZ_305_MC_D2
    );
  N_PZ_305_MC_XOR : X_XOR2
    port map (
      I0 => N_PZ_305_MC_D1,
      I1 => N_PZ_305_MC_D2,
      O => N_PZ_305_MC_D
    );
  upper_dec_din_161 : X_BUF
    port map (
      I => upper_dec_din_MC_Q,
      O => upper_dec_din
    );
  upper_dec_din_MC_REG : X_BUF
    port map (
      I => upper_dec_din_MC_D,
      O => upper_dec_din_MC_Q
    );
  upper_dec_din_MC_D1_PT_0_162 : X_AND3
    port map (
      I0 => NlwInverterSignal_upper_dec_din_MC_D1_PT_0_IN0,
      I1 => upper_dec_prs_state_fft1,
      I2 => serial_data_16_II_UIM,
      O => upper_dec_din_MC_D1_PT_0
    );
  upper_dec_din_MC_D1_163 : X_OR2
    port map (
      I0 => upper_dec_din_MC_D1_PT_0,
      I1 => upper_dec_din_MC_D1_PT_0,
      O => upper_dec_din_MC_D1
    );
  upper_dec_din_MC_D2_164 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => upper_dec_din_MC_D2
    );
  upper_dec_din_MC_XOR : X_XOR2
    port map (
      I0 => upper_dec_din_MC_D1,
      I1 => upper_dec_din_MC_D2,
      O => upper_dec_din_MC_D
    );
  serial_data_16_II_UIM_165 : X_BUF
    port map (
      I => serial_data(16),
      O => serial_data_16_II_UIM
    );
  upper_dec_cin_166 : X_BUF
    port map (
      I => upper_dec_cin_MC_Q,
      O => upper_dec_cin
    );
  upper_dec_cin_MC_REG : X_BUF
    port map (
      I => upper_dec_cin_MC_D,
      O => upper_dec_cin_MC_Q
    );
  upper_dec_cin_MC_D1_PT_0_167 : X_AND3
    port map (
      I0 => NlwInverterSignal_upper_dec_cin_MC_D1_PT_0_IN0,
      I1 => upper_dec_prs_state_fft1,
      I2 => serial_data_17_II_UIM,
      O => upper_dec_cin_MC_D1_PT_0
    );
  upper_dec_cin_MC_D1_168 : X_OR2
    port map (
      I0 => upper_dec_cin_MC_D1_PT_0,
      I1 => upper_dec_cin_MC_D1_PT_0,
      O => upper_dec_cin_MC_D1
    );
  upper_dec_cin_MC_D2_169 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => upper_dec_cin_MC_D2
    );
  upper_dec_cin_MC_XOR : X_XOR2
    port map (
      I0 => upper_dec_cin_MC_D1,
      I1 => upper_dec_cin_MC_D2,
      O => upper_dec_cin_MC_D
    );
  serial_data_17_II_UIM_170 : X_BUF
    port map (
      I => serial_data(17),
      O => serial_data_17_II_UIM
    );
  upper_dec_gin_171 : X_BUF
    port map (
      I => upper_dec_gin_MC_Q,
      O => upper_dec_gin
    );
  upper_dec_gin_MC_REG : X_BUF
    port map (
      I => upper_dec_gin_MC_D,
      O => upper_dec_gin_MC_Q
    );
  upper_dec_gin_MC_D1_PT_0_172 : X_AND3
    port map (
      I0 => NlwInverterSignal_upper_dec_gin_MC_D1_PT_0_IN0,
      I1 => upper_dec_prs_state_fft1,
      I2 => serial_data_12_II_UIM,
      O => upper_dec_gin_MC_D1_PT_0
    );
  upper_dec_gin_MC_D1_173 : X_OR2
    port map (
      I0 => upper_dec_gin_MC_D1_PT_0,
      I1 => upper_dec_gin_MC_D1_PT_0,
      O => upper_dec_gin_MC_D1
    );
  upper_dec_gin_MC_D2_174 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => upper_dec_gin_MC_D2
    );
  upper_dec_gin_MC_XOR : X_XOR2
    port map (
      I0 => upper_dec_gin_MC_D1,
      I1 => upper_dec_gin_MC_D2,
      O => upper_dec_gin_MC_D
    );
  serial_data_12_II_UIM_175 : X_BUF
    port map (
      I => serial_data(12),
      O => serial_data_12_II_UIM
    );
  decoded_data_11_Q : X_BUF
    port map (
      I => decoded_data_11_MC_Q,
      O => decoded_data(11)
    );
  decoded_data_11_MC_Q_176 : X_BUF
    port map (
      I => decoded_data_11_MC_Q_tsim_ireg_Q,
      O => decoded_data_11_MC_Q
    );
  decoded_data_11_MC_REG : X_BUF
    port map (
      I => decoded_data_11_MC_D,
      O => decoded_data_11_MC_Q_tsim_ireg_Q
    );
  decoded_data_11_MC_D1_PT_0_177 : X_AND3
    port map (
      I0 => upper_dec_prs_state_fft2,
      I1 => upper_dec_prs_state_fft1,
      I2 => upper_dec_eout,
      O => decoded_data_11_MC_D1_PT_0
    );
  decoded_data_11_MC_D1_178 : X_OR2
    port map (
      I0 => decoded_data_11_MC_D1_PT_0,
      I1 => decoded_data_11_MC_D1_PT_0,
      O => decoded_data_11_MC_D1
    );
  decoded_data_11_MC_D2_179 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => decoded_data_11_MC_D2
    );
  decoded_data_11_MC_XOR : X_XOR2
    port map (
      I0 => decoded_data_11_MC_D1,
      I1 => decoded_data_11_MC_D2,
      O => decoded_data_11_MC_D
    );
  decoded_data_11_MC_UIM_180 : X_BUF
    port map (
      I => decoded_data_11_MC_Q_tsim_ireg_Q,
      O => decoded_data_11_MC_UIM
    );
  upper_dec_eout_181 : X_BUF
    port map (
      I => upper_dec_eout_MC_Q,
      O => upper_dec_eout
    );
  upper_dec_eout_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => upper_dec_eout_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => upper_dec_eout_MC_Q
    );
  upper_dec_eout_MC_D1_182 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => upper_dec_eout_MC_D1
    );
  upper_dec_eout_MC_D2_PT_0_183 : X_AND2
    port map (
      I0 => NlwInverterSignal_upper_dec_eout_MC_D2_PT_0_IN0,
      I1 => upper_dec_eout,
      O => upper_dec_eout_MC_D2_PT_0
    );
  upper_dec_eout_MC_D2_PT_1_184 : X_AND4
    port map (
      I0 => upper_dec_ein,
      I1 => N_PZ_298,
      I2 => N_PZ_308,
      I3 => N_PZ_302,
      O => upper_dec_eout_MC_D2_PT_1
    );
  upper_dec_eout_MC_D2_PT_2_185 : X_AND4
    port map (
      I0 => NlwInverterSignal_upper_dec_eout_MC_D2_PT_2_IN0,
      I1 => N_PZ_298,
      I2 => N_PZ_308,
      I3 => NlwInverterSignal_upper_dec_eout_MC_D2_PT_2_IN3,
      O => upper_dec_eout_MC_D2_PT_2
    );
  upper_dec_eout_MC_D2_PT_3_186 : X_AND4
    port map (
      I0 => N_PZ_298,
      I1 => NlwInverterSignal_upper_dec_eout_MC_D2_PT_3_IN1,
      I2 => NlwInverterSignal_upper_dec_eout_MC_D2_PT_3_IN2,
      I3 => N_PZ_343,
      O => upper_dec_eout_MC_D2_PT_3
    );
  upper_dec_eout_MC_D2_PT_4_187 : X_AND5
    port map (
      I0 => upper_dec_ein,
      I1 => N_PZ_308,
      I2 => NlwInverterSignal_upper_dec_eout_MC_D2_PT_4_IN2,
      I3 => upper_dec_bin,
      I4 => NlwInverterSignal_upper_dec_eout_MC_D2_PT_4_IN4,
      O => upper_dec_eout_MC_D2_PT_4
    );
  upper_dec_eout_MC_D2_PT_5_188 : X_AND5
    port map (
      I0 => NlwInverterSignal_upper_dec_eout_MC_D2_PT_5_IN0,
      I1 => N_PZ_308,
      I2 => N_PZ_343,
      I3 => NlwInverterSignal_upper_dec_eout_MC_D2_PT_5_IN3,
      I4 => NlwInverterSignal_upper_dec_eout_MC_D2_PT_5_IN4,
      O => upper_dec_eout_MC_D2_PT_5
    );
  upper_dec_eout_MC_D2_PT_6_189 : X_AND6
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => N_PZ_189,
      I4 => upper_dec_ain,
      I5 => upper_dec_bin,
      O => upper_dec_eout_MC_D2_PT_6
    );
  upper_dec_eout_MC_D2_PT_7_190 : X_AND7
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => upper_dec_ein,
      I4 => NlwInverterSignal_upper_dec_eout_MC_D2_PT_7_IN4,
      I5 => N_PZ_298,
      I6 => upper_dec_ain,
      O => upper_dec_eout_MC_D2_PT_7
    );
  upper_dec_eout_MC_D2_PT_8_191 : X_AND7
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => N_PZ_305,
      I4 => NlwInverterSignal_upper_dec_eout_MC_D2_PT_8_IN4,
      I5 => NlwInverterSignal_upper_dec_eout_MC_D2_PT_8_IN5,
      I6 => upper_dec_ain,
      O => upper_dec_eout_MC_D2_PT_8
    );
  upper_dec_eout_MC_D2_PT_9_192 : X_AND8
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => upper_dec_ein,
      I4 => NlwInverterSignal_upper_dec_eout_MC_D2_PT_9_IN4,
      I5 => NlwInverterSignal_upper_dec_eout_MC_D2_PT_9_IN5,
      I6 => NlwInverterSignal_upper_dec_eout_MC_D2_PT_9_IN6,
      I7 => upper_dec_bin,
      O => upper_dec_eout_MC_D2_PT_9
    );
  upper_dec_eout_MC_D2_193 : X_OR16
    port map (
      I0 => upper_dec_eout_MC_D2_PT_0,
      I1 => upper_dec_eout_MC_D2_PT_1,
      I2 => upper_dec_eout_MC_D2_PT_2,
      I3 => upper_dec_eout_MC_D2_PT_3,
      I4 => upper_dec_eout_MC_D2_PT_4,
      I5 => upper_dec_eout_MC_D2_PT_5,
      I6 => upper_dec_eout_MC_D2_PT_6,
      I7 => upper_dec_eout_MC_D2_PT_7,
      I8 => upper_dec_eout_MC_D2_PT_8,
      I9 => upper_dec_eout_MC_D2_PT_9,
      I10 => GND,
      I11 => GND,
      I12 => GND,
      I13 => GND,
      I14 => GND,
      I15 => GND,
      O => upper_dec_eout_MC_D2
    );
  upper_dec_eout_MC_XOR : X_XOR2
    port map (
      I0 => upper_dec_eout_MC_D1,
      I1 => upper_dec_eout_MC_D2,
      O => upper_dec_eout_MC_D
    );
  N_PZ_298_194 : X_BUF
    port map (
      I => N_PZ_298_MC_Q,
      O => N_PZ_298
    );
  N_PZ_298_MC_REG : X_BUF
    port map (
      I => N_PZ_298_MC_D,
      O => N_PZ_298_MC_Q
    );
  N_PZ_298_MC_D1_195 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => N_PZ_298_MC_D1
    );
  N_PZ_298_MC_D2_PT_0_196 : X_AND2
    port map (
      I0 => upper_dec_cin,
      I1 => NlwInverterSignal_N_PZ_298_MC_D2_PT_0_IN1,
      O => N_PZ_298_MC_D2_PT_0
    );
  N_PZ_298_MC_D2_PT_1_197 : X_AND2
    port map (
      I0 => NlwInverterSignal_N_PZ_298_MC_D2_PT_1_IN0,
      I1 => upper_dec_bin,
      O => N_PZ_298_MC_D2_PT_1
    );
  N_PZ_298_MC_D2_198 : X_OR2
    port map (
      I0 => N_PZ_298_MC_D2_PT_0,
      I1 => N_PZ_298_MC_D2_PT_1,
      O => N_PZ_298_MC_D2
    );
  N_PZ_298_MC_XOR : X_XOR2
    port map (
      I0 => N_PZ_298_MC_D1,
      I1 => N_PZ_298_MC_D2,
      O => N_PZ_298_MC_D
    );
  upper_dec_bin_199 : X_BUF
    port map (
      I => upper_dec_bin_MC_Q,
      O => upper_dec_bin
    );
  upper_dec_bin_MC_REG : X_BUF
    port map (
      I => upper_dec_bin_MC_D,
      O => upper_dec_bin_MC_Q
    );
  upper_dec_bin_MC_D1_PT_0_200 : X_AND3
    port map (
      I0 => NlwInverterSignal_upper_dec_bin_MC_D1_PT_0_IN0,
      I1 => upper_dec_prs_state_fft1,
      I2 => serial_data_18_II_UIM,
      O => upper_dec_bin_MC_D1_PT_0
    );
  upper_dec_bin_MC_D1_201 : X_OR2
    port map (
      I0 => upper_dec_bin_MC_D1_PT_0,
      I1 => upper_dec_bin_MC_D1_PT_0,
      O => upper_dec_bin_MC_D1
    );
  upper_dec_bin_MC_D2_202 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => upper_dec_bin_MC_D2
    );
  upper_dec_bin_MC_XOR : X_XOR2
    port map (
      I0 => upper_dec_bin_MC_D1,
      I1 => upper_dec_bin_MC_D2,
      O => upper_dec_bin_MC_D
    );
  serial_data_18_II_UIM_203 : X_BUF
    port map (
      I => serial_data(18),
      O => serial_data_18_II_UIM
    );
  N_PZ_308_204 : X_BUF
    port map (
      I => N_PZ_308_MC_Q,
      O => N_PZ_308
    );
  N_PZ_308_MC_REG : X_BUF
    port map (
      I => N_PZ_308_MC_D,
      O => N_PZ_308_MC_Q
    );
  N_PZ_308_MC_D1_205 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => N_PZ_308_MC_D1
    );
  N_PZ_308_MC_D2_PT_0_206 : X_AND5
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => upper_dec_iin,
      I4 => NlwInverterSignal_N_PZ_308_MC_D2_PT_0_IN4,
      O => N_PZ_308_MC_D2_PT_0
    );
  N_PZ_308_MC_D2_PT_1_207 : X_AND5
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => NlwInverterSignal_N_PZ_308_MC_D2_PT_1_IN3,
      I4 => upper_dec_ain,
      O => N_PZ_308_MC_D2_PT_1
    );
  N_PZ_308_MC_D2_208 : X_OR2
    port map (
      I0 => N_PZ_308_MC_D2_PT_0,
      I1 => N_PZ_308_MC_D2_PT_1,
      O => N_PZ_308_MC_D2
    );
  N_PZ_308_MC_XOR : X_XOR2
    port map (
      I0 => N_PZ_308_MC_D1,
      I1 => N_PZ_308_MC_D2,
      O => N_PZ_308_MC_D
    );
  upper_dec_ain_209 : X_BUF
    port map (
      I => upper_dec_ain_MC_Q,
      O => upper_dec_ain
    );
  upper_dec_ain_MC_REG : X_BUF
    port map (
      I => upper_dec_ain_MC_D,
      O => upper_dec_ain_MC_Q
    );
  upper_dec_ain_MC_D1_PT_0_210 : X_AND3
    port map (
      I0 => NlwInverterSignal_upper_dec_ain_MC_D1_PT_0_IN0,
      I1 => upper_dec_prs_state_fft1,
      I2 => serial_data_19_II_UIM,
      O => upper_dec_ain_MC_D1_PT_0
    );
  upper_dec_ain_MC_D1_211 : X_OR2
    port map (
      I0 => upper_dec_ain_MC_D1_PT_0,
      I1 => upper_dec_ain_MC_D1_PT_0,
      O => upper_dec_ain_MC_D1
    );
  upper_dec_ain_MC_D2_212 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => upper_dec_ain_MC_D2
    );
  upper_dec_ain_MC_XOR : X_XOR2
    port map (
      I0 => upper_dec_ain_MC_D1,
      I1 => upper_dec_ain_MC_D2,
      O => upper_dec_ain_MC_D
    );
  serial_data_19_II_UIM_213 : X_BUF
    port map (
      I => serial_data(19),
      O => serial_data_19_II_UIM
    );
  N_PZ_302_214 : X_BUF
    port map (
      I => N_PZ_302_MC_Q,
      O => N_PZ_302
    );
  N_PZ_302_MC_REG : X_BUF
    port map (
      I => N_PZ_302_MC_D,
      O => N_PZ_302_MC_Q
    );
  N_PZ_302_MC_D1_PT_0_215 : X_AND2
    port map (
      I0 => upper_dec_din,
      I1 => upper_dec_cin,
      O => N_PZ_302_MC_D1_PT_0
    );
  N_PZ_302_MC_D1_216 : X_OR2
    port map (
      I0 => N_PZ_302_MC_D1_PT_0,
      I1 => N_PZ_302_MC_D1_PT_0,
      O => N_PZ_302_MC_D1
    );
  N_PZ_302_MC_D2_217 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => N_PZ_302_MC_D2
    );
  N_PZ_302_MC_XOR : X_XOR2
    port map (
      I0 => N_PZ_302_MC_D1,
      I1 => N_PZ_302_MC_D2,
      O => N_PZ_302_MC_D
    );
  N_PZ_343_218 : X_BUF
    port map (
      I => N_PZ_343_MC_Q,
      O => N_PZ_343
    );
  N_PZ_343_MC_REG : X_BUF
    port map (
      I => N_PZ_343_MC_D,
      O => N_PZ_343_MC_Q
    );
  N_PZ_343_MC_D1_219 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => N_PZ_343_MC_D1
    );
  N_PZ_343_MC_D2_PT_0_220 : X_AND5
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => upper_dec_din,
      I4 => NlwInverterSignal_N_PZ_343_MC_D2_PT_0_IN4,
      O => N_PZ_343_MC_D2_PT_0
    );
  N_PZ_343_MC_D2_PT_1_221 : X_AND5
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => upper_dec_din,
      I4 => NlwInverterSignal_N_PZ_343_MC_D2_PT_1_IN4,
      O => N_PZ_343_MC_D2_PT_1
    );
  N_PZ_343_MC_D2_222 : X_OR2
    port map (
      I0 => N_PZ_343_MC_D2_PT_0,
      I1 => N_PZ_343_MC_D2_PT_1,
      O => N_PZ_343_MC_D2
    );
  N_PZ_343_MC_XOR : X_XOR2
    port map (
      I0 => N_PZ_343_MC_D1,
      I1 => N_PZ_343_MC_D2,
      O => N_PZ_343_MC_D
    );
  N_PZ_348_223 : X_BUF
    port map (
      I => N_PZ_348_MC_Q,
      O => N_PZ_348
    );
  N_PZ_348_MC_REG : X_BUF
    port map (
      I => N_PZ_348_MC_D,
      O => N_PZ_348_MC_Q
    );
  N_PZ_348_MC_D1_224 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => N_PZ_348_MC_D1
    );
  N_PZ_348_MC_D2_PT_0_225 : X_AND7
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => NlwInverterSignal_N_PZ_348_MC_D2_PT_0_IN3,
      I4 => upper_dec_cin,
      I5 => upper_dec_ain,
      I6 => NlwInverterSignal_N_PZ_348_MC_D2_PT_0_IN6,
      O => N_PZ_348_MC_D2_PT_0
    );
  N_PZ_348_MC_D2_PT_1_226 : X_AND8
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => upper_dec_iin,
      I4 => upper_dec_ein,
      I5 => upper_dec_din,
      I6 => NlwInverterSignal_N_PZ_348_MC_D2_PT_1_IN6,
      I7 => NlwInverterSignal_N_PZ_348_MC_D2_PT_1_IN7,
      O => N_PZ_348_MC_D2_PT_1
    );
  N_PZ_348_MC_D2_227 : X_OR2
    port map (
      I0 => N_PZ_348_MC_D2_PT_0,
      I1 => N_PZ_348_MC_D2_PT_1,
      O => N_PZ_348_MC_D2
    );
  N_PZ_348_MC_XOR : X_XOR2
    port map (
      I0 => N_PZ_348_MC_D1,
      I1 => N_PZ_348_MC_D2,
      O => N_PZ_348_MC_D
    );
  decoded_data_12_Q : X_BUF
    port map (
      I => decoded_data_12_MC_Q,
      O => decoded_data(12)
    );
  decoded_data_12_MC_Q_228 : X_BUF
    port map (
      I => decoded_data_12_MC_Q_tsim_ireg_Q,
      O => decoded_data_12_MC_Q
    );
  decoded_data_12_MC_REG : X_BUF
    port map (
      I => decoded_data_12_MC_D,
      O => decoded_data_12_MC_Q_tsim_ireg_Q
    );
  decoded_data_12_MC_D1_PT_0_229 : X_AND3
    port map (
      I0 => upper_dec_prs_state_fft2,
      I1 => upper_dec_prs_state_fft1,
      I2 => upper_dec_dout,
      O => decoded_data_12_MC_D1_PT_0
    );
  decoded_data_12_MC_D1_230 : X_OR2
    port map (
      I0 => decoded_data_12_MC_D1_PT_0,
      I1 => decoded_data_12_MC_D1_PT_0,
      O => decoded_data_12_MC_D1
    );
  decoded_data_12_MC_D2_231 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => decoded_data_12_MC_D2
    );
  decoded_data_12_MC_XOR : X_XOR2
    port map (
      I0 => decoded_data_12_MC_D1,
      I1 => decoded_data_12_MC_D2,
      O => decoded_data_12_MC_D
    );
  decoded_data_12_MC_UIM_232 : X_BUF
    port map (
      I => decoded_data_12_MC_Q_tsim_ireg_Q,
      O => decoded_data_12_MC_UIM
    );
  upper_dec_dout_233 : X_BUF
    port map (
      I => upper_dec_dout_MC_Q,
      O => upper_dec_dout
    );
  upper_dec_dout_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => upper_dec_dout_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => upper_dec_dout_MC_Q
    );
  upper_dec_dout_MC_D1_234 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => upper_dec_dout_MC_D1
    );
  upper_dec_dout_MC_D2_PT_0_235 : X_AND2
    port map (
      I0 => NlwInverterSignal_upper_dec_dout_MC_D2_PT_0_IN0,
      I1 => upper_dec_dout,
      O => upper_dec_dout_MC_D2_PT_0
    );
  upper_dec_dout_MC_D2_PT_1_236 : X_AND3
    port map (
      I0 => NlwInverterSignal_upper_dec_dout_MC_D2_PT_1_IN0,
      I1 => N_PZ_343,
      I2 => upper_dec_bin,
      O => upper_dec_dout_MC_D2_PT_1
    );
  upper_dec_dout_MC_D2_PT_2_237 : X_AND3
    port map (
      I0 => NlwInverterSignal_upper_dec_dout_MC_D2_PT_2_IN0,
      I1 => N_PZ_298,
      I2 => N_PZ_308,
      O => upper_dec_dout_MC_D2_PT_2
    );
  upper_dec_dout_MC_D2_PT_3_238 : X_AND3
    port map (
      I0 => N_PZ_298,
      I1 => NlwInverterSignal_upper_dec_dout_MC_D2_PT_3_IN1,
      I2 => N_PZ_343,
      O => upper_dec_dout_MC_D2_PT_3
    );
  upper_dec_dout_MC_D2_PT_4_239 : X_AND7
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => NlwInverterSignal_upper_dec_dout_MC_D2_PT_4_IN3,
      I4 => upper_dec_ein,
      I5 => upper_dec_din,
      I6 => NlwInverterSignal_upper_dec_dout_MC_D2_PT_4_IN6,
      O => upper_dec_dout_MC_D2_PT_4
    );
  upper_dec_dout_MC_D2_PT_5_240 : X_AND8
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => upper_dec_ein,
      I4 => NlwInverterSignal_upper_dec_dout_MC_D2_PT_5_IN4,
      I5 => N_PZ_298,
      I6 => NlwInverterSignal_upper_dec_dout_MC_D2_PT_5_IN6,
      I7 => upper_dec_ain,
      O => upper_dec_dout_MC_D2_PT_5
    );
  upper_dec_dout_MC_D2_PT_6_241 : X_AND8
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => NlwInverterSignal_upper_dec_dout_MC_D2_PT_6_IN3,
      I4 => NlwInverterSignal_upper_dec_dout_MC_D2_PT_6_IN4,
      I5 => NlwInverterSignal_upper_dec_dout_MC_D2_PT_6_IN5,
      I6 => NlwInverterSignal_upper_dec_dout_MC_D2_PT_6_IN6,
      I7 => upper_dec_ain,
      O => upper_dec_dout_MC_D2_PT_6
    );
  upper_dec_dout_MC_D2_242 : X_OR7
    port map (
      I0 => upper_dec_dout_MC_D2_PT_0,
      I1 => upper_dec_dout_MC_D2_PT_1,
      I2 => upper_dec_dout_MC_D2_PT_2,
      I3 => upper_dec_dout_MC_D2_PT_3,
      I4 => upper_dec_dout_MC_D2_PT_4,
      I5 => upper_dec_dout_MC_D2_PT_5,
      I6 => upper_dec_dout_MC_D2_PT_6,
      O => upper_dec_dout_MC_D2
    );
  upper_dec_dout_MC_XOR : X_XOR2
    port map (
      I0 => upper_dec_dout_MC_D1,
      I1 => upper_dec_dout_MC_D2,
      O => upper_dec_dout_MC_D
    );
  decoded_data_13_Q : X_BUF
    port map (
      I => decoded_data_13_MC_Q,
      O => decoded_data(13)
    );
  decoded_data_13_MC_Q_243 : X_BUF
    port map (
      I => decoded_data_13_MC_Q_tsim_ireg_Q,
      O => decoded_data_13_MC_Q
    );
  decoded_data_13_MC_REG : X_BUF
    port map (
      I => decoded_data_13_MC_D,
      O => decoded_data_13_MC_Q_tsim_ireg_Q
    );
  decoded_data_13_MC_D1_PT_0_244 : X_AND3
    port map (
      I0 => upper_dec_prs_state_fft2,
      I1 => upper_dec_prs_state_fft1,
      I2 => upper_dec_cout,
      O => decoded_data_13_MC_D1_PT_0
    );
  decoded_data_13_MC_D1_245 : X_OR2
    port map (
      I0 => decoded_data_13_MC_D1_PT_0,
      I1 => decoded_data_13_MC_D1_PT_0,
      O => decoded_data_13_MC_D1
    );
  decoded_data_13_MC_D2_246 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => decoded_data_13_MC_D2
    );
  decoded_data_13_MC_XOR : X_XOR2
    port map (
      I0 => decoded_data_13_MC_D1,
      I1 => decoded_data_13_MC_D2,
      O => decoded_data_13_MC_D
    );
  decoded_data_13_MC_UIM_247 : X_BUF
    port map (
      I => decoded_data_13_MC_Q_tsim_ireg_Q,
      O => decoded_data_13_MC_UIM
    );
  upper_dec_cout_248 : X_BUF
    port map (
      I => upper_dec_cout_MC_Q,
      O => upper_dec_cout
    );
  upper_dec_cout_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => upper_dec_cout_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => upper_dec_cout_MC_Q
    );
  upper_dec_cout_MC_D1_249 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => upper_dec_cout_MC_D1
    );
  upper_dec_cout_MC_D2_PT_0_250 : X_AND2
    port map (
      I0 => N_PZ_348,
      I1 => N_PZ_348,
      O => upper_dec_cout_MC_D2_PT_0
    );
  upper_dec_cout_MC_D2_PT_1_251 : X_AND2
    port map (
      I0 => NlwInverterSignal_upper_dec_cout_MC_D2_PT_1_IN0,
      I1 => upper_dec_cout,
      O => upper_dec_cout_MC_D2_PT_1
    );
  upper_dec_cout_MC_D2_PT_2_252 : X_AND4
    port map (
      I0 => NlwInverterSignal_upper_dec_cout_MC_D2_PT_2_IN0,
      I1 => NlwInverterSignal_upper_dec_cout_MC_D2_PT_2_IN1,
      I2 => N_PZ_308,
      I3 => upper_dec_bin,
      O => upper_dec_cout_MC_D2_PT_2
    );
  upper_dec_cout_MC_D2_PT_3_253 : X_AND4
    port map (
      I0 => NlwInverterSignal_upper_dec_cout_MC_D2_PT_3_IN0,
      I1 => NlwInverterSignal_upper_dec_cout_MC_D2_PT_3_IN1,
      I2 => N_PZ_343,
      I3 => upper_dec_bin,
      O => upper_dec_cout_MC_D2_PT_3
    );
  upper_dec_cout_MC_D2_PT_4_254 : X_AND4
    port map (
      I0 => NlwInverterSignal_upper_dec_cout_MC_D2_PT_4_IN0,
      I1 => upper_dec_cin,
      I2 => N_PZ_308,
      I3 => upper_dec_ain,
      O => upper_dec_cout_MC_D2_PT_4
    );
  upper_dec_cout_MC_D2_PT_5_255 : X_AND4
    port map (
      I0 => N_PZ_308,
      I1 => NlwInverterSignal_upper_dec_cout_MC_D2_PT_5_IN1,
      I2 => N_PZ_343,
      I3 => NlwInverterSignal_upper_dec_cout_MC_D2_PT_5_IN3,
      O => upper_dec_cout_MC_D2_PT_5
    );
  upper_dec_cout_MC_D2_PT_6_256 : X_AND7
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => upper_dec_ein,
      I4 => NlwInverterSignal_upper_dec_cout_MC_D2_PT_6_IN4,
      I5 => upper_dec_cin,
      I6 => N_PZ_298,
      O => upper_dec_cout_MC_D2_PT_6
    );
  upper_dec_cout_MC_D2_PT_7_257 : X_AND7
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => upper_dec_ein,
      I4 => upper_dec_cin,
      I5 => NlwInverterSignal_upper_dec_cout_MC_D2_PT_7_IN5,
      I6 => NlwInverterSignal_upper_dec_cout_MC_D2_PT_7_IN6,
      O => upper_dec_cout_MC_D2_PT_7
    );
  upper_dec_cout_MC_D2_PT_8_258 : X_AND8
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => NlwInverterSignal_upper_dec_cout_MC_D2_PT_8_IN3,
      I4 => NlwInverterSignal_upper_dec_cout_MC_D2_PT_8_IN4,
      I5 => NlwInverterSignal_upper_dec_cout_MC_D2_PT_8_IN5,
      I6 => upper_dec_ain,
      I7 => NlwInverterSignal_upper_dec_cout_MC_D2_PT_8_IN7,
      O => upper_dec_cout_MC_D2_PT_8
    );
  upper_dec_cout_MC_D2_259 : X_OR16
    port map (
      I0 => upper_dec_cout_MC_D2_PT_0,
      I1 => upper_dec_cout_MC_D2_PT_1,
      I2 => upper_dec_cout_MC_D2_PT_2,
      I3 => upper_dec_cout_MC_D2_PT_3,
      I4 => upper_dec_cout_MC_D2_PT_4,
      I5 => upper_dec_cout_MC_D2_PT_5,
      I6 => upper_dec_cout_MC_D2_PT_6,
      I7 => upper_dec_cout_MC_D2_PT_7,
      I8 => upper_dec_cout_MC_D2_PT_8,
      I9 => GND,
      I10 => GND,
      I11 => GND,
      I12 => GND,
      I13 => GND,
      I14 => GND,
      I15 => GND,
      O => upper_dec_cout_MC_D2
    );
  upper_dec_cout_MC_XOR : X_XOR2
    port map (
      I0 => upper_dec_cout_MC_D1,
      I1 => upper_dec_cout_MC_D2,
      O => upper_dec_cout_MC_D
    );
  decoded_data_14_Q : X_BUF
    port map (
      I => decoded_data_14_MC_Q,
      O => decoded_data(14)
    );
  decoded_data_14_MC_Q_260 : X_BUF
    port map (
      I => decoded_data_14_MC_Q_tsim_ireg_Q,
      O => decoded_data_14_MC_Q
    );
  decoded_data_14_MC_REG : X_BUF
    port map (
      I => decoded_data_14_MC_D,
      O => decoded_data_14_MC_Q_tsim_ireg_Q
    );
  decoded_data_14_MC_D1_PT_0_261 : X_AND3
    port map (
      I0 => upper_dec_prs_state_fft2,
      I1 => upper_dec_prs_state_fft1,
      I2 => upper_dec_bout,
      O => decoded_data_14_MC_D1_PT_0
    );
  decoded_data_14_MC_D1_262 : X_OR2
    port map (
      I0 => decoded_data_14_MC_D1_PT_0,
      I1 => decoded_data_14_MC_D1_PT_0,
      O => decoded_data_14_MC_D1
    );
  decoded_data_14_MC_D2_263 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => decoded_data_14_MC_D2
    );
  decoded_data_14_MC_XOR : X_XOR2
    port map (
      I0 => decoded_data_14_MC_D1,
      I1 => decoded_data_14_MC_D2,
      O => decoded_data_14_MC_D
    );
  decoded_data_14_MC_UIM_264 : X_BUF
    port map (
      I => decoded_data_14_MC_Q_tsim_ireg_Q,
      O => decoded_data_14_MC_UIM
    );
  upper_dec_bout_265 : X_BUF
    port map (
      I => upper_dec_bout_MC_Q,
      O => upper_dec_bout
    );
  upper_dec_bout_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => upper_dec_bout_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => upper_dec_bout_MC_Q
    );
  upper_dec_bout_MC_D1_266 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => upper_dec_bout_MC_D1
    );
  upper_dec_bout_MC_D2_PT_0_267 : X_AND2
    port map (
      I0 => NlwInverterSignal_upper_dec_bout_MC_D2_PT_0_IN0,
      I1 => upper_dec_bout,
      O => upper_dec_bout_MC_D2_PT_0
    );
  upper_dec_bout_MC_D2_PT_1_268 : X_AND3
    port map (
      I0 => NlwInverterSignal_upper_dec_bout_MC_D2_PT_1_IN0,
      I1 => N_PZ_343,
      I2 => upper_dec_bin,
      O => upper_dec_bout_MC_D2_PT_1
    );
  upper_dec_bout_MC_D2_PT_2_269 : X_AND4
    port map (
      I0 => NlwInverterSignal_upper_dec_bout_MC_D2_PT_2_IN0,
      I1 => NlwInverterSignal_upper_dec_bout_MC_D2_PT_2_IN1,
      I2 => upper_dec_cin,
      I3 => N_PZ_308,
      O => upper_dec_bout_MC_D2_PT_2
    );
  upper_dec_bout_MC_D2_PT_3_270 : X_AND7
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => upper_dec_iin,
      I4 => NlwInverterSignal_upper_dec_bout_MC_D2_PT_3_IN4,
      I5 => N_PZ_305,
      I6 => upper_dec_ain,
      O => upper_dec_bout_MC_D2_PT_3
    );
  upper_dec_bout_MC_D2_PT_4_271 : X_AND7
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => upper_dec_iin,
      I4 => upper_dec_din,
      I5 => NlwInverterSignal_upper_dec_bout_MC_D2_PT_4_IN5,
      I6 => NlwInverterSignal_upper_dec_bout_MC_D2_PT_4_IN6,
      O => upper_dec_bout_MC_D2_PT_4
    );
  upper_dec_bout_MC_D2_PT_5_272 : X_AND7
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => NlwInverterSignal_upper_dec_bout_MC_D2_PT_5_IN3,
      I4 => upper_dec_ein,
      I5 => NlwInverterSignal_upper_dec_bout_MC_D2_PT_5_IN5,
      I6 => upper_dec_bin,
      O => upper_dec_bout_MC_D2_PT_5
    );
  upper_dec_bout_MC_D2_PT_6_273 : X_AND7
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => upper_dec_ein,
      I4 => NlwInverterSignal_upper_dec_bout_MC_D2_PT_6_IN4,
      I5 => NlwInverterSignal_upper_dec_bout_MC_D2_PT_6_IN5,
      I6 => upper_dec_bin,
      O => upper_dec_bout_MC_D2_PT_6
    );
  upper_dec_bout_MC_D2_PT_7_274 : X_AND8
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => upper_dec_iin,
      I4 => NlwInverterSignal_upper_dec_bout_MC_D2_PT_7_IN4,
      I5 => N_PZ_302,
      I6 => upper_dec_ain,
      I7 => NlwInverterSignal_upper_dec_bout_MC_D2_PT_7_IN7,
      O => upper_dec_bout_MC_D2_PT_7
    );
  upper_dec_bout_MC_D2_PT_8_275 : X_AND16
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => upper_dec_iin,
      I4 => upper_dec_ein,
      I5 => NlwInverterSignal_upper_dec_bout_MC_D2_PT_8_IN5,
      I6 => upper_dec_cin,
      I7 => upper_dec_ain,
      I8 => NlwInverterSignal_upper_dec_bout_MC_D2_PT_8_IN8,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => upper_dec_bout_MC_D2_PT_8
    );
  upper_dec_bout_MC_D2_276 : X_OR16
    port map (
      I0 => upper_dec_bout_MC_D2_PT_0,
      I1 => upper_dec_bout_MC_D2_PT_1,
      I2 => upper_dec_bout_MC_D2_PT_2,
      I3 => upper_dec_bout_MC_D2_PT_3,
      I4 => upper_dec_bout_MC_D2_PT_4,
      I5 => upper_dec_bout_MC_D2_PT_5,
      I6 => upper_dec_bout_MC_D2_PT_6,
      I7 => upper_dec_bout_MC_D2_PT_7,
      I8 => upper_dec_bout_MC_D2_PT_8,
      I9 => GND,
      I10 => GND,
      I11 => GND,
      I12 => GND,
      I13 => GND,
      I14 => GND,
      I15 => GND,
      O => upper_dec_bout_MC_D2
    );
  upper_dec_bout_MC_XOR : X_XOR2
    port map (
      I0 => upper_dec_bout_MC_D1,
      I1 => upper_dec_bout_MC_D2,
      O => upper_dec_bout_MC_D
    );
  decoded_data_15_Q : X_BUF
    port map (
      I => decoded_data_15_MC_Q,
      O => decoded_data(15)
    );
  decoded_data_15_MC_Q_277 : X_BUF
    port map (
      I => decoded_data_15_MC_Q_tsim_ireg_Q,
      O => decoded_data_15_MC_Q
    );
  decoded_data_15_MC_REG : X_BUF
    port map (
      I => decoded_data_15_MC_D,
      O => decoded_data_15_MC_Q_tsim_ireg_Q
    );
  decoded_data_15_MC_D1_PT_0_278 : X_AND3
    port map (
      I0 => upper_dec_prs_state_fft2,
      I1 => upper_dec_prs_state_fft1,
      I2 => upper_dec_aout,
      O => decoded_data_15_MC_D1_PT_0
    );
  decoded_data_15_MC_D1_279 : X_OR2
    port map (
      I0 => decoded_data_15_MC_D1_PT_0,
      I1 => decoded_data_15_MC_D1_PT_0,
      O => decoded_data_15_MC_D1
    );
  decoded_data_15_MC_D2_280 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => decoded_data_15_MC_D2
    );
  decoded_data_15_MC_XOR : X_XOR2
    port map (
      I0 => decoded_data_15_MC_D1,
      I1 => decoded_data_15_MC_D2,
      O => decoded_data_15_MC_D
    );
  decoded_data_15_MC_UIM_281 : X_BUF
    port map (
      I => decoded_data_15_MC_Q_tsim_ireg_Q,
      O => decoded_data_15_MC_UIM
    );
  upper_dec_aout_282 : X_BUF
    port map (
      I => upper_dec_aout_MC_Q,
      O => upper_dec_aout
    );
  upper_dec_aout_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => upper_dec_aout_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => upper_dec_aout_MC_Q
    );
  upper_dec_aout_MC_D1_283 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => upper_dec_aout_MC_D1
    );
  upper_dec_aout_MC_D2_PT_0_284 : X_AND2
    port map (
      I0 => N_PZ_348,
      I1 => N_PZ_348,
      O => upper_dec_aout_MC_D2_PT_0
    );
  upper_dec_aout_MC_D2_PT_1_285 : X_AND2
    port map (
      I0 => NlwInverterSignal_upper_dec_aout_MC_D2_PT_1_IN0,
      I1 => upper_dec_aout,
      O => upper_dec_aout_MC_D2_PT_1
    );
  upper_dec_aout_MC_D2_PT_2_286 : X_AND4
    port map (
      I0 => upper_dec_iin,
      I1 => NlwInverterSignal_upper_dec_aout_MC_D2_PT_2_IN1,
      I2 => NlwInverterSignal_upper_dec_aout_MC_D2_PT_2_IN2,
      I3 => N_PZ_343,
      O => upper_dec_aout_MC_D2_PT_2
    );
  upper_dec_aout_MC_D2_PT_3_287 : X_AND4
    port map (
      I0 => upper_dec_ein,
      I1 => NlwInverterSignal_upper_dec_aout_MC_D2_PT_3_IN1,
      I2 => N_PZ_308,
      I3 => upper_dec_ain,
      O => upper_dec_aout_MC_D2_PT_3
    );
  upper_dec_aout_MC_D2_PT_4_288 : X_AND4
    port map (
      I0 => NlwInverterSignal_upper_dec_aout_MC_D2_PT_4_IN0,
      I1 => upper_dec_cin,
      I2 => N_PZ_308,
      I3 => upper_dec_ain,
      O => upper_dec_aout_MC_D2_PT_4
    );
  upper_dec_aout_MC_D2_PT_5_289 : X_AND5
    port map (
      I0 => NlwInverterSignal_upper_dec_aout_MC_D2_PT_5_IN0,
      I1 => NlwInverterSignal_upper_dec_aout_MC_D2_PT_5_IN1,
      I2 => N_PZ_298,
      I3 => N_PZ_343,
      I4 => upper_dec_bin,
      O => upper_dec_aout_MC_D2_PT_5
    );
  upper_dec_aout_MC_D2_PT_6_290 : X_AND7
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => upper_dec_iin,
      I4 => NlwInverterSignal_upper_dec_aout_MC_D2_PT_6_IN4,
      I5 => NlwInverterSignal_upper_dec_aout_MC_D2_PT_6_IN5,
      I6 => N_PZ_298,
      O => upper_dec_aout_MC_D2_PT_6
    );
  upper_dec_aout_MC_D2_PT_7_291 : X_AND7
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => upper_dec_ein,
      I4 => NlwInverterSignal_upper_dec_aout_MC_D2_PT_7_IN4,
      I5 => upper_dec_ain,
      I6 => NlwInverterSignal_upper_dec_aout_MC_D2_PT_7_IN6,
      O => upper_dec_aout_MC_D2_PT_7
    );
  upper_dec_aout_MC_D2_292 : X_OR8
    port map (
      I0 => upper_dec_aout_MC_D2_PT_0,
      I1 => upper_dec_aout_MC_D2_PT_1,
      I2 => upper_dec_aout_MC_D2_PT_2,
      I3 => upper_dec_aout_MC_D2_PT_3,
      I4 => upper_dec_aout_MC_D2_PT_4,
      I5 => upper_dec_aout_MC_D2_PT_5,
      I6 => upper_dec_aout_MC_D2_PT_6,
      I7 => upper_dec_aout_MC_D2_PT_7,
      O => upper_dec_aout_MC_D2
    );
  upper_dec_aout_MC_XOR : X_XOR2
    port map (
      I0 => upper_dec_aout_MC_D1,
      I1 => upper_dec_aout_MC_D2,
      O => upper_dec_aout_MC_D
    );
  decoded_data_1_Q : X_BUF
    port map (
      I => decoded_data_1_MC_Q,
      O => decoded_data(1)
    );
  decoded_data_1_MC_Q_293 : X_BUF
    port map (
      I => decoded_data_1_MC_Q_tsim_ireg_Q,
      O => decoded_data_1_MC_Q
    );
  decoded_data_1_MC_REG : X_BUF
    port map (
      I => decoded_data_1_MC_D,
      O => decoded_data_1_MC_Q_tsim_ireg_Q
    );
  decoded_data_1_MC_D1_PT_0_294 : X_AND3
    port map (
      I0 => lower_dec_prs_state_fft2,
      I1 => lower_dec_prs_state_fft1,
      I2 => lower_dec_gout,
      O => decoded_data_1_MC_D1_PT_0
    );
  decoded_data_1_MC_D1_295 : X_OR2
    port map (
      I0 => decoded_data_1_MC_D1_PT_0,
      I1 => decoded_data_1_MC_D1_PT_0,
      O => decoded_data_1_MC_D1
    );
  decoded_data_1_MC_D2_296 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => decoded_data_1_MC_D2
    );
  decoded_data_1_MC_XOR : X_XOR2
    port map (
      I0 => decoded_data_1_MC_D1,
      I1 => decoded_data_1_MC_D2,
      O => decoded_data_1_MC_D
    );
  decoded_data_1_MC_UIM_297 : X_BUF
    port map (
      I => decoded_data_1_MC_Q_tsim_ireg_Q,
      O => decoded_data_1_MC_UIM
    );
  lower_dec_gout_298 : X_BUF
    port map (
      I => lower_dec_gout_MC_Q,
      O => lower_dec_gout
    );
  lower_dec_gout_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => lower_dec_gout_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => lower_dec_gout_MC_Q
    );
  lower_dec_gout_MC_D1_299 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => lower_dec_gout_MC_D1
    );
  lower_dec_gout_MC_D2_PT_0_300 : X_AND2
    port map (
      I0 => NlwInverterSignal_lower_dec_gout_MC_D2_PT_0_IN0,
      I1 => lower_dec_gout,
      O => lower_dec_gout_MC_D2_PT_0
    );
  lower_dec_gout_MC_D2_PT_1_301 : X_AND8
    port map (
      I0 => NlwInverterSignal_lower_dec_gout_MC_D2_PT_1_IN0,
      I1 => lower_dec_prs_state_fft1,
      I2 => lower_dec_dec_8b10b_prs_state_ffd1,
      I3 => lower_dec_dec_8b10b_prs_state_ffd2,
      I4 => rst_II_UIM,
      I5 => serial_data_1_II_UIM,
      I6 => serial_data_0_II_UIM,
      I7 => NlwInverterSignal_lower_dec_gout_MC_D2_PT_1_IN7,
      O => lower_dec_gout_MC_D2_PT_1
    );
  lower_dec_gout_MC_D2_PT_2_302 : X_AND8
    port map (
      I0 => NlwInverterSignal_lower_dec_gout_MC_D2_PT_2_IN0,
      I1 => lower_dec_prs_state_fft1,
      I2 => lower_dec_dec_8b10b_prs_state_ffd1,
      I3 => lower_dec_dec_8b10b_prs_state_ffd2,
      I4 => rst_II_UIM,
      I5 => NlwInverterSignal_lower_dec_gout_MC_D2_PT_2_IN5,
      I6 => NlwInverterSignal_lower_dec_gout_MC_D2_PT_2_IN6,
      I7 => serial_data_3_II_UIM,
      O => lower_dec_gout_MC_D2_PT_2
    );
  lower_dec_gout_MC_D2_PT_3_303 : X_AND8
    port map (
      I0 => NlwInverterSignal_lower_dec_gout_MC_D2_PT_3_IN0,
      I1 => lower_dec_prs_state_fft1,
      I2 => lower_dec_dec_8b10b_prs_state_ffd1,
      I3 => lower_dec_dec_8b10b_prs_state_ffd2,
      I4 => rst_II_UIM,
      I5 => serial_data_0_II_UIM,
      I6 => NlwInverterSignal_lower_dec_gout_MC_D2_PT_3_IN6,
      I7 => NlwInverterSignal_lower_dec_gout_MC_D2_PT_3_IN7,
      O => lower_dec_gout_MC_D2_PT_3
    );
  lower_dec_gout_MC_D2_PT_4_304 : X_AND8
    port map (
      I0 => NlwInverterSignal_lower_dec_gout_MC_D2_PT_4_IN0,
      I1 => lower_dec_prs_state_fft1,
      I2 => lower_dec_dec_8b10b_prs_state_ffd1,
      I3 => lower_dec_dec_8b10b_prs_state_ffd2,
      I4 => rst_II_UIM,
      I5 => NlwInverterSignal_lower_dec_gout_MC_D2_PT_4_IN5,
      I6 => N_PZ_188,
      I7 => serial_data_3_II_UIM,
      O => lower_dec_gout_MC_D2_PT_4
    );
  lower_dec_gout_MC_D2_PT_5_305 : X_AND16
    port map (
      I0 => NlwInverterSignal_lower_dec_gout_MC_D2_PT_5_IN0,
      I1 => lower_dec_prs_state_fft1,
      I2 => lower_dec_dec_8b10b_prs_state_ffd1,
      I3 => lower_dec_dec_8b10b_prs_state_ffd2,
      I4 => rst_II_UIM,
      I5 => serial_data_1_II_UIM,
      I6 => NlwInverterSignal_lower_dec_gout_MC_D2_PT_5_IN6,
      I7 => NlwInverterSignal_lower_dec_gout_MC_D2_PT_5_IN7,
      I8 => serial_data_2_II_UIM,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => lower_dec_gout_MC_D2_PT_5
    );
  lower_dec_gout_MC_D2_PT_6_306 : X_AND16
    port map (
      I0 => NlwInverterSignal_lower_dec_gout_MC_D2_PT_6_IN0,
      I1 => lower_dec_prs_state_fft1,
      I2 => lower_dec_dec_8b10b_prs_state_ffd1,
      I3 => lower_dec_dec_8b10b_prs_state_ffd2,
      I4 => rst_II_UIM,
      I5 => NlwInverterSignal_lower_dec_gout_MC_D2_PT_6_IN5,
      I6 => serial_data_0_II_UIM,
      I7 => N_PZ_188,
      I8 => NlwInverterSignal_lower_dec_gout_MC_D2_PT_6_IN8,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => lower_dec_gout_MC_D2_PT_6
    );
  lower_dec_gout_MC_D2_307 : X_OR7
    port map (
      I0 => lower_dec_gout_MC_D2_PT_0,
      I1 => lower_dec_gout_MC_D2_PT_1,
      I2 => lower_dec_gout_MC_D2_PT_2,
      I3 => lower_dec_gout_MC_D2_PT_3,
      I4 => lower_dec_gout_MC_D2_PT_4,
      I5 => lower_dec_gout_MC_D2_PT_5,
      I6 => lower_dec_gout_MC_D2_PT_6,
      O => lower_dec_gout_MC_D2
    );
  lower_dec_gout_MC_XOR : X_XOR2
    port map (
      I0 => lower_dec_gout_MC_D1,
      I1 => lower_dec_gout_MC_D2,
      O => lower_dec_gout_MC_D
    );
  decoded_data_2_Q : X_BUF
    port map (
      I => decoded_data_2_MC_Q,
      O => decoded_data(2)
    );
  decoded_data_2_MC_Q_308 : X_BUF
    port map (
      I => decoded_data_2_MC_Q_tsim_ireg_Q,
      O => decoded_data_2_MC_Q
    );
  decoded_data_2_MC_REG : X_BUF
    port map (
      I => decoded_data_2_MC_D,
      O => decoded_data_2_MC_Q_tsim_ireg_Q
    );
  decoded_data_2_MC_D1_PT_0_309 : X_AND3
    port map (
      I0 => lower_dec_prs_state_fft2,
      I1 => lower_dec_prs_state_fft1,
      I2 => lower_dec_fout,
      O => decoded_data_2_MC_D1_PT_0
    );
  decoded_data_2_MC_D1_310 : X_OR2
    port map (
      I0 => decoded_data_2_MC_D1_PT_0,
      I1 => decoded_data_2_MC_D1_PT_0,
      O => decoded_data_2_MC_D1
    );
  decoded_data_2_MC_D2_311 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => decoded_data_2_MC_D2
    );
  decoded_data_2_MC_XOR : X_XOR2
    port map (
      I0 => decoded_data_2_MC_D1,
      I1 => decoded_data_2_MC_D2,
      O => decoded_data_2_MC_D
    );
  decoded_data_2_MC_UIM_312 : X_BUF
    port map (
      I => decoded_data_2_MC_Q_tsim_ireg_Q,
      O => decoded_data_2_MC_UIM
    );
  lower_dec_fout_313 : X_BUF
    port map (
      I => lower_dec_fout_MC_Q,
      O => lower_dec_fout
    );
  lower_dec_fout_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => lower_dec_fout_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => lower_dec_fout_MC_Q
    );
  lower_dec_fout_MC_D1_314 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => lower_dec_fout_MC_D1
    );
  lower_dec_fout_MC_D2_PT_0_315 : X_AND2
    port map (
      I0 => NlwInverterSignal_lower_dec_fout_MC_D2_PT_0_IN0,
      I1 => lower_dec_fout,
      O => lower_dec_fout_MC_D2_PT_0
    );
  lower_dec_fout_MC_D2_PT_1_316 : X_AND8
    port map (
      I0 => NlwInverterSignal_lower_dec_fout_MC_D2_PT_1_IN0,
      I1 => lower_dec_prs_state_fft1,
      I2 => lower_dec_dec_8b10b_prs_state_ffd1,
      I3 => lower_dec_dec_8b10b_prs_state_ffd2,
      I4 => rst_II_UIM,
      I5 => serial_data_1_II_UIM,
      I6 => serial_data_0_II_UIM,
      I7 => NlwInverterSignal_lower_dec_fout_MC_D2_PT_1_IN7,
      O => lower_dec_fout_MC_D2_PT_1
    );
  lower_dec_fout_MC_D2_PT_2_317 : X_AND8
    port map (
      I0 => NlwInverterSignal_lower_dec_fout_MC_D2_PT_2_IN0,
      I1 => lower_dec_prs_state_fft1,
      I2 => lower_dec_dec_8b10b_prs_state_ffd1,
      I3 => lower_dec_dec_8b10b_prs_state_ffd2,
      I4 => rst_II_UIM,
      I5 => NlwInverterSignal_lower_dec_fout_MC_D2_PT_2_IN5,
      I6 => NlwInverterSignal_lower_dec_fout_MC_D2_PT_2_IN6,
      I7 => serial_data_3_II_UIM,
      O => lower_dec_fout_MC_D2_PT_2
    );
  lower_dec_fout_MC_D2_PT_3_318 : X_AND8
    port map (
      I0 => NlwInverterSignal_lower_dec_fout_MC_D2_PT_3_IN0,
      I1 => lower_dec_prs_state_fft1,
      I2 => lower_dec_dec_8b10b_prs_state_ffd1,
      I3 => lower_dec_dec_8b10b_prs_state_ffd2,
      I4 => rst_II_UIM,
      I5 => serial_data_0_II_UIM,
      I6 => N_PZ_188,
      I7 => NlwInverterSignal_lower_dec_fout_MC_D2_PT_3_IN7,
      O => lower_dec_fout_MC_D2_PT_3
    );
  lower_dec_fout_MC_D2_PT_4_319 : X_AND8
    port map (
      I0 => NlwInverterSignal_lower_dec_fout_MC_D2_PT_4_IN0,
      I1 => lower_dec_prs_state_fft1,
      I2 => lower_dec_dec_8b10b_prs_state_ffd1,
      I3 => lower_dec_dec_8b10b_prs_state_ffd2,
      I4 => rst_II_UIM,
      I5 => NlwInverterSignal_lower_dec_fout_MC_D2_PT_4_IN5,
      I6 => NlwInverterSignal_lower_dec_fout_MC_D2_PT_4_IN6,
      I7 => serial_data_3_II_UIM,
      O => lower_dec_fout_MC_D2_PT_4
    );
  lower_dec_fout_MC_D2_PT_5_320 : X_AND16
    port map (
      I0 => NlwInverterSignal_lower_dec_fout_MC_D2_PT_5_IN0,
      I1 => lower_dec_prs_state_fft1,
      I2 => lower_dec_dec_8b10b_prs_state_ffd1,
      I3 => lower_dec_dec_8b10b_prs_state_ffd2,
      I4 => rst_II_UIM,
      I5 => serial_data_1_II_UIM,
      I6 => NlwInverterSignal_lower_dec_fout_MC_D2_PT_5_IN6,
      I7 => N_PZ_188,
      I8 => serial_data_2_II_UIM,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => lower_dec_fout_MC_D2_PT_5
    );
  lower_dec_fout_MC_D2_PT_6_321 : X_AND16
    port map (
      I0 => NlwInverterSignal_lower_dec_fout_MC_D2_PT_6_IN0,
      I1 => lower_dec_prs_state_fft1,
      I2 => lower_dec_dec_8b10b_prs_state_ffd1,
      I3 => lower_dec_dec_8b10b_prs_state_ffd2,
      I4 => rst_II_UIM,
      I5 => NlwInverterSignal_lower_dec_fout_MC_D2_PT_6_IN5,
      I6 => serial_data_0_II_UIM,
      I7 => NlwInverterSignal_lower_dec_fout_MC_D2_PT_6_IN7,
      I8 => NlwInverterSignal_lower_dec_fout_MC_D2_PT_6_IN8,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => lower_dec_fout_MC_D2_PT_6
    );
  lower_dec_fout_MC_D2_322 : X_OR7
    port map (
      I0 => lower_dec_fout_MC_D2_PT_0,
      I1 => lower_dec_fout_MC_D2_PT_1,
      I2 => lower_dec_fout_MC_D2_PT_2,
      I3 => lower_dec_fout_MC_D2_PT_3,
      I4 => lower_dec_fout_MC_D2_PT_4,
      I5 => lower_dec_fout_MC_D2_PT_5,
      I6 => lower_dec_fout_MC_D2_PT_6,
      O => lower_dec_fout_MC_D2
    );
  lower_dec_fout_MC_XOR : X_XOR2
    port map (
      I0 => lower_dec_fout_MC_D1,
      I1 => lower_dec_fout_MC_D2,
      O => lower_dec_fout_MC_D
    );
  decoded_data_3_Q : X_BUF
    port map (
      I => decoded_data_3_MC_Q,
      O => decoded_data(3)
    );
  decoded_data_3_MC_Q_323 : X_BUF
    port map (
      I => decoded_data_3_MC_Q_tsim_ireg_Q,
      O => decoded_data_3_MC_Q
    );
  decoded_data_3_MC_REG : X_BUF
    port map (
      I => decoded_data_3_MC_D,
      O => decoded_data_3_MC_Q_tsim_ireg_Q
    );
  decoded_data_3_MC_D1_PT_0_324 : X_AND3
    port map (
      I0 => lower_dec_prs_state_fft2,
      I1 => lower_dec_prs_state_fft1,
      I2 => lower_dec_eout,
      O => decoded_data_3_MC_D1_PT_0
    );
  decoded_data_3_MC_D1_325 : X_OR2
    port map (
      I0 => decoded_data_3_MC_D1_PT_0,
      I1 => decoded_data_3_MC_D1_PT_0,
      O => decoded_data_3_MC_D1
    );
  decoded_data_3_MC_D2_326 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => decoded_data_3_MC_D2
    );
  decoded_data_3_MC_XOR : X_XOR2
    port map (
      I0 => decoded_data_3_MC_D1,
      I1 => decoded_data_3_MC_D2,
      O => decoded_data_3_MC_D
    );
  decoded_data_3_MC_UIM_327 : X_BUF
    port map (
      I => decoded_data_3_MC_Q_tsim_ireg_Q,
      O => decoded_data_3_MC_UIM
    );
  lower_dec_eout_328 : X_BUF
    port map (
      I => lower_dec_eout_MC_Q,
      O => lower_dec_eout
    );
  lower_dec_eout_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => lower_dec_eout_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => lower_dec_eout_MC_Q
    );
  lower_dec_eout_MC_D1_329 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => lower_dec_eout_MC_D1
    );
  lower_dec_eout_MC_D2_PT_0_330 : X_AND2
    port map (
      I0 => NlwInverterSignal_lower_dec_eout_MC_D2_PT_0_IN0,
      I1 => lower_dec_eout,
      O => lower_dec_eout_MC_D2_PT_0
    );
  lower_dec_eout_MC_D2_PT_1_331 : X_AND6
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => N_PZ_188,
      I4 => NlwInverterSignal_lower_dec_eout_MC_D2_PT_1_IN4,
      I5 => NlwInverterSignal_lower_dec_eout_MC_D2_PT_1_IN5,
      O => lower_dec_eout_MC_D2_PT_1
    );
  lower_dec_eout_MC_D2_PT_2_332 : X_AND7
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => serial_data_4_II_UIM,
      I4 => N_PZ_309,
      I5 => NlwInverterSignal_lower_dec_eout_MC_D2_PT_2_IN5,
      I6 => N_PZ_180,
      O => lower_dec_eout_MC_D2_PT_2
    );
  lower_dec_eout_MC_D2_PT_3_333 : X_AND8
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => serial_data_5_II_UIM,
      I4 => serial_data_7_II_UIM,
      I5 => NlwInverterSignal_lower_dec_eout_MC_D2_PT_3_IN5,
      I6 => NlwInverterSignal_lower_dec_eout_MC_D2_PT_3_IN6,
      I7 => N_PZ_180,
      O => lower_dec_eout_MC_D2_PT_3
    );
  lower_dec_eout_MC_D2_PT_4_334 : X_AND8
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => serial_data_5_II_UIM,
      I4 => NlwInverterSignal_lower_dec_eout_MC_D2_PT_4_IN4,
      I5 => N_PZ_304,
      I6 => NlwInverterSignal_lower_dec_eout_MC_D2_PT_4_IN6,
      I7 => NlwInverterSignal_lower_dec_eout_MC_D2_PT_4_IN7,
      O => lower_dec_eout_MC_D2_PT_4
    );
  lower_dec_eout_MC_D2_PT_5_335 : X_AND8
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => NlwInverterSignal_lower_dec_eout_MC_D2_PT_5_IN3,
      I4 => NlwInverterSignal_lower_dec_eout_MC_D2_PT_5_IN4,
      I5 => serial_data_6_II_UIM,
      I6 => NlwInverterSignal_lower_dec_eout_MC_D2_PT_5_IN6,
      I7 => N_PZ_180,
      O => lower_dec_eout_MC_D2_PT_5
    );
  lower_dec_eout_MC_D2_PT_6_336 : X_AND8
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => NlwInverterSignal_lower_dec_eout_MC_D2_PT_6_IN3,
      I4 => NlwInverterSignal_lower_dec_eout_MC_D2_PT_6_IN4,
      I5 => NlwInverterSignal_lower_dec_eout_MC_D2_PT_6_IN5,
      I6 => N_PZ_304,
      I7 => NlwInverterSignal_lower_dec_eout_MC_D2_PT_6_IN7,
      O => lower_dec_eout_MC_D2_PT_6
    );
  lower_dec_eout_MC_D2_PT_7_337 : X_AND16
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => serial_data_5_II_UIM,
      I4 => NlwInverterSignal_lower_dec_eout_MC_D2_PT_7_IN4,
      I5 => NlwInverterSignal_lower_dec_eout_MC_D2_PT_7_IN5,
      I6 => NlwInverterSignal_lower_dec_eout_MC_D2_PT_7_IN6,
      I7 => NlwInverterSignal_lower_dec_eout_MC_D2_PT_7_IN7,
      I8 => serial_data_8_II_UIM,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => lower_dec_eout_MC_D2_PT_7
    );
  lower_dec_eout_MC_D2_PT_8_338 : X_AND16
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => NlwInverterSignal_lower_dec_eout_MC_D2_PT_8_IN3,
      I4 => NlwInverterSignal_lower_dec_eout_MC_D2_PT_8_IN4,
      I5 => serial_data_6_II_UIM,
      I6 => NlwInverterSignal_lower_dec_eout_MC_D2_PT_8_IN6,
      I7 => NlwInverterSignal_lower_dec_eout_MC_D2_PT_8_IN7,
      I8 => NlwInverterSignal_lower_dec_eout_MC_D2_PT_8_IN8,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => lower_dec_eout_MC_D2_PT_8
    );
  lower_dec_eout_MC_D2_PT_9_339 : X_AND16
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => serial_data_4_II_UIM,
      I4 => serial_data_7_II_UIM,
      I5 => NlwInverterSignal_lower_dec_eout_MC_D2_PT_9_IN5,
      I6 => NlwInverterSignal_lower_dec_eout_MC_D2_PT_9_IN6,
      I7 => NlwInverterSignal_lower_dec_eout_MC_D2_PT_9_IN7,
      I8 => NlwInverterSignal_lower_dec_eout_MC_D2_PT_9_IN8,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => lower_dec_eout_MC_D2_PT_9
    );
  lower_dec_eout_MC_D2_340 : X_OR16
    port map (
      I0 => lower_dec_eout_MC_D2_PT_0,
      I1 => lower_dec_eout_MC_D2_PT_1,
      I2 => lower_dec_eout_MC_D2_PT_2,
      I3 => lower_dec_eout_MC_D2_PT_3,
      I4 => lower_dec_eout_MC_D2_PT_4,
      I5 => lower_dec_eout_MC_D2_PT_5,
      I6 => lower_dec_eout_MC_D2_PT_6,
      I7 => lower_dec_eout_MC_D2_PT_7,
      I8 => lower_dec_eout_MC_D2_PT_8,
      I9 => lower_dec_eout_MC_D2_PT_9,
      I10 => GND,
      I11 => GND,
      I12 => GND,
      I13 => GND,
      I14 => GND,
      I15 => GND,
      O => lower_dec_eout_MC_D2
    );
  lower_dec_eout_MC_XOR : X_XOR2
    port map (
      I0 => lower_dec_eout_MC_D1,
      I1 => lower_dec_eout_MC_D2,
      O => lower_dec_eout_MC_D
    );
  lower_dec_err_chk_n003561_341 : X_BUF
    port map (
      I => lower_dec_err_chk_n003561_MC_Q,
      O => lower_dec_err_chk_n003561
    );
  lower_dec_err_chk_n003561_MC_REG : X_BUF
    port map (
      I => lower_dec_err_chk_n003561_MC_D,
      O => lower_dec_err_chk_n003561_MC_Q
    );
  lower_dec_err_chk_n003561_MC_D1_342 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => lower_dec_err_chk_n003561_MC_D1
    );
  lower_dec_err_chk_n003561_MC_D2_PT_0_343 : X_AND2
    port map (
      I0 => lower_dec_prs_state_fft2,
      I1 => lower_dec_prs_state_fft2,
      O => lower_dec_err_chk_n003561_MC_D2_PT_0
    );
  lower_dec_err_chk_n003561_MC_D2_PT_1_344 : X_AND2
    port map (
      I0 => NlwInverterSignal_lower_dec_err_chk_n003561_MC_D2_PT_1_IN0,
      I1 => NlwInverterSignal_lower_dec_err_chk_n003561_MC_D2_PT_1_IN1,
      O => lower_dec_err_chk_n003561_MC_D2_PT_1
    );
  lower_dec_err_chk_n003561_MC_D2_PT_2_345 : X_AND5
    port map (
      I0 => NlwInverterSignal_lower_dec_err_chk_n003561_MC_D2_PT_2_IN0,
      I1 => NlwInverterSignal_lower_dec_err_chk_n003561_MC_D2_PT_2_IN1,
      I2 => NlwInverterSignal_lower_dec_err_chk_n003561_MC_D2_PT_2_IN2,
      I3 => NlwInverterSignal_lower_dec_err_chk_n003561_MC_D2_PT_2_IN3,
      I4 => NlwInverterSignal_lower_dec_err_chk_n003561_MC_D2_PT_2_IN4,
      O => lower_dec_err_chk_n003561_MC_D2_PT_2
    );
  lower_dec_err_chk_n003561_MC_D2_346 : X_OR3
    port map (
      I0 => lower_dec_err_chk_n003561_MC_D2_PT_0,
      I1 => lower_dec_err_chk_n003561_MC_D2_PT_1,
      I2 => lower_dec_err_chk_n003561_MC_D2_PT_2,
      O => lower_dec_err_chk_n003561_MC_D2
    );
  lower_dec_err_chk_n003561_MC_XOR : X_XOR2
    port map (
      I0 => lower_dec_err_chk_n003561_MC_D1,
      I1 => lower_dec_err_chk_n003561_MC_D2,
      O => lower_dec_err_chk_n003561_MC_D
    );
  N_PZ_304_347 : X_BUF
    port map (
      I => N_PZ_304_MC_Q,
      O => N_PZ_304
    );
  N_PZ_304_MC_REG : X_BUF
    port map (
      I => N_PZ_304_MC_D,
      O => N_PZ_304_MC_Q
    );
  N_PZ_304_MC_D1_PT_0_348 : X_AND2
    port map (
      I0 => serial_data_7_II_UIM,
      I1 => serial_data_6_II_UIM,
      O => N_PZ_304_MC_D1_PT_0
    );
  N_PZ_304_MC_D1_349 : X_OR2
    port map (
      I0 => N_PZ_304_MC_D1_PT_0,
      I1 => N_PZ_304_MC_D1_PT_0,
      O => N_PZ_304_MC_D1
    );
  N_PZ_304_MC_D2_350 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => N_PZ_304_MC_D2
    );
  N_PZ_304_MC_XOR : X_XOR2
    port map (
      I0 => N_PZ_304_MC_D1,
      I1 => N_PZ_304_MC_D2,
      O => N_PZ_304_MC_D
    );
  serial_data_9_II_UIM_351 : X_BUF
    port map (
      I => serial_data(9),
      O => serial_data_9_II_UIM
    );
  serial_data_8_II_UIM_352 : X_BUF
    port map (
      I => serial_data(8),
      O => serial_data_8_II_UIM
    );
  N_PZ_180_353 : X_BUF
    port map (
      I => N_PZ_180_MC_Q,
      O => N_PZ_180
    );
  N_PZ_180_MC_REG : X_BUF
    port map (
      I => N_PZ_180_MC_D,
      O => N_PZ_180_MC_Q
    );
  N_PZ_180_MC_D1_354 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => N_PZ_180_MC_D1
    );
  N_PZ_180_MC_D2_PT_0_355 : X_AND2
    port map (
      I0 => serial_data_9_II_UIM,
      I1 => NlwInverterSignal_N_PZ_180_MC_D2_PT_0_IN1,
      O => N_PZ_180_MC_D2_PT_0
    );
  N_PZ_180_MC_D2_PT_1_356 : X_AND2
    port map (
      I0 => NlwInverterSignal_N_PZ_180_MC_D2_PT_1_IN0,
      I1 => serial_data_8_II_UIM,
      O => N_PZ_180_MC_D2_PT_1
    );
  N_PZ_180_MC_D2_357 : X_OR2
    port map (
      I0 => N_PZ_180_MC_D2_PT_0,
      I1 => N_PZ_180_MC_D2_PT_1,
      O => N_PZ_180_MC_D2
    );
  N_PZ_180_MC_XOR : X_XOR2
    port map (
      I0 => N_PZ_180_MC_D1,
      I1 => N_PZ_180_MC_D2,
      O => N_PZ_180_MC_D
    );
  lower_dec_err_chk_n003564_358 : X_BUF
    port map (
      I => lower_dec_err_chk_n003564_MC_Q,
      O => lower_dec_err_chk_n003564
    );
  lower_dec_err_chk_n003564_MC_REG : X_BUF
    port map (
      I => lower_dec_err_chk_n003564_MC_D,
      O => lower_dec_err_chk_n003564_MC_Q
    );
  lower_dec_err_chk_n003564_MC_D1_359 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => lower_dec_err_chk_n003564_MC_D1
    );
  lower_dec_err_chk_n003564_MC_D2_PT_0_360 : X_AND5
    port map (
      I0 => NlwInverterSignal_lower_dec_err_chk_n003564_MC_D2_PT_0_IN0,
      I1 => lower_dec_prs_state_fft1,
      I2 => N_PZ_304,
      I3 => serial_data_9_II_UIM,
      I4 => serial_data_8_II_UIM,
      O => lower_dec_err_chk_n003564_MC_D2_PT_0
    );
  lower_dec_err_chk_n003564_MC_D2_PT_1_361 : X_AND7
    port map (
      I0 => NlwInverterSignal_lower_dec_err_chk_n003564_MC_D2_PT_1_IN0,
      I1 => lower_dec_prs_state_fft1,
      I2 => serial_data_5_II_UIM,
      I3 => serial_data_4_II_UIM,
      I4 => serial_data_6_II_UIM,
      I5 => serial_data_9_II_UIM,
      I6 => serial_data_8_II_UIM,
      O => lower_dec_err_chk_n003564_MC_D2_PT_1
    );
  lower_dec_err_chk_n003564_MC_D2_362 : X_OR2
    port map (
      I0 => lower_dec_err_chk_n003564_MC_D2_PT_0,
      I1 => lower_dec_err_chk_n003564_MC_D2_PT_1,
      O => lower_dec_err_chk_n003564_MC_D2
    );
  lower_dec_err_chk_n003564_MC_XOR : X_XOR2
    port map (
      I0 => lower_dec_err_chk_n003564_MC_D1,
      I1 => lower_dec_err_chk_n003564_MC_D2,
      O => lower_dec_err_chk_n003564_MC_D
    );
  lower_dec_err_chk_n003574_363 : X_BUF
    port map (
      I => lower_dec_err_chk_n003574_MC_Q,
      O => lower_dec_err_chk_n003574
    );
  lower_dec_err_chk_n003574_MC_REG : X_BUF
    port map (
      I => lower_dec_err_chk_n003574_MC_D,
      O => lower_dec_err_chk_n003574_MC_Q
    );
  lower_dec_err_chk_n003574_MC_D1_364 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => lower_dec_err_chk_n003574_MC_D1
    );
  lower_dec_err_chk_n003574_MC_D2_PT_0_365 : X_AND5
    port map (
      I0 => serial_data_5_II_UIM,
      I1 => serial_data_4_II_UIM,
      I2 => NlwInverterSignal_lower_dec_err_chk_n003574_MC_D2_PT_0_IN2,
      I3 => N_PZ_180,
      I4 => N_PZ_304,
      O => lower_dec_err_chk_n003574_MC_D2_PT_0
    );
  lower_dec_err_chk_n003574_MC_D2_PT_1_366 : X_AND6
    port map (
      I0 => serial_data_5_II_UIM,
      I1 => serial_data_4_II_UIM,
      I2 => serial_data_7_II_UIM,
      I3 => NlwInverterSignal_lower_dec_err_chk_n003574_MC_D2_PT_1_IN3,
      I4 => NlwInverterSignal_lower_dec_err_chk_n003574_MC_D2_PT_1_IN4,
      I5 => serial_data_9_II_UIM,
      O => lower_dec_err_chk_n003574_MC_D2_PT_1
    );
  lower_dec_err_chk_n003574_MC_D2_367 : X_OR2
    port map (
      I0 => lower_dec_err_chk_n003574_MC_D2_PT_0,
      I1 => lower_dec_err_chk_n003574_MC_D2_PT_1,
      O => lower_dec_err_chk_n003574_MC_D2
    );
  lower_dec_err_chk_n003574_MC_XOR : X_XOR2
    port map (
      I0 => lower_dec_err_chk_n003574_MC_D1,
      I1 => lower_dec_err_chk_n003574_MC_D2,
      O => lower_dec_err_chk_n003574_MC_D
    );
  decoded_data_4_Q : X_BUF
    port map (
      I => decoded_data_4_MC_Q,
      O => decoded_data(4)
    );
  decoded_data_4_MC_Q_368 : X_BUF
    port map (
      I => decoded_data_4_MC_Q_tsim_ireg_Q,
      O => decoded_data_4_MC_Q
    );
  decoded_data_4_MC_REG : X_BUF
    port map (
      I => decoded_data_4_MC_D,
      O => decoded_data_4_MC_Q_tsim_ireg_Q
    );
  decoded_data_4_MC_D1_PT_0_369 : X_AND3
    port map (
      I0 => lower_dec_prs_state_fft2,
      I1 => lower_dec_prs_state_fft1,
      I2 => lower_dec_dout,
      O => decoded_data_4_MC_D1_PT_0
    );
  decoded_data_4_MC_D1_370 : X_OR2
    port map (
      I0 => decoded_data_4_MC_D1_PT_0,
      I1 => decoded_data_4_MC_D1_PT_0,
      O => decoded_data_4_MC_D1
    );
  decoded_data_4_MC_D2_371 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => decoded_data_4_MC_D2
    );
  decoded_data_4_MC_XOR : X_XOR2
    port map (
      I0 => decoded_data_4_MC_D1,
      I1 => decoded_data_4_MC_D2,
      O => decoded_data_4_MC_D
    );
  decoded_data_4_MC_UIM_372 : X_BUF
    port map (
      I => decoded_data_4_MC_Q_tsim_ireg_Q,
      O => decoded_data_4_MC_UIM
    );
  lower_dec_dout_373 : X_BUF
    port map (
      I => lower_dec_dout_MC_Q,
      O => lower_dec_dout
    );
  lower_dec_dout_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => lower_dec_dout_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => lower_dec_dout_MC_Q
    );
  lower_dec_dout_MC_D1_374 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => lower_dec_dout_MC_D1
    );
  lower_dec_dout_MC_D2_PT_0_375 : X_AND2
    port map (
      I0 => NlwInverterSignal_lower_dec_dout_MC_D2_PT_0_IN0,
      I1 => lower_dec_dout,
      O => lower_dec_dout_MC_D2_PT_0
    );
  lower_dec_dout_MC_D2_PT_1_376 : X_AND6
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => N_PZ_188,
      I4 => NlwInverterSignal_lower_dec_dout_MC_D2_PT_1_IN4,
      I5 => NlwInverterSignal_lower_dec_dout_MC_D2_PT_1_IN5,
      O => lower_dec_dout_MC_D2_PT_1
    );
  lower_dec_dout_MC_D2_PT_2_377 : X_AND7
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => NlwInverterSignal_lower_dec_dout_MC_D2_PT_2_IN3,
      I4 => NlwInverterSignal_lower_dec_dout_MC_D2_PT_2_IN4,
      I5 => N_PZ_304,
      I6 => NlwInverterSignal_lower_dec_dout_MC_D2_PT_2_IN6,
      O => lower_dec_dout_MC_D2_PT_2
    );
  lower_dec_dout_MC_D2_PT_3_378 : X_AND8
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => serial_data_5_II_UIM,
      I4 => NlwInverterSignal_lower_dec_dout_MC_D2_PT_3_IN4,
      I5 => serial_data_6_II_UIM,
      I6 => NlwInverterSignal_lower_dec_dout_MC_D2_PT_3_IN6,
      I7 => NlwInverterSignal_lower_dec_dout_MC_D2_PT_3_IN7,
      O => lower_dec_dout_MC_D2_PT_3
    );
  lower_dec_dout_MC_D2_PT_4_379 : X_AND8
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => NlwInverterSignal_lower_dec_dout_MC_D2_PT_4_IN3,
      I4 => serial_data_4_II_UIM,
      I5 => NlwInverterSignal_lower_dec_dout_MC_D2_PT_4_IN5,
      I6 => NlwInverterSignal_lower_dec_dout_MC_D2_PT_4_IN6,
      I7 => N_PZ_180,
      O => lower_dec_dout_MC_D2_PT_4
    );
  lower_dec_dout_MC_D2_PT_5_380 : X_AND8
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => NlwInverterSignal_lower_dec_dout_MC_D2_PT_5_IN3,
      I4 => NlwInverterSignal_lower_dec_dout_MC_D2_PT_5_IN4,
      I5 => serial_data_7_II_UIM,
      I6 => NlwInverterSignal_lower_dec_dout_MC_D2_PT_5_IN6,
      I7 => NlwInverterSignal_lower_dec_dout_MC_D2_PT_5_IN7,
      O => lower_dec_dout_MC_D2_PT_5
    );
  lower_dec_dout_MC_D2_PT_6_381 : X_AND8
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => NlwInverterSignal_lower_dec_dout_MC_D2_PT_6_IN3,
      I4 => serial_data_6_II_UIM,
      I5 => NlwInverterSignal_lower_dec_dout_MC_D2_PT_6_IN5,
      I6 => NlwInverterSignal_lower_dec_dout_MC_D2_PT_6_IN6,
      I7 => serial_data_8_II_UIM,
      O => lower_dec_dout_MC_D2_PT_6
    );
  lower_dec_dout_MC_D2_PT_7_382 : X_AND8
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => NlwInverterSignal_lower_dec_dout_MC_D2_PT_7_IN3,
      I4 => serial_data_6_II_UIM,
      I5 => NlwInverterSignal_lower_dec_dout_MC_D2_PT_7_IN5,
      I6 => N_PZ_180,
      I7 => NlwInverterSignal_lower_dec_dout_MC_D2_PT_7_IN7,
      O => lower_dec_dout_MC_D2_PT_7
    );
  lower_dec_dout_MC_D2_PT_8_383 : X_AND16
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => serial_data_5_II_UIM,
      I4 => serial_data_4_II_UIM,
      I5 => N_PZ_309,
      I6 => NlwInverterSignal_lower_dec_dout_MC_D2_PT_8_IN6,
      I7 => NlwInverterSignal_lower_dec_dout_MC_D2_PT_8_IN7,
      I8 => serial_data_8_II_UIM,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => lower_dec_dout_MC_D2_PT_8
    );
  lower_dec_dout_MC_D2_PT_9_384 : X_AND16
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => serial_data_5_II_UIM,
      I4 => serial_data_4_II_UIM,
      I5 => serial_data_7_II_UIM,
      I6 => NlwInverterSignal_lower_dec_dout_MC_D2_PT_9_IN6,
      I7 => NlwInverterSignal_lower_dec_dout_MC_D2_PT_9_IN7,
      I8 => serial_data_9_II_UIM,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => lower_dec_dout_MC_D2_PT_9
    );
  lower_dec_dout_MC_D2_PT_10_385 : X_AND16
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => NlwInverterSignal_lower_dec_dout_MC_D2_PT_10_IN3,
      I4 => serial_data_4_II_UIM,
      I5 => serial_data_7_II_UIM,
      I6 => NlwInverterSignal_lower_dec_dout_MC_D2_PT_10_IN6,
      I7 => NlwInverterSignal_lower_dec_dout_MC_D2_PT_10_IN7,
      I8 => NlwInverterSignal_lower_dec_dout_MC_D2_PT_10_IN8,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => lower_dec_dout_MC_D2_PT_10
    );
  lower_dec_dout_MC_D2_386 : X_OR16
    port map (
      I0 => lower_dec_dout_MC_D2_PT_0,
      I1 => lower_dec_dout_MC_D2_PT_1,
      I2 => lower_dec_dout_MC_D2_PT_2,
      I3 => lower_dec_dout_MC_D2_PT_3,
      I4 => lower_dec_dout_MC_D2_PT_4,
      I5 => lower_dec_dout_MC_D2_PT_5,
      I6 => lower_dec_dout_MC_D2_PT_6,
      I7 => lower_dec_dout_MC_D2_PT_7,
      I8 => lower_dec_dout_MC_D2_PT_8,
      I9 => lower_dec_dout_MC_D2_PT_9,
      I10 => lower_dec_dout_MC_D2_PT_10,
      I11 => GND,
      I12 => GND,
      I13 => GND,
      I14 => GND,
      I15 => GND,
      O => lower_dec_dout_MC_D2
    );
  lower_dec_dout_MC_XOR : X_XOR2
    port map (
      I0 => lower_dec_dout_MC_D1,
      I1 => lower_dec_dout_MC_D2,
      O => lower_dec_dout_MC_D
    );
  decoded_data_5_Q : X_BUF
    port map (
      I => decoded_data_5_MC_Q,
      O => decoded_data(5)
    );
  decoded_data_5_MC_Q_387 : X_BUF
    port map (
      I => decoded_data_5_MC_Q_tsim_ireg_Q,
      O => decoded_data_5_MC_Q
    );
  decoded_data_5_MC_REG : X_BUF
    port map (
      I => decoded_data_5_MC_D,
      O => decoded_data_5_MC_Q_tsim_ireg_Q
    );
  decoded_data_5_MC_D1_PT_0_388 : X_AND3
    port map (
      I0 => lower_dec_prs_state_fft2,
      I1 => lower_dec_prs_state_fft1,
      I2 => lower_dec_cout,
      O => decoded_data_5_MC_D1_PT_0
    );
  decoded_data_5_MC_D1_389 : X_OR2
    port map (
      I0 => decoded_data_5_MC_D1_PT_0,
      I1 => decoded_data_5_MC_D1_PT_0,
      O => decoded_data_5_MC_D1
    );
  decoded_data_5_MC_D2_390 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => decoded_data_5_MC_D2
    );
  decoded_data_5_MC_XOR : X_XOR2
    port map (
      I0 => decoded_data_5_MC_D1,
      I1 => decoded_data_5_MC_D2,
      O => decoded_data_5_MC_D
    );
  decoded_data_5_MC_UIM_391 : X_BUF
    port map (
      I => decoded_data_5_MC_Q_tsim_ireg_Q,
      O => decoded_data_5_MC_UIM
    );
  lower_dec_cout_392 : X_BUF
    port map (
      I => lower_dec_cout_MC_Q,
      O => lower_dec_cout
    );
  lower_dec_cout_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => lower_dec_cout_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => lower_dec_cout_MC_Q
    );
  lower_dec_cout_MC_D1_393 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => lower_dec_cout_MC_D1
    );
  lower_dec_cout_MC_D2_PT_0_394 : X_AND2
    port map (
      I0 => NlwInverterSignal_lower_dec_cout_MC_D2_PT_0_IN0,
      I1 => lower_dec_cout,
      O => lower_dec_cout_MC_D2_PT_0
    );
  lower_dec_cout_MC_D2_PT_1_395 : X_AND8
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => serial_data_5_II_UIM,
      I4 => NlwInverterSignal_lower_dec_cout_MC_D2_PT_1_IN4,
      I5 => serial_data_7_II_UIM,
      I6 => NlwInverterSignal_lower_dec_cout_MC_D2_PT_1_IN6,
      I7 => NlwInverterSignal_lower_dec_cout_MC_D2_PT_1_IN7,
      O => lower_dec_cout_MC_D2_PT_1
    );
  lower_dec_cout_MC_D2_PT_2_396 : X_AND8
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => serial_data_5_II_UIM,
      I4 => serial_data_7_II_UIM,
      I5 => NlwInverterSignal_lower_dec_cout_MC_D2_PT_2_IN5,
      I6 => NlwInverterSignal_lower_dec_cout_MC_D2_PT_2_IN6,
      I7 => NlwInverterSignal_lower_dec_cout_MC_D2_PT_2_IN7,
      O => lower_dec_cout_MC_D2_PT_2
    );
  lower_dec_cout_MC_D2_PT_3_397 : X_AND8
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => NlwInverterSignal_lower_dec_cout_MC_D2_PT_3_IN3,
      I4 => serial_data_4_II_UIM,
      I5 => NlwInverterSignal_lower_dec_cout_MC_D2_PT_3_IN5,
      I6 => NlwInverterSignal_lower_dec_cout_MC_D2_PT_3_IN6,
      I7 => N_PZ_180,
      O => lower_dec_cout_MC_D2_PT_3
    );
  lower_dec_cout_MC_D2_PT_4_398 : X_AND8
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => NlwInverterSignal_lower_dec_cout_MC_D2_PT_4_IN3,
      I4 => NlwInverterSignal_lower_dec_cout_MC_D2_PT_4_IN4,
      I5 => NlwInverterSignal_lower_dec_cout_MC_D2_PT_4_IN5,
      I6 => NlwInverterSignal_lower_dec_cout_MC_D2_PT_4_IN6,
      I7 => NlwInverterSignal_lower_dec_cout_MC_D2_PT_4_IN7,
      O => lower_dec_cout_MC_D2_PT_4
    );
  lower_dec_cout_MC_D2_PT_5_399 : X_AND8
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => serial_data_4_II_UIM,
      I4 => serial_data_6_II_UIM,
      I5 => NlwInverterSignal_lower_dec_cout_MC_D2_PT_5_IN5,
      I6 => NlwInverterSignal_lower_dec_cout_MC_D2_PT_5_IN6,
      I7 => NlwInverterSignal_lower_dec_cout_MC_D2_PT_5_IN7,
      O => lower_dec_cout_MC_D2_PT_5
    );
  lower_dec_cout_MC_D2_PT_6_400 : X_AND8
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => NlwInverterSignal_lower_dec_cout_MC_D2_PT_6_IN3,
      I4 => serial_data_7_II_UIM,
      I5 => NlwInverterSignal_lower_dec_cout_MC_D2_PT_6_IN5,
      I6 => N_PZ_180,
      I7 => NlwInverterSignal_lower_dec_cout_MC_D2_PT_6_IN7,
      O => lower_dec_cout_MC_D2_PT_6
    );
  lower_dec_cout_MC_D2_PT_7_401 : X_AND16
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => serial_data_5_II_UIM,
      I4 => serial_data_4_II_UIM,
      I5 => NlwInverterSignal_lower_dec_cout_MC_D2_PT_7_IN5,
      I6 => serial_data_6_II_UIM,
      I7 => NlwInverterSignal_lower_dec_cout_MC_D2_PT_7_IN7,
      I8 => NlwInverterSignal_lower_dec_cout_MC_D2_PT_7_IN8,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => lower_dec_cout_MC_D2_PT_7
    );
  lower_dec_cout_MC_D2_PT_8_402 : X_AND16
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => NlwInverterSignal_lower_dec_cout_MC_D2_PT_8_IN3,
      I4 => NlwInverterSignal_lower_dec_cout_MC_D2_PT_8_IN4,
      I5 => serial_data_6_II_UIM,
      I6 => NlwInverterSignal_lower_dec_cout_MC_D2_PT_8_IN6,
      I7 => N_PZ_180,
      I8 => serial_data_8_II_UIM,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => lower_dec_cout_MC_D2_PT_8
    );
  lower_dec_cout_MC_D2_403 : X_OR16
    port map (
      I0 => lower_dec_cout_MC_D2_PT_0,
      I1 => lower_dec_cout_MC_D2_PT_1,
      I2 => lower_dec_cout_MC_D2_PT_2,
      I3 => lower_dec_cout_MC_D2_PT_3,
      I4 => lower_dec_cout_MC_D2_PT_4,
      I5 => lower_dec_cout_MC_D2_PT_5,
      I6 => lower_dec_cout_MC_D2_PT_6,
      I7 => lower_dec_cout_MC_D2_PT_7,
      I8 => lower_dec_cout_MC_D2_PT_8,
      I9 => GND,
      I10 => GND,
      I11 => GND,
      I12 => GND,
      I13 => GND,
      I14 => GND,
      I15 => GND,
      O => lower_dec_cout_MC_D2
    );
  lower_dec_cout_MC_XOR : X_XOR2
    port map (
      I0 => lower_dec_cout_MC_D1,
      I1 => lower_dec_cout_MC_D2,
      O => lower_dec_cout_MC_D
    );
  decoded_data_6_Q : X_BUF
    port map (
      I => decoded_data_6_MC_Q,
      O => decoded_data(6)
    );
  decoded_data_6_MC_Q_404 : X_BUF
    port map (
      I => decoded_data_6_MC_Q_tsim_ireg_Q,
      O => decoded_data_6_MC_Q
    );
  decoded_data_6_MC_REG : X_BUF
    port map (
      I => decoded_data_6_MC_D,
      O => decoded_data_6_MC_Q_tsim_ireg_Q
    );
  decoded_data_6_MC_D1_PT_0_405 : X_AND3
    port map (
      I0 => lower_dec_prs_state_fft2,
      I1 => lower_dec_prs_state_fft1,
      I2 => lower_dec_bout,
      O => decoded_data_6_MC_D1_PT_0
    );
  decoded_data_6_MC_D1_406 : X_OR2
    port map (
      I0 => decoded_data_6_MC_D1_PT_0,
      I1 => decoded_data_6_MC_D1_PT_0,
      O => decoded_data_6_MC_D1
    );
  decoded_data_6_MC_D2_407 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => decoded_data_6_MC_D2
    );
  decoded_data_6_MC_XOR : X_XOR2
    port map (
      I0 => decoded_data_6_MC_D1,
      I1 => decoded_data_6_MC_D2,
      O => decoded_data_6_MC_D
    );
  decoded_data_6_MC_UIM_408 : X_BUF
    port map (
      I => decoded_data_6_MC_Q_tsim_ireg_Q,
      O => decoded_data_6_MC_UIM
    );
  lower_dec_bout_409 : X_BUF
    port map (
      I => lower_dec_bout_MC_Q,
      O => lower_dec_bout
    );
  lower_dec_bout_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => lower_dec_bout_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => lower_dec_bout_MC_Q
    );
  lower_dec_bout_MC_D1_410 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => lower_dec_bout_MC_D1
    );
  lower_dec_bout_MC_D2_PT_0_411 : X_AND2
    port map (
      I0 => NlwInverterSignal_lower_dec_bout_MC_D2_PT_0_IN0,
      I1 => lower_dec_bout,
      O => lower_dec_bout_MC_D2_PT_0
    );
  lower_dec_bout_MC_D2_PT_1_412 : X_AND8
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => NlwInverterSignal_lower_dec_bout_MC_D2_PT_1_IN3,
      I4 => NlwInverterSignal_lower_dec_bout_MC_D2_PT_1_IN4,
      I5 => N_PZ_309,
      I6 => NlwInverterSignal_lower_dec_bout_MC_D2_PT_1_IN6,
      I7 => serial_data_9_II_UIM,
      O => lower_dec_bout_MC_D2_PT_1
    );
  lower_dec_bout_MC_D2_PT_2_413 : X_AND8
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => serial_data_5_II_UIM,
      I4 => NlwInverterSignal_lower_dec_bout_MC_D2_PT_2_IN4,
      I5 => NlwInverterSignal_lower_dec_bout_MC_D2_PT_2_IN5,
      I6 => NlwInverterSignal_lower_dec_bout_MC_D2_PT_2_IN6,
      I7 => serial_data_8_II_UIM,
      O => lower_dec_bout_MC_D2_PT_2
    );
  lower_dec_bout_MC_D2_PT_3_414 : X_AND8
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => serial_data_5_II_UIM,
      I4 => NlwInverterSignal_lower_dec_bout_MC_D2_PT_3_IN4,
      I5 => NlwInverterSignal_lower_dec_bout_MC_D2_PT_3_IN5,
      I6 => N_PZ_180,
      I7 => serial_data_8_II_UIM,
      O => lower_dec_bout_MC_D2_PT_3
    );
  lower_dec_bout_MC_D2_PT_4_415 : X_AND8
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => serial_data_4_II_UIM,
      I4 => NlwInverterSignal_lower_dec_bout_MC_D2_PT_4_IN4,
      I5 => serial_data_6_II_UIM,
      I6 => NlwInverterSignal_lower_dec_bout_MC_D2_PT_4_IN6,
      I7 => NlwInverterSignal_lower_dec_bout_MC_D2_PT_4_IN7,
      O => lower_dec_bout_MC_D2_PT_4
    );
  lower_dec_bout_MC_D2_PT_5_416 : X_AND8
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => NlwInverterSignal_lower_dec_bout_MC_D2_PT_5_IN3,
      I4 => serial_data_6_II_UIM,
      I5 => NlwInverterSignal_lower_dec_bout_MC_D2_PT_5_IN5,
      I6 => NlwInverterSignal_lower_dec_bout_MC_D2_PT_5_IN6,
      I7 => serial_data_8_II_UIM,
      O => lower_dec_bout_MC_D2_PT_5
    );
  lower_dec_bout_MC_D2_PT_6_417 : X_AND16
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => NlwInverterSignal_lower_dec_bout_MC_D2_PT_6_IN3,
      I4 => NlwInverterSignal_lower_dec_bout_MC_D2_PT_6_IN4,
      I5 => NlwInverterSignal_lower_dec_bout_MC_D2_PT_6_IN5,
      I6 => NlwInverterSignal_lower_dec_bout_MC_D2_PT_6_IN6,
      I7 => NlwInverterSignal_lower_dec_bout_MC_D2_PT_6_IN7,
      I8 => serial_data_9_II_UIM,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => lower_dec_bout_MC_D2_PT_6
    );
  lower_dec_bout_MC_D2_PT_7_418 : X_AND16
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => serial_data_5_II_UIM,
      I4 => serial_data_4_II_UIM,
      I5 => serial_data_7_II_UIM,
      I6 => NlwInverterSignal_lower_dec_bout_MC_D2_PT_7_IN6,
      I7 => NlwInverterSignal_lower_dec_bout_MC_D2_PT_7_IN7,
      I8 => serial_data_9_II_UIM,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => lower_dec_bout_MC_D2_PT_7
    );
  lower_dec_bout_MC_D2_PT_8_419 : X_AND16
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => NlwInverterSignal_lower_dec_bout_MC_D2_PT_8_IN3,
      I4 => serial_data_4_II_UIM,
      I5 => serial_data_7_II_UIM,
      I6 => NlwInverterSignal_lower_dec_bout_MC_D2_PT_8_IN6,
      I7 => NlwInverterSignal_lower_dec_bout_MC_D2_PT_8_IN7,
      I8 => NlwInverterSignal_lower_dec_bout_MC_D2_PT_8_IN8,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => lower_dec_bout_MC_D2_PT_8
    );
  lower_dec_bout_MC_D2_PT_9_420 : X_AND16
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => NlwInverterSignal_lower_dec_bout_MC_D2_PT_9_IN3,
      I4 => serial_data_4_II_UIM,
      I5 => NlwInverterSignal_lower_dec_bout_MC_D2_PT_9_IN5,
      I6 => N_PZ_180,
      I7 => N_PZ_304,
      I8 => NlwInverterSignal_lower_dec_bout_MC_D2_PT_9_IN8,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => lower_dec_bout_MC_D2_PT_9
    );
  lower_dec_bout_MC_D2_421 : X_OR16
    port map (
      I0 => lower_dec_bout_MC_D2_PT_0,
      I1 => lower_dec_bout_MC_D2_PT_1,
      I2 => lower_dec_bout_MC_D2_PT_2,
      I3 => lower_dec_bout_MC_D2_PT_3,
      I4 => lower_dec_bout_MC_D2_PT_4,
      I5 => lower_dec_bout_MC_D2_PT_5,
      I6 => lower_dec_bout_MC_D2_PT_6,
      I7 => lower_dec_bout_MC_D2_PT_7,
      I8 => lower_dec_bout_MC_D2_PT_8,
      I9 => lower_dec_bout_MC_D2_PT_9,
      I10 => GND,
      I11 => GND,
      I12 => GND,
      I13 => GND,
      I14 => GND,
      I15 => GND,
      O => lower_dec_bout_MC_D2
    );
  lower_dec_bout_MC_XOR : X_XOR2
    port map (
      I0 => lower_dec_bout_MC_D1,
      I1 => lower_dec_bout_MC_D2,
      O => lower_dec_bout_MC_D
    );
  decoded_data_7_Q : X_BUF
    port map (
      I => decoded_data_7_MC_Q,
      O => decoded_data(7)
    );
  decoded_data_7_MC_Q_422 : X_BUF
    port map (
      I => decoded_data_7_MC_Q_tsim_ireg_Q,
      O => decoded_data_7_MC_Q
    );
  decoded_data_7_MC_REG : X_BUF
    port map (
      I => decoded_data_7_MC_D,
      O => decoded_data_7_MC_Q_tsim_ireg_Q
    );
  decoded_data_7_MC_D1_PT_0_423 : X_AND3
    port map (
      I0 => lower_dec_prs_state_fft2,
      I1 => lower_dec_prs_state_fft1,
      I2 => lower_dec_aout,
      O => decoded_data_7_MC_D1_PT_0
    );
  decoded_data_7_MC_D1_424 : X_OR2
    port map (
      I0 => decoded_data_7_MC_D1_PT_0,
      I1 => decoded_data_7_MC_D1_PT_0,
      O => decoded_data_7_MC_D1
    );
  decoded_data_7_MC_D2_425 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => decoded_data_7_MC_D2
    );
  decoded_data_7_MC_XOR : X_XOR2
    port map (
      I0 => decoded_data_7_MC_D1,
      I1 => decoded_data_7_MC_D2,
      O => decoded_data_7_MC_D
    );
  decoded_data_7_MC_UIM_426 : X_BUF
    port map (
      I => decoded_data_7_MC_Q_tsim_ireg_Q,
      O => decoded_data_7_MC_UIM
    );
  lower_dec_aout_427 : X_BUF
    port map (
      I => lower_dec_aout_MC_Q,
      O => lower_dec_aout
    );
  lower_dec_aout_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => lower_dec_aout_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => lower_dec_aout_MC_Q
    );
  lower_dec_aout_MC_D1_428 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => lower_dec_aout_MC_D1
    );
  lower_dec_aout_MC_D2_PT_0_429 : X_AND2
    port map (
      I0 => NlwInverterSignal_lower_dec_aout_MC_D2_PT_0_IN0,
      I1 => lower_dec_aout,
      O => lower_dec_aout_MC_D2_PT_0
    );
  lower_dec_aout_MC_D2_PT_1_430 : X_AND8
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => NlwInverterSignal_lower_dec_aout_MC_D2_PT_1_IN3,
      I4 => NlwInverterSignal_lower_dec_aout_MC_D2_PT_1_IN4,
      I5 => N_PZ_309,
      I6 => NlwInverterSignal_lower_dec_aout_MC_D2_PT_1_IN6,
      I7 => serial_data_8_II_UIM,
      O => lower_dec_aout_MC_D2_PT_1
    );
  lower_dec_aout_MC_D2_PT_2_431 : X_AND8
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => serial_data_5_II_UIM,
      I4 => NlwInverterSignal_lower_dec_aout_MC_D2_PT_2_IN4,
      I5 => NlwInverterSignal_lower_dec_aout_MC_D2_PT_2_IN5,
      I6 => NlwInverterSignal_lower_dec_aout_MC_D2_PT_2_IN6,
      I7 => serial_data_9_II_UIM,
      O => lower_dec_aout_MC_D2_PT_2
    );
  lower_dec_aout_MC_D2_PT_3_432 : X_AND8
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => serial_data_5_II_UIM,
      I4 => NlwInverterSignal_lower_dec_aout_MC_D2_PT_3_IN4,
      I5 => NlwInverterSignal_lower_dec_aout_MC_D2_PT_3_IN5,
      I6 => N_PZ_180,
      I7 => NlwInverterSignal_lower_dec_aout_MC_D2_PT_3_IN7,
      O => lower_dec_aout_MC_D2_PT_3
    );
  lower_dec_aout_MC_D2_PT_4_433 : X_AND8
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => NlwInverterSignal_lower_dec_aout_MC_D2_PT_4_IN3,
      I4 => serial_data_7_II_UIM,
      I5 => NlwInverterSignal_lower_dec_aout_MC_D2_PT_4_IN5,
      I6 => NlwInverterSignal_lower_dec_aout_MC_D2_PT_4_IN6,
      I7 => NlwInverterSignal_lower_dec_aout_MC_D2_PT_4_IN7,
      O => lower_dec_aout_MC_D2_PT_4
    );
  lower_dec_aout_MC_D2_PT_5_434 : X_AND8
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => NlwInverterSignal_lower_dec_aout_MC_D2_PT_5_IN3,
      I4 => serial_data_7_II_UIM,
      I5 => NlwInverterSignal_lower_dec_aout_MC_D2_PT_5_IN5,
      I6 => NlwInverterSignal_lower_dec_aout_MC_D2_PT_5_IN6,
      I7 => serial_data_9_II_UIM,
      O => lower_dec_aout_MC_D2_PT_5
    );
  lower_dec_aout_MC_D2_PT_6_435 : X_AND16
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => NlwInverterSignal_lower_dec_aout_MC_D2_PT_6_IN3,
      I4 => NlwInverterSignal_lower_dec_aout_MC_D2_PT_6_IN4,
      I5 => NlwInverterSignal_lower_dec_aout_MC_D2_PT_6_IN5,
      I6 => NlwInverterSignal_lower_dec_aout_MC_D2_PT_6_IN6,
      I7 => NlwInverterSignal_lower_dec_aout_MC_D2_PT_6_IN7,
      I8 => serial_data_8_II_UIM,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => lower_dec_aout_MC_D2_PT_6
    );
  lower_dec_aout_MC_D2_PT_7_436 : X_AND16
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => serial_data_5_II_UIM,
      I4 => serial_data_4_II_UIM,
      I5 => NlwInverterSignal_lower_dec_aout_MC_D2_PT_7_IN5,
      I6 => serial_data_6_II_UIM,
      I7 => NlwInverterSignal_lower_dec_aout_MC_D2_PT_7_IN7,
      I8 => NlwInverterSignal_lower_dec_aout_MC_D2_PT_7_IN8,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => lower_dec_aout_MC_D2_PT_7
    );
  lower_dec_aout_MC_D2_PT_8_437 : X_AND16
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => NlwInverterSignal_lower_dec_aout_MC_D2_PT_8_IN3,
      I4 => serial_data_4_II_UIM,
      I5 => NlwInverterSignal_lower_dec_aout_MC_D2_PT_8_IN5,
      I6 => serial_data_6_II_UIM,
      I7 => NlwInverterSignal_lower_dec_aout_MC_D2_PT_8_IN7,
      I8 => NlwInverterSignal_lower_dec_aout_MC_D2_PT_8_IN8,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => lower_dec_aout_MC_D2_PT_8
    );
  lower_dec_aout_MC_D2_PT_9_438 : X_AND16
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => NlwInverterSignal_lower_dec_aout_MC_D2_PT_9_IN3,
      I4 => serial_data_4_II_UIM,
      I5 => NlwInverterSignal_lower_dec_aout_MC_D2_PT_9_IN5,
      I6 => N_PZ_180,
      I7 => N_PZ_304,
      I8 => serial_data_8_II_UIM,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => lower_dec_aout_MC_D2_PT_9
    );
  lower_dec_aout_MC_D2_439 : X_OR16
    port map (
      I0 => lower_dec_aout_MC_D2_PT_0,
      I1 => lower_dec_aout_MC_D2_PT_1,
      I2 => lower_dec_aout_MC_D2_PT_2,
      I3 => lower_dec_aout_MC_D2_PT_3,
      I4 => lower_dec_aout_MC_D2_PT_4,
      I5 => lower_dec_aout_MC_D2_PT_5,
      I6 => lower_dec_aout_MC_D2_PT_6,
      I7 => lower_dec_aout_MC_D2_PT_7,
      I8 => lower_dec_aout_MC_D2_PT_8,
      I9 => lower_dec_aout_MC_D2_PT_9,
      I10 => GND,
      I11 => GND,
      I12 => GND,
      I13 => GND,
      I14 => GND,
      I15 => GND,
      O => lower_dec_aout_MC_D2
    );
  lower_dec_aout_MC_XOR : X_XOR2
    port map (
      I0 => lower_dec_aout_MC_D1,
      I1 => lower_dec_aout_MC_D2,
      O => lower_dec_aout_MC_D
    );
  decoded_data_8_Q : X_BUF
    port map (
      I => decoded_data_8_MC_Q,
      O => decoded_data(8)
    );
  decoded_data_8_MC_Q_440 : X_BUF
    port map (
      I => decoded_data_8_MC_Q_tsim_ireg_Q,
      O => decoded_data_8_MC_Q
    );
  decoded_data_8_MC_REG : X_BUF
    port map (
      I => decoded_data_8_MC_D,
      O => decoded_data_8_MC_Q_tsim_ireg_Q
    );
  decoded_data_8_MC_D1_PT_0_441 : X_AND3
    port map (
      I0 => upper_dec_prs_state_fft2,
      I1 => upper_dec_prs_state_fft1,
      I2 => upper_dec_hout,
      O => decoded_data_8_MC_D1_PT_0
    );
  decoded_data_8_MC_D1_442 : X_OR2
    port map (
      I0 => decoded_data_8_MC_D1_PT_0,
      I1 => decoded_data_8_MC_D1_PT_0,
      O => decoded_data_8_MC_D1
    );
  decoded_data_8_MC_D2_443 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => decoded_data_8_MC_D2
    );
  decoded_data_8_MC_XOR : X_XOR2
    port map (
      I0 => decoded_data_8_MC_D1,
      I1 => decoded_data_8_MC_D2,
      O => decoded_data_8_MC_D
    );
  decoded_data_8_MC_UIM_444 : X_BUF
    port map (
      I => decoded_data_8_MC_Q_tsim_ireg_Q,
      O => decoded_data_8_MC_UIM
    );
  upper_dec_hout_445 : X_BUF
    port map (
      I => upper_dec_hout_MC_Q,
      O => upper_dec_hout
    );
  upper_dec_hout_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => upper_dec_hout_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => upper_dec_hout_MC_Q
    );
  upper_dec_hout_MC_D1_446 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => upper_dec_hout_MC_D1
    );
  upper_dec_hout_MC_D2_PT_0_447 : X_AND2
    port map (
      I0 => NlwInverterSignal_upper_dec_hout_MC_D2_PT_0_IN0,
      I1 => upper_dec_hout,
      O => upper_dec_hout_MC_D2_PT_0
    );
  upper_dec_hout_MC_D2_PT_1_448 : X_AND6
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => upper_dec_hin,
      I4 => NlwInverterSignal_upper_dec_hout_MC_D2_PT_1_IN4,
      I5 => NlwInverterSignal_upper_dec_hout_MC_D2_PT_1_IN5,
      O => upper_dec_hout_MC_D2_PT_1
    );
  upper_dec_hout_MC_D2_PT_2_449 : X_AND6
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => NlwInverterSignal_upper_dec_hout_MC_D2_PT_2_IN3,
      I4 => upper_dec_jin,
      I5 => N_PZ_189,
      O => upper_dec_hout_MC_D2_PT_2
    );
  upper_dec_hout_MC_D2_PT_3_450 : X_AND7
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => upper_dec_hin,
      I4 => upper_dec_jin,
      I5 => NlwInverterSignal_upper_dec_hout_MC_D2_PT_3_IN5,
      I6 => upper_dec_gin,
      O => upper_dec_hout_MC_D2_PT_3
    );
  upper_dec_hout_MC_D2_PT_4_451 : X_AND7
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => upper_dec_hin,
      I4 => NlwInverterSignal_upper_dec_hout_MC_D2_PT_4_IN4,
      I5 => upper_dec_fin,
      I6 => upper_dec_gin,
      O => upper_dec_hout_MC_D2_PT_4
    );
  upper_dec_hout_MC_D2_PT_5_452 : X_AND7
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => upper_dec_hin,
      I4 => NlwInverterSignal_upper_dec_hout_MC_D2_PT_5_IN4,
      I5 => NlwInverterSignal_upper_dec_hout_MC_D2_PT_5_IN5,
      I6 => NlwInverterSignal_upper_dec_hout_MC_D2_PT_5_IN6,
      O => upper_dec_hout_MC_D2_PT_5
    );
  upper_dec_hout_MC_D2_PT_6_453 : X_AND7
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => NlwInverterSignal_upper_dec_hout_MC_D2_PT_6_IN3,
      I4 => upper_dec_jin,
      I5 => upper_dec_fin,
      I6 => upper_dec_gin,
      O => upper_dec_hout_MC_D2_PT_6
    );
  upper_dec_hout_MC_D2_PT_7_454 : X_AND7
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => NlwInverterSignal_upper_dec_hout_MC_D2_PT_7_IN3,
      I4 => upper_dec_jin,
      I5 => NlwInverterSignal_upper_dec_hout_MC_D2_PT_7_IN5,
      I6 => NlwInverterSignal_upper_dec_hout_MC_D2_PT_7_IN6,
      O => upper_dec_hout_MC_D2_PT_7
    );
  upper_dec_hout_MC_D2_PT_8_455 : X_AND7
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => NlwInverterSignal_upper_dec_hout_MC_D2_PT_8_IN3,
      I4 => NlwInverterSignal_upper_dec_hout_MC_D2_PT_8_IN4,
      I5 => upper_dec_fin,
      I6 => NlwInverterSignal_upper_dec_hout_MC_D2_PT_8_IN6,
      O => upper_dec_hout_MC_D2_PT_8
    );
  upper_dec_hout_MC_D2_456 : X_OR16
    port map (
      I0 => upper_dec_hout_MC_D2_PT_0,
      I1 => upper_dec_hout_MC_D2_PT_1,
      I2 => upper_dec_hout_MC_D2_PT_2,
      I3 => upper_dec_hout_MC_D2_PT_3,
      I4 => upper_dec_hout_MC_D2_PT_4,
      I5 => upper_dec_hout_MC_D2_PT_5,
      I6 => upper_dec_hout_MC_D2_PT_6,
      I7 => upper_dec_hout_MC_D2_PT_7,
      I8 => upper_dec_hout_MC_D2_PT_8,
      I9 => GND,
      I10 => GND,
      I11 => GND,
      I12 => GND,
      I13 => GND,
      I14 => GND,
      I15 => GND,
      O => upper_dec_hout_MC_D2
    );
  upper_dec_hout_MC_XOR : X_XOR2
    port map (
      I0 => upper_dec_hout_MC_D1,
      I1 => upper_dec_hout_MC_D2,
      O => upper_dec_hout_MC_D
    );
  decoded_data_9_Q : X_BUF
    port map (
      I => decoded_data_9_MC_Q,
      O => decoded_data(9)
    );
  decoded_data_9_MC_Q_457 : X_BUF
    port map (
      I => decoded_data_9_MC_Q_tsim_ireg_Q,
      O => decoded_data_9_MC_Q
    );
  decoded_data_9_MC_REG : X_BUF
    port map (
      I => decoded_data_9_MC_D,
      O => decoded_data_9_MC_Q_tsim_ireg_Q
    );
  decoded_data_9_MC_D1_PT_0_458 : X_AND3
    port map (
      I0 => upper_dec_prs_state_fft2,
      I1 => upper_dec_prs_state_fft1,
      I2 => upper_dec_gout,
      O => decoded_data_9_MC_D1_PT_0
    );
  decoded_data_9_MC_D1_459 : X_OR2
    port map (
      I0 => decoded_data_9_MC_D1_PT_0,
      I1 => decoded_data_9_MC_D1_PT_0,
      O => decoded_data_9_MC_D1
    );
  decoded_data_9_MC_D2_460 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => decoded_data_9_MC_D2
    );
  decoded_data_9_MC_XOR : X_XOR2
    port map (
      I0 => decoded_data_9_MC_D1,
      I1 => decoded_data_9_MC_D2,
      O => decoded_data_9_MC_D
    );
  decoded_data_9_MC_UIM_461 : X_BUF
    port map (
      I => decoded_data_9_MC_Q_tsim_ireg_Q,
      O => decoded_data_9_MC_UIM
    );
  upper_dec_gout_462 : X_BUF
    port map (
      I => upper_dec_gout_MC_Q,
      O => upper_dec_gout
    );
  upper_dec_gout_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => upper_dec_gout_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => upper_dec_gout_MC_Q
    );
  upper_dec_gout_MC_D1_463 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => upper_dec_gout_MC_D1
    );
  upper_dec_gout_MC_D2_PT_0_464 : X_AND2
    port map (
      I0 => NlwInverterSignal_upper_dec_gout_MC_D2_PT_0_IN0,
      I1 => upper_dec_gout,
      O => upper_dec_gout_MC_D2_PT_0
    );
  upper_dec_gout_MC_D2_PT_1_465 : X_AND6
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => upper_dec_hin,
      I4 => upper_dec_jin,
      I5 => NlwInverterSignal_upper_dec_gout_MC_D2_PT_1_IN5,
      O => upper_dec_gout_MC_D2_PT_1
    );
  upper_dec_gout_MC_D2_PT_2_466 : X_AND6
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => NlwInverterSignal_upper_dec_gout_MC_D2_PT_2_IN3,
      I4 => NlwInverterSignal_upper_dec_gout_MC_D2_PT_2_IN4,
      I5 => upper_dec_fin,
      O => upper_dec_gout_MC_D2_PT_2
    );
  upper_dec_gout_MC_D2_PT_3_467 : X_AND6
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => upper_dec_jin,
      I4 => NlwInverterSignal_upper_dec_gout_MC_D2_PT_3_IN4,
      I5 => NlwInverterSignal_upper_dec_gout_MC_D2_PT_3_IN5,
      O => upper_dec_gout_MC_D2_PT_3
    );
  upper_dec_gout_MC_D2_PT_4_468 : X_AND6
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => NlwInverterSignal_upper_dec_gout_MC_D2_PT_4_IN3,
      I4 => upper_dec_fin,
      I5 => N_PZ_189,
      O => upper_dec_gout_MC_D2_PT_4
    );
  upper_dec_gout_MC_D2_PT_5_469 : X_AND7
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => upper_dec_hin,
      I4 => NlwInverterSignal_upper_dec_gout_MC_D2_PT_5_IN4,
      I5 => NlwInverterSignal_upper_dec_gout_MC_D2_PT_5_IN5,
      I6 => upper_dec_gin,
      O => upper_dec_gout_MC_D2_PT_5
    );
  upper_dec_gout_MC_D2_PT_6_470 : X_AND7
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => NlwInverterSignal_upper_dec_gout_MC_D2_PT_6_IN3,
      I4 => upper_dec_jin,
      I5 => N_PZ_189,
      I6 => NlwInverterSignal_upper_dec_gout_MC_D2_PT_6_IN6,
      O => upper_dec_gout_MC_D2_PT_6
    );
  upper_dec_gout_MC_D2_471 : X_OR7
    port map (
      I0 => upper_dec_gout_MC_D2_PT_0,
      I1 => upper_dec_gout_MC_D2_PT_1,
      I2 => upper_dec_gout_MC_D2_PT_2,
      I3 => upper_dec_gout_MC_D2_PT_3,
      I4 => upper_dec_gout_MC_D2_PT_4,
      I5 => upper_dec_gout_MC_D2_PT_5,
      I6 => upper_dec_gout_MC_D2_PT_6,
      O => upper_dec_gout_MC_D2
    );
  upper_dec_gout_MC_XOR : X_XOR2
    port map (
      I0 => upper_dec_gout_MC_D1,
      I1 => upper_dec_gout_MC_D2,
      O => upper_dec_gout_MC_D
    );
  frame_out_dec_472 : X_BUF
    port map (
      I => frame_out_dec_MC_Q,
      O => frame_out_dec
    );
  frame_out_dec_MC_Q_473 : X_BUF
    port map (
      I => frame_out_dec_MC_Q_tsim_ireg_Q,
      O => frame_out_dec_MC_Q
    );
  frame_out_dec_MC_REG : X_BUF
    port map (
      I => frame_out_dec_MC_D,
      O => frame_out_dec_MC_Q_tsim_ireg_Q
    );
  frame_out_dec_MC_D1_PT_0_474 : X_AND4
    port map (
      I0 => lower_dec_prs_state_fft2,
      I1 => lower_dec_prs_state_fft1,
      I2 => upper_dec_prs_state_fft2,
      I3 => upper_dec_prs_state_fft1,
      O => frame_out_dec_MC_D1_PT_0
    );
  frame_out_dec_MC_D1_475 : X_OR2
    port map (
      I0 => frame_out_dec_MC_D1_PT_0,
      I1 => frame_out_dec_MC_D1_PT_0,
      O => frame_out_dec_MC_D1
    );
  frame_out_dec_MC_D2_476 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => frame_out_dec_MC_D2
    );
  frame_out_dec_MC_XOR : X_XOR2
    port map (
      I0 => frame_out_dec_MC_D1,
      I1 => frame_out_dec_MC_D2,
      O => frame_out_dec_MC_D
    );
  ill_char_det_477 : X_BUF
    port map (
      I => ill_char_det_MC_Q,
      O => ill_char_det
    );
  ill_char_det_MC_Q_478 : X_BUF
    port map (
      I => ill_char_det_MC_Q_tsim_ireg_Q,
      O => ill_char_det_MC_Q
    );
  ill_char_det_MC_REG : X_BUF
    port map (
      I => ill_char_det_MC_D,
      O => ill_char_det_MC_Q_tsim_ireg_Q
    );
  ill_char_det_MC_D1_PT_0_479 : X_AND3
    port map (
      I0 => err_prs_state_ffd1,
      I1 => err_prs_state_ffd2,
      I2 => NlwInverterSignal_ill_char_det_MC_D1_PT_0_IN2,
      O => ill_char_det_MC_D1_PT_0
    );
  ill_char_det_MC_D1_480 : X_OR2
    port map (
      I0 => ill_char_det_MC_D1_PT_0,
      I1 => ill_char_det_MC_D1_PT_0,
      O => ill_char_det_MC_D1
    );
  ill_char_det_MC_D2_481 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => ill_char_det_MC_D2
    );
  ill_char_det_MC_XOR : X_XOR2
    port map (
      I0 => ill_char_det_MC_D1,
      I1 => ill_char_det_MC_D2,
      O => ill_char_det_MC_D
    );
  err_prs_state_ffd1_482 : X_BUF
    port map (
      I => err_prs_state_ffd1_MC_Q,
      O => err_prs_state_ffd1
    );
  err_prs_state_ffd1_MC_R_OR_PRLD_483 : X_OR2
    port map (
      I0 => FOOBAR1_ctinst_0,
      I1 => PRLD,
      O => err_prs_state_ffd1_MC_R_OR_PRLD
    );
  err_prs_state_ffd1_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => err_prs_state_ffd1_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => err_prs_state_ffd1_MC_R_OR_PRLD,
      O => err_prs_state_ffd1_MC_Q
    );
  err_prs_state_ffd1_MC_D1_484 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => err_prs_state_ffd1_MC_D1
    );
  err_prs_state_ffd1_MC_D2_PT_0_485 : X_AND2
    port map (
      I0 => err_prs_state_ffd1,
      I1 => NlwInverterSignal_err_prs_state_ffd1_MC_D2_PT_0_IN1,
      O => err_prs_state_ffd1_MC_D2_PT_0
    );
  err_prs_state_ffd1_MC_D2_PT_1_486 : X_AND5
    port map (
      I0 => lower_dec_prs_state_fft2,
      I1 => lower_dec_prs_state_fft1,
      I2 => upper_dec_prs_state_fft2,
      I3 => upper_dec_prs_state_fft1,
      I4 => NlwInverterSignal_err_prs_state_ffd1_MC_D2_PT_1_IN4,
      O => err_prs_state_ffd1_MC_D2_PT_1
    );
  err_prs_state_ffd1_MC_D2_487 : X_OR2
    port map (
      I0 => err_prs_state_ffd1_MC_D2_PT_0,
      I1 => err_prs_state_ffd1_MC_D2_PT_1,
      O => err_prs_state_ffd1_MC_D2
    );
  err_prs_state_ffd1_MC_XOR : X_XOR2
    port map (
      I0 => err_prs_state_ffd1_MC_D1,
      I1 => err_prs_state_ffd1_MC_D2,
      O => err_prs_state_ffd1_MC_D
    );
  err_prs_state_ffd2_488 : X_BUF
    port map (
      I => err_prs_state_ffd2_MC_Q,
      O => err_prs_state_ffd2
    );
  err_prs_state_ffd2_MC_R_OR_PRLD_489 : X_OR2
    port map (
      I0 => FOOBAR1_ctinst_0,
      I1 => PRLD,
      O => err_prs_state_ffd2_MC_R_OR_PRLD
    );
  err_prs_state_ffd2_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => err_prs_state_ffd2_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => err_prs_state_ffd2_MC_R_OR_PRLD,
      O => err_prs_state_ffd2_MC_Q
    );
  err_prs_state_ffd2_MC_D1_490 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => err_prs_state_ffd2_MC_D1
    );
  err_prs_state_ffd2_MC_D2_PT_0_491 : X_AND2
    port map (
      I0 => err_prs_state_ffd1,
      I1 => err_prs_state_ffd1,
      O => err_prs_state_ffd2_MC_D2_PT_0
    );
  err_prs_state_ffd2_MC_D2_PT_1_492 : X_AND5
    port map (
      I0 => lower_dec_prs_state_fft2,
      I1 => lower_dec_prs_state_fft1,
      I2 => upper_dec_prs_state_fft2,
      I3 => upper_dec_prs_state_fft1,
      I4 => err_prs_state_ffd2,
      O => err_prs_state_ffd2_MC_D2_PT_1
    );
  err_prs_state_ffd2_MC_D2_493 : X_OR2
    port map (
      I0 => err_prs_state_ffd2_MC_D2_PT_0,
      I1 => err_prs_state_ffd2_MC_D2_PT_1,
      O => err_prs_state_ffd2_MC_D2
    );
  err_prs_state_ffd2_MC_XOR : X_XOR2
    port map (
      I0 => err_prs_state_ffd2_MC_D1,
      I1 => err_prs_state_ffd2_MC_D2,
      O => err_prs_state_ffd2_MC_D
    );
  err_ill_char_det7_494 : X_BUF
    port map (
      I => err_ill_char_det7_MC_Q,
      O => err_ill_char_det7
    );
  err_ill_char_det7_MC_REG : X_BUF
    port map (
      I => err_ill_char_det7_MC_D,
      O => err_ill_char_det7_MC_Q
    );
  err_ill_char_det7_MC_D1_495 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => err_ill_char_det7_MC_D1
    );
  err_ill_char_det7_MC_D2_PT_0_496 : X_AND4
    port map (
      I0 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_0_IN0,
      I1 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_0_IN1,
      I2 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_0_IN2,
      I3 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_0_IN3,
      O => err_ill_char_det7_MC_D2_PT_0
    );
  err_ill_char_det7_MC_D2_PT_1_497 : X_AND4
    port map (
      I0 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_1_IN0,
      I1 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_1_IN1,
      I2 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_1_IN2,
      I3 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_1_IN3,
      O => err_ill_char_det7_MC_D2_PT_1
    );
  err_ill_char_det7_MC_D2_PT_2_498 : X_AND4
    port map (
      I0 => serial_data_1_II_UIM,
      I1 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_2_IN1,
      I2 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_2_IN2,
      I3 => N_PZ_217,
      O => err_ill_char_det7_MC_D2_PT_2
    );
  err_ill_char_det7_MC_D2_PT_3_499 : X_AND4
    port map (
      I0 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_3_IN0,
      I1 => serial_data_0_II_UIM,
      I2 => serial_data_5_II_UIM,
      I3 => N_PZ_217,
      O => err_ill_char_det7_MC_D2_PT_3
    );
  err_ill_char_det7_MC_D2_PT_4_500 : X_AND4
    port map (
      I0 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_4_IN0,
      I1 => serial_data_0_II_UIM,
      I2 => serial_data_4_II_UIM,
      I3 => N_PZ_217,
      O => err_ill_char_det7_MC_D2_PT_4
    );
  err_ill_char_det7_MC_D2_PT_5_501 : X_AND4
    port map (
      I0 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_5_IN0,
      I1 => serial_data_2_II_UIM,
      I2 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_5_IN2,
      I3 => N_PZ_217,
      O => err_ill_char_det7_MC_D2_PT_5
    );
  err_ill_char_det7_MC_D2_PT_6_502 : X_AND4
    port map (
      I0 => serial_data_0_II_UIM,
      I1 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_6_IN1,
      I2 => serial_data_5_II_UIM,
      I3 => N_PZ_217,
      O => err_ill_char_det7_MC_D2_PT_6
    );
  err_ill_char_det7_MC_D2_PT_7_503 : X_AND4
    port map (
      I0 => serial_data_0_II_UIM,
      I1 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_7_IN1,
      I2 => serial_data_4_II_UIM,
      I3 => N_PZ_217,
      O => err_ill_char_det7_MC_D2_PT_7
    );
  err_ill_char_det7_MC_D2_PT_8_504 : X_AND5
    port map (
      I0 => serial_data_1_II_UIM,
      I1 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_8_IN1,
      I2 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_8_IN2,
      I3 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_8_IN3,
      I4 => N_PZ_217,
      O => err_ill_char_det7_MC_D2_PT_8
    );
  err_ill_char_det7_MC_D2_PT_9_505 : X_AND5
    port map (
      I0 => serial_data_1_II_UIM,
      I1 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_9_IN1,
      I2 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_9_IN2,
      I3 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_9_IN3,
      I4 => N_PZ_217,
      O => err_ill_char_det7_MC_D2_PT_9
    );
  err_ill_char_det7_MC_D2_PT_10_506 : X_AND5
    port map (
      I0 => serial_data_1_II_UIM,
      I1 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_10_IN1,
      I2 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_10_IN2,
      I3 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_10_IN3,
      I4 => N_PZ_217,
      O => err_ill_char_det7_MC_D2_PT_10
    );
  err_ill_char_det7_MC_D2_PT_11_507 : X_AND5
    port map (
      I0 => serial_data_1_II_UIM,
      I1 => N_PZ_188,
      I2 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_11_IN2,
      I3 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_11_IN3,
      I4 => N_PZ_217,
      O => err_ill_char_det7_MC_D2_PT_11
    );
  err_ill_char_det7_MC_D2_PT_12_508 : X_AND5
    port map (
      I0 => serial_data_0_II_UIM,
      I1 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_12_IN1,
      I2 => serial_data_5_II_UIM,
      I3 => serial_data_4_II_UIM,
      I4 => N_PZ_217,
      O => err_ill_char_det7_MC_D2_PT_12
    );
  err_ill_char_det7_MC_D2_PT_13_509 : X_AND6
    port map (
      I0 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_13_IN0,
      I1 => serial_data_3_II_UIM,
      I2 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_13_IN2,
      I3 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_13_IN3,
      I4 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_13_IN4,
      I5 => N_PZ_217,
      O => err_ill_char_det7_MC_D2_PT_13
    );
  err_ill_char_det7_MC_D2_PT_14_510 : X_AND6
    port map (
      I0 => serial_data_0_II_UIM,
      I1 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_14_IN1,
      I2 => serial_data_4_II_UIM,
      I3 => N_PZ_309,
      I4 => N_PZ_180,
      I5 => N_PZ_217,
      O => err_ill_char_det7_MC_D2_PT_14
    );
  err_ill_char_det7_MC_D2_PT_15_511 : X_AND6
    port map (
      I0 => serial_data_3_II_UIM,
      I1 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_15_IN1,
      I2 => serial_data_5_II_UIM,
      I3 => serial_data_4_II_UIM,
      I4 => N_PZ_304,
      I5 => N_PZ_217,
      O => err_ill_char_det7_MC_D2_PT_15
    );
  err_ill_char_det7_MC_D2_PT_16_512 : X_AND7
    port map (
      I0 => serial_data_0_II_UIM,
      I1 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_16_IN1,
      I2 => serial_data_4_II_UIM,
      I3 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_16_IN3,
      I4 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_16_IN4,
      I5 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_16_IN5,
      I6 => N_PZ_217,
      O => err_ill_char_det7_MC_D2_PT_16
    );
  err_ill_char_det7_MC_D2_PT_17_513 : X_AND7
    port map (
      I0 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_17_IN0,
      I1 => serial_data_3_II_UIM,
      I2 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_17_IN2,
      I3 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_17_IN3,
      I4 => N_PZ_180,
      I5 => N_PZ_304,
      I6 => N_PZ_217,
      O => err_ill_char_det7_MC_D2_PT_17
    );
  err_ill_char_det7_MC_D2_PT_18_514 : X_AND8
    port map (
      I0 => serial_data_1_II_UIM,
      I1 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_18_IN1,
      I2 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_18_IN2,
      I3 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_18_IN3,
      I4 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_18_IN4,
      I5 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_18_IN5,
      I6 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_18_IN6,
      I7 => N_PZ_217,
      O => err_ill_char_det7_MC_D2_PT_18
    );
  err_ill_char_det7_MC_D2_PT_19_515 : X_AND8
    port map (
      I0 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_19_IN0,
      I1 => serial_data_3_II_UIM,
      I2 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_19_IN2,
      I3 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_19_IN3,
      I4 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_19_IN4,
      I5 => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_19_IN5,
      I6 => serial_data_8_II_UIM,
      I7 => N_PZ_217,
      O => err_ill_char_det7_MC_D2_PT_19
    );
  err_ill_char_det7_MC_D2_516 : X_OR32
    port map (
      I0 => err_ill_char_det7_MC_D2_PT_0,
      I1 => err_ill_char_det7_MC_D2_PT_1,
      I2 => err_ill_char_det7_MC_D2_PT_2,
      I3 => err_ill_char_det7_MC_D2_PT_3,
      I4 => err_ill_char_det7_MC_D2_PT_4,
      I5 => err_ill_char_det7_MC_D2_PT_5,
      I6 => err_ill_char_det7_MC_D2_PT_6,
      I7 => err_ill_char_det7_MC_D2_PT_7,
      I8 => err_ill_char_det7_MC_D2_PT_8,
      I9 => err_ill_char_det7_MC_D2_PT_9,
      I10 => err_ill_char_det7_MC_D2_PT_10,
      I11 => err_ill_char_det7_MC_D2_PT_11,
      I12 => err_ill_char_det7_MC_D2_PT_12,
      I13 => err_ill_char_det7_MC_D2_PT_13,
      I14 => err_ill_char_det7_MC_D2_PT_14,
      I15 => err_ill_char_det7_MC_D2_PT_15,
      I16 => err_ill_char_det7_MC_D2_PT_16,
      I17 => err_ill_char_det7_MC_D2_PT_17,
      I18 => err_ill_char_det7_MC_D2_PT_18,
      I19 => err_ill_char_det7_MC_D2_PT_19,
      I20 => GND,
      I21 => GND,
      I22 => GND,
      I23 => GND,
      I24 => GND,
      I25 => GND,
      I26 => GND,
      I27 => GND,
      I28 => GND,
      I29 => GND,
      I30 => GND,
      I31 => GND,
      O => err_ill_char_det7_MC_D2
    );
  err_ill_char_det7_MC_XOR : X_XOR2
    port map (
      I0 => err_ill_char_det7_MC_D1,
      I1 => err_ill_char_det7_MC_D2,
      O => err_ill_char_det7_MC_D
    );
  err_n0020_517 : X_BUF
    port map (
      I => err_n0020_MC_Q,
      O => err_n0020
    );
  err_n0020_MC_REG : X_BUF
    port map (
      I => err_n0020_MC_D,
      O => err_n0020_MC_Q
    );
  err_n0020_MC_D1_PT_0_518 : X_AND3
    port map (
      I0 => lower_dec_prs_state_fft2,
      I1 => lower_dec_prs_state_fft1,
      I2 => lower_dec_k_dec,
      O => err_n0020_MC_D1_PT_0
    );
  err_n0020_MC_D1_519 : X_OR2
    port map (
      I0 => err_n0020_MC_D1_PT_0,
      I1 => err_n0020_MC_D1_PT_0,
      O => err_n0020_MC_D1
    );
  err_n0020_MC_D2_PT_0_520 : X_AND3
    port map (
      I0 => upper_dec_prs_state_fft2,
      I1 => upper_dec_prs_state_fft1,
      I2 => upper_dec_k_dec,
      O => err_n0020_MC_D2_PT_0
    );
  err_n0020_MC_D2_521 : X_OR2
    port map (
      I0 => err_n0020_MC_D2_PT_0,
      I1 => err_n0020_MC_D2_PT_0,
      O => err_n0020_MC_D2
    );
  err_n0020_MC_XOR : X_XOR2
    port map (
      I0 => err_n0020_MC_D1,
      I1 => err_n0020_MC_D2,
      O => err_n0020_MC_D
    );
  lower_dec_k_dec_522 : X_BUF
    port map (
      I => lower_dec_k_dec_MC_Q,
      O => lower_dec_k_dec
    );
  lower_dec_k_dec_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => lower_dec_k_dec_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => lower_dec_k_dec_MC_Q
    );
  lower_dec_k_dec_MC_D1_523 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => lower_dec_k_dec_MC_D1
    );
  lower_dec_k_dec_MC_D2_PT_0_524 : X_AND2
    port map (
      I0 => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_0_IN0,
      I1 => lower_dec_k_dec,
      O => lower_dec_k_dec_MC_D2_PT_0
    );
  lower_dec_k_dec_MC_D2_PT_1_525 : X_AND4
    port map (
      I0 => lower_dec_prs_state_fft2,
      I1 => lower_dec_dec_8b10b_prs_state_ffd1,
      I2 => lower_dec_dec_8b10b_prs_state_ffd2,
      I3 => rst_II_UIM,
      O => lower_dec_k_dec_MC_D2_PT_1
    );
  lower_dec_k_dec_MC_D2_PT_2_526 : X_AND4
    port map (
      I0 => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_2_IN0,
      I1 => lower_dec_dec_8b10b_prs_state_ffd1,
      I2 => lower_dec_dec_8b10b_prs_state_ffd2,
      I3 => rst_II_UIM,
      O => lower_dec_k_dec_MC_D2_PT_2
    );
  lower_dec_k_dec_MC_D2_PT_3_527 : X_AND4
    port map (
      I0 => lower_dec_dec_8b10b_prs_state_ffd1,
      I1 => lower_dec_dec_8b10b_prs_state_ffd2,
      I2 => rst_II_UIM,
      I3 => N_PZ_188,
      O => lower_dec_k_dec_MC_D2_PT_3
    );
  lower_dec_k_dec_MC_D2_PT_4_528 : X_AND8
    port map (
      I0 => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_4_IN0,
      I1 => lower_dec_prs_state_fft1,
      I2 => lower_dec_dec_8b10b_prs_state_ffd1,
      I3 => lower_dec_dec_8b10b_prs_state_ffd2,
      I4 => rst_II_UIM,
      I5 => serial_data_5_II_UIM,
      I6 => serial_data_4_II_UIM,
      I7 => N_PZ_304,
      O => lower_dec_k_dec_MC_D2_PT_4
    );
  lower_dec_k_dec_MC_D2_PT_5_529 : X_AND16
    port map (
      I0 => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_5_IN0,
      I1 => lower_dec_prs_state_fft1,
      I2 => lower_dec_dec_8b10b_prs_state_ffd1,
      I3 => lower_dec_dec_8b10b_prs_state_ffd2,
      I4 => rst_II_UIM,
      I5 => serial_data_1_II_UIM,
      I6 => serial_data_0_II_UIM,
      I7 => serial_data_2_II_UIM,
      I8 => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_5_IN8,
      I9 => N_PZ_309,
      I10 => N_PZ_180,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => lower_dec_k_dec_MC_D2_PT_5
    );
  lower_dec_k_dec_MC_D2_PT_6_530 : X_AND16
    port map (
      I0 => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_6_IN0,
      I1 => lower_dec_prs_state_fft1,
      I2 => lower_dec_dec_8b10b_prs_state_ffd1,
      I3 => lower_dec_dec_8b10b_prs_state_ffd2,
      I4 => rst_II_UIM,
      I5 => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_6_IN5,
      I6 => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_6_IN6,
      I7 => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_6_IN7,
      I8 => serial_data_5_II_UIM,
      I9 => N_PZ_180,
      I10 => N_PZ_304,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => lower_dec_k_dec_MC_D2_PT_6
    );
  lower_dec_k_dec_MC_D2_PT_7_531 : X_AND16
    port map (
      I0 => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_7_IN0,
      I1 => lower_dec_prs_state_fft1,
      I2 => lower_dec_dec_8b10b_prs_state_ffd1,
      I3 => lower_dec_dec_8b10b_prs_state_ffd2,
      I4 => rst_II_UIM,
      I5 => serial_data_1_II_UIM,
      I6 => serial_data_0_II_UIM,
      I7 => serial_data_2_II_UIM,
      I8 => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_7_IN8,
      I9 => serial_data_4_II_UIM,
      I10 => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_7_IN10,
      I11 => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_7_IN11,
      I12 => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_7_IN12,
      I13 => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_7_IN13,
      I14 => VCC,
      I15 => VCC,
      O => lower_dec_k_dec_MC_D2_PT_7
    );
  lower_dec_k_dec_MC_D2_PT_8_532 : X_AND16
    port map (
      I0 => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_8_IN0,
      I1 => lower_dec_prs_state_fft1,
      I2 => lower_dec_dec_8b10b_prs_state_ffd1,
      I3 => lower_dec_dec_8b10b_prs_state_ffd2,
      I4 => rst_II_UIM,
      I5 => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_8_IN5,
      I6 => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_8_IN6,
      I7 => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_8_IN7,
      I8 => serial_data_5_II_UIM,
      I9 => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_8_IN9,
      I10 => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_8_IN10,
      I11 => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_8_IN11,
      I12 => serial_data_9_II_UIM,
      I13 => serial_data_8_II_UIM,
      I14 => VCC,
      I15 => VCC,
      O => lower_dec_k_dec_MC_D2_PT_8
    );
  lower_dec_k_dec_MC_D2_533 : X_OR16
    port map (
      I0 => lower_dec_k_dec_MC_D2_PT_0,
      I1 => lower_dec_k_dec_MC_D2_PT_1,
      I2 => lower_dec_k_dec_MC_D2_PT_2,
      I3 => lower_dec_k_dec_MC_D2_PT_3,
      I4 => lower_dec_k_dec_MC_D2_PT_4,
      I5 => lower_dec_k_dec_MC_D2_PT_5,
      I6 => lower_dec_k_dec_MC_D2_PT_6,
      I7 => lower_dec_k_dec_MC_D2_PT_7,
      I8 => lower_dec_k_dec_MC_D2_PT_8,
      I9 => GND,
      I10 => GND,
      I11 => GND,
      I12 => GND,
      I13 => GND,
      I14 => GND,
      I15 => GND,
      O => lower_dec_k_dec_MC_D2
    );
  lower_dec_k_dec_MC_XOR : X_XOR2
    port map (
      I0 => lower_dec_k_dec_MC_D1,
      I1 => lower_dec_k_dec_MC_D2,
      O => lower_dec_k_dec_MC_D
    );
  upper_dec_k_dec_534 : X_BUF
    port map (
      I => upper_dec_k_dec_MC_Q,
      O => upper_dec_k_dec
    );
  upper_dec_k_dec_MC_REG : X_FF
    generic map(
      XON => FALSE
    )
    port map (
      I => upper_dec_k_dec_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => PRLD,
      O => upper_dec_k_dec_MC_Q
    );
  upper_dec_k_dec_MC_D1_535 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => upper_dec_k_dec_MC_D1
    );
  upper_dec_k_dec_MC_D2_PT_0_536 : X_AND2
    port map (
      I0 => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_0_IN0,
      I1 => upper_dec_k_dec,
      O => upper_dec_k_dec_MC_D2_PT_0
    );
  upper_dec_k_dec_MC_D2_PT_1_537 : X_AND4
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => N_PZ_189,
      O => upper_dec_k_dec_MC_D2_PT_1
    );
  upper_dec_k_dec_MC_D2_PT_2_538 : X_AND6
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => upper_dec_iin,
      I4 => upper_dec_ein,
      I5 => N_PZ_302,
      O => upper_dec_k_dec_MC_D2_PT_2
    );
  upper_dec_k_dec_MC_D2_PT_3_539 : X_AND16
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => upper_dec_hin,
      I4 => upper_dec_jin,
      I5 => upper_dec_gin,
      I6 => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_3_IN6,
      I7 => N_PZ_305,
      I8 => upper_dec_ain,
      I9 => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_3_IN9,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => upper_dec_k_dec_MC_D2_PT_3
    );
  upper_dec_k_dec_MC_D2_PT_4_540 : X_AND16
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_4_IN3,
      I4 => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_4_IN4,
      I5 => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_4_IN5,
      I6 => upper_dec_ein,
      I7 => N_PZ_302,
      I8 => upper_dec_ain,
      I9 => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_4_IN9,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => upper_dec_k_dec_MC_D2_PT_4
    );
  upper_dec_k_dec_MC_D2_PT_5_541 : X_AND16
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => upper_dec_hin,
      I4 => upper_dec_jin,
      I5 => upper_dec_gin,
      I6 => upper_dec_iin,
      I7 => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_5_IN7,
      I8 => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_5_IN8,
      I9 => N_PZ_298,
      I10 => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_5_IN10,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => upper_dec_k_dec_MC_D2_PT_5
    );
  upper_dec_k_dec_MC_D2_PT_6_542 : X_AND16
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_6_IN3,
      I4 => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_6_IN4,
      I5 => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_6_IN5,
      I6 => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_6_IN6,
      I7 => upper_dec_ein,
      I8 => N_PZ_302,
      I9 => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_6_IN9,
      I10 => upper_dec_bin,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => upper_dec_k_dec_MC_D2_PT_6
    );
  upper_dec_k_dec_MC_D2_PT_7_543 : X_AND16
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => upper_dec_hin,
      I4 => upper_dec_jin,
      I5 => upper_dec_gin,
      I6 => upper_dec_iin,
      I7 => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_7_IN7,
      I8 => upper_dec_din,
      I9 => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_7_IN9,
      I10 => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_7_IN10,
      I11 => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_7_IN11,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => upper_dec_k_dec_MC_D2_PT_7
    );
  upper_dec_k_dec_MC_D2_PT_8_544 : X_AND16
    port map (
      I0 => rst_II_UIM,
      I1 => upper_dec_dec_8b10b_prs_state_ffd1,
      I2 => upper_dec_dec_8b10b_prs_state_ffd2,
      I3 => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_8_IN3,
      I4 => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_8_IN4,
      I5 => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_8_IN5,
      I6 => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_8_IN6,
      I7 => upper_dec_ein,
      I8 => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_8_IN8,
      I9 => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_8_IN9,
      I10 => upper_dec_ain,
      I11 => upper_dec_bin,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => upper_dec_k_dec_MC_D2_PT_8
    );
  upper_dec_k_dec_MC_D2_545 : X_OR16
    port map (
      I0 => upper_dec_k_dec_MC_D2_PT_0,
      I1 => upper_dec_k_dec_MC_D2_PT_1,
      I2 => upper_dec_k_dec_MC_D2_PT_2,
      I3 => upper_dec_k_dec_MC_D2_PT_3,
      I4 => upper_dec_k_dec_MC_D2_PT_4,
      I5 => upper_dec_k_dec_MC_D2_PT_5,
      I6 => upper_dec_k_dec_MC_D2_PT_6,
      I7 => upper_dec_k_dec_MC_D2_PT_7,
      I8 => upper_dec_k_dec_MC_D2_PT_8,
      I9 => GND,
      I10 => GND,
      I11 => GND,
      I12 => GND,
      I13 => GND,
      I14 => GND,
      I15 => GND,
      O => upper_dec_k_dec_MC_D2
    );
  upper_dec_k_dec_MC_XOR : X_XOR2
    port map (
      I0 => upper_dec_k_dec_MC_D1,
      I1 => upper_dec_k_dec_MC_D2,
      O => upper_dec_k_dec_MC_D
    );
  error_u_546 : X_BUF
    port map (
      I => error_u_MC_Q,
      O => error_u
    );
  error_u_MC_REG : X_BUF
    port map (
      I => error_u_MC_D,
      O => error_u_MC_Q
    );
  error_u_MC_D1_547 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => error_u_MC_D1
    );
  error_u_MC_D2_PT_0_548 : X_AND5
    port map (
      I0 => upper_dec_err_chk_prs_state_ffd1,
      I1 => upper_dec_err_chk_prs_state_ffd2,
      I2 => N_PZ_305,
      I3 => NlwInverterSignal_error_u_MC_D2_PT_0_IN3,
      I4 => NlwInverterSignal_error_u_MC_D2_PT_0_IN4,
      O => error_u_MC_D2_PT_0
    );
  error_u_MC_D2_PT_1_549 : X_AND5
    port map (
      I0 => upper_dec_err_chk_prs_state_ffd1,
      I1 => upper_dec_err_chk_prs_state_ffd2,
      I2 => N_PZ_302,
      I3 => upper_dec_ain,
      I4 => upper_dec_bin,
      O => error_u_MC_D2_PT_1
    );
  error_u_MC_D2_PT_2_550 : X_AND6
    port map (
      I0 => upper_dec_err_chk_prs_state_ffd1,
      I1 => upper_dec_err_chk_prs_state_ffd2,
      I2 => upper_dec_hin,
      I3 => upper_dec_jin,
      I4 => upper_dec_fin,
      I5 => upper_dec_gin,
      O => error_u_MC_D2_PT_2
    );
  error_u_MC_D2_PT_3_551 : X_AND6
    port map (
      I0 => upper_dec_err_chk_prs_state_ffd1,
      I1 => upper_dec_err_chk_prs_state_ffd2,
      I2 => NlwInverterSignal_error_u_MC_D2_PT_3_IN2,
      I3 => NlwInverterSignal_error_u_MC_D2_PT_3_IN3,
      I4 => NlwInverterSignal_error_u_MC_D2_PT_3_IN4,
      I5 => NlwInverterSignal_error_u_MC_D2_PT_3_IN5,
      O => error_u_MC_D2_PT_3
    );
  error_u_MC_D2_PT_4_552 : X_AND6
    port map (
      I0 => upper_dec_err_chk_prs_state_ffd1,
      I1 => upper_dec_err_chk_prs_state_ffd2,
      I2 => upper_dec_iin,
      I3 => upper_dec_ein,
      I4 => N_PZ_302,
      I5 => upper_dec_ain,
      O => error_u_MC_D2_PT_4
    );
  error_u_MC_D2_PT_5_553 : X_AND6
    port map (
      I0 => upper_dec_err_chk_prs_state_ffd1,
      I1 => upper_dec_err_chk_prs_state_ffd2,
      I2 => upper_dec_iin,
      I3 => upper_dec_ein,
      I4 => N_PZ_302,
      I5 => upper_dec_bin,
      O => error_u_MC_D2_PT_5
    );
  error_u_MC_D2_PT_6_554 : X_AND7
    port map (
      I0 => upper_dec_err_chk_prs_state_ffd1,
      I1 => upper_dec_err_chk_prs_state_ffd2,
      I2 => upper_dec_hin,
      I3 => upper_dec_jin,
      I4 => upper_dec_gin,
      I5 => NlwInverterSignal_error_u_MC_D2_PT_6_IN5,
      I6 => upper_dec_ein,
      O => error_u_MC_D2_PT_6
    );
  error_u_MC_D2_PT_7_555 : X_AND7
    port map (
      I0 => upper_dec_err_chk_prs_state_ffd1,
      I1 => upper_dec_err_chk_prs_state_ffd2,
      I2 => upper_dec_hin,
      I3 => upper_dec_jin,
      I4 => upper_dec_gin,
      I5 => NlwInverterSignal_error_u_MC_D2_PT_7_IN5,
      I6 => N_PZ_302,
      O => error_u_MC_D2_PT_7
    );
  error_u_MC_D2_PT_8_556 : X_AND7
    port map (
      I0 => upper_dec_err_chk_prs_state_ffd1,
      I1 => upper_dec_err_chk_prs_state_ffd2,
      I2 => upper_dec_hin,
      I3 => upper_dec_fin,
      I4 => upper_dec_gin,
      I5 => upper_dec_iin,
      I6 => upper_dec_ein,
      O => error_u_MC_D2_PT_8
    );
  error_u_MC_D2_PT_9_557 : X_AND7
    port map (
      I0 => upper_dec_err_chk_prs_state_ffd1,
      I1 => upper_dec_err_chk_prs_state_ffd2,
      I2 => NlwInverterSignal_error_u_MC_D2_PT_9_IN2,
      I3 => NlwInverterSignal_error_u_MC_D2_PT_9_IN3,
      I4 => NlwInverterSignal_error_u_MC_D2_PT_9_IN4,
      I5 => upper_dec_iin,
      I6 => NlwInverterSignal_error_u_MC_D2_PT_9_IN6,
      O => error_u_MC_D2_PT_9
    );
  error_u_MC_D2_PT_10_558 : X_AND7
    port map (
      I0 => upper_dec_err_chk_prs_state_ffd1,
      I1 => upper_dec_err_chk_prs_state_ffd2,
      I2 => NlwInverterSignal_error_u_MC_D2_PT_10_IN2,
      I3 => NlwInverterSignal_error_u_MC_D2_PT_10_IN3,
      I4 => NlwInverterSignal_error_u_MC_D2_PT_10_IN4,
      I5 => upper_dec_ein,
      I6 => N_PZ_305,
      O => error_u_MC_D2_PT_10
    );
  error_u_MC_D2_PT_11_559 : X_AND7
    port map (
      I0 => upper_dec_err_chk_prs_state_ffd1,
      I1 => upper_dec_err_chk_prs_state_ffd2,
      I2 => NlwInverterSignal_error_u_MC_D2_PT_11_IN2,
      I3 => NlwInverterSignal_error_u_MC_D2_PT_11_IN3,
      I4 => NlwInverterSignal_error_u_MC_D2_PT_11_IN4,
      I5 => NlwInverterSignal_error_u_MC_D2_PT_11_IN5,
      I6 => NlwInverterSignal_error_u_MC_D2_PT_11_IN6,
      O => error_u_MC_D2_PT_11
    );
  error_u_MC_D2_PT_12_560 : X_AND7
    port map (
      I0 => upper_dec_err_chk_prs_state_ffd1,
      I1 => upper_dec_err_chk_prs_state_ffd2,
      I2 => upper_dec_iin,
      I3 => upper_dec_ein,
      I4 => NlwInverterSignal_error_u_MC_D2_PT_12_IN4,
      I5 => upper_dec_ain,
      I6 => upper_dec_bin,
      O => error_u_MC_D2_PT_12
    );
  error_u_MC_D2_PT_13_561 : X_AND7
    port map (
      I0 => upper_dec_err_chk_prs_state_ffd1,
      I1 => upper_dec_err_chk_prs_state_ffd2,
      I2 => NlwInverterSignal_error_u_MC_D2_PT_13_IN2,
      I3 => NlwInverterSignal_error_u_MC_D2_PT_13_IN3,
      I4 => NlwInverterSignal_error_u_MC_D2_PT_13_IN4,
      I5 => NlwInverterSignal_error_u_MC_D2_PT_13_IN5,
      I6 => NlwInverterSignal_error_u_MC_D2_PT_13_IN6,
      O => error_u_MC_D2_PT_13
    );
  error_u_MC_D2_PT_14_562 : X_AND8
    port map (
      I0 => upper_dec_err_chk_prs_state_ffd1,
      I1 => upper_dec_err_chk_prs_state_ffd2,
      I2 => upper_dec_hin,
      I3 => upper_dec_jin,
      I4 => upper_dec_gin,
      I5 => NlwInverterSignal_error_u_MC_D2_PT_14_IN5,
      I6 => NlwInverterSignal_error_u_MC_D2_PT_14_IN6,
      I7 => upper_dec_ain,
      O => error_u_MC_D2_PT_14
    );
  error_u_MC_D2_PT_15_563 : X_AND8
    port map (
      I0 => upper_dec_err_chk_prs_state_ffd1,
      I1 => upper_dec_err_chk_prs_state_ffd2,
      I2 => upper_dec_hin,
      I3 => upper_dec_jin,
      I4 => upper_dec_gin,
      I5 => NlwInverterSignal_error_u_MC_D2_PT_15_IN5,
      I6 => NlwInverterSignal_error_u_MC_D2_PT_15_IN6,
      I7 => upper_dec_bin,
      O => error_u_MC_D2_PT_15
    );
  error_u_MC_D2_PT_16_564 : X_AND8
    port map (
      I0 => upper_dec_err_chk_prs_state_ffd1,
      I1 => upper_dec_err_chk_prs_state_ffd2,
      I2 => NlwInverterSignal_error_u_MC_D2_PT_16_IN2,
      I3 => NlwInverterSignal_error_u_MC_D2_PT_16_IN3,
      I4 => NlwInverterSignal_error_u_MC_D2_PT_16_IN4,
      I5 => upper_dec_ein,
      I6 => NlwInverterSignal_error_u_MC_D2_PT_16_IN6,
      I7 => NlwInverterSignal_error_u_MC_D2_PT_16_IN7,
      O => error_u_MC_D2_PT_16
    );
  error_u_MC_D2_PT_17_565 : X_AND8
    port map (
      I0 => upper_dec_err_chk_prs_state_ffd1,
      I1 => upper_dec_err_chk_prs_state_ffd2,
      I2 => NlwInverterSignal_error_u_MC_D2_PT_17_IN2,
      I3 => NlwInverterSignal_error_u_MC_D2_PT_17_IN3,
      I4 => NlwInverterSignal_error_u_MC_D2_PT_17_IN4,
      I5 => upper_dec_ein,
      I6 => NlwInverterSignal_error_u_MC_D2_PT_17_IN6,
      I7 => NlwInverterSignal_error_u_MC_D2_PT_17_IN7,
      O => error_u_MC_D2_PT_17
    );
  error_u_MC_D2_PT_18_566 : X_AND16
    port map (
      I0 => upper_dec_err_chk_prs_state_ffd1,
      I1 => upper_dec_err_chk_prs_state_ffd2,
      I2 => upper_dec_hin,
      I3 => upper_dec_jin,
      I4 => upper_dec_gin,
      I5 => upper_dec_iin,
      I6 => NlwInverterSignal_error_u_MC_D2_PT_18_IN6,
      I7 => upper_dec_ain,
      I8 => upper_dec_bin,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => error_u_MC_D2_PT_18
    );
  error_u_MC_D2_PT_19_567 : X_AND16
    port map (
      I0 => upper_dec_err_chk_prs_state_ffd1,
      I1 => upper_dec_err_chk_prs_state_ffd2,
      I2 => NlwInverterSignal_error_u_MC_D2_PT_19_IN2,
      I3 => NlwInverterSignal_error_u_MC_D2_PT_19_IN3,
      I4 => NlwInverterSignal_error_u_MC_D2_PT_19_IN4,
      I5 => NlwInverterSignal_error_u_MC_D2_PT_19_IN5,
      I6 => upper_dec_ein,
      I7 => NlwInverterSignal_error_u_MC_D2_PT_19_IN7,
      I8 => NlwInverterSignal_error_u_MC_D2_PT_19_IN8,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => error_u_MC_D2_PT_19
    );
  error_u_MC_D2_568 : X_OR32
    port map (
      I0 => error_u_MC_D2_PT_0,
      I1 => error_u_MC_D2_PT_1,
      I2 => error_u_MC_D2_PT_2,
      I3 => error_u_MC_D2_PT_3,
      I4 => error_u_MC_D2_PT_4,
      I5 => error_u_MC_D2_PT_5,
      I6 => error_u_MC_D2_PT_6,
      I7 => error_u_MC_D2_PT_7,
      I8 => error_u_MC_D2_PT_8,
      I9 => error_u_MC_D2_PT_9,
      I10 => error_u_MC_D2_PT_10,
      I11 => error_u_MC_D2_PT_11,
      I12 => error_u_MC_D2_PT_12,
      I13 => error_u_MC_D2_PT_13,
      I14 => error_u_MC_D2_PT_14,
      I15 => error_u_MC_D2_PT_15,
      I16 => error_u_MC_D2_PT_16,
      I17 => error_u_MC_D2_PT_17,
      I18 => error_u_MC_D2_PT_18,
      I19 => error_u_MC_D2_PT_19,
      I20 => GND,
      I21 => GND,
      I22 => GND,
      I23 => GND,
      I24 => GND,
      I25 => GND,
      I26 => GND,
      I27 => GND,
      I28 => GND,
      I29 => GND,
      I30 => GND,
      I31 => GND,
      O => error_u_MC_D2
    );
  error_u_MC_XOR : X_XOR2
    port map (
      I0 => error_u_MC_D1,
      I1 => error_u_MC_D2,
      O => error_u_MC_D
    );
  err_ill_char_det5_569 : X_BUF
    port map (
      I => err_ill_char_det5_MC_Q,
      O => err_ill_char_det5
    );
  err_ill_char_det5_MC_REG : X_BUF
    port map (
      I => err_ill_char_det5_MC_D,
      O => err_ill_char_det5_MC_Q
    );
  err_ill_char_det5_MC_D1_570 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => err_ill_char_det5_MC_D1
    );
  err_ill_char_det5_MC_D2_PT_0_571 : X_AND8
    port map (
      I0 => lower_dec_prs_state_fft2,
      I1 => lower_dec_prs_state_fft1,
      I2 => decoded_data_0_MC_UIM,
      I3 => upper_dec_prs_state_fft2,
      I4 => upper_dec_prs_state_fft1,
      I5 => NlwInverterSignal_err_ill_char_det5_MC_D2_PT_0_IN5,
      I6 => lower_dec_k_dec,
      I7 => upper_dec_k_dec,
      O => err_ill_char_det5_MC_D2_PT_0
    );
  err_ill_char_det5_MC_D2_PT_1_572 : X_AND8
    port map (
      I0 => lower_dec_prs_state_fft2,
      I1 => lower_dec_prs_state_fft1,
      I2 => NlwInverterSignal_err_ill_char_det5_MC_D2_PT_1_IN2,
      I3 => upper_dec_prs_state_fft2,
      I4 => upper_dec_prs_state_fft1,
      I5 => decoded_data_8_MC_UIM,
      I6 => lower_dec_k_dec,
      I7 => upper_dec_k_dec,
      O => err_ill_char_det5_MC_D2_PT_1
    );
  err_ill_char_det5_MC_D2_PT_2_573 : X_AND8
    port map (
      I0 => lower_dec_prs_state_fft2,
      I1 => lower_dec_prs_state_fft1,
      I2 => upper_dec_prs_state_fft2,
      I3 => upper_dec_prs_state_fft1,
      I4 => decoded_data_10_MC_UIM,
      I5 => NlwInverterSignal_err_ill_char_det5_MC_D2_PT_2_IN5,
      I6 => lower_dec_k_dec,
      I7 => upper_dec_k_dec,
      O => err_ill_char_det5_MC_D2_PT_2
    );
  err_ill_char_det5_MC_D2_PT_3_574 : X_AND8
    port map (
      I0 => lower_dec_prs_state_fft2,
      I1 => lower_dec_prs_state_fft1,
      I2 => upper_dec_prs_state_fft2,
      I3 => upper_dec_prs_state_fft1,
      I4 => NlwInverterSignal_err_ill_char_det5_MC_D2_PT_3_IN4,
      I5 => decoded_data_2_MC_UIM,
      I6 => lower_dec_k_dec,
      I7 => upper_dec_k_dec,
      O => err_ill_char_det5_MC_D2_PT_3
    );
  err_ill_char_det5_MC_D2_PT_4_575 : X_AND8
    port map (
      I0 => lower_dec_prs_state_fft2,
      I1 => lower_dec_prs_state_fft1,
      I2 => upper_dec_prs_state_fft2,
      I3 => upper_dec_prs_state_fft1,
      I4 => decoded_data_11_MC_UIM,
      I5 => NlwInverterSignal_err_ill_char_det5_MC_D2_PT_4_IN5,
      I6 => lower_dec_k_dec,
      I7 => upper_dec_k_dec,
      O => err_ill_char_det5_MC_D2_PT_4
    );
  err_ill_char_det5_MC_D2_PT_5_576 : X_AND8
    port map (
      I0 => lower_dec_prs_state_fft2,
      I1 => lower_dec_prs_state_fft1,
      I2 => upper_dec_prs_state_fft2,
      I3 => upper_dec_prs_state_fft1,
      I4 => NlwInverterSignal_err_ill_char_det5_MC_D2_PT_5_IN4,
      I5 => decoded_data_3_MC_UIM,
      I6 => lower_dec_k_dec,
      I7 => upper_dec_k_dec,
      O => err_ill_char_det5_MC_D2_PT_5
    );
  err_ill_char_det5_MC_D2_PT_6_577 : X_AND8
    port map (
      I0 => lower_dec_prs_state_fft2,
      I1 => lower_dec_prs_state_fft1,
      I2 => upper_dec_prs_state_fft2,
      I3 => upper_dec_prs_state_fft1,
      I4 => decoded_data_12_MC_UIM,
      I5 => NlwInverterSignal_err_ill_char_det5_MC_D2_PT_6_IN5,
      I6 => lower_dec_k_dec,
      I7 => upper_dec_k_dec,
      O => err_ill_char_det5_MC_D2_PT_6
    );
  err_ill_char_det5_MC_D2_PT_7_578 : X_AND8
    port map (
      I0 => lower_dec_prs_state_fft2,
      I1 => lower_dec_prs_state_fft1,
      I2 => upper_dec_prs_state_fft2,
      I3 => upper_dec_prs_state_fft1,
      I4 => NlwInverterSignal_err_ill_char_det5_MC_D2_PT_7_IN4,
      I5 => decoded_data_4_MC_UIM,
      I6 => lower_dec_k_dec,
      I7 => upper_dec_k_dec,
      O => err_ill_char_det5_MC_D2_PT_7
    );
  err_ill_char_det5_MC_D2_PT_8_579 : X_AND8
    port map (
      I0 => lower_dec_prs_state_fft2,
      I1 => lower_dec_prs_state_fft1,
      I2 => upper_dec_prs_state_fft2,
      I3 => upper_dec_prs_state_fft1,
      I4 => decoded_data_13_MC_UIM,
      I5 => NlwInverterSignal_err_ill_char_det5_MC_D2_PT_8_IN5,
      I6 => lower_dec_k_dec,
      I7 => upper_dec_k_dec,
      O => err_ill_char_det5_MC_D2_PT_8
    );
  err_ill_char_det5_MC_D2_PT_9_580 : X_AND8
    port map (
      I0 => lower_dec_prs_state_fft2,
      I1 => lower_dec_prs_state_fft1,
      I2 => upper_dec_prs_state_fft2,
      I3 => upper_dec_prs_state_fft1,
      I4 => NlwInverterSignal_err_ill_char_det5_MC_D2_PT_9_IN4,
      I5 => decoded_data_5_MC_UIM,
      I6 => lower_dec_k_dec,
      I7 => upper_dec_k_dec,
      O => err_ill_char_det5_MC_D2_PT_9
    );
  err_ill_char_det5_MC_D2_PT_10_581 : X_AND8
    port map (
      I0 => lower_dec_prs_state_fft2,
      I1 => lower_dec_prs_state_fft1,
      I2 => upper_dec_prs_state_fft2,
      I3 => upper_dec_prs_state_fft1,
      I4 => decoded_data_14_MC_UIM,
      I5 => NlwInverterSignal_err_ill_char_det5_MC_D2_PT_10_IN5,
      I6 => lower_dec_k_dec,
      I7 => upper_dec_k_dec,
      O => err_ill_char_det5_MC_D2_PT_10
    );
  err_ill_char_det5_MC_D2_PT_11_582 : X_AND8
    port map (
      I0 => lower_dec_prs_state_fft2,
      I1 => lower_dec_prs_state_fft1,
      I2 => upper_dec_prs_state_fft2,
      I3 => upper_dec_prs_state_fft1,
      I4 => NlwInverterSignal_err_ill_char_det5_MC_D2_PT_11_IN4,
      I5 => decoded_data_6_MC_UIM,
      I6 => lower_dec_k_dec,
      I7 => upper_dec_k_dec,
      O => err_ill_char_det5_MC_D2_PT_11
    );
  err_ill_char_det5_MC_D2_PT_12_583 : X_AND8
    port map (
      I0 => lower_dec_prs_state_fft2,
      I1 => lower_dec_prs_state_fft1,
      I2 => upper_dec_prs_state_fft2,
      I3 => upper_dec_prs_state_fft1,
      I4 => decoded_data_15_MC_UIM,
      I5 => NlwInverterSignal_err_ill_char_det5_MC_D2_PT_12_IN5,
      I6 => lower_dec_k_dec,
      I7 => upper_dec_k_dec,
      O => err_ill_char_det5_MC_D2_PT_12
    );
  err_ill_char_det5_MC_D2_PT_13_584 : X_AND8
    port map (
      I0 => lower_dec_prs_state_fft2,
      I1 => lower_dec_prs_state_fft1,
      I2 => upper_dec_prs_state_fft2,
      I3 => upper_dec_prs_state_fft1,
      I4 => NlwInverterSignal_err_ill_char_det5_MC_D2_PT_13_IN4,
      I5 => decoded_data_7_MC_UIM,
      I6 => lower_dec_k_dec,
      I7 => upper_dec_k_dec,
      O => err_ill_char_det5_MC_D2_PT_13
    );
  err_ill_char_det5_MC_D2_PT_14_585 : X_AND8
    port map (
      I0 => lower_dec_prs_state_fft2,
      I1 => lower_dec_prs_state_fft1,
      I2 => upper_dec_prs_state_fft2,
      I3 => upper_dec_prs_state_fft1,
      I4 => decoded_data_1_MC_UIM,
      I5 => NlwInverterSignal_err_ill_char_det5_MC_D2_PT_14_IN5,
      I6 => lower_dec_k_dec,
      I7 => upper_dec_k_dec,
      O => err_ill_char_det5_MC_D2_PT_14
    );
  err_ill_char_det5_MC_D2_PT_15_586 : X_AND8
    port map (
      I0 => lower_dec_prs_state_fft2,
      I1 => lower_dec_prs_state_fft1,
      I2 => upper_dec_prs_state_fft2,
      I3 => upper_dec_prs_state_fft1,
      I4 => NlwInverterSignal_err_ill_char_det5_MC_D2_PT_15_IN4,
      I5 => decoded_data_9_MC_UIM,
      I6 => lower_dec_k_dec,
      I7 => upper_dec_k_dec,
      O => err_ill_char_det5_MC_D2_PT_15
    );
  err_ill_char_det5_MC_D2_587 : X_OR16
    port map (
      I0 => err_ill_char_det5_MC_D2_PT_0,
      I1 => err_ill_char_det5_MC_D2_PT_1,
      I2 => err_ill_char_det5_MC_D2_PT_2,
      I3 => err_ill_char_det5_MC_D2_PT_3,
      I4 => err_ill_char_det5_MC_D2_PT_4,
      I5 => err_ill_char_det5_MC_D2_PT_5,
      I6 => err_ill_char_det5_MC_D2_PT_6,
      I7 => err_ill_char_det5_MC_D2_PT_7,
      I8 => err_ill_char_det5_MC_D2_PT_8,
      I9 => err_ill_char_det5_MC_D2_PT_9,
      I10 => err_ill_char_det5_MC_D2_PT_10,
      I11 => err_ill_char_det5_MC_D2_PT_11,
      I12 => err_ill_char_det5_MC_D2_PT_12,
      I13 => err_ill_char_det5_MC_D2_PT_13,
      I14 => err_ill_char_det5_MC_D2_PT_14,
      I15 => err_ill_char_det5_MC_D2_PT_15,
      O => err_ill_char_det5_MC_D2
    );
  err_ill_char_det5_MC_XOR : X_XOR2
    port map (
      I0 => err_ill_char_det5_MC_D1,
      I1 => err_ill_char_det5_MC_D2,
      O => err_ill_char_det5_MC_D
    );
  N_PZ_217_588 : X_BUF
    port map (
      I => N_PZ_217_MC_Q,
      O => N_PZ_217
    );
  N_PZ_217_MC_REG : X_BUF
    port map (
      I => N_PZ_217_MC_D,
      O => N_PZ_217_MC_Q
    );
  N_PZ_217_MC_D1_589 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => N_PZ_217_MC_D1
    );
  N_PZ_217_MC_D2_PT_0_590 : X_AND8
    port map (
      I0 => NlwInverterSignal_N_PZ_217_MC_D2_PT_0_IN0,
      I1 => lower_dec_prs_state_fft1,
      I2 => NlwInverterSignal_N_PZ_217_MC_D2_PT_0_IN2,
      I3 => NlwInverterSignal_N_PZ_217_MC_D2_PT_0_IN3,
      I4 => NlwInverterSignal_N_PZ_217_MC_D2_PT_0_IN4,
      I5 => NlwInverterSignal_N_PZ_217_MC_D2_PT_0_IN5,
      I6 => NlwInverterSignal_N_PZ_217_MC_D2_PT_0_IN6,
      I7 => NlwInverterSignal_N_PZ_217_MC_D2_PT_0_IN7,
      O => N_PZ_217_MC_D2_PT_0
    );
  N_PZ_217_MC_D2_PT_1_591 : X_AND8
    port map (
      I0 => NlwInverterSignal_N_PZ_217_MC_D2_PT_1_IN0,
      I1 => lower_dec_prs_state_fft1,
      I2 => NlwInverterSignal_N_PZ_217_MC_D2_PT_1_IN2,
      I3 => NlwInverterSignal_N_PZ_217_MC_D2_PT_1_IN3,
      I4 => serial_data_9_II_UIM,
      I5 => NlwInverterSignal_N_PZ_217_MC_D2_PT_1_IN5,
      I6 => NlwInverterSignal_N_PZ_217_MC_D2_PT_1_IN6,
      I7 => NlwInverterSignal_N_PZ_217_MC_D2_PT_1_IN7,
      O => N_PZ_217_MC_D2_PT_1
    );
  N_PZ_217_MC_D2_PT_2_592 : X_AND8
    port map (
      I0 => NlwInverterSignal_N_PZ_217_MC_D2_PT_2_IN0,
      I1 => lower_dec_prs_state_fft1,
      I2 => NlwInverterSignal_N_PZ_217_MC_D2_PT_2_IN2,
      I3 => NlwInverterSignal_N_PZ_217_MC_D2_PT_2_IN3,
      I4 => serial_data_8_II_UIM,
      I5 => NlwInverterSignal_N_PZ_217_MC_D2_PT_2_IN5,
      I6 => NlwInverterSignal_N_PZ_217_MC_D2_PT_2_IN6,
      I7 => NlwInverterSignal_N_PZ_217_MC_D2_PT_2_IN7,
      O => N_PZ_217_MC_D2_PT_2
    );
  N_PZ_217_MC_D2_593 : X_OR3
    port map (
      I0 => N_PZ_217_MC_D2_PT_0,
      I1 => N_PZ_217_MC_D2_PT_1,
      I2 => N_PZ_217_MC_D2_PT_2,
      O => N_PZ_217_MC_D2
    );
  N_PZ_217_MC_XOR : X_XOR2
    port map (
      I0 => N_PZ_217_MC_D1,
      I1 => N_PZ_217_MC_D2,
      O => N_PZ_217_MC_D
    );
  NlwInverterBlock_FOOBAR1_ctinst_0_OUT : X_INV
    port map (
      I => NlwInverterSignal_FOOBAR1_ctinst_0_OUT,
      O => FOOBAR1_ctinst_0
    );
  NlwInverterBlock_lower_dec_prs_state_fft2_MC_D2_PT_0_IN2 : X_INV
    port map (
      I => frame_in_dec_II_UIM,
      O => NlwInverterSignal_lower_dec_prs_state_fft2_MC_D2_PT_0_IN2
    );
  NlwInverterBlock_lower_dec_prs_state_fft2_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => lower_dec_prs_state_fft2,
      O => NlwInverterSignal_lower_dec_prs_state_fft2_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_lower_dec_prs_state_fft1_MC_D2_PT_0_IN2 : X_INV
    port map (
      I => frame_in_dec_II_UIM,
      O => NlwInverterSignal_lower_dec_prs_state_fft1_MC_D2_PT_0_IN2
    );
  NlwInverterBlock_lower_dec_prs_state_fft1_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => lower_dec_prs_state_fft2,
      O => NlwInverterSignal_lower_dec_prs_state_fft1_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_lower_dec_prs_state_fft1_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => lower_dec_prs_state_fft1,
      O => NlwInverterSignal_lower_dec_prs_state_fft1_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_lower_dec_dec_8b10b_prs_state_ffd1_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => lower_dec_dec_8b10b_prs_state_ffd2,
      O => NlwInverterSignal_lower_dec_dec_8b10b_prs_state_ffd1_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_lower_dec_dec_8b10b_prs_state_ffd1_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => lower_dec_prs_state_fft2,
      O => NlwInverterSignal_lower_dec_dec_8b10b_prs_state_ffd1_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_lower_dec_dec_8b10b_prs_state_ffd1_MC_D2_PT_1_IN2 : X_INV
    port map (
      I => lower_dec_dec_8b10b_prs_state_ffd2,
      O => NlwInverterSignal_lower_dec_dec_8b10b_prs_state_ffd1_MC_D2_PT_1_IN2
    );
  NlwInverterBlock_lower_dec_dec_8b10b_prs_state_ffd2_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => lower_dec_prs_state_fft2,
      O => NlwInverterSignal_lower_dec_dec_8b10b_prs_state_ffd2_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_lower_dec_err_chk_prs_state_ffd1_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => lower_dec_err_chk_prs_state_ffd2,
      O => NlwInverterSignal_lower_dec_err_chk_prs_state_ffd1_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_lower_dec_err_chk_prs_state_ffd1_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => lower_dec_prs_state_fft2,
      O => NlwInverterSignal_lower_dec_err_chk_prs_state_ffd1_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_lower_dec_err_chk_prs_state_ffd1_MC_D2_PT_1_IN2 : X_INV
    port map (
      I => lower_dec_err_chk_prs_state_ffd2,
      O => NlwInverterSignal_lower_dec_err_chk_prs_state_ffd1_MC_D2_PT_1_IN2
    );
  NlwInverterBlock_lower_dec_err_chk_prs_state_ffd2_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => lower_dec_prs_state_fft2,
      O => NlwInverterSignal_lower_dec_err_chk_prs_state_ffd2_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_lower_dec_hout_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_lower_dec_hout_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_lower_dec_hout_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => lower_dec_prs_state_fft2,
      O => NlwInverterSignal_lower_dec_hout_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_lower_dec_hout_MC_D2_PT_1_IN6 : X_INV
    port map (
      I => serial_data_0_II_UIM,
      O => NlwInverterSignal_lower_dec_hout_MC_D2_PT_1_IN6
    );
  NlwInverterBlock_lower_dec_hout_MC_D2_PT_1_IN7 : X_INV
    port map (
      I => N_PZ_188,
      O => NlwInverterSignal_lower_dec_hout_MC_D2_PT_1_IN7
    );
  NlwInverterBlock_lower_dec_hout_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => lower_dec_prs_state_fft2,
      O => NlwInverterSignal_lower_dec_hout_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_lower_dec_hout_MC_D2_PT_2_IN5 : X_INV
    port map (
      I => serial_data_1_II_UIM,
      O => NlwInverterSignal_lower_dec_hout_MC_D2_PT_2_IN5
    );
  NlwInverterBlock_lower_dec_hout_MC_D2_PT_3_IN0 : X_INV
    port map (
      I => lower_dec_prs_state_fft2,
      O => NlwInverterSignal_lower_dec_hout_MC_D2_PT_3_IN0
    );
  NlwInverterBlock_lower_dec_hout_MC_D2_PT_3_IN7 : X_INV
    port map (
      I => serial_data_3_II_UIM,
      O => NlwInverterSignal_lower_dec_hout_MC_D2_PT_3_IN7
    );
  NlwInverterBlock_lower_dec_hout_MC_D2_PT_4_IN0 : X_INV
    port map (
      I => lower_dec_prs_state_fft2,
      O => NlwInverterSignal_lower_dec_hout_MC_D2_PT_4_IN0
    );
  NlwInverterBlock_lower_dec_hout_MC_D2_PT_4_IN6 : X_INV
    port map (
      I => serial_data_0_II_UIM,
      O => NlwInverterSignal_lower_dec_hout_MC_D2_PT_4_IN6
    );
  NlwInverterBlock_lower_dec_hout_MC_D2_PT_5_IN0 : X_INV
    port map (
      I => lower_dec_prs_state_fft2,
      O => NlwInverterSignal_lower_dec_hout_MC_D2_PT_5_IN0
    );
  NlwInverterBlock_lower_dec_hout_MC_D2_PT_5_IN6 : X_INV
    port map (
      I => serial_data_0_II_UIM,
      O => NlwInverterSignal_lower_dec_hout_MC_D2_PT_5_IN6
    );
  NlwInverterBlock_lower_dec_hout_MC_D2_PT_5_IN7 : X_INV
    port map (
      I => serial_data_3_II_UIM,
      O => NlwInverterSignal_lower_dec_hout_MC_D2_PT_5_IN7
    );
  NlwInverterBlock_lower_dec_hout_MC_D2_PT_5_IN8 : X_INV
    port map (
      I => serial_data_2_II_UIM,
      O => NlwInverterSignal_lower_dec_hout_MC_D2_PT_5_IN8
    );
  NlwInverterBlock_lower_dec_hout_MC_D2_PT_6_IN0 : X_INV
    port map (
      I => lower_dec_prs_state_fft2,
      O => NlwInverterSignal_lower_dec_hout_MC_D2_PT_6_IN0
    );
  NlwInverterBlock_lower_dec_hout_MC_D2_PT_6_IN5 : X_INV
    port map (
      I => serial_data_1_II_UIM,
      O => NlwInverterSignal_lower_dec_hout_MC_D2_PT_6_IN5
    );
  NlwInverterBlock_lower_dec_hout_MC_D2_PT_7_IN0 : X_INV
    port map (
      I => lower_dec_prs_state_fft2,
      O => NlwInverterSignal_lower_dec_hout_MC_D2_PT_7_IN0
    );
  NlwInverterBlock_lower_dec_hout_MC_D2_PT_7_IN5 : X_INV
    port map (
      I => serial_data_1_II_UIM,
      O => NlwInverterSignal_lower_dec_hout_MC_D2_PT_7_IN5
    );
  NlwInverterBlock_lower_dec_hout_MC_D2_PT_7_IN7 : X_INV
    port map (
      I => serial_data_3_II_UIM,
      O => NlwInverterSignal_lower_dec_hout_MC_D2_PT_7_IN7
    );
  NlwInverterBlock_lower_dec_hout_MC_D2_PT_7_IN8 : X_INV
    port map (
      I => serial_data_2_II_UIM,
      O => NlwInverterSignal_lower_dec_hout_MC_D2_PT_7_IN8
    );
  NlwInverterBlock_lower_dec_hout_MC_D2_PT_8_IN0 : X_INV
    port map (
      I => lower_dec_prs_state_fft2,
      O => NlwInverterSignal_lower_dec_hout_MC_D2_PT_8_IN0
    );
  NlwInverterBlock_lower_dec_hout_MC_D2_PT_8_IN5 : X_INV
    port map (
      I => serial_data_1_II_UIM,
      O => NlwInverterSignal_lower_dec_hout_MC_D2_PT_8_IN5
    );
  NlwInverterBlock_lower_dec_hout_MC_D2_PT_8_IN6 : X_INV
    port map (
      I => serial_data_0_II_UIM,
      O => NlwInverterSignal_lower_dec_hout_MC_D2_PT_8_IN6
    );
  NlwInverterBlock_lower_dec_hout_MC_D2_PT_8_IN8 : X_INV
    port map (
      I => serial_data_2_II_UIM,
      O => NlwInverterSignal_lower_dec_hout_MC_D2_PT_8_IN8
    );
  NlwInverterBlock_N_PZ_188_MC_D1_PT_0_IN0 : X_INV
    port map (
      I => serial_data_5_II_UIM,
      O => NlwInverterSignal_N_PZ_188_MC_D1_PT_0_IN0
    );
  NlwInverterBlock_N_PZ_188_MC_D1_PT_0_IN1 : X_INV
    port map (
      I => serial_data_4_II_UIM,
      O => NlwInverterSignal_N_PZ_188_MC_D1_PT_0_IN1
    );
  NlwInverterBlock_N_PZ_309_MC_D1_PT_0_IN0 : X_INV
    port map (
      I => serial_data_7_II_UIM,
      O => NlwInverterSignal_N_PZ_309_MC_D1_PT_0_IN0
    );
  NlwInverterBlock_N_PZ_309_MC_D1_PT_0_IN1 : X_INV
    port map (
      I => serial_data_6_II_UIM,
      O => NlwInverterSignal_N_PZ_309_MC_D1_PT_0_IN1
    );
  NlwInverterBlock_upper_dec_prs_state_fft2_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => frame_in_dec_II_UIM,
      O => NlwInverterSignal_upper_dec_prs_state_fft2_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_upper_dec_prs_state_fft2_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => upper_dec_prs_state_fft2,
      O => NlwInverterSignal_upper_dec_prs_state_fft2_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_upper_dec_prs_state_fft1_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => upper_dec_prs_state_fft2,
      O => NlwInverterSignal_upper_dec_prs_state_fft1_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_upper_dec_prs_state_fft1_MC_D2_PT_0_IN2 : X_INV
    port map (
      I => upper_dec_prs_state_fft1,
      O => NlwInverterSignal_upper_dec_prs_state_fft1_MC_D2_PT_0_IN2
    );
  NlwInverterBlock_upper_dec_prs_state_fft1_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => frame_in_dec_II_UIM,
      O => NlwInverterSignal_upper_dec_prs_state_fft1_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_upper_dec_dec_8b10b_prs_state_ffd1_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => upper_dec_dec_8b10b_prs_state_ffd2,
      O => NlwInverterSignal_upper_dec_dec_8b10b_prs_state_ffd1_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_upper_dec_dec_8b10b_prs_state_ffd1_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => upper_dec_prs_state_fft2,
      O => NlwInverterSignal_upper_dec_dec_8b10b_prs_state_ffd1_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_upper_dec_dec_8b10b_prs_state_ffd1_MC_D2_PT_1_IN2 : X_INV
    port map (
      I => upper_dec_dec_8b10b_prs_state_ffd2,
      O => NlwInverterSignal_upper_dec_dec_8b10b_prs_state_ffd1_MC_D2_PT_1_IN2
    );
  NlwInverterBlock_upper_dec_dec_8b10b_prs_state_ffd2_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => upper_dec_prs_state_fft2,
      O => NlwInverterSignal_upper_dec_dec_8b10b_prs_state_ffd2_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_upper_dec_err_chk_prs_state_ffd1_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => upper_dec_err_chk_prs_state_ffd2,
      O => NlwInverterSignal_upper_dec_err_chk_prs_state_ffd1_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_upper_dec_err_chk_prs_state_ffd1_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => upper_dec_prs_state_fft2,
      O => NlwInverterSignal_upper_dec_err_chk_prs_state_ffd1_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_upper_dec_err_chk_prs_state_ffd1_MC_D2_PT_1_IN2 : X_INV
    port map (
      I => upper_dec_err_chk_prs_state_ffd2,
      O => NlwInverterSignal_upper_dec_err_chk_prs_state_ffd1_MC_D2_PT_1_IN2
    );
  NlwInverterBlock_upper_dec_err_chk_prs_state_ffd2_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => upper_dec_prs_state_fft2,
      O => NlwInverterSignal_upper_dec_err_chk_prs_state_ffd2_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_upper_dec_fout_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_upper_dec_fout_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_upper_dec_fout_MC_D2_PT_1_IN5 : X_INV
    port map (
      I => upper_dec_fin,
      O => NlwInverterSignal_upper_dec_fout_MC_D2_PT_1_IN5
    );
  NlwInverterBlock_upper_dec_fout_MC_D2_PT_2_IN3 : X_INV
    port map (
      I => upper_dec_hin,
      O => NlwInverterSignal_upper_dec_fout_MC_D2_PT_2_IN3
    );
  NlwInverterBlock_upper_dec_fout_MC_D2_PT_2_IN4 : X_INV
    port map (
      I => upper_dec_jin,
      O => NlwInverterSignal_upper_dec_fout_MC_D2_PT_2_IN4
    );
  NlwInverterBlock_upper_dec_fout_MC_D2_PT_3_IN4 : X_INV
    port map (
      I => upper_dec_fin,
      O => NlwInverterSignal_upper_dec_fout_MC_D2_PT_3_IN4
    );
  NlwInverterBlock_upper_dec_fout_MC_D2_PT_4_IN3 : X_INV
    port map (
      I => upper_dec_jin,
      O => NlwInverterSignal_upper_dec_fout_MC_D2_PT_4_IN3
    );
  NlwInverterBlock_upper_dec_fout_MC_D2_PT_4_IN5 : X_INV
    port map (
      I => N_PZ_189,
      O => NlwInverterSignal_upper_dec_fout_MC_D2_PT_4_IN5
    );
  NlwInverterBlock_upper_dec_fout_MC_D2_PT_5_IN4 : X_INV
    port map (
      I => upper_dec_jin,
      O => NlwInverterSignal_upper_dec_fout_MC_D2_PT_5_IN4
    );
  NlwInverterBlock_upper_dec_fout_MC_D2_PT_6_IN3 : X_INV
    port map (
      I => upper_dec_hin,
      O => NlwInverterSignal_upper_dec_fout_MC_D2_PT_6_IN3
    );
  NlwInverterBlock_upper_dec_fout_MC_D2_PT_6_IN5 : X_INV
    port map (
      I => N_PZ_189,
      O => NlwInverterSignal_upper_dec_fout_MC_D2_PT_6_IN5
    );
  NlwInverterBlock_upper_dec_fout_MC_D2_PT_6_IN6 : X_INV
    port map (
      I => upper_dec_gin,
      O => NlwInverterSignal_upper_dec_fout_MC_D2_PT_6_IN6
    );
  NlwInverterBlock_upper_dec_hin_MC_D1_PT_0_IN0 : X_INV
    port map (
      I => upper_dec_prs_state_fft2,
      O => NlwInverterSignal_upper_dec_hin_MC_D1_PT_0_IN0
    );
  NlwInverterBlock_upper_dec_jin_MC_D1_PT_0_IN0 : X_INV
    port map (
      I => upper_dec_prs_state_fft2,
      O => NlwInverterSignal_upper_dec_jin_MC_D1_PT_0_IN0
    );
  NlwInverterBlock_upper_dec_fin_MC_D1_PT_0_IN0 : X_INV
    port map (
      I => upper_dec_prs_state_fft2,
      O => NlwInverterSignal_upper_dec_fin_MC_D1_PT_0_IN0
    );
  NlwInverterBlock_N_PZ_189_MC_D1_PT_0_IN0 : X_INV
    port map (
      I => upper_dec_iin,
      O => NlwInverterSignal_N_PZ_189_MC_D1_PT_0_IN0
    );
  NlwInverterBlock_N_PZ_189_MC_D1_PT_0_IN1 : X_INV
    port map (
      I => upper_dec_ein,
      O => NlwInverterSignal_N_PZ_189_MC_D1_PT_0_IN1
    );
  NlwInverterBlock_upper_dec_iin_MC_D1_PT_0_IN0 : X_INV
    port map (
      I => upper_dec_prs_state_fft2,
      O => NlwInverterSignal_upper_dec_iin_MC_D1_PT_0_IN0
    );
  NlwInverterBlock_upper_dec_ein_MC_D1_PT_0_IN0 : X_INV
    port map (
      I => upper_dec_prs_state_fft2,
      O => NlwInverterSignal_upper_dec_ein_MC_D1_PT_0_IN0
    );
  NlwInverterBlock_N_PZ_305_MC_D1_PT_0_IN0 : X_INV
    port map (
      I => upper_dec_din,
      O => NlwInverterSignal_N_PZ_305_MC_D1_PT_0_IN0
    );
  NlwInverterBlock_N_PZ_305_MC_D1_PT_0_IN1 : X_INV
    port map (
      I => upper_dec_cin,
      O => NlwInverterSignal_N_PZ_305_MC_D1_PT_0_IN1
    );
  NlwInverterBlock_upper_dec_din_MC_D1_PT_0_IN0 : X_INV
    port map (
      I => upper_dec_prs_state_fft2,
      O => NlwInverterSignal_upper_dec_din_MC_D1_PT_0_IN0
    );
  NlwInverterBlock_upper_dec_cin_MC_D1_PT_0_IN0 : X_INV
    port map (
      I => upper_dec_prs_state_fft2,
      O => NlwInverterSignal_upper_dec_cin_MC_D1_PT_0_IN0
    );
  NlwInverterBlock_upper_dec_gin_MC_D1_PT_0_IN0 : X_INV
    port map (
      I => upper_dec_prs_state_fft2,
      O => NlwInverterSignal_upper_dec_gin_MC_D1_PT_0_IN0
    );
  NlwInverterBlock_upper_dec_eout_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_upper_dec_eout_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_upper_dec_eout_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => upper_dec_din,
      O => NlwInverterSignal_upper_dec_eout_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_upper_dec_eout_MC_D2_PT_2_IN3 : X_INV
    port map (
      I => upper_dec_ain,
      O => NlwInverterSignal_upper_dec_eout_MC_D2_PT_2_IN3
    );
  NlwInverterBlock_upper_dec_eout_MC_D2_PT_3_IN1 : X_INV
    port map (
      I => N_PZ_308,
      O => NlwInverterSignal_upper_dec_eout_MC_D2_PT_3_IN1
    );
  NlwInverterBlock_upper_dec_eout_MC_D2_PT_3_IN2 : X_INV
    port map (
      I => upper_dec_ain,
      O => NlwInverterSignal_upper_dec_eout_MC_D2_PT_3_IN2
    );
  NlwInverterBlock_upper_dec_eout_MC_D2_PT_4_IN2 : X_INV
    port map (
      I => N_PZ_302,
      O => NlwInverterSignal_upper_dec_eout_MC_D2_PT_4_IN2
    );
  NlwInverterBlock_upper_dec_eout_MC_D2_PT_4_IN4 : X_INV
    port map (
      I => N_PZ_348,
      O => NlwInverterSignal_upper_dec_eout_MC_D2_PT_4_IN4
    );
  NlwInverterBlock_upper_dec_eout_MC_D2_PT_5_IN0 : X_INV
    port map (
      I => N_PZ_298,
      O => NlwInverterSignal_upper_dec_eout_MC_D2_PT_5_IN0
    );
  NlwInverterBlock_upper_dec_eout_MC_D2_PT_5_IN3 : X_INV
    port map (
      I => upper_dec_bin,
      O => NlwInverterSignal_upper_dec_eout_MC_D2_PT_5_IN3
    );
  NlwInverterBlock_upper_dec_eout_MC_D2_PT_5_IN4 : X_INV
    port map (
      I => N_PZ_348,
      O => NlwInverterSignal_upper_dec_eout_MC_D2_PT_5_IN4
    );
  NlwInverterBlock_upper_dec_eout_MC_D2_PT_7_IN4 : X_INV
    port map (
      I => upper_dec_din,
      O => NlwInverterSignal_upper_dec_eout_MC_D2_PT_7_IN4
    );
  NlwInverterBlock_upper_dec_eout_MC_D2_PT_8_IN4 : X_INV
    port map (
      I => N_PZ_298,
      O => NlwInverterSignal_upper_dec_eout_MC_D2_PT_8_IN4
    );
  NlwInverterBlock_upper_dec_eout_MC_D2_PT_8_IN5 : X_INV
    port map (
      I => N_PZ_308,
      O => NlwInverterSignal_upper_dec_eout_MC_D2_PT_8_IN5
    );
  NlwInverterBlock_upper_dec_eout_MC_D2_PT_9_IN4 : X_INV
    port map (
      I => N_PZ_298,
      O => NlwInverterSignal_upper_dec_eout_MC_D2_PT_9_IN4
    );
  NlwInverterBlock_upper_dec_eout_MC_D2_PT_9_IN5 : X_INV
    port map (
      I => N_PZ_308,
      O => NlwInverterSignal_upper_dec_eout_MC_D2_PT_9_IN5
    );
  NlwInverterBlock_upper_dec_eout_MC_D2_PT_9_IN6 : X_INV
    port map (
      I => upper_dec_ain,
      O => NlwInverterSignal_upper_dec_eout_MC_D2_PT_9_IN6
    );
  NlwInverterBlock_N_PZ_298_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => upper_dec_bin,
      O => NlwInverterSignal_N_PZ_298_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_N_PZ_298_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => upper_dec_cin,
      O => NlwInverterSignal_N_PZ_298_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_upper_dec_bin_MC_D1_PT_0_IN0 : X_INV
    port map (
      I => upper_dec_prs_state_fft2,
      O => NlwInverterSignal_upper_dec_bin_MC_D1_PT_0_IN0
    );
  NlwInverterBlock_N_PZ_308_MC_D2_PT_0_IN4 : X_INV
    port map (
      I => upper_dec_ain,
      O => NlwInverterSignal_N_PZ_308_MC_D2_PT_0_IN4
    );
  NlwInverterBlock_N_PZ_308_MC_D2_PT_1_IN3 : X_INV
    port map (
      I => upper_dec_iin,
      O => NlwInverterSignal_N_PZ_308_MC_D2_PT_1_IN3
    );
  NlwInverterBlock_upper_dec_ain_MC_D1_PT_0_IN0 : X_INV
    port map (
      I => upper_dec_prs_state_fft2,
      O => NlwInverterSignal_upper_dec_ain_MC_D1_PT_0_IN0
    );
  NlwInverterBlock_N_PZ_343_MC_D2_PT_0_IN4 : X_INV
    port map (
      I => upper_dec_cin,
      O => NlwInverterSignal_N_PZ_343_MC_D2_PT_0_IN4
    );
  NlwInverterBlock_N_PZ_343_MC_D2_PT_1_IN4 : X_INV
    port map (
      I => upper_dec_ain,
      O => NlwInverterSignal_N_PZ_343_MC_D2_PT_1_IN4
    );
  NlwInverterBlock_N_PZ_348_MC_D2_PT_0_IN3 : X_INV
    port map (
      I => upper_dec_iin,
      O => NlwInverterSignal_N_PZ_348_MC_D2_PT_0_IN3
    );
  NlwInverterBlock_N_PZ_348_MC_D2_PT_0_IN6 : X_INV
    port map (
      I => upper_dec_bin,
      O => NlwInverterSignal_N_PZ_348_MC_D2_PT_0_IN6
    );
  NlwInverterBlock_N_PZ_348_MC_D2_PT_1_IN6 : X_INV
    port map (
      I => upper_dec_cin,
      O => NlwInverterSignal_N_PZ_348_MC_D2_PT_1_IN6
    );
  NlwInverterBlock_N_PZ_348_MC_D2_PT_1_IN7 : X_INV
    port map (
      I => upper_dec_ain,
      O => NlwInverterSignal_N_PZ_348_MC_D2_PT_1_IN7
    );
  NlwInverterBlock_upper_dec_dout_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_upper_dec_dout_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_upper_dec_dout_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => upper_dec_iin,
      O => NlwInverterSignal_upper_dec_dout_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_upper_dec_dout_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => upper_dec_ein,
      O => NlwInverterSignal_upper_dec_dout_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_upper_dec_dout_MC_D2_PT_3_IN1 : X_INV
    port map (
      I => upper_dec_ain,
      O => NlwInverterSignal_upper_dec_dout_MC_D2_PT_3_IN1
    );
  NlwInverterBlock_upper_dec_dout_MC_D2_PT_4_IN3 : X_INV
    port map (
      I => upper_dec_iin,
      O => NlwInverterSignal_upper_dec_dout_MC_D2_PT_4_IN3
    );
  NlwInverterBlock_upper_dec_dout_MC_D2_PT_4_IN6 : X_INV
    port map (
      I => upper_dec_bin,
      O => NlwInverterSignal_upper_dec_dout_MC_D2_PT_4_IN6
    );
  NlwInverterBlock_upper_dec_dout_MC_D2_PT_5_IN4 : X_INV
    port map (
      I => upper_dec_din,
      O => NlwInverterSignal_upper_dec_dout_MC_D2_PT_5_IN4
    );
  NlwInverterBlock_upper_dec_dout_MC_D2_PT_5_IN6 : X_INV
    port map (
      I => N_PZ_308,
      O => NlwInverterSignal_upper_dec_dout_MC_D2_PT_5_IN6
    );
  NlwInverterBlock_upper_dec_dout_MC_D2_PT_6_IN3 : X_INV
    port map (
      I => upper_dec_ein,
      O => NlwInverterSignal_upper_dec_dout_MC_D2_PT_6_IN3
    );
  NlwInverterBlock_upper_dec_dout_MC_D2_PT_6_IN4 : X_INV
    port map (
      I => N_PZ_298,
      O => NlwInverterSignal_upper_dec_dout_MC_D2_PT_6_IN4
    );
  NlwInverterBlock_upper_dec_dout_MC_D2_PT_6_IN5 : X_INV
    port map (
      I => N_PZ_308,
      O => NlwInverterSignal_upper_dec_dout_MC_D2_PT_6_IN5
    );
  NlwInverterBlock_upper_dec_dout_MC_D2_PT_6_IN6 : X_INV
    port map (
      I => N_PZ_302,
      O => NlwInverterSignal_upper_dec_dout_MC_D2_PT_6_IN6
    );
  NlwInverterBlock_upper_dec_cout_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_upper_dec_cout_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_upper_dec_cout_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => upper_dec_ein,
      O => NlwInverterSignal_upper_dec_cout_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_upper_dec_cout_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => upper_dec_din,
      O => NlwInverterSignal_upper_dec_cout_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_upper_dec_cout_MC_D2_PT_3_IN0 : X_INV
    port map (
      I => upper_dec_ein,
      O => NlwInverterSignal_upper_dec_cout_MC_D2_PT_3_IN0
    );
  NlwInverterBlock_upper_dec_cout_MC_D2_PT_3_IN1 : X_INV
    port map (
      I => N_PZ_308,
      O => NlwInverterSignal_upper_dec_cout_MC_D2_PT_3_IN1
    );
  NlwInverterBlock_upper_dec_cout_MC_D2_PT_4_IN0 : X_INV
    port map (
      I => upper_dec_din,
      O => NlwInverterSignal_upper_dec_cout_MC_D2_PT_4_IN0
    );
  NlwInverterBlock_upper_dec_cout_MC_D2_PT_5_IN1 : X_INV
    port map (
      I => upper_dec_ain,
      O => NlwInverterSignal_upper_dec_cout_MC_D2_PT_5_IN1
    );
  NlwInverterBlock_upper_dec_cout_MC_D2_PT_5_IN3 : X_INV
    port map (
      I => upper_dec_bin,
      O => NlwInverterSignal_upper_dec_cout_MC_D2_PT_5_IN3
    );
  NlwInverterBlock_upper_dec_cout_MC_D2_PT_6_IN4 : X_INV
    port map (
      I => upper_dec_din,
      O => NlwInverterSignal_upper_dec_cout_MC_D2_PT_6_IN4
    );
  NlwInverterBlock_upper_dec_cout_MC_D2_PT_7_IN5 : X_INV
    port map (
      I => N_PZ_308,
      O => NlwInverterSignal_upper_dec_cout_MC_D2_PT_7_IN5
    );
  NlwInverterBlock_upper_dec_cout_MC_D2_PT_7_IN6 : X_INV
    port map (
      I => upper_dec_ain,
      O => NlwInverterSignal_upper_dec_cout_MC_D2_PT_7_IN6
    );
  NlwInverterBlock_upper_dec_cout_MC_D2_PT_8_IN3 : X_INV
    port map (
      I => upper_dec_ein,
      O => NlwInverterSignal_upper_dec_cout_MC_D2_PT_8_IN3
    );
  NlwInverterBlock_upper_dec_cout_MC_D2_PT_8_IN4 : X_INV
    port map (
      I => upper_dec_din,
      O => NlwInverterSignal_upper_dec_cout_MC_D2_PT_8_IN4
    );
  NlwInverterBlock_upper_dec_cout_MC_D2_PT_8_IN5 : X_INV
    port map (
      I => N_PZ_308,
      O => NlwInverterSignal_upper_dec_cout_MC_D2_PT_8_IN5
    );
  NlwInverterBlock_upper_dec_cout_MC_D2_PT_8_IN7 : X_INV
    port map (
      I => upper_dec_bin,
      O => NlwInverterSignal_upper_dec_cout_MC_D2_PT_8_IN7
    );
  NlwInverterBlock_upper_dec_bout_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_upper_dec_bout_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_upper_dec_bout_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => upper_dec_iin,
      O => NlwInverterSignal_upper_dec_bout_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_upper_dec_bout_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => upper_dec_ein,
      O => NlwInverterSignal_upper_dec_bout_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_upper_dec_bout_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => upper_dec_din,
      O => NlwInverterSignal_upper_dec_bout_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_upper_dec_bout_MC_D2_PT_3_IN4 : X_INV
    port map (
      I => upper_dec_ein,
      O => NlwInverterSignal_upper_dec_bout_MC_D2_PT_3_IN4
    );
  NlwInverterBlock_upper_dec_bout_MC_D2_PT_4_IN5 : X_INV
    port map (
      I => upper_dec_cin,
      O => NlwInverterSignal_upper_dec_bout_MC_D2_PT_4_IN5
    );
  NlwInverterBlock_upper_dec_bout_MC_D2_PT_4_IN6 : X_INV
    port map (
      I => upper_dec_ain,
      O => NlwInverterSignal_upper_dec_bout_MC_D2_PT_4_IN6
    );
  NlwInverterBlock_upper_dec_bout_MC_D2_PT_5_IN3 : X_INV
    port map (
      I => upper_dec_iin,
      O => NlwInverterSignal_upper_dec_bout_MC_D2_PT_5_IN3
    );
  NlwInverterBlock_upper_dec_bout_MC_D2_PT_5_IN5 : X_INV
    port map (
      I => upper_dec_din,
      O => NlwInverterSignal_upper_dec_bout_MC_D2_PT_5_IN5
    );
  NlwInverterBlock_upper_dec_bout_MC_D2_PT_6_IN4 : X_INV
    port map (
      I => upper_dec_cin,
      O => NlwInverterSignal_upper_dec_bout_MC_D2_PT_6_IN4
    );
  NlwInverterBlock_upper_dec_bout_MC_D2_PT_6_IN5 : X_INV
    port map (
      I => upper_dec_ain,
      O => NlwInverterSignal_upper_dec_bout_MC_D2_PT_6_IN5
    );
  NlwInverterBlock_upper_dec_bout_MC_D2_PT_7_IN4 : X_INV
    port map (
      I => upper_dec_ein,
      O => NlwInverterSignal_upper_dec_bout_MC_D2_PT_7_IN4
    );
  NlwInverterBlock_upper_dec_bout_MC_D2_PT_7_IN7 : X_INV
    port map (
      I => upper_dec_bin,
      O => NlwInverterSignal_upper_dec_bout_MC_D2_PT_7_IN7
    );
  NlwInverterBlock_upper_dec_bout_MC_D2_PT_8_IN5 : X_INV
    port map (
      I => upper_dec_din,
      O => NlwInverterSignal_upper_dec_bout_MC_D2_PT_8_IN5
    );
  NlwInverterBlock_upper_dec_bout_MC_D2_PT_8_IN8 : X_INV
    port map (
      I => upper_dec_bin,
      O => NlwInverterSignal_upper_dec_bout_MC_D2_PT_8_IN8
    );
  NlwInverterBlock_upper_dec_aout_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_upper_dec_aout_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_upper_dec_aout_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => upper_dec_ein,
      O => NlwInverterSignal_upper_dec_aout_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_upper_dec_aout_MC_D2_PT_2_IN2 : X_INV
    port map (
      I => N_PZ_298,
      O => NlwInverterSignal_upper_dec_aout_MC_D2_PT_2_IN2
    );
  NlwInverterBlock_upper_dec_aout_MC_D2_PT_3_IN1 : X_INV
    port map (
      I => upper_dec_cin,
      O => NlwInverterSignal_upper_dec_aout_MC_D2_PT_3_IN1
    );
  NlwInverterBlock_upper_dec_aout_MC_D2_PT_4_IN0 : X_INV
    port map (
      I => upper_dec_din,
      O => NlwInverterSignal_upper_dec_aout_MC_D2_PT_4_IN0
    );
  NlwInverterBlock_upper_dec_aout_MC_D2_PT_5_IN0 : X_INV
    port map (
      I => upper_dec_iin,
      O => NlwInverterSignal_upper_dec_aout_MC_D2_PT_5_IN0
    );
  NlwInverterBlock_upper_dec_aout_MC_D2_PT_5_IN1 : X_INV
    port map (
      I => upper_dec_ein,
      O => NlwInverterSignal_upper_dec_aout_MC_D2_PT_5_IN1
    );
  NlwInverterBlock_upper_dec_aout_MC_D2_PT_6_IN4 : X_INV
    port map (
      I => upper_dec_ein,
      O => NlwInverterSignal_upper_dec_aout_MC_D2_PT_6_IN4
    );
  NlwInverterBlock_upper_dec_aout_MC_D2_PT_6_IN5 : X_INV
    port map (
      I => upper_dec_din,
      O => NlwInverterSignal_upper_dec_aout_MC_D2_PT_6_IN5
    );
  NlwInverterBlock_upper_dec_aout_MC_D2_PT_7_IN4 : X_INV
    port map (
      I => upper_dec_din,
      O => NlwInverterSignal_upper_dec_aout_MC_D2_PT_7_IN4
    );
  NlwInverterBlock_upper_dec_aout_MC_D2_PT_7_IN6 : X_INV
    port map (
      I => upper_dec_bin,
      O => NlwInverterSignal_upper_dec_aout_MC_D2_PT_7_IN6
    );
  NlwInverterBlock_lower_dec_gout_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_lower_dec_gout_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_lower_dec_gout_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => lower_dec_prs_state_fft2,
      O => NlwInverterSignal_lower_dec_gout_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_lower_dec_gout_MC_D2_PT_1_IN7 : X_INV
    port map (
      I => serial_data_3_II_UIM,
      O => NlwInverterSignal_lower_dec_gout_MC_D2_PT_1_IN7
    );
  NlwInverterBlock_lower_dec_gout_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => lower_dec_prs_state_fft2,
      O => NlwInverterSignal_lower_dec_gout_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_lower_dec_gout_MC_D2_PT_2_IN5 : X_INV
    port map (
      I => serial_data_1_II_UIM,
      O => NlwInverterSignal_lower_dec_gout_MC_D2_PT_2_IN5
    );
  NlwInverterBlock_lower_dec_gout_MC_D2_PT_2_IN6 : X_INV
    port map (
      I => serial_data_0_II_UIM,
      O => NlwInverterSignal_lower_dec_gout_MC_D2_PT_2_IN6
    );
  NlwInverterBlock_lower_dec_gout_MC_D2_PT_3_IN0 : X_INV
    port map (
      I => lower_dec_prs_state_fft2,
      O => NlwInverterSignal_lower_dec_gout_MC_D2_PT_3_IN0
    );
  NlwInverterBlock_lower_dec_gout_MC_D2_PT_3_IN6 : X_INV
    port map (
      I => N_PZ_188,
      O => NlwInverterSignal_lower_dec_gout_MC_D2_PT_3_IN6
    );
  NlwInverterBlock_lower_dec_gout_MC_D2_PT_3_IN7 : X_INV
    port map (
      I => serial_data_3_II_UIM,
      O => NlwInverterSignal_lower_dec_gout_MC_D2_PT_3_IN7
    );
  NlwInverterBlock_lower_dec_gout_MC_D2_PT_4_IN0 : X_INV
    port map (
      I => lower_dec_prs_state_fft2,
      O => NlwInverterSignal_lower_dec_gout_MC_D2_PT_4_IN0
    );
  NlwInverterBlock_lower_dec_gout_MC_D2_PT_4_IN5 : X_INV
    port map (
      I => serial_data_0_II_UIM,
      O => NlwInverterSignal_lower_dec_gout_MC_D2_PT_4_IN5
    );
  NlwInverterBlock_lower_dec_gout_MC_D2_PT_5_IN0 : X_INV
    port map (
      I => lower_dec_prs_state_fft2,
      O => NlwInverterSignal_lower_dec_gout_MC_D2_PT_5_IN0
    );
  NlwInverterBlock_lower_dec_gout_MC_D2_PT_5_IN6 : X_INV
    port map (
      I => serial_data_0_II_UIM,
      O => NlwInverterSignal_lower_dec_gout_MC_D2_PT_5_IN6
    );
  NlwInverterBlock_lower_dec_gout_MC_D2_PT_5_IN7 : X_INV
    port map (
      I => N_PZ_188,
      O => NlwInverterSignal_lower_dec_gout_MC_D2_PT_5_IN7
    );
  NlwInverterBlock_lower_dec_gout_MC_D2_PT_6_IN0 : X_INV
    port map (
      I => lower_dec_prs_state_fft2,
      O => NlwInverterSignal_lower_dec_gout_MC_D2_PT_6_IN0
    );
  NlwInverterBlock_lower_dec_gout_MC_D2_PT_6_IN5 : X_INV
    port map (
      I => serial_data_1_II_UIM,
      O => NlwInverterSignal_lower_dec_gout_MC_D2_PT_6_IN5
    );
  NlwInverterBlock_lower_dec_gout_MC_D2_PT_6_IN8 : X_INV
    port map (
      I => serial_data_2_II_UIM,
      O => NlwInverterSignal_lower_dec_gout_MC_D2_PT_6_IN8
    );
  NlwInverterBlock_lower_dec_fout_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_lower_dec_fout_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_lower_dec_fout_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => lower_dec_prs_state_fft2,
      O => NlwInverterSignal_lower_dec_fout_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_lower_dec_fout_MC_D2_PT_1_IN7 : X_INV
    port map (
      I => serial_data_3_II_UIM,
      O => NlwInverterSignal_lower_dec_fout_MC_D2_PT_1_IN7
    );
  NlwInverterBlock_lower_dec_fout_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => lower_dec_prs_state_fft2,
      O => NlwInverterSignal_lower_dec_fout_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_lower_dec_fout_MC_D2_PT_2_IN5 : X_INV
    port map (
      I => serial_data_1_II_UIM,
      O => NlwInverterSignal_lower_dec_fout_MC_D2_PT_2_IN5
    );
  NlwInverterBlock_lower_dec_fout_MC_D2_PT_2_IN6 : X_INV
    port map (
      I => serial_data_0_II_UIM,
      O => NlwInverterSignal_lower_dec_fout_MC_D2_PT_2_IN6
    );
  NlwInverterBlock_lower_dec_fout_MC_D2_PT_3_IN0 : X_INV
    port map (
      I => lower_dec_prs_state_fft2,
      O => NlwInverterSignal_lower_dec_fout_MC_D2_PT_3_IN0
    );
  NlwInverterBlock_lower_dec_fout_MC_D2_PT_3_IN7 : X_INV
    port map (
      I => serial_data_3_II_UIM,
      O => NlwInverterSignal_lower_dec_fout_MC_D2_PT_3_IN7
    );
  NlwInverterBlock_lower_dec_fout_MC_D2_PT_4_IN0 : X_INV
    port map (
      I => lower_dec_prs_state_fft2,
      O => NlwInverterSignal_lower_dec_fout_MC_D2_PT_4_IN0
    );
  NlwInverterBlock_lower_dec_fout_MC_D2_PT_4_IN5 : X_INV
    port map (
      I => serial_data_0_II_UIM,
      O => NlwInverterSignal_lower_dec_fout_MC_D2_PT_4_IN5
    );
  NlwInverterBlock_lower_dec_fout_MC_D2_PT_4_IN6 : X_INV
    port map (
      I => N_PZ_188,
      O => NlwInverterSignal_lower_dec_fout_MC_D2_PT_4_IN6
    );
  NlwInverterBlock_lower_dec_fout_MC_D2_PT_5_IN0 : X_INV
    port map (
      I => lower_dec_prs_state_fft2,
      O => NlwInverterSignal_lower_dec_fout_MC_D2_PT_5_IN0
    );
  NlwInverterBlock_lower_dec_fout_MC_D2_PT_5_IN6 : X_INV
    port map (
      I => serial_data_0_II_UIM,
      O => NlwInverterSignal_lower_dec_fout_MC_D2_PT_5_IN6
    );
  NlwInverterBlock_lower_dec_fout_MC_D2_PT_6_IN0 : X_INV
    port map (
      I => lower_dec_prs_state_fft2,
      O => NlwInverterSignal_lower_dec_fout_MC_D2_PT_6_IN0
    );
  NlwInverterBlock_lower_dec_fout_MC_D2_PT_6_IN5 : X_INV
    port map (
      I => serial_data_1_II_UIM,
      O => NlwInverterSignal_lower_dec_fout_MC_D2_PT_6_IN5
    );
  NlwInverterBlock_lower_dec_fout_MC_D2_PT_6_IN7 : X_INV
    port map (
      I => N_PZ_188,
      O => NlwInverterSignal_lower_dec_fout_MC_D2_PT_6_IN7
    );
  NlwInverterBlock_lower_dec_fout_MC_D2_PT_6_IN8 : X_INV
    port map (
      I => serial_data_2_II_UIM,
      O => NlwInverterSignal_lower_dec_fout_MC_D2_PT_6_IN8
    );
  NlwInverterBlock_lower_dec_eout_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_lower_dec_eout_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_lower_dec_eout_MC_D2_PT_1_IN4 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_eout_MC_D2_PT_1_IN4
    );
  NlwInverterBlock_lower_dec_eout_MC_D2_PT_1_IN5 : X_INV
    port map (
      I => N_PZ_180,
      O => NlwInverterSignal_lower_dec_eout_MC_D2_PT_1_IN5
    );
  NlwInverterBlock_lower_dec_eout_MC_D2_PT_2_IN5 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_eout_MC_D2_PT_2_IN5
    );
  NlwInverterBlock_lower_dec_eout_MC_D2_PT_3_IN5 : X_INV
    port map (
      I => serial_data_6_II_UIM,
      O => NlwInverterSignal_lower_dec_eout_MC_D2_PT_3_IN5
    );
  NlwInverterBlock_lower_dec_eout_MC_D2_PT_3_IN6 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_eout_MC_D2_PT_3_IN6
    );
  NlwInverterBlock_lower_dec_eout_MC_D2_PT_4_IN4 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_eout_MC_D2_PT_4_IN4
    );
  NlwInverterBlock_lower_dec_eout_MC_D2_PT_4_IN6 : X_INV
    port map (
      I => lower_dec_err_chk_n003564,
      O => NlwInverterSignal_lower_dec_eout_MC_D2_PT_4_IN6
    );
  NlwInverterBlock_lower_dec_eout_MC_D2_PT_4_IN7 : X_INV
    port map (
      I => lower_dec_err_chk_n003574,
      O => NlwInverterSignal_lower_dec_eout_MC_D2_PT_4_IN7
    );
  NlwInverterBlock_lower_dec_eout_MC_D2_PT_5_IN3 : X_INV
    port map (
      I => serial_data_4_II_UIM,
      O => NlwInverterSignal_lower_dec_eout_MC_D2_PT_5_IN3
    );
  NlwInverterBlock_lower_dec_eout_MC_D2_PT_5_IN4 : X_INV
    port map (
      I => serial_data_7_II_UIM,
      O => NlwInverterSignal_lower_dec_eout_MC_D2_PT_5_IN4
    );
  NlwInverterBlock_lower_dec_eout_MC_D2_PT_5_IN6 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_eout_MC_D2_PT_5_IN6
    );
  NlwInverterBlock_lower_dec_eout_MC_D2_PT_6_IN3 : X_INV
    port map (
      I => serial_data_4_II_UIM,
      O => NlwInverterSignal_lower_dec_eout_MC_D2_PT_6_IN3
    );
  NlwInverterBlock_lower_dec_eout_MC_D2_PT_6_IN4 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_eout_MC_D2_PT_6_IN4
    );
  NlwInverterBlock_lower_dec_eout_MC_D2_PT_6_IN5 : X_INV
    port map (
      I => N_PZ_180,
      O => NlwInverterSignal_lower_dec_eout_MC_D2_PT_6_IN5
    );
  NlwInverterBlock_lower_dec_eout_MC_D2_PT_6_IN7 : X_INV
    port map (
      I => serial_data_9_II_UIM,
      O => NlwInverterSignal_lower_dec_eout_MC_D2_PT_6_IN7
    );
  NlwInverterBlock_lower_dec_eout_MC_D2_PT_7_IN4 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_eout_MC_D2_PT_7_IN4
    );
  NlwInverterBlock_lower_dec_eout_MC_D2_PT_7_IN5 : X_INV
    port map (
      I => N_PZ_180,
      O => NlwInverterSignal_lower_dec_eout_MC_D2_PT_7_IN5
    );
  NlwInverterBlock_lower_dec_eout_MC_D2_PT_7_IN6 : X_INV
    port map (
      I => lower_dec_err_chk_n003564,
      O => NlwInverterSignal_lower_dec_eout_MC_D2_PT_7_IN6
    );
  NlwInverterBlock_lower_dec_eout_MC_D2_PT_7_IN7 : X_INV
    port map (
      I => lower_dec_err_chk_n003574,
      O => NlwInverterSignal_lower_dec_eout_MC_D2_PT_7_IN7
    );
  NlwInverterBlock_lower_dec_eout_MC_D2_PT_8_IN3 : X_INV
    port map (
      I => serial_data_5_II_UIM,
      O => NlwInverterSignal_lower_dec_eout_MC_D2_PT_8_IN3
    );
  NlwInverterBlock_lower_dec_eout_MC_D2_PT_8_IN4 : X_INV
    port map (
      I => serial_data_7_II_UIM,
      O => NlwInverterSignal_lower_dec_eout_MC_D2_PT_8_IN4
    );
  NlwInverterBlock_lower_dec_eout_MC_D2_PT_8_IN6 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_eout_MC_D2_PT_8_IN6
    );
  NlwInverterBlock_lower_dec_eout_MC_D2_PT_8_IN7 : X_INV
    port map (
      I => N_PZ_180,
      O => NlwInverterSignal_lower_dec_eout_MC_D2_PT_8_IN7
    );
  NlwInverterBlock_lower_dec_eout_MC_D2_PT_8_IN8 : X_INV
    port map (
      I => serial_data_9_II_UIM,
      O => NlwInverterSignal_lower_dec_eout_MC_D2_PT_8_IN8
    );
  NlwInverterBlock_lower_dec_eout_MC_D2_PT_9_IN5 : X_INV
    port map (
      I => serial_data_6_II_UIM,
      O => NlwInverterSignal_lower_dec_eout_MC_D2_PT_9_IN5
    );
  NlwInverterBlock_lower_dec_eout_MC_D2_PT_9_IN6 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_eout_MC_D2_PT_9_IN6
    );
  NlwInverterBlock_lower_dec_eout_MC_D2_PT_9_IN7 : X_INV
    port map (
      I => N_PZ_180,
      O => NlwInverterSignal_lower_dec_eout_MC_D2_PT_9_IN7
    );
  NlwInverterBlock_lower_dec_eout_MC_D2_PT_9_IN8 : X_INV
    port map (
      I => serial_data_9_II_UIM,
      O => NlwInverterSignal_lower_dec_eout_MC_D2_PT_9_IN8
    );
  NlwInverterBlock_lower_dec_err_chk_n003561_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => lower_dec_prs_state_fft1,
      O => NlwInverterSignal_lower_dec_err_chk_n003561_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_lower_dec_err_chk_n003561_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => lower_dec_prs_state_fft1,
      O => NlwInverterSignal_lower_dec_err_chk_n003561_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_lower_dec_err_chk_n003561_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => serial_data_5_II_UIM,
      O => NlwInverterSignal_lower_dec_err_chk_n003561_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_lower_dec_err_chk_n003561_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => serial_data_4_II_UIM,
      O => NlwInverterSignal_lower_dec_err_chk_n003561_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_lower_dec_err_chk_n003561_MC_D2_PT_2_IN2 : X_INV
    port map (
      I => N_PZ_304,
      O => NlwInverterSignal_lower_dec_err_chk_n003561_MC_D2_PT_2_IN2
    );
  NlwInverterBlock_lower_dec_err_chk_n003561_MC_D2_PT_2_IN3 : X_INV
    port map (
      I => serial_data_9_II_UIM,
      O => NlwInverterSignal_lower_dec_err_chk_n003561_MC_D2_PT_2_IN3
    );
  NlwInverterBlock_lower_dec_err_chk_n003561_MC_D2_PT_2_IN4 : X_INV
    port map (
      I => serial_data_8_II_UIM,
      O => NlwInverterSignal_lower_dec_err_chk_n003561_MC_D2_PT_2_IN4
    );
  NlwInverterBlock_N_PZ_180_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => serial_data_8_II_UIM,
      O => NlwInverterSignal_N_PZ_180_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_N_PZ_180_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => serial_data_9_II_UIM,
      O => NlwInverterSignal_N_PZ_180_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_lower_dec_err_chk_n003564_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => lower_dec_prs_state_fft2,
      O => NlwInverterSignal_lower_dec_err_chk_n003564_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_lower_dec_err_chk_n003564_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => lower_dec_prs_state_fft2,
      O => NlwInverterSignal_lower_dec_err_chk_n003564_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_lower_dec_err_chk_n003574_MC_D2_PT_0_IN2 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_err_chk_n003574_MC_D2_PT_0_IN2
    );
  NlwInverterBlock_lower_dec_err_chk_n003574_MC_D2_PT_1_IN3 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_err_chk_n003574_MC_D2_PT_1_IN3
    );
  NlwInverterBlock_lower_dec_err_chk_n003574_MC_D2_PT_1_IN4 : X_INV
    port map (
      I => N_PZ_180,
      O => NlwInverterSignal_lower_dec_err_chk_n003574_MC_D2_PT_1_IN4
    );
  NlwInverterBlock_lower_dec_dout_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_lower_dec_dout_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_lower_dec_dout_MC_D2_PT_1_IN4 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_dout_MC_D2_PT_1_IN4
    );
  NlwInverterBlock_lower_dec_dout_MC_D2_PT_1_IN5 : X_INV
    port map (
      I => N_PZ_180,
      O => NlwInverterSignal_lower_dec_dout_MC_D2_PT_1_IN5
    );
  NlwInverterBlock_lower_dec_dout_MC_D2_PT_2_IN3 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_dout_MC_D2_PT_2_IN3
    );
  NlwInverterBlock_lower_dec_dout_MC_D2_PT_2_IN4 : X_INV
    port map (
      I => N_PZ_180,
      O => NlwInverterSignal_lower_dec_dout_MC_D2_PT_2_IN4
    );
  NlwInverterBlock_lower_dec_dout_MC_D2_PT_2_IN6 : X_INV
    port map (
      I => serial_data_9_II_UIM,
      O => NlwInverterSignal_lower_dec_dout_MC_D2_PT_2_IN6
    );
  NlwInverterBlock_lower_dec_dout_MC_D2_PT_3_IN4 : X_INV
    port map (
      I => serial_data_4_II_UIM,
      O => NlwInverterSignal_lower_dec_dout_MC_D2_PT_3_IN4
    );
  NlwInverterBlock_lower_dec_dout_MC_D2_PT_3_IN6 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_dout_MC_D2_PT_3_IN6
    );
  NlwInverterBlock_lower_dec_dout_MC_D2_PT_3_IN7 : X_INV
    port map (
      I => serial_data_8_II_UIM,
      O => NlwInverterSignal_lower_dec_dout_MC_D2_PT_3_IN7
    );
  NlwInverterBlock_lower_dec_dout_MC_D2_PT_4_IN3 : X_INV
    port map (
      I => serial_data_5_II_UIM,
      O => NlwInverterSignal_lower_dec_dout_MC_D2_PT_4_IN3
    );
  NlwInverterBlock_lower_dec_dout_MC_D2_PT_4_IN5 : X_INV
    port map (
      I => serial_data_7_II_UIM,
      O => NlwInverterSignal_lower_dec_dout_MC_D2_PT_4_IN5
    );
  NlwInverterBlock_lower_dec_dout_MC_D2_PT_4_IN6 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_dout_MC_D2_PT_4_IN6
    );
  NlwInverterBlock_lower_dec_dout_MC_D2_PT_5_IN3 : X_INV
    port map (
      I => serial_data_5_II_UIM,
      O => NlwInverterSignal_lower_dec_dout_MC_D2_PT_5_IN3
    );
  NlwInverterBlock_lower_dec_dout_MC_D2_PT_5_IN4 : X_INV
    port map (
      I => serial_data_4_II_UIM,
      O => NlwInverterSignal_lower_dec_dout_MC_D2_PT_5_IN4
    );
  NlwInverterBlock_lower_dec_dout_MC_D2_PT_5_IN6 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_dout_MC_D2_PT_5_IN6
    );
  NlwInverterBlock_lower_dec_dout_MC_D2_PT_5_IN7 : X_INV
    port map (
      I => serial_data_8_II_UIM,
      O => NlwInverterSignal_lower_dec_dout_MC_D2_PT_5_IN7
    );
  NlwInverterBlock_lower_dec_dout_MC_D2_PT_6_IN3 : X_INV
    port map (
      I => serial_data_4_II_UIM,
      O => NlwInverterSignal_lower_dec_dout_MC_D2_PT_6_IN3
    );
  NlwInverterBlock_lower_dec_dout_MC_D2_PT_6_IN5 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_dout_MC_D2_PT_6_IN5
    );
  NlwInverterBlock_lower_dec_dout_MC_D2_PT_6_IN6 : X_INV
    port map (
      I => lower_dec_err_chk_n003564,
      O => NlwInverterSignal_lower_dec_dout_MC_D2_PT_6_IN6
    );
  NlwInverterBlock_lower_dec_dout_MC_D2_PT_7_IN3 : X_INV
    port map (
      I => serial_data_7_II_UIM,
      O => NlwInverterSignal_lower_dec_dout_MC_D2_PT_7_IN3
    );
  NlwInverterBlock_lower_dec_dout_MC_D2_PT_7_IN5 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_dout_MC_D2_PT_7_IN5
    );
  NlwInverterBlock_lower_dec_dout_MC_D2_PT_7_IN7 : X_INV
    port map (
      I => serial_data_9_II_UIM,
      O => NlwInverterSignal_lower_dec_dout_MC_D2_PT_7_IN7
    );
  NlwInverterBlock_lower_dec_dout_MC_D2_PT_8_IN6 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_dout_MC_D2_PT_8_IN6
    );
  NlwInverterBlock_lower_dec_dout_MC_D2_PT_8_IN7 : X_INV
    port map (
      I => N_PZ_180,
      O => NlwInverterSignal_lower_dec_dout_MC_D2_PT_8_IN7
    );
  NlwInverterBlock_lower_dec_dout_MC_D2_PT_9_IN6 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_dout_MC_D2_PT_9_IN6
    );
  NlwInverterBlock_lower_dec_dout_MC_D2_PT_9_IN7 : X_INV
    port map (
      I => lower_dec_err_chk_n003574,
      O => NlwInverterSignal_lower_dec_dout_MC_D2_PT_9_IN7
    );
  NlwInverterBlock_lower_dec_dout_MC_D2_PT_10_IN3 : X_INV
    port map (
      I => serial_data_5_II_UIM,
      O => NlwInverterSignal_lower_dec_dout_MC_D2_PT_10_IN3
    );
  NlwInverterBlock_lower_dec_dout_MC_D2_PT_10_IN6 : X_INV
    port map (
      I => serial_data_6_II_UIM,
      O => NlwInverterSignal_lower_dec_dout_MC_D2_PT_10_IN6
    );
  NlwInverterBlock_lower_dec_dout_MC_D2_PT_10_IN7 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_dout_MC_D2_PT_10_IN7
    );
  NlwInverterBlock_lower_dec_dout_MC_D2_PT_10_IN8 : X_INV
    port map (
      I => N_PZ_180,
      O => NlwInverterSignal_lower_dec_dout_MC_D2_PT_10_IN8
    );
  NlwInverterBlock_lower_dec_cout_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_lower_dec_cout_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_lower_dec_cout_MC_D2_PT_1_IN4 : X_INV
    port map (
      I => serial_data_4_II_UIM,
      O => NlwInverterSignal_lower_dec_cout_MC_D2_PT_1_IN4
    );
  NlwInverterBlock_lower_dec_cout_MC_D2_PT_1_IN6 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_cout_MC_D2_PT_1_IN6
    );
  NlwInverterBlock_lower_dec_cout_MC_D2_PT_1_IN7 : X_INV
    port map (
      I => lower_dec_err_chk_n003564,
      O => NlwInverterSignal_lower_dec_cout_MC_D2_PT_1_IN7
    );
  NlwInverterBlock_lower_dec_cout_MC_D2_PT_2_IN5 : X_INV
    port map (
      I => serial_data_6_II_UIM,
      O => NlwInverterSignal_lower_dec_cout_MC_D2_PT_2_IN5
    );
  NlwInverterBlock_lower_dec_cout_MC_D2_PT_2_IN6 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_cout_MC_D2_PT_2_IN6
    );
  NlwInverterBlock_lower_dec_cout_MC_D2_PT_2_IN7 : X_INV
    port map (
      I => serial_data_8_II_UIM,
      O => NlwInverterSignal_lower_dec_cout_MC_D2_PT_2_IN7
    );
  NlwInverterBlock_lower_dec_cout_MC_D2_PT_3_IN3 : X_INV
    port map (
      I => serial_data_5_II_UIM,
      O => NlwInverterSignal_lower_dec_cout_MC_D2_PT_3_IN3
    );
  NlwInverterBlock_lower_dec_cout_MC_D2_PT_3_IN5 : X_INV
    port map (
      I => serial_data_6_II_UIM,
      O => NlwInverterSignal_lower_dec_cout_MC_D2_PT_3_IN5
    );
  NlwInverterBlock_lower_dec_cout_MC_D2_PT_3_IN6 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_cout_MC_D2_PT_3_IN6
    );
  NlwInverterBlock_lower_dec_cout_MC_D2_PT_4_IN3 : X_INV
    port map (
      I => serial_data_5_II_UIM,
      O => NlwInverterSignal_lower_dec_cout_MC_D2_PT_4_IN3
    );
  NlwInverterBlock_lower_dec_cout_MC_D2_PT_4_IN4 : X_INV
    port map (
      I => serial_data_4_II_UIM,
      O => NlwInverterSignal_lower_dec_cout_MC_D2_PT_4_IN4
    );
  NlwInverterBlock_lower_dec_cout_MC_D2_PT_4_IN5 : X_INV
    port map (
      I => serial_data_6_II_UIM,
      O => NlwInverterSignal_lower_dec_cout_MC_D2_PT_4_IN5
    );
  NlwInverterBlock_lower_dec_cout_MC_D2_PT_4_IN6 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_cout_MC_D2_PT_4_IN6
    );
  NlwInverterBlock_lower_dec_cout_MC_D2_PT_4_IN7 : X_INV
    port map (
      I => N_PZ_180,
      O => NlwInverterSignal_lower_dec_cout_MC_D2_PT_4_IN7
    );
  NlwInverterBlock_lower_dec_cout_MC_D2_PT_5_IN5 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_cout_MC_D2_PT_5_IN5
    );
  NlwInverterBlock_lower_dec_cout_MC_D2_PT_5_IN6 : X_INV
    port map (
      I => N_PZ_180,
      O => NlwInverterSignal_lower_dec_cout_MC_D2_PT_5_IN6
    );
  NlwInverterBlock_lower_dec_cout_MC_D2_PT_5_IN7 : X_INV
    port map (
      I => lower_dec_err_chk_n003564,
      O => NlwInverterSignal_lower_dec_cout_MC_D2_PT_5_IN7
    );
  NlwInverterBlock_lower_dec_cout_MC_D2_PT_6_IN3 : X_INV
    port map (
      I => serial_data_4_II_UIM,
      O => NlwInverterSignal_lower_dec_cout_MC_D2_PT_6_IN3
    );
  NlwInverterBlock_lower_dec_cout_MC_D2_PT_6_IN5 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_cout_MC_D2_PT_6_IN5
    );
  NlwInverterBlock_lower_dec_cout_MC_D2_PT_6_IN7 : X_INV
    port map (
      I => serial_data_8_II_UIM,
      O => NlwInverterSignal_lower_dec_cout_MC_D2_PT_6_IN7
    );
  NlwInverterBlock_lower_dec_cout_MC_D2_PT_7_IN5 : X_INV
    port map (
      I => serial_data_7_II_UIM,
      O => NlwInverterSignal_lower_dec_cout_MC_D2_PT_7_IN5
    );
  NlwInverterBlock_lower_dec_cout_MC_D2_PT_7_IN7 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_cout_MC_D2_PT_7_IN7
    );
  NlwInverterBlock_lower_dec_cout_MC_D2_PT_7_IN8 : X_INV
    port map (
      I => serial_data_9_II_UIM,
      O => NlwInverterSignal_lower_dec_cout_MC_D2_PT_7_IN8
    );
  NlwInverterBlock_lower_dec_cout_MC_D2_PT_8_IN3 : X_INV
    port map (
      I => serial_data_5_II_UIM,
      O => NlwInverterSignal_lower_dec_cout_MC_D2_PT_8_IN3
    );
  NlwInverterBlock_lower_dec_cout_MC_D2_PT_8_IN4 : X_INV
    port map (
      I => serial_data_4_II_UIM,
      O => NlwInverterSignal_lower_dec_cout_MC_D2_PT_8_IN4
    );
  NlwInverterBlock_lower_dec_cout_MC_D2_PT_8_IN6 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_cout_MC_D2_PT_8_IN6
    );
  NlwInverterBlock_lower_dec_bout_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_lower_dec_bout_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_lower_dec_bout_MC_D2_PT_1_IN3 : X_INV
    port map (
      I => N_PZ_188,
      O => NlwInverterSignal_lower_dec_bout_MC_D2_PT_1_IN3
    );
  NlwInverterBlock_lower_dec_bout_MC_D2_PT_1_IN4 : X_INV
    port map (
      I => serial_data_5_II_UIM,
      O => NlwInverterSignal_lower_dec_bout_MC_D2_PT_1_IN4
    );
  NlwInverterBlock_lower_dec_bout_MC_D2_PT_1_IN6 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_bout_MC_D2_PT_1_IN6
    );
  NlwInverterBlock_lower_dec_bout_MC_D2_PT_2_IN4 : X_INV
    port map (
      I => serial_data_4_II_UIM,
      O => NlwInverterSignal_lower_dec_bout_MC_D2_PT_2_IN4
    );
  NlwInverterBlock_lower_dec_bout_MC_D2_PT_2_IN5 : X_INV
    port map (
      I => serial_data_6_II_UIM,
      O => NlwInverterSignal_lower_dec_bout_MC_D2_PT_2_IN5
    );
  NlwInverterBlock_lower_dec_bout_MC_D2_PT_2_IN6 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_bout_MC_D2_PT_2_IN6
    );
  NlwInverterBlock_lower_dec_bout_MC_D2_PT_3_IN4 : X_INV
    port map (
      I => serial_data_7_II_UIM,
      O => NlwInverterSignal_lower_dec_bout_MC_D2_PT_3_IN4
    );
  NlwInverterBlock_lower_dec_bout_MC_D2_PT_3_IN5 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_bout_MC_D2_PT_3_IN5
    );
  NlwInverterBlock_lower_dec_bout_MC_D2_PT_4_IN4 : X_INV
    port map (
      I => serial_data_7_II_UIM,
      O => NlwInverterSignal_lower_dec_bout_MC_D2_PT_4_IN4
    );
  NlwInverterBlock_lower_dec_bout_MC_D2_PT_4_IN6 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_bout_MC_D2_PT_4_IN6
    );
  NlwInverterBlock_lower_dec_bout_MC_D2_PT_4_IN7 : X_INV
    port map (
      I => serial_data_9_II_UIM,
      O => NlwInverterSignal_lower_dec_bout_MC_D2_PT_4_IN7
    );
  NlwInverterBlock_lower_dec_bout_MC_D2_PT_5_IN3 : X_INV
    port map (
      I => serial_data_4_II_UIM,
      O => NlwInverterSignal_lower_dec_bout_MC_D2_PT_5_IN3
    );
  NlwInverterBlock_lower_dec_bout_MC_D2_PT_5_IN5 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_bout_MC_D2_PT_5_IN5
    );
  NlwInverterBlock_lower_dec_bout_MC_D2_PT_5_IN6 : X_INV
    port map (
      I => lower_dec_err_chk_n003564,
      O => NlwInverterSignal_lower_dec_bout_MC_D2_PT_5_IN6
    );
  NlwInverterBlock_lower_dec_bout_MC_D2_PT_6_IN3 : X_INV
    port map (
      I => N_PZ_188,
      O => NlwInverterSignal_lower_dec_bout_MC_D2_PT_6_IN3
    );
  NlwInverterBlock_lower_dec_bout_MC_D2_PT_6_IN4 : X_INV
    port map (
      I => serial_data_5_II_UIM,
      O => NlwInverterSignal_lower_dec_bout_MC_D2_PT_6_IN4
    );
  NlwInverterBlock_lower_dec_bout_MC_D2_PT_6_IN5 : X_INV
    port map (
      I => serial_data_4_II_UIM,
      O => NlwInverterSignal_lower_dec_bout_MC_D2_PT_6_IN5
    );
  NlwInverterBlock_lower_dec_bout_MC_D2_PT_6_IN6 : X_INV
    port map (
      I => serial_data_6_II_UIM,
      O => NlwInverterSignal_lower_dec_bout_MC_D2_PT_6_IN6
    );
  NlwInverterBlock_lower_dec_bout_MC_D2_PT_6_IN7 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_bout_MC_D2_PT_6_IN7
    );
  NlwInverterBlock_lower_dec_bout_MC_D2_PT_7_IN6 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_bout_MC_D2_PT_7_IN6
    );
  NlwInverterBlock_lower_dec_bout_MC_D2_PT_7_IN7 : X_INV
    port map (
      I => lower_dec_err_chk_n003574,
      O => NlwInverterSignal_lower_dec_bout_MC_D2_PT_7_IN7
    );
  NlwInverterBlock_lower_dec_bout_MC_D2_PT_8_IN3 : X_INV
    port map (
      I => serial_data_5_II_UIM,
      O => NlwInverterSignal_lower_dec_bout_MC_D2_PT_8_IN3
    );
  NlwInverterBlock_lower_dec_bout_MC_D2_PT_8_IN6 : X_INV
    port map (
      I => serial_data_6_II_UIM,
      O => NlwInverterSignal_lower_dec_bout_MC_D2_PT_8_IN6
    );
  NlwInverterBlock_lower_dec_bout_MC_D2_PT_8_IN7 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_bout_MC_D2_PT_8_IN7
    );
  NlwInverterBlock_lower_dec_bout_MC_D2_PT_8_IN8 : X_INV
    port map (
      I => serial_data_9_II_UIM,
      O => NlwInverterSignal_lower_dec_bout_MC_D2_PT_8_IN8
    );
  NlwInverterBlock_lower_dec_bout_MC_D2_PT_9_IN3 : X_INV
    port map (
      I => serial_data_5_II_UIM,
      O => NlwInverterSignal_lower_dec_bout_MC_D2_PT_9_IN3
    );
  NlwInverterBlock_lower_dec_bout_MC_D2_PT_9_IN5 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_bout_MC_D2_PT_9_IN5
    );
  NlwInverterBlock_lower_dec_bout_MC_D2_PT_9_IN8 : X_INV
    port map (
      I => serial_data_8_II_UIM,
      O => NlwInverterSignal_lower_dec_bout_MC_D2_PT_9_IN8
    );
  NlwInverterBlock_lower_dec_aout_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_lower_dec_aout_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_lower_dec_aout_MC_D2_PT_1_IN3 : X_INV
    port map (
      I => N_PZ_188,
      O => NlwInverterSignal_lower_dec_aout_MC_D2_PT_1_IN3
    );
  NlwInverterBlock_lower_dec_aout_MC_D2_PT_1_IN4 : X_INV
    port map (
      I => serial_data_5_II_UIM,
      O => NlwInverterSignal_lower_dec_aout_MC_D2_PT_1_IN4
    );
  NlwInverterBlock_lower_dec_aout_MC_D2_PT_1_IN6 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_aout_MC_D2_PT_1_IN6
    );
  NlwInverterBlock_lower_dec_aout_MC_D2_PT_2_IN4 : X_INV
    port map (
      I => serial_data_4_II_UIM,
      O => NlwInverterSignal_lower_dec_aout_MC_D2_PT_2_IN4
    );
  NlwInverterBlock_lower_dec_aout_MC_D2_PT_2_IN5 : X_INV
    port map (
      I => serial_data_7_II_UIM,
      O => NlwInverterSignal_lower_dec_aout_MC_D2_PT_2_IN5
    );
  NlwInverterBlock_lower_dec_aout_MC_D2_PT_2_IN6 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_aout_MC_D2_PT_2_IN6
    );
  NlwInverterBlock_lower_dec_aout_MC_D2_PT_3_IN4 : X_INV
    port map (
      I => serial_data_6_II_UIM,
      O => NlwInverterSignal_lower_dec_aout_MC_D2_PT_3_IN4
    );
  NlwInverterBlock_lower_dec_aout_MC_D2_PT_3_IN5 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_aout_MC_D2_PT_3_IN5
    );
  NlwInverterBlock_lower_dec_aout_MC_D2_PT_3_IN7 : X_INV
    port map (
      I => serial_data_8_II_UIM,
      O => NlwInverterSignal_lower_dec_aout_MC_D2_PT_3_IN7
    );
  NlwInverterBlock_lower_dec_aout_MC_D2_PT_4_IN3 : X_INV
    port map (
      I => serial_data_5_II_UIM,
      O => NlwInverterSignal_lower_dec_aout_MC_D2_PT_4_IN3
    );
  NlwInverterBlock_lower_dec_aout_MC_D2_PT_4_IN5 : X_INV
    port map (
      I => serial_data_6_II_UIM,
      O => NlwInverterSignal_lower_dec_aout_MC_D2_PT_4_IN5
    );
  NlwInverterBlock_lower_dec_aout_MC_D2_PT_4_IN6 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_aout_MC_D2_PT_4_IN6
    );
  NlwInverterBlock_lower_dec_aout_MC_D2_PT_4_IN7 : X_INV
    port map (
      I => serial_data_8_II_UIM,
      O => NlwInverterSignal_lower_dec_aout_MC_D2_PT_4_IN7
    );
  NlwInverterBlock_lower_dec_aout_MC_D2_PT_5_IN3 : X_INV
    port map (
      I => serial_data_4_II_UIM,
      O => NlwInverterSignal_lower_dec_aout_MC_D2_PT_5_IN3
    );
  NlwInverterBlock_lower_dec_aout_MC_D2_PT_5_IN5 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_aout_MC_D2_PT_5_IN5
    );
  NlwInverterBlock_lower_dec_aout_MC_D2_PT_5_IN6 : X_INV
    port map (
      I => lower_dec_err_chk_n003564,
      O => NlwInverterSignal_lower_dec_aout_MC_D2_PT_5_IN6
    );
  NlwInverterBlock_lower_dec_aout_MC_D2_PT_6_IN3 : X_INV
    port map (
      I => N_PZ_188,
      O => NlwInverterSignal_lower_dec_aout_MC_D2_PT_6_IN3
    );
  NlwInverterBlock_lower_dec_aout_MC_D2_PT_6_IN4 : X_INV
    port map (
      I => serial_data_5_II_UIM,
      O => NlwInverterSignal_lower_dec_aout_MC_D2_PT_6_IN4
    );
  NlwInverterBlock_lower_dec_aout_MC_D2_PT_6_IN5 : X_INV
    port map (
      I => serial_data_4_II_UIM,
      O => NlwInverterSignal_lower_dec_aout_MC_D2_PT_6_IN5
    );
  NlwInverterBlock_lower_dec_aout_MC_D2_PT_6_IN6 : X_INV
    port map (
      I => serial_data_7_II_UIM,
      O => NlwInverterSignal_lower_dec_aout_MC_D2_PT_6_IN6
    );
  NlwInverterBlock_lower_dec_aout_MC_D2_PT_6_IN7 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_aout_MC_D2_PT_6_IN7
    );
  NlwInverterBlock_lower_dec_aout_MC_D2_PT_7_IN5 : X_INV
    port map (
      I => serial_data_7_II_UIM,
      O => NlwInverterSignal_lower_dec_aout_MC_D2_PT_7_IN5
    );
  NlwInverterBlock_lower_dec_aout_MC_D2_PT_7_IN7 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_aout_MC_D2_PT_7_IN7
    );
  NlwInverterBlock_lower_dec_aout_MC_D2_PT_7_IN8 : X_INV
    port map (
      I => serial_data_9_II_UIM,
      O => NlwInverterSignal_lower_dec_aout_MC_D2_PT_7_IN8
    );
  NlwInverterBlock_lower_dec_aout_MC_D2_PT_8_IN3 : X_INV
    port map (
      I => serial_data_5_II_UIM,
      O => NlwInverterSignal_lower_dec_aout_MC_D2_PT_8_IN3
    );
  NlwInverterBlock_lower_dec_aout_MC_D2_PT_8_IN5 : X_INV
    port map (
      I => serial_data_7_II_UIM,
      O => NlwInverterSignal_lower_dec_aout_MC_D2_PT_8_IN5
    );
  NlwInverterBlock_lower_dec_aout_MC_D2_PT_8_IN7 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_aout_MC_D2_PT_8_IN7
    );
  NlwInverterBlock_lower_dec_aout_MC_D2_PT_8_IN8 : X_INV
    port map (
      I => serial_data_8_II_UIM,
      O => NlwInverterSignal_lower_dec_aout_MC_D2_PT_8_IN8
    );
  NlwInverterBlock_lower_dec_aout_MC_D2_PT_9_IN3 : X_INV
    port map (
      I => serial_data_5_II_UIM,
      O => NlwInverterSignal_lower_dec_aout_MC_D2_PT_9_IN3
    );
  NlwInverterBlock_lower_dec_aout_MC_D2_PT_9_IN5 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_lower_dec_aout_MC_D2_PT_9_IN5
    );
  NlwInverterBlock_upper_dec_hout_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_upper_dec_hout_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_upper_dec_hout_MC_D2_PT_1_IN4 : X_INV
    port map (
      I => upper_dec_jin,
      O => NlwInverterSignal_upper_dec_hout_MC_D2_PT_1_IN4
    );
  NlwInverterBlock_upper_dec_hout_MC_D2_PT_1_IN5 : X_INV
    port map (
      I => N_PZ_189,
      O => NlwInverterSignal_upper_dec_hout_MC_D2_PT_1_IN5
    );
  NlwInverterBlock_upper_dec_hout_MC_D2_PT_2_IN3 : X_INV
    port map (
      I => upper_dec_hin,
      O => NlwInverterSignal_upper_dec_hout_MC_D2_PT_2_IN3
    );
  NlwInverterBlock_upper_dec_hout_MC_D2_PT_3_IN5 : X_INV
    port map (
      I => upper_dec_fin,
      O => NlwInverterSignal_upper_dec_hout_MC_D2_PT_3_IN5
    );
  NlwInverterBlock_upper_dec_hout_MC_D2_PT_4_IN4 : X_INV
    port map (
      I => upper_dec_jin,
      O => NlwInverterSignal_upper_dec_hout_MC_D2_PT_4_IN4
    );
  NlwInverterBlock_upper_dec_hout_MC_D2_PT_5_IN4 : X_INV
    port map (
      I => upper_dec_jin,
      O => NlwInverterSignal_upper_dec_hout_MC_D2_PT_5_IN4
    );
  NlwInverterBlock_upper_dec_hout_MC_D2_PT_5_IN5 : X_INV
    port map (
      I => upper_dec_fin,
      O => NlwInverterSignal_upper_dec_hout_MC_D2_PT_5_IN5
    );
  NlwInverterBlock_upper_dec_hout_MC_D2_PT_5_IN6 : X_INV
    port map (
      I => upper_dec_gin,
      O => NlwInverterSignal_upper_dec_hout_MC_D2_PT_5_IN6
    );
  NlwInverterBlock_upper_dec_hout_MC_D2_PT_6_IN3 : X_INV
    port map (
      I => upper_dec_hin,
      O => NlwInverterSignal_upper_dec_hout_MC_D2_PT_6_IN3
    );
  NlwInverterBlock_upper_dec_hout_MC_D2_PT_7_IN3 : X_INV
    port map (
      I => upper_dec_hin,
      O => NlwInverterSignal_upper_dec_hout_MC_D2_PT_7_IN3
    );
  NlwInverterBlock_upper_dec_hout_MC_D2_PT_7_IN5 : X_INV
    port map (
      I => upper_dec_fin,
      O => NlwInverterSignal_upper_dec_hout_MC_D2_PT_7_IN5
    );
  NlwInverterBlock_upper_dec_hout_MC_D2_PT_7_IN6 : X_INV
    port map (
      I => upper_dec_gin,
      O => NlwInverterSignal_upper_dec_hout_MC_D2_PT_7_IN6
    );
  NlwInverterBlock_upper_dec_hout_MC_D2_PT_8_IN3 : X_INV
    port map (
      I => upper_dec_hin,
      O => NlwInverterSignal_upper_dec_hout_MC_D2_PT_8_IN3
    );
  NlwInverterBlock_upper_dec_hout_MC_D2_PT_8_IN4 : X_INV
    port map (
      I => upper_dec_jin,
      O => NlwInverterSignal_upper_dec_hout_MC_D2_PT_8_IN4
    );
  NlwInverterBlock_upper_dec_hout_MC_D2_PT_8_IN6 : X_INV
    port map (
      I => upper_dec_gin,
      O => NlwInverterSignal_upper_dec_hout_MC_D2_PT_8_IN6
    );
  NlwInverterBlock_upper_dec_gout_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_upper_dec_gout_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_upper_dec_gout_MC_D2_PT_1_IN5 : X_INV
    port map (
      I => upper_dec_fin,
      O => NlwInverterSignal_upper_dec_gout_MC_D2_PT_1_IN5
    );
  NlwInverterBlock_upper_dec_gout_MC_D2_PT_2_IN3 : X_INV
    port map (
      I => upper_dec_hin,
      O => NlwInverterSignal_upper_dec_gout_MC_D2_PT_2_IN3
    );
  NlwInverterBlock_upper_dec_gout_MC_D2_PT_2_IN4 : X_INV
    port map (
      I => upper_dec_jin,
      O => NlwInverterSignal_upper_dec_gout_MC_D2_PT_2_IN4
    );
  NlwInverterBlock_upper_dec_gout_MC_D2_PT_3_IN4 : X_INV
    port map (
      I => upper_dec_fin,
      O => NlwInverterSignal_upper_dec_gout_MC_D2_PT_3_IN4
    );
  NlwInverterBlock_upper_dec_gout_MC_D2_PT_3_IN5 : X_INV
    port map (
      I => N_PZ_189,
      O => NlwInverterSignal_upper_dec_gout_MC_D2_PT_3_IN5
    );
  NlwInverterBlock_upper_dec_gout_MC_D2_PT_4_IN3 : X_INV
    port map (
      I => upper_dec_jin,
      O => NlwInverterSignal_upper_dec_gout_MC_D2_PT_4_IN3
    );
  NlwInverterBlock_upper_dec_gout_MC_D2_PT_5_IN4 : X_INV
    port map (
      I => upper_dec_jin,
      O => NlwInverterSignal_upper_dec_gout_MC_D2_PT_5_IN4
    );
  NlwInverterBlock_upper_dec_gout_MC_D2_PT_5_IN5 : X_INV
    port map (
      I => N_PZ_189,
      O => NlwInverterSignal_upper_dec_gout_MC_D2_PT_5_IN5
    );
  NlwInverterBlock_upper_dec_gout_MC_D2_PT_6_IN3 : X_INV
    port map (
      I => upper_dec_hin,
      O => NlwInverterSignal_upper_dec_gout_MC_D2_PT_6_IN3
    );
  NlwInverterBlock_upper_dec_gout_MC_D2_PT_6_IN6 : X_INV
    port map (
      I => upper_dec_gin,
      O => NlwInverterSignal_upper_dec_gout_MC_D2_PT_6_IN6
    );
  NlwInverterBlock_ill_char_det_MC_D1_PT_0_IN2 : X_INV
    port map (
      I => err_ill_char_det7,
      O => NlwInverterSignal_ill_char_det_MC_D1_PT_0_IN2
    );
  NlwInverterBlock_err_prs_state_ffd1_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => err_prs_state_ffd2,
      O => NlwInverterSignal_err_prs_state_ffd1_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_err_prs_state_ffd1_MC_D2_PT_1_IN4 : X_INV
    port map (
      I => err_prs_state_ffd2,
      O => NlwInverterSignal_err_prs_state_ffd1_MC_D2_PT_1_IN4
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => lower_dec_err_chk_prs_state_ffd1,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => err_n0020,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_0_IN2 : X_INV
    port map (
      I => error_u,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_0_IN2
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_0_IN3 : X_INV
    port map (
      I => err_ill_char_det5,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_0_IN3
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => lower_dec_err_chk_prs_state_ffd2,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => err_n0020,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_1_IN2 : X_INV
    port map (
      I => error_u,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_1_IN2
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_1_IN3 : X_INV
    port map (
      I => err_ill_char_det5,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_1_IN3
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => serial_data_2_II_UIM,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_2_IN2 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_2_IN2
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_3_IN0 : X_INV
    port map (
      I => serial_data_1_II_UIM,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_3_IN0
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_4_IN0 : X_INV
    port map (
      I => serial_data_1_II_UIM,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_4_IN0
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_5_IN0 : X_INV
    port map (
      I => serial_data_1_II_UIM,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_5_IN0
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_5_IN2 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_5_IN2
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_6_IN1 : X_INV
    port map (
      I => serial_data_2_II_UIM,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_6_IN1
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_7_IN1 : X_INV
    port map (
      I => serial_data_2_II_UIM,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_7_IN1
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_8_IN1 : X_INV
    port map (
      I => serial_data_0_II_UIM,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_8_IN1
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_8_IN2 : X_INV
    port map (
      I => serial_data_3_II_UIM,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_8_IN2
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_8_IN3 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_8_IN3
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_9_IN1 : X_INV
    port map (
      I => serial_data_0_II_UIM,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_9_IN1
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_9_IN2 : X_INV
    port map (
      I => serial_data_5_II_UIM,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_9_IN2
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_9_IN3 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_9_IN3
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_10_IN1 : X_INV
    port map (
      I => serial_data_0_II_UIM,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_10_IN1
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_10_IN2 : X_INV
    port map (
      I => serial_data_4_II_UIM,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_10_IN2
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_10_IN3 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_10_IN3
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_11_IN2 : X_INV
    port map (
      I => serial_data_3_II_UIM,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_11_IN2
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_11_IN3 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_11_IN3
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_12_IN1 : X_INV
    port map (
      I => serial_data_3_II_UIM,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_12_IN1
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_13_IN0 : X_INV
    port map (
      I => serial_data_1_II_UIM,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_13_IN0
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_13_IN2 : X_INV
    port map (
      I => serial_data_5_II_UIM,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_13_IN2
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_13_IN3 : X_INV
    port map (
      I => serial_data_4_II_UIM,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_13_IN3
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_13_IN4 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_13_IN4
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_14_IN1 : X_INV
    port map (
      I => serial_data_3_II_UIM,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_14_IN1
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_15_IN1 : X_INV
    port map (
      I => serial_data_2_II_UIM,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_15_IN1
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_16_IN1 : X_INV
    port map (
      I => serial_data_3_II_UIM,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_16_IN1
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_16_IN3 : X_INV
    port map (
      I => N_PZ_180,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_16_IN3
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_16_IN4 : X_INV
    port map (
      I => N_PZ_304,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_16_IN4
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_16_IN5 : X_INV
    port map (
      I => serial_data_8_II_UIM,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_16_IN5
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_17_IN0 : X_INV
    port map (
      I => serial_data_0_II_UIM,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_17_IN0
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_17_IN2 : X_INV
    port map (
      I => serial_data_2_II_UIM,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_17_IN2
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_17_IN3 : X_INV
    port map (
      I => serial_data_4_II_UIM,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_17_IN3
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_18_IN1 : X_INV
    port map (
      I => serial_data_3_II_UIM,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_18_IN1
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_18_IN2 : X_INV
    port map (
      I => serial_data_5_II_UIM,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_18_IN2
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_18_IN3 : X_INV
    port map (
      I => lower_dec_err_chk_n003561,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_18_IN3
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_18_IN4 : X_INV
    port map (
      I => N_PZ_180,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_18_IN4
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_18_IN5 : X_INV
    port map (
      I => N_PZ_304,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_18_IN5
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_18_IN6 : X_INV
    port map (
      I => serial_data_9_II_UIM,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_18_IN6
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_19_IN0 : X_INV
    port map (
      I => serial_data_0_II_UIM,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_19_IN0
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_19_IN2 : X_INV
    port map (
      I => serial_data_2_II_UIM,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_19_IN2
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_19_IN3 : X_INV
    port map (
      I => serial_data_4_II_UIM,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_19_IN3
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_19_IN4 : X_INV
    port map (
      I => N_PZ_309,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_19_IN4
    );
  NlwInverterBlock_err_ill_char_det7_MC_D2_PT_19_IN5 : X_INV
    port map (
      I => N_PZ_180,
      O => NlwInverterSignal_err_ill_char_det7_MC_D2_PT_19_IN5
    );
  NlwInverterBlock_lower_dec_k_dec_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_lower_dec_k_dec_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => lower_dec_prs_state_fft1,
      O => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_lower_dec_k_dec_MC_D2_PT_4_IN0 : X_INV
    port map (
      I => lower_dec_prs_state_fft2,
      O => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_4_IN0
    );
  NlwInverterBlock_lower_dec_k_dec_MC_D2_PT_5_IN0 : X_INV
    port map (
      I => lower_dec_prs_state_fft2,
      O => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_5_IN0
    );
  NlwInverterBlock_lower_dec_k_dec_MC_D2_PT_5_IN8 : X_INV
    port map (
      I => serial_data_5_II_UIM,
      O => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_5_IN8
    );
  NlwInverterBlock_lower_dec_k_dec_MC_D2_PT_6_IN0 : X_INV
    port map (
      I => lower_dec_prs_state_fft2,
      O => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_6_IN0
    );
  NlwInverterBlock_lower_dec_k_dec_MC_D2_PT_6_IN5 : X_INV
    port map (
      I => serial_data_1_II_UIM,
      O => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_6_IN5
    );
  NlwInverterBlock_lower_dec_k_dec_MC_D2_PT_6_IN6 : X_INV
    port map (
      I => serial_data_0_II_UIM,
      O => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_6_IN6
    );
  NlwInverterBlock_lower_dec_k_dec_MC_D2_PT_6_IN7 : X_INV
    port map (
      I => serial_data_2_II_UIM,
      O => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_6_IN7
    );
  NlwInverterBlock_lower_dec_k_dec_MC_D2_PT_7_IN0 : X_INV
    port map (
      I => lower_dec_prs_state_fft2,
      O => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_7_IN0
    );
  NlwInverterBlock_lower_dec_k_dec_MC_D2_PT_7_IN8 : X_INV
    port map (
      I => serial_data_5_II_UIM,
      O => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_7_IN8
    );
  NlwInverterBlock_lower_dec_k_dec_MC_D2_PT_7_IN10 : X_INV
    port map (
      I => N_PZ_309,
      O => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_7_IN10
    );
  NlwInverterBlock_lower_dec_k_dec_MC_D2_PT_7_IN11 : X_INV
    port map (
      I => N_PZ_304,
      O => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_7_IN11
    );
  NlwInverterBlock_lower_dec_k_dec_MC_D2_PT_7_IN12 : X_INV
    port map (
      I => serial_data_9_II_UIM,
      O => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_7_IN12
    );
  NlwInverterBlock_lower_dec_k_dec_MC_D2_PT_7_IN13 : X_INV
    port map (
      I => serial_data_8_II_UIM,
      O => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_7_IN13
    );
  NlwInverterBlock_lower_dec_k_dec_MC_D2_PT_8_IN0 : X_INV
    port map (
      I => lower_dec_prs_state_fft2,
      O => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_8_IN0
    );
  NlwInverterBlock_lower_dec_k_dec_MC_D2_PT_8_IN5 : X_INV
    port map (
      I => serial_data_1_II_UIM,
      O => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_8_IN5
    );
  NlwInverterBlock_lower_dec_k_dec_MC_D2_PT_8_IN6 : X_INV
    port map (
      I => serial_data_0_II_UIM,
      O => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_8_IN6
    );
  NlwInverterBlock_lower_dec_k_dec_MC_D2_PT_8_IN7 : X_INV
    port map (
      I => serial_data_2_II_UIM,
      O => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_8_IN7
    );
  NlwInverterBlock_lower_dec_k_dec_MC_D2_PT_8_IN9 : X_INV
    port map (
      I => serial_data_4_II_UIM,
      O => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_8_IN9
    );
  NlwInverterBlock_lower_dec_k_dec_MC_D2_PT_8_IN10 : X_INV
    port map (
      I => N_PZ_309,
      O => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_8_IN10
    );
  NlwInverterBlock_lower_dec_k_dec_MC_D2_PT_8_IN11 : X_INV
    port map (
      I => N_PZ_304,
      O => NlwInverterSignal_lower_dec_k_dec_MC_D2_PT_8_IN11
    );
  NlwInverterBlock_upper_dec_k_dec_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => rst_II_UIM,
      O => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_upper_dec_k_dec_MC_D2_PT_3_IN6 : X_INV
    port map (
      I => upper_dec_ein,
      O => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_3_IN6
    );
  NlwInverterBlock_upper_dec_k_dec_MC_D2_PT_3_IN9 : X_INV
    port map (
      I => upper_dec_bin,
      O => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_3_IN9
    );
  NlwInverterBlock_upper_dec_k_dec_MC_D2_PT_4_IN3 : X_INV
    port map (
      I => upper_dec_hin,
      O => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_4_IN3
    );
  NlwInverterBlock_upper_dec_k_dec_MC_D2_PT_4_IN4 : X_INV
    port map (
      I => upper_dec_jin,
      O => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_4_IN4
    );
  NlwInverterBlock_upper_dec_k_dec_MC_D2_PT_4_IN5 : X_INV
    port map (
      I => upper_dec_gin,
      O => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_4_IN5
    );
  NlwInverterBlock_upper_dec_k_dec_MC_D2_PT_4_IN9 : X_INV
    port map (
      I => upper_dec_bin,
      O => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_4_IN9
    );
  NlwInverterBlock_upper_dec_k_dec_MC_D2_PT_5_IN7 : X_INV
    port map (
      I => upper_dec_ein,
      O => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_5_IN7
    );
  NlwInverterBlock_upper_dec_k_dec_MC_D2_PT_5_IN8 : X_INV
    port map (
      I => upper_dec_din,
      O => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_5_IN8
    );
  NlwInverterBlock_upper_dec_k_dec_MC_D2_PT_5_IN10 : X_INV
    port map (
      I => upper_dec_ain,
      O => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_5_IN10
    );
  NlwInverterBlock_upper_dec_k_dec_MC_D2_PT_6_IN3 : X_INV
    port map (
      I => upper_dec_hin,
      O => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_6_IN3
    );
  NlwInverterBlock_upper_dec_k_dec_MC_D2_PT_6_IN4 : X_INV
    port map (
      I => upper_dec_jin,
      O => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_6_IN4
    );
  NlwInverterBlock_upper_dec_k_dec_MC_D2_PT_6_IN5 : X_INV
    port map (
      I => upper_dec_gin,
      O => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_6_IN5
    );
  NlwInverterBlock_upper_dec_k_dec_MC_D2_PT_6_IN6 : X_INV
    port map (
      I => upper_dec_iin,
      O => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_6_IN6
    );
  NlwInverterBlock_upper_dec_k_dec_MC_D2_PT_6_IN9 : X_INV
    port map (
      I => upper_dec_ain,
      O => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_6_IN9
    );
  NlwInverterBlock_upper_dec_k_dec_MC_D2_PT_7_IN7 : X_INV
    port map (
      I => upper_dec_ein,
      O => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_7_IN7
    );
  NlwInverterBlock_upper_dec_k_dec_MC_D2_PT_7_IN9 : X_INV
    port map (
      I => upper_dec_cin,
      O => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_7_IN9
    );
  NlwInverterBlock_upper_dec_k_dec_MC_D2_PT_7_IN10 : X_INV
    port map (
      I => upper_dec_ain,
      O => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_7_IN10
    );
  NlwInverterBlock_upper_dec_k_dec_MC_D2_PT_7_IN11 : X_INV
    port map (
      I => upper_dec_bin,
      O => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_7_IN11
    );
  NlwInverterBlock_upper_dec_k_dec_MC_D2_PT_8_IN3 : X_INV
    port map (
      I => upper_dec_hin,
      O => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_8_IN3
    );
  NlwInverterBlock_upper_dec_k_dec_MC_D2_PT_8_IN4 : X_INV
    port map (
      I => upper_dec_jin,
      O => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_8_IN4
    );
  NlwInverterBlock_upper_dec_k_dec_MC_D2_PT_8_IN5 : X_INV
    port map (
      I => upper_dec_gin,
      O => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_8_IN5
    );
  NlwInverterBlock_upper_dec_k_dec_MC_D2_PT_8_IN6 : X_INV
    port map (
      I => upper_dec_iin,
      O => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_8_IN6
    );
  NlwInverterBlock_upper_dec_k_dec_MC_D2_PT_8_IN8 : X_INV
    port map (
      I => N_PZ_305,
      O => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_8_IN8
    );
  NlwInverterBlock_upper_dec_k_dec_MC_D2_PT_8_IN9 : X_INV
    port map (
      I => N_PZ_302,
      O => NlwInverterSignal_upper_dec_k_dec_MC_D2_PT_8_IN9
    );
  NlwInverterBlock_error_u_MC_D2_PT_0_IN3 : X_INV
    port map (
      I => upper_dec_ain,
      O => NlwInverterSignal_error_u_MC_D2_PT_0_IN3
    );
  NlwInverterBlock_error_u_MC_D2_PT_0_IN4 : X_INV
    port map (
      I => upper_dec_bin,
      O => NlwInverterSignal_error_u_MC_D2_PT_0_IN4
    );
  NlwInverterBlock_error_u_MC_D2_PT_3_IN2 : X_INV
    port map (
      I => upper_dec_hin,
      O => NlwInverterSignal_error_u_MC_D2_PT_3_IN2
    );
  NlwInverterBlock_error_u_MC_D2_PT_3_IN3 : X_INV
    port map (
      I => upper_dec_jin,
      O => NlwInverterSignal_error_u_MC_D2_PT_3_IN3
    );
  NlwInverterBlock_error_u_MC_D2_PT_3_IN4 : X_INV
    port map (
      I => upper_dec_fin,
      O => NlwInverterSignal_error_u_MC_D2_PT_3_IN4
    );
  NlwInverterBlock_error_u_MC_D2_PT_3_IN5 : X_INV
    port map (
      I => upper_dec_gin,
      O => NlwInverterSignal_error_u_MC_D2_PT_3_IN5
    );
  NlwInverterBlock_error_u_MC_D2_PT_6_IN5 : X_INV
    port map (
      I => upper_dec_iin,
      O => NlwInverterSignal_error_u_MC_D2_PT_6_IN5
    );
  NlwInverterBlock_error_u_MC_D2_PT_7_IN5 : X_INV
    port map (
      I => upper_dec_ein,
      O => NlwInverterSignal_error_u_MC_D2_PT_7_IN5
    );
  NlwInverterBlock_error_u_MC_D2_PT_9_IN2 : X_INV
    port map (
      I => upper_dec_hin,
      O => NlwInverterSignal_error_u_MC_D2_PT_9_IN2
    );
  NlwInverterBlock_error_u_MC_D2_PT_9_IN3 : X_INV
    port map (
      I => upper_dec_jin,
      O => NlwInverterSignal_error_u_MC_D2_PT_9_IN3
    );
  NlwInverterBlock_error_u_MC_D2_PT_9_IN4 : X_INV
    port map (
      I => upper_dec_gin,
      O => NlwInverterSignal_error_u_MC_D2_PT_9_IN4
    );
  NlwInverterBlock_error_u_MC_D2_PT_9_IN6 : X_INV
    port map (
      I => upper_dec_ein,
      O => NlwInverterSignal_error_u_MC_D2_PT_9_IN6
    );
  NlwInverterBlock_error_u_MC_D2_PT_10_IN2 : X_INV
    port map (
      I => upper_dec_hin,
      O => NlwInverterSignal_error_u_MC_D2_PT_10_IN2
    );
  NlwInverterBlock_error_u_MC_D2_PT_10_IN3 : X_INV
    port map (
      I => upper_dec_jin,
      O => NlwInverterSignal_error_u_MC_D2_PT_10_IN3
    );
  NlwInverterBlock_error_u_MC_D2_PT_10_IN4 : X_INV
    port map (
      I => upper_dec_gin,
      O => NlwInverterSignal_error_u_MC_D2_PT_10_IN4
    );
  NlwInverterBlock_error_u_MC_D2_PT_11_IN2 : X_INV
    port map (
      I => upper_dec_hin,
      O => NlwInverterSignal_error_u_MC_D2_PT_11_IN2
    );
  NlwInverterBlock_error_u_MC_D2_PT_11_IN3 : X_INV
    port map (
      I => upper_dec_fin,
      O => NlwInverterSignal_error_u_MC_D2_PT_11_IN3
    );
  NlwInverterBlock_error_u_MC_D2_PT_11_IN4 : X_INV
    port map (
      I => upper_dec_gin,
      O => NlwInverterSignal_error_u_MC_D2_PT_11_IN4
    );
  NlwInverterBlock_error_u_MC_D2_PT_11_IN5 : X_INV
    port map (
      I => upper_dec_iin,
      O => NlwInverterSignal_error_u_MC_D2_PT_11_IN5
    );
  NlwInverterBlock_error_u_MC_D2_PT_11_IN6 : X_INV
    port map (
      I => upper_dec_ein,
      O => NlwInverterSignal_error_u_MC_D2_PT_11_IN6
    );
  NlwInverterBlock_error_u_MC_D2_PT_12_IN4 : X_INV
    port map (
      I => N_PZ_305,
      O => NlwInverterSignal_error_u_MC_D2_PT_12_IN4
    );
  NlwInverterBlock_error_u_MC_D2_PT_13_IN2 : X_INV
    port map (
      I => upper_dec_iin,
      O => NlwInverterSignal_error_u_MC_D2_PT_13_IN2
    );
  NlwInverterBlock_error_u_MC_D2_PT_13_IN3 : X_INV
    port map (
      I => upper_dec_ein,
      O => NlwInverterSignal_error_u_MC_D2_PT_13_IN3
    );
  NlwInverterBlock_error_u_MC_D2_PT_13_IN4 : X_INV
    port map (
      I => N_PZ_302,
      O => NlwInverterSignal_error_u_MC_D2_PT_13_IN4
    );
  NlwInverterBlock_error_u_MC_D2_PT_13_IN5 : X_INV
    port map (
      I => upper_dec_ain,
      O => NlwInverterSignal_error_u_MC_D2_PT_13_IN5
    );
  NlwInverterBlock_error_u_MC_D2_PT_13_IN6 : X_INV
    port map (
      I => upper_dec_bin,
      O => NlwInverterSignal_error_u_MC_D2_PT_13_IN6
    );
  NlwInverterBlock_error_u_MC_D2_PT_14_IN5 : X_INV
    port map (
      I => upper_dec_ein,
      O => NlwInverterSignal_error_u_MC_D2_PT_14_IN5
    );
  NlwInverterBlock_error_u_MC_D2_PT_14_IN6 : X_INV
    port map (
      I => N_PZ_305,
      O => NlwInverterSignal_error_u_MC_D2_PT_14_IN6
    );
  NlwInverterBlock_error_u_MC_D2_PT_15_IN5 : X_INV
    port map (
      I => upper_dec_ein,
      O => NlwInverterSignal_error_u_MC_D2_PT_15_IN5
    );
  NlwInverterBlock_error_u_MC_D2_PT_15_IN6 : X_INV
    port map (
      I => N_PZ_305,
      O => NlwInverterSignal_error_u_MC_D2_PT_15_IN6
    );
  NlwInverterBlock_error_u_MC_D2_PT_16_IN2 : X_INV
    port map (
      I => upper_dec_hin,
      O => NlwInverterSignal_error_u_MC_D2_PT_16_IN2
    );
  NlwInverterBlock_error_u_MC_D2_PT_16_IN3 : X_INV
    port map (
      I => upper_dec_jin,
      O => NlwInverterSignal_error_u_MC_D2_PT_16_IN3
    );
  NlwInverterBlock_error_u_MC_D2_PT_16_IN4 : X_INV
    port map (
      I => upper_dec_gin,
      O => NlwInverterSignal_error_u_MC_D2_PT_16_IN4
    );
  NlwInverterBlock_error_u_MC_D2_PT_16_IN6 : X_INV
    port map (
      I => N_PZ_302,
      O => NlwInverterSignal_error_u_MC_D2_PT_16_IN6
    );
  NlwInverterBlock_error_u_MC_D2_PT_16_IN7 : X_INV
    port map (
      I => upper_dec_ain,
      O => NlwInverterSignal_error_u_MC_D2_PT_16_IN7
    );
  NlwInverterBlock_error_u_MC_D2_PT_17_IN2 : X_INV
    port map (
      I => upper_dec_hin,
      O => NlwInverterSignal_error_u_MC_D2_PT_17_IN2
    );
  NlwInverterBlock_error_u_MC_D2_PT_17_IN3 : X_INV
    port map (
      I => upper_dec_jin,
      O => NlwInverterSignal_error_u_MC_D2_PT_17_IN3
    );
  NlwInverterBlock_error_u_MC_D2_PT_17_IN4 : X_INV
    port map (
      I => upper_dec_gin,
      O => NlwInverterSignal_error_u_MC_D2_PT_17_IN4
    );
  NlwInverterBlock_error_u_MC_D2_PT_17_IN6 : X_INV
    port map (
      I => N_PZ_302,
      O => NlwInverterSignal_error_u_MC_D2_PT_17_IN6
    );
  NlwInverterBlock_error_u_MC_D2_PT_17_IN7 : X_INV
    port map (
      I => upper_dec_bin,
      O => NlwInverterSignal_error_u_MC_D2_PT_17_IN7
    );
  NlwInverterBlock_error_u_MC_D2_PT_18_IN6 : X_INV
    port map (
      I => upper_dec_ein,
      O => NlwInverterSignal_error_u_MC_D2_PT_18_IN6
    );
  NlwInverterBlock_error_u_MC_D2_PT_19_IN2 : X_INV
    port map (
      I => upper_dec_hin,
      O => NlwInverterSignal_error_u_MC_D2_PT_19_IN2
    );
  NlwInverterBlock_error_u_MC_D2_PT_19_IN3 : X_INV
    port map (
      I => upper_dec_jin,
      O => NlwInverterSignal_error_u_MC_D2_PT_19_IN3
    );
  NlwInverterBlock_error_u_MC_D2_PT_19_IN4 : X_INV
    port map (
      I => upper_dec_gin,
      O => NlwInverterSignal_error_u_MC_D2_PT_19_IN4
    );
  NlwInverterBlock_error_u_MC_D2_PT_19_IN5 : X_INV
    port map (
      I => upper_dec_iin,
      O => NlwInverterSignal_error_u_MC_D2_PT_19_IN5
    );
  NlwInverterBlock_error_u_MC_D2_PT_19_IN7 : X_INV
    port map (
      I => upper_dec_ain,
      O => NlwInverterSignal_error_u_MC_D2_PT_19_IN7
    );
  NlwInverterBlock_error_u_MC_D2_PT_19_IN8 : X_INV
    port map (
      I => upper_dec_bin,
      O => NlwInverterSignal_error_u_MC_D2_PT_19_IN8
    );
  NlwInverterBlock_err_ill_char_det5_MC_D2_PT_0_IN5 : X_INV
    port map (
      I => decoded_data_8_MC_UIM,
      O => NlwInverterSignal_err_ill_char_det5_MC_D2_PT_0_IN5
    );
  NlwInverterBlock_err_ill_char_det5_MC_D2_PT_1_IN2 : X_INV
    port map (
      I => decoded_data_0_MC_UIM,
      O => NlwInverterSignal_err_ill_char_det5_MC_D2_PT_1_IN2
    );
  NlwInverterBlock_err_ill_char_det5_MC_D2_PT_2_IN5 : X_INV
    port map (
      I => decoded_data_2_MC_UIM,
      O => NlwInverterSignal_err_ill_char_det5_MC_D2_PT_2_IN5
    );
  NlwInverterBlock_err_ill_char_det5_MC_D2_PT_3_IN4 : X_INV
    port map (
      I => decoded_data_10_MC_UIM,
      O => NlwInverterSignal_err_ill_char_det5_MC_D2_PT_3_IN4
    );
  NlwInverterBlock_err_ill_char_det5_MC_D2_PT_4_IN5 : X_INV
    port map (
      I => decoded_data_3_MC_UIM,
      O => NlwInverterSignal_err_ill_char_det5_MC_D2_PT_4_IN5
    );
  NlwInverterBlock_err_ill_char_det5_MC_D2_PT_5_IN4 : X_INV
    port map (
      I => decoded_data_11_MC_UIM,
      O => NlwInverterSignal_err_ill_char_det5_MC_D2_PT_5_IN4
    );
  NlwInverterBlock_err_ill_char_det5_MC_D2_PT_6_IN5 : X_INV
    port map (
      I => decoded_data_4_MC_UIM,
      O => NlwInverterSignal_err_ill_char_det5_MC_D2_PT_6_IN5
    );
  NlwInverterBlock_err_ill_char_det5_MC_D2_PT_7_IN4 : X_INV
    port map (
      I => decoded_data_12_MC_UIM,
      O => NlwInverterSignal_err_ill_char_det5_MC_D2_PT_7_IN4
    );
  NlwInverterBlock_err_ill_char_det5_MC_D2_PT_8_IN5 : X_INV
    port map (
      I => decoded_data_5_MC_UIM,
      O => NlwInverterSignal_err_ill_char_det5_MC_D2_PT_8_IN5
    );
  NlwInverterBlock_err_ill_char_det5_MC_D2_PT_9_IN4 : X_INV
    port map (
      I => decoded_data_13_MC_UIM,
      O => NlwInverterSignal_err_ill_char_det5_MC_D2_PT_9_IN4
    );
  NlwInverterBlock_err_ill_char_det5_MC_D2_PT_10_IN5 : X_INV
    port map (
      I => decoded_data_6_MC_UIM,
      O => NlwInverterSignal_err_ill_char_det5_MC_D2_PT_10_IN5
    );
  NlwInverterBlock_err_ill_char_det5_MC_D2_PT_11_IN4 : X_INV
    port map (
      I => decoded_data_14_MC_UIM,
      O => NlwInverterSignal_err_ill_char_det5_MC_D2_PT_11_IN4
    );
  NlwInverterBlock_err_ill_char_det5_MC_D2_PT_12_IN5 : X_INV
    port map (
      I => decoded_data_7_MC_UIM,
      O => NlwInverterSignal_err_ill_char_det5_MC_D2_PT_12_IN5
    );
  NlwInverterBlock_err_ill_char_det5_MC_D2_PT_13_IN4 : X_INV
    port map (
      I => decoded_data_15_MC_UIM,
      O => NlwInverterSignal_err_ill_char_det5_MC_D2_PT_13_IN4
    );
  NlwInverterBlock_err_ill_char_det5_MC_D2_PT_14_IN5 : X_INV
    port map (
      I => decoded_data_9_MC_UIM,
      O => NlwInverterSignal_err_ill_char_det5_MC_D2_PT_14_IN5
    );
  NlwInverterBlock_err_ill_char_det5_MC_D2_PT_15_IN4 : X_INV
    port map (
      I => decoded_data_1_MC_UIM,
      O => NlwInverterSignal_err_ill_char_det5_MC_D2_PT_15_IN4
    );
  NlwInverterBlock_N_PZ_217_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => lower_dec_prs_state_fft2,
      O => NlwInverterSignal_N_PZ_217_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_N_PZ_217_MC_D2_PT_0_IN2 : X_INV
    port map (
      I => N_PZ_309,
      O => NlwInverterSignal_N_PZ_217_MC_D2_PT_0_IN2
    );
  NlwInverterBlock_N_PZ_217_MC_D2_PT_0_IN3 : X_INV
    port map (
      I => lower_dec_err_chk_n003564,
      O => NlwInverterSignal_N_PZ_217_MC_D2_PT_0_IN3
    );
  NlwInverterBlock_N_PZ_217_MC_D2_PT_0_IN4 : X_INV
    port map (
      I => lower_dec_err_chk_n003574,
      O => NlwInverterSignal_N_PZ_217_MC_D2_PT_0_IN4
    );
  NlwInverterBlock_N_PZ_217_MC_D2_PT_0_IN5 : X_INV
    port map (
      I => err_n0020,
      O => NlwInverterSignal_N_PZ_217_MC_D2_PT_0_IN5
    );
  NlwInverterBlock_N_PZ_217_MC_D2_PT_0_IN6 : X_INV
    port map (
      I => error_u,
      O => NlwInverterSignal_N_PZ_217_MC_D2_PT_0_IN6
    );
  NlwInverterBlock_N_PZ_217_MC_D2_PT_0_IN7 : X_INV
    port map (
      I => err_ill_char_det5,
      O => NlwInverterSignal_N_PZ_217_MC_D2_PT_0_IN7
    );
  NlwInverterBlock_N_PZ_217_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => lower_dec_prs_state_fft2,
      O => NlwInverterSignal_N_PZ_217_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_N_PZ_217_MC_D2_PT_1_IN2 : X_INV
    port map (
      I => lower_dec_err_chk_n003564,
      O => NlwInverterSignal_N_PZ_217_MC_D2_PT_1_IN2
    );
  NlwInverterBlock_N_PZ_217_MC_D2_PT_1_IN3 : X_INV
    port map (
      I => lower_dec_err_chk_n003574,
      O => NlwInverterSignal_N_PZ_217_MC_D2_PT_1_IN3
    );
  NlwInverterBlock_N_PZ_217_MC_D2_PT_1_IN5 : X_INV
    port map (
      I => err_n0020,
      O => NlwInverterSignal_N_PZ_217_MC_D2_PT_1_IN5
    );
  NlwInverterBlock_N_PZ_217_MC_D2_PT_1_IN6 : X_INV
    port map (
      I => error_u,
      O => NlwInverterSignal_N_PZ_217_MC_D2_PT_1_IN6
    );
  NlwInverterBlock_N_PZ_217_MC_D2_PT_1_IN7 : X_INV
    port map (
      I => err_ill_char_det5,
      O => NlwInverterSignal_N_PZ_217_MC_D2_PT_1_IN7
    );
  NlwInverterBlock_N_PZ_217_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => lower_dec_prs_state_fft2,
      O => NlwInverterSignal_N_PZ_217_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_N_PZ_217_MC_D2_PT_2_IN2 : X_INV
    port map (
      I => lower_dec_err_chk_n003564,
      O => NlwInverterSignal_N_PZ_217_MC_D2_PT_2_IN2
    );
  NlwInverterBlock_N_PZ_217_MC_D2_PT_2_IN3 : X_INV
    port map (
      I => lower_dec_err_chk_n003574,
      O => NlwInverterSignal_N_PZ_217_MC_D2_PT_2_IN3
    );
  NlwInverterBlock_N_PZ_217_MC_D2_PT_2_IN5 : X_INV
    port map (
      I => err_n0020,
      O => NlwInverterSignal_N_PZ_217_MC_D2_PT_2_IN5
    );
  NlwInverterBlock_N_PZ_217_MC_D2_PT_2_IN6 : X_INV
    port map (
      I => error_u,
      O => NlwInverterSignal_N_PZ_217_MC_D2_PT_2_IN6
    );
  NlwInverterBlock_N_PZ_217_MC_D2_PT_2_IN7 : X_INV
    port map (
      I => err_ill_char_det5,
      O => NlwInverterSignal_N_PZ_217_MC_D2_PT_2_IN7
    );
  NlwBlockROC : ROC generic map ( WIDTH => 100 ns)
     port map (O => PRLD);
end Structure;

