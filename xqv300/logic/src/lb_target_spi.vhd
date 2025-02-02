-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : lb_target_spi.vhd
-- Author     :   <Administrator@HEAVEN>
-- Company    : 
-- Created    : 2011-05-14
-- Last update: 2011-05-14
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2011 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2011-05-14  1.0      Administrator   Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity lb_target_spi is
  generic (
    C_SCK_RATIO : integer;
    C_REG_WIDTH : integer := 14;

    ADDR : std_logic_vector(15 downto 0)
    );

  port (
    LB_Clk_i   : in  std_logic;
    LB_Reset_i : in  std_logic;
    LB_Addr_i  : in  std_logic_vector(15 downto 0);
    LB_Write_i : in  std_logic;
    LB_Read_i  : in  std_logic;
    LB_Ready_o : out std_logic;
    LB_DataW_i : in  std_logic_vector(15 downto 0);
    LB_DataR_o : out std_logic_vector(15 downto 0);

    -- SPI port
    spi_en_o : out std_logic;

    sck_o  : out std_logic;
    sdi_i  : in  std_logic;
    sdo_o  : out std_logic;
    cs_n_o : out std_logic
    );

end lb_target_spi;

architecture impl of lb_target_spi is

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

  signal updated_o  : std_logic;
  signal ctrl_o     : std_logic_vector(15 downto 0);
  signal sta_i      : std_logic_vector(15 downto 0);

  component spi24_v2
    generic (
      C_SCK_RATIO : integer;
      C_REG_WIDTH : integer);
    port (
      clk_i        : in  std_logic;
      rst_i        : in  std_logic;
      task_start_i : in  std_logic;
      data_i       : in  std_logic_vector(C_REG_WIDTH-1 downto 0);
      data_o       : out std_logic_vector(C_REG_WIDTH-1 downto 0);
      spi_wren_i   : in  std_logic;
      sck_o        : out std_logic;
      sdi_i        : in  std_logic;
      sdo_o        : out std_logic;
      spi_en_o     : out std_logic;
      cs_n_o       : out std_logic);
  end component;
  
begin  -- impl

  lb_target_reg_1 : lb_target_reg
    generic map (
      ADDR => ADDR)
    port map (
      LB_Clk_i   => LB_Clk_i,
      LB_Reset_i => LB_Reset_i,
      LB_Addr_i  => LB_Addr_i,
      LB_Write_i => LB_Write_i,
      LB_Read_i  => LB_Read_i,
      LB_Ready_o => LB_Ready_o,
      LB_DataW_i => LB_DataW_i,
      LB_DataR_o => LB_DataR_o,
      updated_o  => updated_o,
      ctrl_o     => ctrl_o,
      sta_i      => sta_i);

  spi24_v2_1 : spi24_v2
    generic map (
      C_SCK_RATIO => C_SCK_RATIO,
      C_REG_WIDTH => C_REG_WIDTH)
    port map (
      clk_i        => LB_Clk_i,
      rst_i        => LB_Reset_i,
      task_start_i => updated_o,
      data_i       => ctrl_o(C_REG_WIDTH-1 downto 0),
      data_o       => sta_i(C_REG_WIDTH-1 downto 0),
      spi_wren_i   => '1',
      sck_o        => sck_o,
      sdi_i        => sdi_i,
      sdo_o        => sdo_o,
      spi_en_o     => open,
      cs_n_o       => cs_n_o);
end impl;
