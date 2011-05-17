-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : lb_target_sensor.vhd
-- Author     :   <Administrator@HEAVEN>
-- Company    : 
-- Created    : 2011-05-17
-- Last update: 2011-05-17
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2011 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2011-05-17  1.0      Administrator   Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity lb_target_sensor is
  
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

    sensor_i : in std_logic

    );
end lb_target_sensor;

architecture impl of lb_target_sensor is

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

  signal LB_Ready_t1 : std_logic;
  signal LB_DataR_t1 : std_logic_vector(15 downto 0);
  signal updated_t1  : std_logic;
  signal ctrl_t1     : std_logic_vector(15 downto 0);
  signal sta_t1      : std_logic_vector(15 downto 0);

  signal LB_Ready_t2 : std_logic;
  signal LB_DataR_t2 : std_logic_vector(15 downto 0);
  signal updated_t2  : std_logic;
  signal ctrl_t2     : std_logic_vector(15 downto 0);
  signal sta_t2      : std_logic_vector(15 downto 0);

  signal t1, t2   : std_logic_vector(15 downto 0);
  signal div      : std_logic_vector(15 downto 0);
  signal lclk     : std_logic;
  signal sensor_r : std_logic;
  signal sensor_v : std_logic_vector(1 downto 0);
  
begin  -- impl

  LB_DataR_o <= LB_DataR_t1 or LB_DataR_t2;
  LB_Ready_o <= LB_Ready_t1 or LB_Ready_t2;

  T1_REG : lb_target_reg
    generic map (
      ADDR => ADDR)
    port map (
      LB_Clk_i   => LB_Clk_i,
      LB_Reset_i => LB_Reset_i,
      LB_Addr_i  => LB_Addr_i,
      LB_Write_i => LB_Write_i,
      LB_Read_i  => LB_Read_i,
      LB_Ready_o => LB_Ready_t1,
      LB_DataW_i => LB_DataW_i,
      LB_DataR_o => LB_DataR_t1,
      updated_o  => updated_t1,
      ctrl_o     => ctrl_t1,
      sta_i      => sta_t1);

  T2_REG : lb_target_reg
    generic map (
      ADDR => ADDR + 1)
    port map (
      LB_Clk_i   => LB_Clk_i,
      LB_Reset_i => LB_Reset_i,
      LB_Addr_i  => LB_Addr_i,
      LB_Write_i => LB_Write_i,
      LB_Read_i  => LB_Read_i,
      LB_Ready_o => LB_Ready_t2,
      LB_DataW_i => LB_DataW_i,
      LB_DataR_o => LB_DataR_t2,
      updated_o  => updated_t2,
      ctrl_o     => ctrl_t2,
      sta_i      => sta_t2);

  process (LB_Clk_i)
  begin  -- process
    if rising_edge(LB_Clk_i) then
      div <= div + 1;
    end if;
  end process;

  lclk <= div(7);

  sensor_v <= sensor_r & sensor_i;

  process (lclk, LB_Reset_i)
  begin  -- process
    if LB_Reset_i = '1' then              -- asynchronous reset (active low)
      t1     <= (others => '0');
      t2     <= (others => '0');
      sta_t1 <= (others => '0');
      sta_t2 <= (others => '0');
    elsif lclk'event and lclk = '1' then  -- rising clock edge
      sensor_r <= sensor_i;
      case sensor_v is
        -- rising edge
        when "01" =>
          t1     <= (others => '0');
          t2     <= t2;
          sta_t1 <= sta_t1;
          sta_t2 <= t2;
          -- falling edge
        when "10" =>
          t1     <= t1;
          t2     <= (others => '0');
          sta_t1 <= t1;
          sta_t2 <= sta_t2;
        when "11" =>
          t1     <= t1 + 1;
          t2     <= t2;
          sta_t1 <= sta_t1;
          sta_t2 <= sta_t2;
        when "00" =>
          t1     <= t1;
          t2     <= t2 + 1;
          sta_t1 <= sta_t1;
          sta_t2 <= sta_t2;
        when others => null;
      end case;
    end if;
  end process;

end impl;
