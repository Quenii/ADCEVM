-------------------------------------------------------------------------------
-- Title      : Local Bus Target Register
-- Project    : 
-------------------------------------------------------------------------------
-- File       : lb_target_reg.vhd
-- Author     :   <Liu Peng@GKHY-LIUPENG>
-- Company    : 
-- Created    : 2010-01-11
-- Last update: 2014-01-17
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2010 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2010-01-11  1.0      Liu Peng        Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity lb_target_reg is

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

    updated_o : out std_logic;
    ctrl_o    : out std_logic_vector(15 downto 0);
    sta_i     : in  std_logic_vector(15 downto 0));

end lb_target_reg;

architecture archi of lb_target_reg is

  type   state_t is (s_idle, s_read, s_write);
  signal state : state_t;

  signal selected          : std_logic;
  signal ctrl              : std_logic_vector(15 downto 0);
  signal updating, updated : std_logic;
  
  
begin  -- archi



  selected <= '1' when (LB_CS_i and LB_ADS_i) = '1' and ADDR_4B = conv_integer(LB_Addr_i) else
              '0';

  process (LB_Clk_i, LB_Reset_i)
  begin
    if LB_Reset_i = '1' then
      ctrl     <= (others => '0');
      updating <= '0';
      updated  <= '0';
    elsif rising_edge(LB_Clk_i) then
      if (selected and LB_Write_i and LB_Valid_i) = '1' then
        ctrl     <= LB_DataW_i;
        updating <= '1';
      else
        updating <= '0';
      end if;
      updated <= updating;
    end if;
  end process;

  LB_Ready_o <= selected;
  LB_DataR_o <= Sta_i when selected = '1' and LB_Write_i = '0' else (others => '0');
  LB_ACK_o   <= selected;
  updated_o  <= updated;
  ctrl_o     <= ctrl;
  
end archi;
