-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : async_fifo_deep2.vhd
-- Author     :   <Administrator@JUNZHOU>
-- Company    : 
-- Created    : 2009-07-30
-- Last update: 2009-08-01
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description:
--   
--   Namely, this async fifo is called deep2, but the author is smart enough
--   to implement it efficiently using only one level reg, thus, the actual
--   deepth is one. (by Roc)
-- 
-------------------------------------------------------------------------------
-- Copyright (c) 2009 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2009-07-30  1.0      ZhouJun Created
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity async_fifo_deep2 is

  generic (
    DATA_WIDTH : integer := 8);
  port (
    wclk_i : in  std_logic;
    rclk_i : in  std_logic;
    arst_i : in  std_logic;
    wput_i : in  std_logic;
    rget_i : in  std_logic;
    data_i : in  std_logic_vector(DATA_WIDTH - 1 downto 0);
    wrdy_o : out std_logic;
    rrdy_o : out std_logic;
    data_o : out std_logic_vector(DATA_WIDTH - 1 downto 0));

end async_fifo_deep2;

architecture archi of async_fifo_deep2 is
  
  signal data               : std_logic_vector(data_i'length - 1 downto 0);
  signal wrdy               : std_logic;
  signal rrdy               : std_logic;
  signal wptr, rptr         : std_logic;
  signal rq1_wptr, rq2_wptr : std_logic;
  signal wq1_rptr, wq2_rptr : std_logic;

begin
  
  process(wclk_i)
  begin
    if rising_edge(wclk_i) then
      if wrdy = '1' and wput_i = '1' then
        data <= data_i;
      end if;
    end if;
  end process;

  process(arst_i, wclk_i)
  begin
    if arst_i = '1' then
      wptr <= '0';
    elsif rising_edge(wclk_i) then
      wptr <= wptr xor (wput_i and wrdy);
    end if;
  end process;

  process(arst_i, wclk_i)
  begin
    if arst_i = '1' then
      wq1_rptr <= '0';
      wq2_rptr <= '0';
    elsif rising_edge(wclk_i) then
      wq1_rptr <= rptr;
      wq2_rptr <= wq1_rptr;
    end if;
  end process;

  wrdy <= not (wptr xor wq2_rptr);

  process(arst_i, rclk_i)
  begin
    if arst_i = '1' then
      rq1_wptr <= '0';
      rq2_wptr <= '0';
    elsif rising_edge(rclk_i) then
      rq1_wptr <= wptr;
      rq2_wptr <= rq1_wptr;
    end if;
  end process;

  process(arst_i, rclk_i)
  begin
    if arst_i = '1' then
      rptr <= '0';
    elsif rising_edge(rclk_i) then
      rptr <= rptr xor (rget_i and rrdy);
    end if;
  end process;

  rrdy <= rptr xor rq2_wptr;

  rrdy_o <= rrdy;
  wrdy_o <= wrdy;
  data_o <= data;
  
end archi;

