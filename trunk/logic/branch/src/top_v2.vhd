-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : top_v2.vhd
-- Author     :   <Quenii@QUENII-NB>
-- Company    : 
-- Created    : 2014-01-16
-- Last update: 2014-02-10
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

    ltc2656_clr_o : out std_logic;
    ltc2656_ldac_n_o : out std_logic;
    ltc2656_cs_n_o : out std_logic;
    ltc2656_sck_o : out std_logic;
    ltc2656_sdi_i : in std_logic;
    ltc2656_sdo_o : out std_logic;
    
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

  constant WR_ADDR   : std_logic_vector(1 downto 0) := "00";
  constant RD_ADDR   : std_logic_vector(1 downto 0) := "10";
  constant FIFO_BASE : integer                      := 10;

  component fx2local
    generic (
      WR_ADDR : std_logic_vector(1 downto 0);
      RD_ADDR : std_logic_vector(1 downto 0));
    port (
      FX_CLK_i   : in    std_logic;
      FX2FD_io   : inout std_logic_vector (15 downto 0);
      FLAGA_i    : in    std_logic;
      FLAGB_i    : in    std_logic;
      FLAGC_i    : in    std_logic;
      FLAGD_i    : in    std_logic;
      SLRD_n_o   : out   std_logic;
      SLWR_n_o   : out   std_logic;
      SLOE_n_o   : out   std_logic;
      PKTEND_o   : out   std_logic;
      FIFOADR_o  : out   std_logic_vector(1 downto 0);
      LB_Clk_o   : out   std_logic;
      LB_Reset_o : out   std_logic;
      LB_CS_o    : out   std_logic;
      LB_ADS_o   : out   std_logic;
      LB_ACK_i   : in    std_logic;
      LB_Addr_o  : out   std_logic_vector(15 downto 0);
      LB_Write_o : out   std_logic;
      LB_Valid_o : out   std_logic;
      LB_DataW_o : out   std_logic_vector(15 downto 0);
      LB_Ready_i : in    std_logic;
      LB_DataR_i : in    std_logic_vector(15 downto 0));
  end component;

  component lb_target_reg
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
      updated_o  : out std_logic;
      ctrl_o     : out std_logic_vector(15 downto 0);
      sta_i      : in  std_logic_vector(15 downto 0));
  end component;

  component lb_target_ififo
    generic (
      CNT_REG_ADDR_4B  : integer;
      DATA_REG_ADDR_4B : integer);
    port (
      LB_Clk_i      : in  std_logic;
      LB_Reset_i    : in  std_logic;
      LB_CS_i       : in  std_logic;
      LB_ADS_i      : in  std_logic;
      LB_ACK_o      : out std_logic;
      LB_Addr_i     : in  std_logic_vector(15 downto 0);
      LB_Write_i    : in  std_logic;
      LB_Valid_i    : in  std_logic;
      LB_DataW_i    : in  std_logic_vector(15 downto 0);
      LB_Ready_o    : out std_logic;
      LB_DataR_o    : out std_logic_vector(15 downto 0);
      fifo_cnt_i    : in  std_logic_vector(15 downto 0);
      fifo_q_i      : in  std_logic_vector(15 downto 0);
      fifo_rd_en_o  : out std_logic;
      fifo_rd_ack_i : in  std_logic);
  end component;

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

  signal LB_ACK_reg0   : std_logic;
  signal LB_Ready_reg0 : std_logic;
  signal LB_DataR_reg0 : std_logic_vector(15 downto 0);
  signal updated_reg0  : std_logic;
  signal ctrl_reg0     : std_logic_vector(15 downto 0);
  signal sta_reg0      : std_logic_vector(15 downto 0);

  signal LB_ACK_ififo   : std_logic;
  signal LB_Ready_ififo : std_logic;
  signal LB_DataR_ififo : std_logic_vector(15 downto 0);

  signal LB_ACK_spi   : std_logic;
  signal LB_Ready_spi : std_logic;
  signal LB_DataR_spi : std_logic_vector(15 downto 0);

  signal LB_ACK_dac   : std_logic;
  signal LB_Ready_dac : std_logic;
  signal LB_DataR_dac : std_logic_vector(15 downto 0);

  signal fifo_cnt_i    : std_logic_vector(15 downto 0);
  signal fifo_q_i      : std_logic_vector(15 downto 0);
  signal fifo_rd_en_o  : std_logic;
  signal fifo_rd_ack_i : std_logic;
begin  -- impl

  fx2local_1 : fx2local
    generic map (
      WR_ADDR => WR_ADDR,
      RD_ADDR => RD_ADDR)
    port map (
      FX_CLK_i   => FX_CLK_i,
      FX2FD_io   => FX2FD_io,
      FLAGA_i    => FLAGA_i,
      FLAGB_i    => FLAGB_i,
      FLAGC_i    => FLAGC_i,
      FLAGD_i    => FLAGD_i,
      SLRD_n_o   => SLRD_n_o,
      SLWR_n_o   => SLWR_n_o,
      SLOE_n_o   => SLOE_n_o,
      PKTEND_o   => PKTEND_o,
      FIFOADR_o  => FIFOADR_o,
      LB_Clk_o   => LB_Clk,
      LB_Reset_o => LB_Reset,
      LB_CS_o    => LB_CS,
      LB_ADS_o   => LB_ADS,
      LB_ACK_i   => LB_ACK,
      LB_Addr_o  => LB_Addr,
      LB_Write_o => LB_Write,
      LB_Valid_o => LB_Valid,
      LB_DataW_o => LB_DataW,
      LB_Ready_i => LB_Ready,
      LB_DataR_i => LB_DataR);

  LB_ACK   <= LB_ACK_reg0 or LB_ACK_ififo or LB_ACK_spi or LB_ACK_dac;
  LB_Ready <= LB_Ready_reg0 or LB_Ready_ififo or LB_Ready_spi or LB_Ready_dac;
  LB_DataR <= LB_DataR_reg0 or LB_DataR_ififo or LB_DataR_spi or LB_DataR_dac;

  lb_target_reg_1 : lb_target_reg
    generic map (
      ADDR_4B => 1)
    port map (
      LB_Clk_i   => LB_Clk,
      LB_Reset_i => LB_Reset,
      LB_CS_i    => LB_CS,
      LB_ADS_i   => LB_ADS,
      LB_ACK_o   => LB_ACK_reg0,
      LB_Addr_i  => LB_Addr,
      LB_Write_i => LB_Write,
      LB_Valid_i => LB_Valid,
      LB_DataW_i => LB_DataW,
      LB_Ready_o => LB_Ready_reg0,
      LB_DataR_o => LB_DataR_reg0,
      updated_o  => updated_reg0,
      ctrl_o     => ctrl_reg0,
      sta_i      => sta_reg0);
  sta_reg0 <= ctrl_reg0;

  lb_target_ififo_1 : lb_target_ififo
    generic map (
      CNT_REG_ADDR_4B  => FIFO_BASE,
      DATA_REG_ADDR_4B => FIFO_BASE+1)
    port map (
      LB_Clk_i      => LB_Clk,
      LB_Reset_i    => LB_Reset,
      LB_CS_i       => LB_CS,
      LB_ADS_i      => LB_ADS,
      LB_ACK_o      => LB_ACK_ififo,
      LB_Addr_i     => LB_Addr,
      LB_Write_i    => LB_Write,
      LB_Valid_i    => LB_Valid,
      LB_DataW_i    => LB_DataW,
      LB_Ready_o    => LB_Ready_ififo,
      LB_DataR_o    => LB_DataR_ififo,
      fifo_cnt_i    => fifo_cnt_i,
      fifo_q_i      => fifo_q_i,
      fifo_rd_en_o  => fifo_rd_en_o,
      fifo_rd_ack_i => fifo_rd_ack_i);

  fifo_rd_ack_i <= fifo_rd_en_o;
  fifo_cnt_i    <= x"1000";

  process (LB_Clk, LB_Reset)
  begin  -- process
    if LB_Reset = '1' then
      fifo_q_i <= (others => '0');
    elsif LB_Clk'event and LB_Clk = '1' then  -- rising clock edge
      if fifo_rd_en_o = '1' then
        fifo_q_i <= fifo_q_i + '1';
      end if;
    end if;
  end process;

  tlc3548 : entity work.lb_target_spi
    generic map (
      ADDR_4B        => 100,
      CPOL           => '1',
      CPHA           => '0',
      SPI_2X_CLK_DIV => 5,
      C_REG_WIDTH    => 16)
    port map (
      LB_Clk_i   => LB_Clk,
      LB_Reset_i => LB_Reset,
      LB_CS_i    => LB_CS,
      LB_ADS_i   => LB_ADS,
      LB_ACK_o   => LB_ACK_spi,
      LB_Addr_i  => LB_Addr,
      LB_Write_i => LB_Write,
      LB_Valid_i => LB_Valid,
      LB_DataW_i => LB_DataW,
      LB_Ready_o => LB_Ready_spi,
      LB_DataR_o => LB_DataR_spi,
      sck_o      => tlc3548_sck_o,
      sdi_i      => tlc3548_sdi_i,
      sdo_o      => tlc3548_sdo_o,
      cs_n_o     => tlc3548_cs_n_o);

  tlc3548_fs_o      <= '1';
  tlc3548_start_n_o <= '1';

  ltc2656: entity work.lb_target_spi
    generic map (
      ADDR_4B => 102,
      CPOL => '1',
      CPHA => '1',
      SPI_2X_CLK_DIV => 1,
      C_REG_WIDTH => 24)
    port map (
      LB_Clk_i   => LB_Clk,
      LB_Reset_i => LB_Reset,
      LB_CS_i    => LB_CS,
      LB_ADS_i   => LB_ADS,
      LB_ACK_o   => LB_ACK_dac,
      LB_Addr_i  => LB_Addr,
      LB_Write_i => LB_Write,
      LB_Valid_i => LB_Valid,
      LB_DataW_i => LB_DataW,
      LB_Ready_o => LB_Ready_dac,
      LB_DataR_o => LB_DataR_dac,
      sck_o      => ltc2656_sck_o,
      sdi_i      => ltc2656_sdi_i,
      sdo_o      => ltc2656_sdo_o,
      cs_n_o     => ltc2656_cs_n_o);

  ltc2656_clr_o <= '1';
  ltc2656_ldac_n_o <= '1';
end impl;
