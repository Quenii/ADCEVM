-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : io_rec.vhd
-- Author     :   <Administrator@CHINA-6E5B7FBFB>
-- Company    : 
-- Created    : 2011-05-20
-- Last update: 2011-05-26
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2011 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2011-05-20  1.0      Administrator   Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity io_rec is
  
  generic (
    DATA_WIDTH : integer                       := 8;
    REG_ADDR   : std_logic_vector(15 downto 0) := x"0080";
    FIFO_ADDR  : std_logic_vector(15 downto 0) := x"0081"
    );

  port (
    rst_n_i    : in  std_logic;
    -- loc bus
    LB_Clk_i   : in  std_logic;
    LB_Reset_i : in  std_logic;
    LB_Addr_i  : in  std_logic_vector(15 downto 0);
    LB_Write_i : in  std_logic;
    LB_Read_i  : in  std_logic;
    LB_Ready_o : out std_logic;
    LB_DataW_i : in  std_logic_vector(15 downto 0);
    LB_DataR_o : out std_logic_vector(15 downto 0);
    -- data bus
    clk_i      : in  std_logic;
    din_i      : in  std_logic_vector(DATA_WIDTH - 1 downto 0));

end io_rec;

architecture behave of io_rec is

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
  -- signal define
  signal pkg_length : std_logic_vector(15 downto 0) := (others => '0');
  signal task_start : std_logic_vector(15 downto 0) := (others => '0');

  component lb_target_fifo_rome
    generic (
      ADDR : std_logic_vector(15 downto 0));
    port (
      LB_Clk_i    : in  std_logic;
      LB_Reset_i  : in  std_logic;
      LB_Addr_i   : in  std_logic_vector(15 downto 0);
      LB_Write_i  : in  std_logic;
      LB_Read_i   : in  std_logic;
      LB_Ready_o  : out std_logic;
      LB_DataW_i  : in  std_logic_vector(15 downto 0);
      LB_DataR_o  : out std_logic_vector(15 downto 0);
      fifo_emp_i  : in  std_logic;
      fifo_rd_o   : out std_logic;
      fifo_din_i  : in  std_logic_vector(15 downto 0);
      fifo_ful_i  : in  std_logic;
      fifo_wr_o   : out std_logic;
      fifo_dout_o : out std_logic_vector(15 downto 0));
  end component;

  component dat_buf
    port (
      clk_i        : in  std_logic;
      din_i        : in  std_logic_vector(7 downto 0);
      rst_i        : in  std_logic;
      task_start_i : in  std_logic;
      rd_clk_i     : in  std_logic;
      rd_i         : in  std_logic;
      empty_o      : out std_logic;
      dout_o       : out std_logic_vector(15 downto 0));
  end component;

  signal rd_i            : std_logic;
  signal empty_o         : std_logic;
  signal dout_o          : std_logic_vector(15 downto 0);
  signal LB_Ready_fifo_o : std_logic;
  signal LB_Ready_reg_o  : std_logic;
  
begin  -- behave

  LB_Ready_o <= LB_Ready_reg_o or LB_Ready_fifo_o;

  task_control_reg : lb_target_reg
    generic map (
      ADDR => REG_ADDR)
    port map (
      LB_Clk_i   => LB_Clk_i,
      LB_Reset_i => LB_Reset_i,
      LB_Addr_i  => LB_Addr_i,
      LB_Write_i => LB_Write_i,
      LB_Read_i  => LB_Read_i,
      LB_Ready_o => LB_Ready_reg_o,
      LB_DataW_i => LB_DataW_i,
      LB_DataR_o => open,
      updated_o  => open,
      ctrl_o     => task_start,
      sta_i      => x"0000");

  dat_buf_1 : dat_buf
    port map (
      clk_i        => clk_i,
      din_i        => din_i,
      rst_i        => task_start(0),
      task_start_i => task_start(15),
      rd_clk_i     => LB_Clk_i,
      rd_i         => rd_i,
      empty_o      => empty_o,
      dout_o       => dout_o);

  lb_target_fifo_rome_1 : lb_target_fifo_rome
    generic map (
      ADDR => FIFO_ADDR)
    port map (
      LB_Clk_i    => LB_Clk_i,
      LB_Reset_i  => LB_Reset_i,
      LB_Addr_i   => LB_Addr_i,
      LB_Write_i  => LB_Write_i,
      LB_Read_i   => LB_Read_i,
      LB_Ready_o  => LB_Ready_fifo_o,
      LB_DataW_i  => x"0000",
      LB_DataR_o  => LB_DataR_o,
      fifo_emp_i  => empty_o,
      fifo_rd_o   => rd_i,
      fifo_din_i  => dout_o,
      fifo_ful_i  => '0',
      fifo_wr_o   => open,
      fifo_dout_o => open);

end behave;
