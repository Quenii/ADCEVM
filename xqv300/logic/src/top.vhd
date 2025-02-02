-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : top.vhd%
-- Author     :   <Administrator@CHINA-6C7FF0513>
-- Company    : 
-- Created    : 2010-05-09
-- Last update: 2010-07-19
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2010 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2010-05-09  1.0      Rome    Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity top is
  
  port (
    clk_80m              : in    std_logic;
    -- System reset in
    sys_rst_i            : in    std_logic;
    -- Power reset out, active low
    UMR                  : out   std_logic;
    -- 68013 port
    -- FX2 SLAV FIFO
    FX_CLK_i             : in    std_logic;
    FX2FD_io             : inout std_logic_vector (15 downto 0);  -- fifo data/q
    FLAGA_i              : in    std_logic;  -- program strobe
    FLAGB_i              : in    std_logic;  -- full
    FLAGC_i              : in    std_logic;  -- empty
    FLAGD_i              : in    std_logic;  -- not used
    SLRD_n_o             : out   std_logic;  -- fifo_rd
    SLWR_n_o             : out   std_logic;  -- fifo_wr
    SL_OE_n_o            : out   std_logic;
    PKTEND_o             : out   std_logic;  -- not used
    FIFOADR_o            : out   std_logic_vector(1 downto 0);    -- fifo adr
    -- TLC3548 SPI port
    TLC3548_sck_o        : out   std_logic;
    TLC3548_sdi_i        : in    std_logic;
    TLC3548_sdo_o        : out   std_logic;
    TLC3548_cs_n_o       : out   std_logic;
    TLC3548_fs_o         : out   std_logic;
    TLC3548_start_n_o    : out   std_logic;  -- do not use it, pull it up
    TLC3548_eco          : in    std_logic;  -- not used yet
    -- LTC2656 SPI port and configuration port
    LTC2656_sck_o        : out   std_logic;
    LTC2656_sdo_o        : out   std_logic;
    LTC2656_ld_cs_n_o    : out   std_logic;
    LTC2656_ldac_n_o     : out   std_logic
    );

end top;

architecture behave of top is

-------------------------------------------------------------------------------
  -- local bus
  component lb
    generic (
      FIFO_WR_PORT : std_logic_vector(1 downto 0);
      FIFO_RD_PORT : std_logic_vector(1 downto 0));
    port (
      sys_rst_i      : in  std_logic;
      LB_Clk_i       : in  std_logic;
      LB_Addr_o      : out std_logic_vector(15 downto 0);
      LB_Write_o     : out std_logic;
      LB_Read_o      : out std_logic;
      LB_Ready_i     : in  std_logic;
      LB_DataW_o     : out std_logic_vector(15 downto 0);
      LB_DataR_i     : in  std_logic_vector(15 downto 0);
      -- 68013 port
      PKTEND_o       : out std_logic;
      fifo_emp_i     : in  std_logic;
      fifo_ful_i     : in  std_logic;
      fifo_progful_i : in  std_logic;
      fifo_progemp_i : in  std_logic;
      fifo_wr_o      : out std_logic;
      fifo_rd_o      : out std_logic;
      fifo_adr_o     : out std_logic_vector(1 downto 0);
      fifo_din_i     : in  std_logic_vector(15 downto 0);
      fifo_dout_o    : out std_logic_vector(15 downto 0));
  end component;
  -- local bus
  signal LB_Clk_i       : std_logic;
  signal LB_Addr_o      : std_logic_vector(15 downto 0);
  signal LB_Write_o     : std_logic;
  signal LB_Read_o      : std_logic;
  signal LB_Ready_i     : std_logic;
  signal LB_DataW_o     : std_logic_vector(15 downto 0);
  signal LB_DataR_i     : std_logic_vector(15 downto 0);
  -- 68013 port
  signal fifo_emp_i     : std_logic;
  signal fifo_ful_i     : std_logic;
  signal fifo_progful_i : std_logic;
  signal fifo_progemp_i : std_logic;
  signal fifo_wr_o      : std_logic;
  signal fifo_rd_o      : std_logic;
  signal fifo_adr_o     : std_logic_vector(1 downto 0);
  signal fifo_din_i     : std_logic_vector(15 downto 0);
  signal fifo_dout_o    : std_logic_vector(15 downto 0);
-------------------------------------------------------------------------------
  component ltc2656b
    port (
      LB_Clk_i          : in  std_logic;
      LB_Reset_i        : in  std_logic;
      LB_Addr_i         : in  std_logic_vector(15 downto 0);
      LB_Write_i        : in  std_logic;
      LB_Read_i         : in  std_logic;
      LB_Ready_o        : out std_logic;
      LB_DataW_i        : in  std_logic_vector(15 downto 0);
      LB_DataR_o        : out std_logic_vector(15 downto 0);
      LTC2656_sck_o     : out std_logic;
      LTC2656_sdi_i     : in  std_logic;
      LTC2656_sdo_o     : out std_logic;
      LTC2656_ld_cs_n_o : out std_logic;
      LTC2656_ldac_n_o  : out std_logic);
  end component;
  signal LB_Ready_2656_i : std_logic;
  signal LB_Ready_had_i  : std_logic;
  signal LB_DataR_had_i  : std_logic_vector(15 downto 0);
  signal LB_DataR_2656_i : std_logic_vector(15 downto 0);
-------------------------------------------------------------------------------
  component lb_target_reg
    generic (
      ADDR : std_logic_vector(15 downto 0));
    port (
      LB_Clk_i   : in  std_logic;
      LB_Reset_i : in  std_logic;
      LB_Addr_i  : in  std_logic_vector(15 downto 0);
      LB_Write_i : in  std_logic;
      LB_Read_i  : in  std_logic;
      LB_Ready_o : out std_logic;
      LB_DataW_i : in  std_logic_vector(15 downto 0);
      LB_DataR_o : out std_logic_vector(15 downto 0);
      updated_o  : out std_logic;
      ctrl_o     : out std_logic_vector(15 downto 0);
      sta_i      : in  std_logic_vector(15 downto 0));
  end component;
  --
  signal LB_Ready_reset_ctr_i : std_logic;
  signal LB_DataR_reset_ctr_i : std_logic_vector(15 downto 0);
  signal reset_ctr_o          : std_logic_vector(15 downto 0);
  signal ssram0_gw_n          : std_logic;
-------------------------------------------------------------------------------
  component tlc3548
    port (
      LB_Clk_i          : in  std_logic;
      LB_Reset_i        : in  std_logic;
      LB_Addr_i         : in  std_logic_vector(15 downto 0);
      LB_Write_i        : in  std_logic;
      LB_Read_i         : in  std_logic;
      LB_Ready_o        : out std_logic;
      LB_DataW_i        : in  std_logic_vector(15 downto 0);
      LB_DataR_o        : out std_logic_vector(15 downto 0);
      TLC3548_sck_o     : out std_logic;
      TLC3548_sdi_i     : in  std_logic;
      TLC3548_sdo_o     : out std_logic;
      TLC3548_cs_n_o    : out std_logic;
      TLC3548_fs_o      : out std_logic;
      TLC3548_start_n_o : out std_logic;
      TLC3548_eco       : in  std_logic);
  end component;
  --
  signal LB_Ready_tlc3548_i : std_logic;
  signal LB_DataR_tlc3548_i : std_logic_vector(15 downto 0);
-------------------------------------------------------------------------------
  component dcm_user
    port (
      areset : in  std_logic := '0';
      inclk0 : in  std_logic := '0';
      c0     : out std_logic);
  end component;
  
begin  -- behave
  
  dcm_user_1 : dcm_user
    port map (
      areset => '0',
      inclk0 => FX_CLK_i,
      c0     => LB_Clk_i);
-------------------------------------------------------------------------------
  -- 68013 port
  FX2FD_io       <= fifo_dout_o when fifo_adr_o(1) = '1' else (others => 'Z');
  fifo_din_i     <= FX2FD_io    when fifo_adr_o(1) = '0' else (others => '0');
  fifo_progful_i <= not FLAGC_i;
  fifo_progemp_i <= not FLAGA_i;
  fifo_ful_i     <= not FLAGC_i;
  fifo_emp_i     <= not FLAGA_i;
  FIFOADR_o      <= fifo_adr_o;
  SLRD_n_o       <= not fifo_rd_o;
  SLWR_n_o       <= not fifo_wr_o;
  SL_OE_n_o      <= fifo_adr_o(1);

  UMR           <= '1';                 -- not reset
  

  LB_Ready_i <= LB_Ready_had_i or LB_Ready_2656_i or LB_Ready_reset_ctr_i or LB_Ready_tlc3548_i;
  LB_DataR_i <= LB_DataR_had_i or LB_DataR_2656_i or LB_DataR_reset_ctr_i or LB_DataR_tlc3548_i;

-------------------------------------------------------------------------------
  -- local bus
  lb_1 : lb
    generic map (
      FIFO_WR_PORT => "10",
      FIFO_RD_PORT => "00")
    port map (
      sys_rst_i      => '0',            --sys_rst_i,
      LB_Clk_i       => LB_Clk_i,
      LB_Addr_o      => LB_Addr_o,
      LB_Write_o     => LB_Write_o,
      LB_Read_o      => LB_Read_o,
      LB_Ready_i     => LB_Ready_i,
      LB_DataW_o     => LB_DataW_o,
      LB_DataR_i     => LB_DataR_i,
      PKTEND_o       => PKTEND_o,
      fifo_emp_i     => fifo_emp_i,
      fifo_ful_i     => fifo_ful_i,
      fifo_progful_i => fifo_progful_i,
      fifo_progemp_i => fifo_progemp_i,
      fifo_wr_o      => fifo_wr_o,
      fifo_rd_o      => fifo_rd_o,
      fifo_adr_o     => fifo_adr_o,
      fifo_din_i     => fifo_din_i,
      fifo_dout_o    => fifo_dout_o);
-------------------------------------------------------------------------------
  DAC7612 : ltc2656b
    port map (
      LB_Clk_i          => LB_Clk_i,
      LB_Reset_i        => reset_ctr_o(1),
      LB_Addr_i         => LB_Addr_o,
      LB_Write_i        => LB_Write_o,
      LB_Read_i         => LB_Read_o,
      LB_Ready_o        => LB_Ready_2656_i,
      LB_DataW_i        => LB_DataW_o,
      LB_DataR_o        => LB_DataR_2656_i,
      LTC2656_sck_o     => LTC2656_sck_o,
      LTC2656_sdi_i     => '1',
      LTC2656_sdo_o     => LTC2656_sdo_o,
      LTC2656_ld_cs_n_o => LTC2656_ld_cs_n_o,
      LTC2656_ldac_n_o  => LTC2656_ldac_n_o
      );
-------------------------------------------------------------------------------
  tlc3548_1 : tlc3548
    port map (
      LB_Clk_i          => LB_Clk_i,
      LB_Reset_i        => reset_ctr_o(2),
      LB_Addr_i         => LB_Addr_o,
      LB_Write_i        => LB_Write_o,
      LB_Read_i         => LB_Read_o,
      LB_Ready_o        => LB_Ready_tlc3548_i,
      LB_DataW_i        => LB_DataW_o,
      LB_DataR_o        => LB_DataR_tlc3548_i,
      TLC3548_sck_o     => TLC3548_sck_o,
      TLC3548_sdi_i     => TLC3548_sdi_i,
      TLC3548_sdo_o     => TLC3548_sdo_o,
      TLC3548_cs_n_o    => TLC3548_cs_n_o,
      TLC3548_fs_o      => TLC3548_fs_o,
      TLC3548_start_n_o => TLC3548_start_n_o,
      TLC3548_eco       => TLC3548_eco);

-------------------------------------------------------------------------------
  lb_target_reset_ctr : lb_target_reg
    generic map (
      ADDR => x"FFFF")
    port map (
      LB_Clk_i   => LB_Clk_i,
      LB_Reset_i => '0',
      LB_Addr_i  => LB_Addr_o,
      LB_Write_i => LB_Write_o,
      LB_Read_i  => LB_Read_o,
      LB_Ready_o => LB_Ready_reset_ctr_i,
      LB_DataW_i => LB_DataW_o,
      LB_DataR_o => LB_DataR_reset_ctr_i,
      updated_o  => open,
      ctrl_o     => reset_ctr_o,
      sta_i      => x"0000");

end behave;
