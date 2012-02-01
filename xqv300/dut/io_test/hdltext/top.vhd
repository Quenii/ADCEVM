-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : top.vhd
-- Author     :   <Administrator@PARADISE-B3328F>
-- Company    : 
-- Created    : 2011-05-24
-- Last update: 2011-05-24
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2011 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2011-05-24  1.0      Administrator   Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

Library UNISIM;
use UNISIM.vcomponents.all;

entity top is
  
  port (
    clk_i : in  std_logic;
    b0_io : out std_logic_vector(18 downto 0);
    b1_io : out std_logic_vector(17 downto 0);
    b2_io : out std_logic_vector(16 downto 0);
    b3_io : out std_logic_vector(14 downto 0);
    b4_io : out std_logic_vector(20 downto 0);
    b5_io : out std_logic_vector(18 downto 0);
    b6_io : out std_logic_vector(20 downto 0);
    b7_io : out std_logic_vector(19 downto 0)
    );

end top;

architecture impl of top is

  signal b0 : std_logic_vector(18 downto 0);
  signal b1 : std_logic_vector(17 downto 0);
  signal b2 : std_logic_vector(16 downto 0);
  signal b3 : std_logic_vector(14 downto 0);
  signal b4 : std_logic_vector(20 downto 0);
  signal b5 : std_logic_vector(18 downto 0);
  signal b6 : std_logic_vector(20 downto 0);
  signal b7 : std_logic_vector(19 downto 0);
  signal clk_bufg : std_logic;

begin  -- impl

	BUFG_inst : BUFG
	port map (
		O => clk_bufg, -- Clock buffer output
		I => clk_i -- Clock buffer input
	);
  process (clk_bufg)
  begin  -- process
    if rising_edge(clk_bufg) then
      b0(18 downto 10) <= b0(18 downto 10) + 1;
      b0(9 downto 0)   <= b0(9 downto 0) + 1;
      b1(17 downto 10) <= b1(17 downto 10) + 1;
      b1(9 downto 0)   <= b1(9 downto 0) + 1;
      b2(16 downto 10) <= b2(16 downto 10) + 1;
      b2(9 downto 0)   <= b2(9 downto 0) + 1;
      b3(14 downto 10) <= b3(14 downto 10) + 1;
      b3(9 downto 0)   <= b3(9 downto 0) + 1;
      b4(20 downto 10) <= b4(20 downto 10) + 1;
      b4(9 downto 0)   <= b4(9 downto 0) + 1;
      b5(18 downto 10) <= b5(18 downto 10) + 1;
      b5(9 downto 0)   <= b5(9 downto 0) + 1;
      b6(20 downto 10) <= b6(20 downto 10) + 1;
      b6(9 downto 0)   <= b6(9 downto 0) + 1;
      b7(19 downto 10) <= b7(19 downto 10) + 1;
      b7(9 downto 0)   <= b7(9 downto 0) + 1;
    end if;
  end process;

  b0_io <= b0;
  b1_io <= b1;
  b2_io <= b2;
  b3_io <= b3;
  b4_io <= b4;
  b5_io <= b5;
  b6_io <= b6;
  b7_io <= b7;
  
end impl;
