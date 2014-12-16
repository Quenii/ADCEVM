-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : lb_target_spi.vhd
-- Author     :   <Administrator@PC-201105271714>
-- Company    : 
-- Created    : 2013-08-03
-- Last update: 2014-11-26
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2013 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2013-08-03  1.0      Administrator   Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity lb_target_spi is
  generic (
    ADDR_4B        : integer;
    CPOL           : std_logic := '0';  -- SPI mode selection (mode 0 default)
    CPHA           : std_logic := '0';  -- CPOL = clock polarity, CPHA = clock phase.
    SPI_2X_CLK_DIV : integer;
    C_REG_WIDTH    : integer := 64);

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

    sck_o  : out std_logic;
    sdi_i  : in  std_logic;
    sdo_o  : out std_logic;
    cs_n_o : out std_logic
    );

end lb_target_spi;

architecture impl of lb_target_spi is

  signal LB_ACK_l   : std_logic;
  signal LB_Ready_l : std_logic;
  signal LB_DataR_l : std_logic_vector(15 downto 0);
  signal updated_l  : std_logic;
  signal ctrl_l     : std_logic_vector(15 downto 0);
  signal sta_l      : std_logic_vector(15 downto 0);

  signal LB_ACK_h   : std_logic;
  signal LB_Ready_h : std_logic;
  signal LB_DataR_h : std_logic_vector(15 downto 0);
  signal updated_h  : std_logic;
  signal ctrl_h     : std_logic_vector(15 downto 0);
  signal sta_h      : std_logic_vector(15 downto 0);

  signal ctrl : std_logic_vector(31 downto 0);
  signal sta  : std_logic_vector(31 downto 0);

  signal task_start_i : std_logic;
  signal data_i       : std_logic_vector(C_REG_WIDTH-1 downto 0);
  signal data_o       : std_logic_vector(C_REG_WIDTH-1 downto 0);
  signal spi_wren_i   : std_logic := '0';
  signal spi_en_o     : std_logic;

  signal spi_ssel_o : std_logic;
  signal spi_sck_o  : std_logic;
  signal spi_mosi_o : std_logic;
  signal spi_miso_i : std_logic := 'X';
  
begin  -- impl

  LB_Ready_o <= LB_Ready_l or LB_Ready_h;
  LB_ACK_o   <= LB_ACK_l or LB_ACK_h;
  LB_DataR_o <= LB_DataR_l or LB_DataR_h;

  reg_l : entity work.lb_target_reg
    generic map (
      ADDR_4B => ADDR_4B)
    port map (
      LB_Clk_i   => LB_Clk_i,
      LB_Reset_i => LB_Reset_i,
      LB_CS_i    => LB_CS_i,
      LB_ADS_i   => LB_ADS_i,
      LB_ACK_o   => LB_ACK_l,
      LB_Addr_i  => LB_Addr_i,
      LB_Write_i => LB_Write_i,
      LB_Valid_i => LB_Valid_i,
      LB_DataW_i => LB_DataW_i,
      LB_Ready_o => LB_Ready_l,
      LB_DataR_o => LB_DataR_l,
      updated_o  => updated_l,
      ctrl_o     => ctrl_l,
      sta_i      => sta_l);

  reg_h : entity work.lb_target_reg
    generic map (
      ADDR_4B => ADDR_4B+1)
    port map (
      LB_Clk_i   => LB_Clk_i,
      LB_Reset_i => LB_Reset_i,
      LB_CS_i    => LB_CS_i,
      LB_ADS_i   => LB_ADS_i,
      LB_ACK_o   => LB_ACK_h,
      LB_Addr_i  => LB_Addr_i,
      LB_Write_i => LB_Write_i,
      LB_Valid_i => LB_Valid_i,
      LB_DataW_i => LB_DataW_i,
      LB_Ready_o => LB_Ready_h,
      LB_DataR_o => LB_DataR_h,
      updated_o  => updated_h,
      ctrl_o     => ctrl_h,
      sta_i      => sta_h);

  ctrl  <= ctrl_h & ctrl_l;
  sta_h <= sta(31 downto 16);
  sta_l <= sta(15 downto 0);

  task_start_i                <= updated_l;
  data_i                      <= ctrl(C_REG_WIDTH-1 downto 0);
  sta(C_REG_WIDTH-1 downto 0) <= data_o;

  spi_master_1 : entity work.spi_master
    generic map (
      N              => C_REG_WIDTH,
      CPOL           => CPOL,
      CPHA           => CPHA,
      PREFETCH       => 1,
      SPI_2X_CLK_DIV => SPI_2X_CLK_DIV)
    port map (
      sclk_i     => LB_Clk_i,
      pclk_i     => LB_Clk_i,
      rst_i      => LB_Reset_i,
      spi_ssel_o => spi_ssel_o,
      spi_sck_o  => spi_sck_o,
      spi_mosi_o => spi_mosi_o,
      spi_miso_i => spi_miso_i,
      di_req_o   => open,
      di_i       => data_i,
      wren_i     => task_start_i,
      wr_ack_o   => open,
      do_valid_o => open,
      do_o       => data_o);

  cs_n_o     <= spi_ssel_o;
  sdo_o      <= spi_mosi_o;
  spi_miso_i <= sdi_i;
  sck_o      <= spi_sck_o;

end impl;
