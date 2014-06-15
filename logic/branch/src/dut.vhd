-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : dut.vhd
-- Author     :   <Quenii@QUENII-NB>
-- Company    : 
-- Created    : 2014-02-18
-- Last update: 2014-05-04
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2014 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-02-18  1.0      Quenii  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity dut is
  generic (
    ADDR_4B : integer);

  port (
    LB_Clk_i   : in  std_logic;
    LB_Reset_i : in  std_logic;
    LB_CS_i    : in  std_logic;
    LB_ADS_i   : in  std_logic;
    LB_ACK_o   : out std_logic;
    LB_Addr_i  : in  std_logic_vector(15 downto 0);
    LB_Write_i : in  std_logic;
    LB_Valid_i : in  std_logic;
    LB_DataW_i : in  std_logic_vector(15 downto 0);
    LB_Ready_o : out std_logic;
    LB_DataR_o : out std_logic_vector(15 downto 0);

    ssram_clk_o   : out std_logic;
    ssram_ce1_n_o : out std_logic;
    ssram_ce2_n_o : out std_logic;
    ssram_ce2_o   : out std_logic;
    ssram_addr_o  : out std_logic_vector(ADDR_WIDTH - 1 downto 0);
    ssram_d_i     : in  std_logic_vector(DATA_WIDTH - 1 downto 0);
    ssram_d_t_o   : out std_logic;
    ssram_d_o     : out std_logic_vector(DATA_WIDTH - 1 downto 0);
    ssram_adv_o   : out std_logic;
    ssram_we_n_o  : out std_logic;
    ssram_oe_n_o  : out std_logic;
    ssram_bw_n_o  : out std_logic;
    ssram_cke_n_o : out std_logic;
    ssram_zz_o    : out std_logic;
    ssram_mode_o  : out std_logic);

end dut;

architecture impl of dut is

begin  -- impl

  lb_target_ififo_1: entity work.lb_target_ififo
    generic map (
      CNT_REG_ADDR_4B  => CNT_REG_ADDR_4B,
      DATA_REG_ADDR_4B => DATA_REG_ADDR_4B)
    port map (
      LB_Clk_i      => LB_Clk_i,
      LB_Reset_i    => LB_Reset_i,
      LB_CS_i       => LB_CS_i,
      LB_ADS_i      => LB_ADS_i,
      LB_ACK_o      => LB_ACK_o,
      LB_Addr_i     => LB_Addr_i,
      LB_Write_i    => LB_Write_i,
      LB_Valid_i    => LB_Valid_i,
      LB_DataW_i    => LB_DataW_i,
      LB_Ready_o    => LB_Ready_o,
      LB_DataR_o    => LB_DataR_o,
      fifo_cnt_i    => fifo_cnt_i,
      fifo_q_i      => fifo_q_i,
      fifo_rd_en_o  => fifo_rd_en_o,
      fifo_rd_ack_i => fifo_rd_ack_i);

  dat_buf_v2_1: entity work.dat_buf_v2
    generic map (
      DATA_WIDTH => DATA_WIDTH,
      ADDR_WIDTH => ADDR_WIDTH)
    port map (
      sys_clk_i     => sys_clk_i,
      rst_i         => rst_i,
      task_start    => task_start,
      task_length   => task_length,
      fifo_full_o   => fifo_full_o,
      fifo_rd_o     => fifo_rd_o,
      din_i         => din_i,
      rd_empty_i    => rd_empty_i,
      LB_Clk_i      => LB_Clk_i,
      rd_i          => rd_i,
      empty_o       => empty_o,
      dout_o        => dout_o,
      ssram_clk_o   => ssram_clk_o,
      ssram_ce1_n_o => ssram_ce1_n_o,
      ssram_ce2_n_o => ssram_ce2_n_o,
      ssram_ce2_o   => ssram_ce2_o,
      ssram_addr_o  => ssram_addr_o,
      ssram_d_i     => ssram_d_i,
      ssram_d_t_o   => ssram_d_t_o,
      ssram_d_o     => ssram_d_o,
      ssram_adv_o   => ssram_adv_o,
      ssram_we_n_o  => ssram_we_n_o,
      ssram_oe_n_o  => ssram_oe_n_o,
      ssram_bw_n_o  => ssram_bw_n_o,
      ssram_cke_n_o => ssram_cke_n_o,
      ssram_zz_o    => ssram_zz_o,
      ssram_mode_o  => ssram_mode_o);
end impl;
