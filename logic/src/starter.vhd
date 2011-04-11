-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : starter.vhd
-- Author     :   <Administrator@HEAVEN>
-- Company    : 
-- Created    : 2011-04-11
-- Last update: 2011-04-11
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2011 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2011-04-11  1.0      Administrator   Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity starter is

    port (
        LB_Clk_i : in std_logic;
        rst_i    : in std_logic;

        ctrl_la_start    : in std_logic_vector(15 downto 0);
        updated_la_start : in std_logic;
        ctrl_ha_start    : in std_logic_vector(15 downto 0);
        updated_ha_start : in std_logic;
        ctrl_la_end      : in std_logic_vector(15 downto 0);
        updated_la_end   : in std_logic;
        ctrl_ha_end      : in std_logic_vector(15 downto 0);
        updated_ha_end   : in std_logic;

        clk_i       : in  std_logic;
        start_adr_o : out std_logic_vector(18 downto 0);
        end_adr_o   : out std_logic_vector(18 downto 0);
        tsk_start_o : out std_logic
        );
end starter;

architecture impl of starter is

    component async_fifo_deep2
        generic (
            DATA_WIDTH : integer := 16);
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
    end component;

    signal las_wput_i : std_logic;
    signal las_rget_i : std_logic;
    signal las_wrdy_o : std_logic;
    signal las_rrdy_o : std_logic;

    signal has_wput_i : std_logic;
    signal has_rget_i : std_logic;
    signal has_wrdy_o : std_logic;
    signal has_rrdy_o : std_logic;

    signal lae_wput_i : std_logic;
    signal lae_rget_i : std_logic;
    signal lae_wrdy_o : std_logic;
    signal lae_rrdy_o : std_logic;

    signal hae_wput_i : std_logic;
    signal hae_rget_i : std_logic;
    signal hae_wrdy_o : std_logic;
    signal hae_rrdy_o : std_logic;

    signal tsk_start : std_logic;
begin  -- impl

    las_wput_i <= '1' when las_wrdy_o = '1' and updated_la_start = '1'
                  else '0';
    has_wput_i <= '1' when has_wrdy_o = '1' and updated_ha_start = '1'
                  else '0';
    lae_wput_i <= '1' when lae_wrdy_o = '1' and updated_la_end = '1'
                  else '0';
    hae_wput_i <= '1' when hae_wrdy_o = '1' and updated_ha_end = '1'
                  else '0';
    
    async_fifo_deep2_las : async_fifo_deep2
        generic map (
            DATA_WIDTH => 16)
        port map (
            wclk_i => LB_Clk_i,
            rclk_i => clk_i,
            arst_i => rst_i,
            wput_i => las_wput_i,
            rget_i => las_rget_i,
            data_i => ctrl_la_start,
            wrdy_o => las_wrdy_o,
            rrdy_o => las_rrdy_o,
            data_o => start_adr_o(15 downto 0));

    async_fifo_deep2_lae : async_fifo_deep2
        generic map (
            DATA_WIDTH => 16)
        port map (
            wclk_i => LB_Clk_i,
            rclk_i => clk_i,
            arst_i => rst_i,
            wput_i => lae_wput_i,
            rget_i => lae_rget_i,
            data_i => ctrl_la_end,
            wrdy_o => lae_wrdy_o,
            rrdy_o => lae_rrdy_o,
            data_o => end_adr_o(15 downto 0));

    async_fifo_deep2_has : async_fifo_deep2
        generic map (
            DATA_WIDTH => 3)
        port map (
            wclk_i => LB_Clk_i,
            rclk_i => clk_i,
            arst_i => rst_i,
            wput_i => has_wput_i,
            rget_i => has_rget_i,
            data_i => ctrl_ha_start(2 downto 0),
            wrdy_o => has_wrdy_o,
            rrdy_o => has_rrdy_o,
            data_o => start_adr_o(18 downto 16));

    async_fifo_deep2_hae : async_fifo_deep2
        generic map (
            DATA_WIDTH => 3)
        port map (
            wclk_i => LB_Clk_i,
            rclk_i => clk_i,
            arst_i => rst_i,
            wput_i => hae_wput_i,
            rget_i => hae_rget_i,
            data_i => ctrl_ha_end(2 downto 0),
            wrdy_o => hae_wrdy_o,
            rrdy_o => hae_rrdy_o,
            data_o => end_adr_o(18 downto 16));

    tsk_start <= '1' when las_rrdy_o = '1' and has_rrdy_o = '1' and lae_rrdy_o = '1' and hae_rrdy_o = '1'
                 else '0';

    lae_rget_i  <= tsk_start;
    hae_rget_i  <= tsk_start;
    las_rget_i  <= tsk_start;
    has_rget_i  <= tsk_start;
    tsk_start_o <= tsk_start;
end impl;
