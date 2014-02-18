-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : lb_target_ofifo.vhd
-- Author     :   <roc@ROCS-LAPTOP>
-- Company    : 
-- Created    : 2010-01-12
-- Last update: 2013-10-31
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2010 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2010-01-12  1.0      roc     Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity lb_target_ofifo is

  generic (
    CNT_REG_ADDR_4B  : integer;
    --  VALVE_REG_ADDR : integer;
    DATA_REG_ADDR_4B : integer);  
  port (
    LB_Clk_i   : in  std_logic;
    LB_Reset_i : in  std_logic;
    LB_CS_i    : in  std_logic;
    LB_ADS_i   : in  std_logic;
    LB_ACK_o   : out std_logic;
    LB_Addr_i  : in  std_logic_vector(13 downto 2);
    LB_Write_i : in  std_logic;
    LB_Valid_i : in  std_logic;
    LB_DataW_i : in  std_logic_vector(31 downto 0);
    LB_Ready_o : out std_logic;
    LB_DataR_o : out std_logic_vector(31 downto 0);

    fifo_space_cnt_i : in  std_logic_vector(31 downto 0);
    fifo_busy_i      : in  std_logic; 
    fifo_d_o         : out std_logic_vector(31 downto 0);
    fifo_wr_en_o     : out std_logic);

end lb_target_ofifo;

architecture archi of lb_target_ofifo is

  component lb_target_reg
    generic (
      ADDR_4B : integer);
    port (
      LB_Clk_i   : in  std_logic;
      LB_Reset_i : in  std_logic;
      LB_CS_i    : in  std_logic;
      LB_ADS_i   : in  std_logic;
      LB_ACK_o   : out std_logic;
      LB_Addr_i  : in  std_logic_vector(13 downto 2);
      LB_Write_i : in  std_logic;
      LB_Valid_i : in  std_logic;
      LB_DataW_i : in  std_logic_vector(31 downto 0);
      LB_Ready_o : out std_logic;
      LB_DataR_o : out std_logic_vector(31 downto 0);
      updated_o  : out std_logic;
      ctrl_o     : out std_logic_vector(31 downto 0);
      sta_i      : in  std_logic_vector(31 downto 0));
  end component;


  signal LB_ACK_cnt_reg   : std_logic;
  signal LB_Ready_cnt_reg : std_logic;
  signal LB_DataR_cnt_reg : std_logic_vector(31 downto 0);
  signal LB_ACK_fifo      : std_logic;
  signal LB_Ready_fifo    : std_logic;
  signal LB_DataR_fifo    : std_logic_vector(31 downto 0);


  signal ctl, sta    : std_logic_vector(31 downto 0);
  signal ctl_updated : std_logic;

  signal fifo_selected : std_logic;
  signal fifo_wr_en    : std_logic;
  
  
begin  -- archi


  cnt_reg : lb_target_reg
    generic map (
      ADDR_4B => CNT_REG_ADDR_4B)
    port map (
      LB_Clk_i   => LB_Clk_i,
      LB_Reset_i => LB_Reset_i,
      LB_CS_i    => LB_CS_i,
      LB_ADS_i   => LB_ADS_i,
      LB_ACK_o   => LB_ACK_cnt_reg,
      LB_Addr_i  => LB_Addr_i,
      LB_Write_i => LB_Write_i,
      LB_Valid_i => LB_Valid_i,
      LB_DataW_i => LB_DataW_i,
      LB_Ready_o => LB_Ready_cnt_reg,
      LB_DataR_o => LB_DataR_cnt_reg,
      updated_o  => ctl_updated,        -- cnt_reg_updated,
      ctrl_o     => ctl,
      sta_i      => sta);
  sta <= fifo_space_cnt_i;

  -----------------------------------------------------------------------------


  fifo_selected <= '1' when (LB_CS_i and LB_ADS_i) = '1' and DATA_REG_ADDR_4B = conv_integer(LB_Addr_i) else
                   '0';

  fifo_wr_en <= fifo_selected and LB_Write_i and LB_Valid_i;

  fifo_wr_en_o <= fifo_wr_en;
  fifo_d_o     <= LB_DataW_i;

  LB_ACK_fifo   <= fifo_selected;
  LB_Ready_fifo <= fifo_selected and (not fifo_busy_i);
  LB_DataR_fifo <= (others => '0');

  LB_Ready_o <= LB_Ready_fifo or LB_Ready_cnt_reg;
  LB_DataR_o <= LB_DataR_fifo or LB_DataR_cnt_reg;
  LB_ACK_o   <= LB_ACK_fifo or LB_ACK_cnt_reg;


end archi;
