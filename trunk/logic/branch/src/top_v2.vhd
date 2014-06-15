-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : top_v2.vhd
-- Author     :   <Quenii@QUENII-NB>
-- Company    : 
-- Created    : 2014-01-16
-- Last update: 2014-06-15
-- Platform   :  
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2014 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-01-16  1.0      Quenii  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity top_v2 is
  port (
    sys_clk_i : in std_logic;

    FX_CLK_i  : in    std_logic;
    FX2FD_io  : inout std_logic_vector (15 downto 0);
    FLAGA_i   : in    std_logic;
    FLAGB_i   : in    std_logic;
    FLAGC_i   : in    std_logic;
    FLAGD_i   : in    std_logic;
    SLRD_n_o  : out   std_logic;
    SLWR_n_o  : out   std_logic;
    SLOE_n_o  : out   std_logic;
    PKTEND_o  : out   std_logic;
    FIFOADR_o : out   std_logic_vector(1 downto 0);

    ltc2656_clr_o    : out std_logic;
    ltc2656_ldac_n_o : out std_logic;
    ltc2656_cs_n_o   : out std_logic;
    ltc2656_sck_o    : out std_logic;
    ltc2656_sdi_i    : in  std_logic;
    ltc2656_sdo_o    : out std_logic;

    tlc3548_sck_o     : out std_logic;
    tlc3548_fs_o      : out std_logic;
    tlc3548_sdo_o     : out std_logic;
    tlc3548_sdi_i     : in  std_logic;
    tlc3548_cs_n_o    : out std_logic;
    tlc3548_eco_i     : in  std_logic;
    tlc3548_start_n_o : out std_logic

    );
end top_v2;

architecture impl of top_v2 is

  signal sys_clk   : std_logic;
  signal sys_rst   : std_logic;
  signal sys_rst_n : std_logic;

  signal LB_Clk   : std_logic;
  signal LB_Reset : std_logic;
  signal LB_CS    : std_logic;
  signal LB_ADS   : std_logic;
  signal LB_Addr  : std_logic_vector(15 downto 0);
  signal LB_Write : std_logic;
  signal LB_Valid : std_logic;
  signal LB_DataW : std_logic_vector(15 downto 0);
  signal LB_ACK   : std_logic;
  signal LB_Ready : std_logic;
  signal LB_DataR : std_logic_vector(15 downto 0);

  signal LB_ACK_reg1   : std_logic;
  signal LB_Ready_reg1 : std_logic;
  signal LB_DataR_reg1 : std_logic_vector(15 downto 0);
  signal updated_reg1  : std_logic;
  signal ctrl_reg1     : std_logic_vector(15 downto 0);
  signal sta_reg1      : std_logic_vector(15 downto 0);

  signal LB_ACK_dut   : std_logic;
  signal LB_Ready_dut : std_logic;
  signal LB_DataR_dut : std_logic_vector(15 downto 0);
  signal fifo_rd_en_o : std_logic;
  
  signal clk_div : std_logic;

  signal test : std_logic_vector(15 downto 0);
  
begin  -- impl

  dcm45_1 : entity work.dcm45
    port map (
      areset => '0',
      inclk0 => sys_clk_i,
      c0     => sys_clk,
      c1     => clk_div,
      locked => sys_rst_n);
  sys_rst <= sys_rst_n;

  board_1 : entity work.board
    port map (
      FX_CLK_i          => FX_CLK_i,
      FX2FD_io          => FX2FD_io,
      FLAGA_i           => FLAGA_i,
      FLAGB_i           => FLAGB_i,
      FLAGC_i           => FLAGC_i,
      FLAGD_i           => FLAGD_i,
      SLRD_n_o          => SLRD_n_o,
      SLWR_n_o          => SLWR_n_o,
      SLOE_n_o          => SLOE_n_o,
      PKTEND_o          => PKTEND_o,
      FIFOADR_o         => FIFOADR_o,
      ltc2656_clr_o     => ltc2656_clr_o,
      ltc2656_ldac_n_o  => ltc2656_ldac_n_o,
      ltc2656_cs_n_o    => ltc2656_cs_n_o,
      ltc2656_sck_o     => ltc2656_sck_o,
      ltc2656_sdi_i     => ltc2656_sdi_i,
      ltc2656_sdo_o     => ltc2656_sdo_o,
      tlc3548_sck_o     => tlc3548_sck_o,
      tlc3548_fs_o      => tlc3548_fs_o,
      tlc3548_sdo_o     => tlc3548_sdo_o,
      tlc3548_sdi_i     => tlc3548_sdi_i,
      tlc3548_cs_n_o    => tlc3548_cs_n_o,
      tlc3548_eco_i     => tlc3548_eco_i,
      tlc3548_start_n_o => tlc3548_start_n_o,
      LB_Clk_o          => LB_Clk,
      LB_Reset_o        => LB_Reset,
      LB_CS_o           => LB_CS,
      LB_ADS_o          => LB_ADS,
      LB_ACK_i          => LB_ACK,
      LB_Addr_o         => LB_Addr,
      LB_Write_o        => LB_Write,
      LB_Valid_o        => LB_Valid,
      LB_DataW_o        => LB_DataW,
      LB_Ready_i        => LB_Ready,
      LB_DataR_i        => LB_DataR);

  LB_ACK   <= LB_ACK_reg1 or LB_ACK_dut;
  LB_Ready <= LB_Ready_reg1 or LB_Ready_dut;
  LB_DataR <= LB_DataR_reg1 or LB_DataR_dut;

  reg1 : entity work.lb_target_reg
    generic map (
      ADDR_4B => 1)
    port map (
      LB_Clk_i   => LB_Clk,
      LB_Reset_i => LB_Reset,
      LB_CS_i    => LB_CS,
      LB_ADS_i   => LB_ADS,
      LB_ACK_o   => LB_ACK_reg1,
      LB_Addr_i  => LB_Addr,
      LB_Write_i => LB_Write,
      LB_Valid_i => LB_Valid,
      LB_DataW_i => LB_DataW,
      LB_Ready_o => LB_Ready_reg1,
      LB_DataR_o => LB_DataR_reg1,
      updated_o  => updated_reg1,
      ctrl_o     => ctrl_reg1,
      sta_i      => sta_reg1);

  freq_meter_1 : entity work.freq_meter
    generic map (
      SYS_FREQ => 100000000,
      WIDTH    => 16)
    port map (
      sys_clk_i => sys_clk,
      clk_i     => FX_CLK_i,
      counter_o => sta_reg1,
      updated_o => open);

  lb_target_ififo_1: entity work.lb_target_ififo
    generic map (
      CNT_REG_ADDR_4B  => 201,
      DATA_REG_ADDR_4B => 200)
    port map (
      LB_Clk_i      => LB_Clk,
      LB_Reset_i    => LB_Reset,
      LB_CS_i       => LB_CS,
      LB_ADS_i      => LB_ADS,
      LB_ACK_o      => LB_ACK_dut,
      LB_Addr_i     => LB_Addr,
      LB_Write_i    => LB_Write,
      LB_Valid_i    => LB_Valid,
      LB_DataW_i    => LB_DataW,
      LB_Ready_o    => LB_Ready_dut,
      LB_DataR_o    => LB_DataR_dut,
      fifo_cnt_i    => x"1000",
      fifo_q_i      => test,
      fifo_rd_en_o  => fifo_rd_en_o,
      fifo_rd_ack_i => fifo_rd_en_o);

  process (LB_Clk)
  begin  -- process
    if rising_edge(LB_Clk) then
      if fifo_rd_en_o = '1' then
        test <= test + '1';
      end if;
    end if;
  end process;
end impl;
