-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : freq_meter.vhd
-- Author     :   <Quenii@QUENII-NB>
-- Company    : 
-- Created    : 2014-02-18
-- Last update: 2014-02-18
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
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity freq_meter is

  generic (
    SYS_FREQ : integer;
    WIDTH    : integer := 16);

  port (
    sys_clk_i : in std_logic;

    clk_i     : in  std_logic;
    counter_o : out std_logic_vector(WIDTH-1 downto 0);
    updated_o : out std_logic
    );

end freq_meter;

architecture impl of freq_meter is

  signal cnt_s : integer range 0 to SYS_FREQ;

  signal counter : std_logic_vector(WIDTH-1 downto 0);
  signal updated : std_logic;

  signal cnt   : std_logic_vector(WIDTH-1 downto 0);
  signal div   : std_logic_vector(11 downto 0);
  signal div_r : std_logic_vector(11 downto 0);
  
begin  -- impl

  updated_o <= updated;
  counter_o <= counter;

  process (clk_i)
  begin  -- process
    if rising_edge(clk_i) then
      div <= div + '1';
    end if;
  end process;

  process (sys_clk_i)
  begin  -- process
    if rising_edge(sys_clk_i) then
      div_r <= div;
      if cnt_s < SYS_FREQ then
        cnt_s   <= cnt_s + 1;
        updated <= '0';
        counter <= counter;
        if div = x"000" and div_r = x"fff" then
          cnt <= cnt + '1';
        end if;
      else
        cnt     <= (others => '0');
        cnt_s   <= 0;
        updated <= '1';
        counter <= cnt;
      end if;
    end if;
  end process;
  

end impl;
