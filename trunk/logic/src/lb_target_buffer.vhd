-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : lb_target_buffer.vhd
-- Author     :   <Administrator@HEAVEN>
-- Company    : 
-- Created    : 2011-04-11
-- Last update: 2011-04-15
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

-------------------------------------------------------------------------------
-- +------+    +------------+
-- |Demux | => | ssr_buffer |
-- +------+    +------------+
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;    

entity lb_target_buffer is
    generic (
        ADDR_BASE : std_logic_vector(15 downto 0) := x"3000";
        LENGTH     : std_logic_vector(15 downto 0);
        IO_TYPE : string := "LVDS"
        );
    port (
        LB_Clk_i   : in  std_logic;     --usb clk, 48M/24M
        LB_Reset_i : in  std_logic;
        LB_Addr_i  : in  std_logic_vector(15 downto 0);
        LB_Write_i : in  std_logic;
        LB_Read_i  : in  std_logic;
        LB_Ready_o : out std_logic;
        LB_DataW_i : in  std_logic_vector(15 downto 0);
        LB_DataR_o : out std_logic_vector(15 downto 0);

        clk_i : in std_logic;           -- sysclk, 125MHz

        rx_i     : in std_logic_vector(15 downto 0);
        rx_clk_i : in std_logic;        -- ADC Sampling clock

        ssram_adr_o  : out std_logic_vector(18 downto 0);
        ssram_dout_o : out std_logic_vector(63 downto 0);
        ssram_din_i  : in std_logic_vector(63 downto 0);
        ssram_oe_o   : out std_logic;
        ssram_we_o   : out std_logic;
        ssram_ce_o   : out std_logic;
        ssram_clk_o  : out std_logic;
        ssram_adv_o  : out std_logic

        );
end lb_target_buffer;

architecture impl of lb_target_buffer is

--    constant ADDR_LA_START : std_logic_vector(15 downto 0) := ADDR_BASE + x"0000";
--    constant ADDR_HA_START : std_logic_vector(15 downto 0) := ADDR_BASE + x"0001";
--    constant ADDR_LA_END   : std_logic_vector(15 downto 0) := ADDR_BASE + x"0002";
--    constant ADDR_HA_END   : std_logic_vector(15 downto 0) := ADDR_BASE + x"0003";

    constant ADDR_LA_START : std_logic_vector(15 downto 0) := x"3000";
    constant ADDR_HA_START : std_logic_vector(15 downto 0) := x"3001";
    constant ADDR_LA_END   : std_logic_vector(15 downto 0) := x"3002";
    constant ADDR_HA_END   : std_logic_vector(15 downto 0) := x"3003";

    signal rst_i : std_logic;
    
    component demux
        generic (
            IO_TYPE : string);
        port (
            rst_i      : in  std_logic;
            clk_i      : in  std_logic;
            enable_i   : in  std_logic;
            data_i     : in  std_logic_vector(15 downto 0);
            rd_clk_i   : in  std_logic;
            rd_req_i   : in  std_logic;
            rd_q_o     : out std_logic_vector(63 downto 0);
            rd_empty_o : out std_logic);
    end component;

    signal dm_rst_i      : std_logic;
    signal dm_clk_i      : std_logic;
    signal dm_enable_i   : std_logic;
    signal dm_data_i     : std_logic_vector(15 downto 0);
    signal dm_rd_clk_i   : std_logic;
    signal dm_rd_req_i   : std_logic;
    signal dm_rd_q_o     : std_logic_vector(63 downto 0);
    signal dm_rd_empty_o : std_logic;

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

    -- start_adr lsb
    signal LB_Ready_la_start : std_logic;
    signal LB_DataR_la_start : std_logic_vector(15 downto 0);
    signal updated_la_start  : std_logic;
    signal ctrl_la_start     : std_logic_vector(15 downto 0);
    signal sta_la_start      : std_logic_vector(15 downto 0);
    -- start_adr msb
    signal LB_Ready_ha_start : std_logic;
    signal LB_DataR_ha_start : std_logic_vector(15 downto 0);
    signal updated_ha_start  : std_logic;
    signal ctrl_ha_start     : std_logic_vector(15 downto 0);
    signal sta_ha_start      : std_logic_vector(15 downto 0);
    -- end_adr lsb
    signal LB_Ready_la_end   : std_logic;
    signal LB_DataR_la_end   : std_logic_vector(15 downto 0);
    signal updated_la_end    : std_logic;
    signal ctrl_la_end       : std_logic_vector(15 downto 0);
    signal sta_la_end        : std_logic_vector(15 downto 0);
    -- end_adr msb
    signal LB_Ready_ha_end   : std_logic;
    signal LB_DataR_ha_end   : std_logic_vector(15 downto 0);
    signal updated_ha_end    : std_logic;
    signal ctrl_ha_end       : std_logic_vector(15 downto 0);
    signal sta_ha_end        : std_logic_vector(15 downto 0);

    component ssr_buffer
        port (
            clk_i         : in  std_logic;
            rst_i         : in  std_logic;
            tsk_start_i   : in  std_logic;
            full_o        : out std_logic;
            empty_o       : out std_logic;
            start_adr_i   : in  std_logic_vector(18 downto 0);
            end_adr_i     : in  std_logic_vector(18 downto 0);
            ififo_rdclk_o : out std_logic;
            ififo_rdreq_o : out std_logic;
            ififo_q_i     : in  std_logic_vector(63 downto 0);
            ififo_empty_i : in  std_logic;
            ofifo_rdclk_i : in  std_logic;
            ofifo_rdreq_i : in  std_logic;
            ofifo_q_o     : out std_logic_vector(15 downto 0);
            ofifo_empty_o : out std_logic;
            ssram_adr_o   : out std_logic_vector(18 downto 0);
            ssram_dout_o  : out std_logic_vector(63 downto 0);
            ssram_din_i   : in std_logic_vector(63 downto 0);
            ssram_oe_o    : out std_logic;
            ssram_we_o    : out std_logic;
            ssram_ce_o    : out std_logic;
            ssram_clk_o   : out std_logic;
            ssram_adv_o   : out std_logic);
    end component;

    signal sb_clk_i   : std_logic;
    signal sb_rst_i   : std_logic;
    signal sb_full_o  : std_logic;
    signal sb_empty_o : std_logic;

    signal sb_tsk_start_i : std_logic;
    signal sb_start_adr_i : std_logic_vector(18 downto 0);
    signal sb_end_adr_i   : std_logic_vector(18 downto 0);

    signal sb_ififo_rdclk_o : std_logic;
    signal sb_ififo_rdreq_o : std_logic;
    signal sb_ififo_q_i     : std_logic_vector(63 downto 0);
    signal sb_ififo_empty_i : std_logic;
    signal sb_ofifo_rdclk_i : std_logic;
    signal sb_ofifo_rdreq_i : std_logic;
    signal sb_ofifo_q_o     : std_logic_vector(15 downto 0);
    signal sb_ofifo_empty_o : std_logic;

    component starter
        port (
            LB_Clk_i         : in  std_logic;
            rst_i            : in  std_logic;
            ctrl_la_start    : in  std_logic_vector(15 downto 0);
            updated_la_start : in  std_logic;
            ctrl_ha_start    : in  std_logic_vector(15 downto 0);
            updated_ha_start : in  std_logic;
            ctrl_la_end      : in  std_logic_vector(15 downto 0);
            updated_la_end   : in  std_logic;
            ctrl_ha_end      : in  std_logic_vector(15 downto 0);
            updated_ha_end   : in  std_logic;
            clk_i            : in  std_logic;
            start_adr_o      : out std_logic_vector(18 downto 0);
            end_adr_o        : out std_logic_vector(18 downto 0);
            tsk_start_o      : out std_logic);
    end component;

    signal start_adr_o : std_logic_vector(18 downto 0);
    signal end_adr_o   : std_logic_vector(18 downto 0);
    signal tsk_start_o : std_logic;
    
begin  -- impl

    rst_i <= LB_Reset_i;
    
    sb_clk_i       <= clk_i;
    sb_rst_i       <= rst_i;
    sb_tsk_start_i <= tsk_start_o;
    sb_start_adr_i <= start_adr_o;
    sb_end_adr_i   <= end_adr_o;

    ssr_buffer_1 : ssr_buffer
        port map (
            clk_i         => sb_clk_i,
            rst_i         => sb_rst_i,
            tsk_start_i   => sb_tsk_start_i,
            full_o        => sb_full_o,
            empty_o       => sb_empty_o,
            start_adr_i   => sb_start_adr_i,
            end_adr_i     => sb_end_adr_i,
            ififo_rdclk_o => sb_ififo_rdclk_o,
            ififo_rdreq_o => sb_ififo_rdreq_o,
            ififo_q_i     => sb_ififo_q_i,
            ififo_empty_i => sb_ififo_empty_i,
            ofifo_rdclk_i => sb_ofifo_rdclk_i,
            ofifo_rdreq_i => sb_ofifo_rdreq_i,
            ofifo_q_o     => sb_ofifo_q_o,
            ofifo_empty_o => sb_ofifo_empty_o,
            ssram_adr_o   => ssram_adr_o,
            ssram_dout_o  => ssram_dout_o,
            ssram_din_i   => ssram_din_i,
            ssram_oe_o    => ssram_oe_o,
            ssram_we_o    => ssram_we_o,
            ssram_ce_o    => ssram_ce_o,
            ssram_clk_o   => ssram_clk_o,
            ssram_adv_o   => ssram_adv_o);

    dm_rst_i    <= rst_i;
    dm_clk_i    <= rx_clk_i;
    dm_data_i   <= rx_i;
    dm_rd_clk_i <= clk_i;
    dm_rd_req_i <= sb_ififo_rdreq_o;

    sb_ififo_empty_i <= dm_rd_empty_o;
    sb_ififo_q_i     <= dm_rd_q_o;

    process (clk_i, rst_i)
    begin  -- process
        if rst_i = '0' then             -- asynchronous reset (active low)
            dm_enable_i <= '0';
        elsif clk_i'event and clk_i = '1' then  -- rising clock edge
            if tsk_start_o = '1' then
                dm_enable_i <= '1';
            elsif sb_full_o = '1' then
                dm_enable_i <= '0';
            else
                dm_enable_i <= dm_enable_i;
            end if;
        end if;
    end process;
    
    demux_1 : demux
        generic map (
            IO_TYPE => IO_TYPE)
        port map (
            rst_i      => dm_rst_i,
            clk_i      => dm_clk_i,
            enable_i   => dm_enable_i,
            data_i     => dm_data_i,
            rd_clk_i   => dm_rd_clk_i,
            rd_req_i   => dm_rd_req_i,
            rd_q_o     => dm_rd_q_o,
            rd_empty_o => dm_rd_empty_o);

    starter_1 : starter
        port map (
            LB_Clk_i         => LB_Clk_i,
            rst_i            => rst_i,
            ctrl_la_start    => ctrl_la_start,
            updated_la_start => updated_la_start,
            ctrl_ha_start    => ctrl_ha_start,
            updated_ha_start => updated_ha_start,
            ctrl_la_end      => ctrl_la_end,
            updated_la_end   => updated_la_end,
            ctrl_ha_end      => ctrl_ha_end,
            updated_ha_end   => updated_ha_end,
            clk_i            => clk_i,
            start_adr_o      => start_adr_o,
            end_adr_o        => end_adr_o,
            tsk_start_o      => tsk_start_o);

    lb_target_reg_la_start : lb_target_reg
        generic map (
            ADDR => ADDR_LA_START)
        port map (
            LB_Clk_i   => LB_Clk_i,
            LB_Reset_i => LB_Reset_i,
            LB_Addr_i  => LB_Addr_i,
            LB_Write_i => LB_Write_i,
            LB_Read_i  => LB_Read_i,
            LB_Ready_o => LB_Ready_la_start,
            LB_DataW_i => LB_DataW_i,
            LB_DataR_o => LB_DataR_la_start,
            updated_o  => updated_la_start,
            ctrl_o     => ctrl_la_start,
            sta_i      => sta_la_start);

    lb_target_reg_ha_start : lb_target_reg
        generic map (
            ADDR => ADDR_HA_START)
        port map (
            LB_Clk_i   => LB_Clk_i,
            LB_Reset_i => LB_Reset_i,
            LB_Addr_i  => LB_Addr_i,
            LB_Write_i => LB_Write_i,
            LB_Read_i  => LB_Read_i,
            LB_Ready_o => LB_Ready_ha_start,
            LB_DataW_i => LB_DataW_i,
            LB_DataR_o => LB_DataR_ha_start,
            updated_o  => updated_ha_start,
            ctrl_o     => ctrl_ha_start,
            sta_i      => sta_ha_start);

    lb_target_reg_la_end : lb_target_reg
        generic map (
            ADDR => ADDR_LA_END)
        port map (
            LB_Clk_i   => LB_Clk_i,
            LB_Reset_i => LB_Reset_i,
            LB_Addr_i  => LB_Addr_i,
            LB_Write_i => LB_Write_i,
            LB_Read_i  => LB_Read_i,
            LB_Ready_o => LB_Ready_la_end,
            LB_DataW_i => LB_DataW_i,
            LB_DataR_o => LB_DataR_la_end,
            updated_o  => updated_la_end,
            ctrl_o     => ctrl_la_end,
            sta_i      => sta_la_end);

    lb_target_reg_ha_end : lb_target_reg
        generic map (
            ADDR => ADDR_HA_END)
        port map (
            LB_Clk_i   => LB_Clk_i,
            LB_Reset_i => LB_Reset_i,
            LB_Addr_i  => LB_Addr_i,
            LB_Write_i => LB_Write_i,
            LB_Read_i  => LB_Read_i,
            LB_Ready_o => LB_Ready_ha_end,
            LB_DataW_i => LB_DataW_i,
            LB_DataR_o => LB_DataR_ha_end,
            updated_o  => updated_ha_end,
            ctrl_o     => ctrl_ha_end,
            sta_i      => sta_ha_end);

    LB_Ready_o <= LB_Ready_la_end or LB_Ready_ha_end or LB_Ready_la_start or LB_Ready_ha_start;
    LB_DataR_o <= LB_DataR_la_end or LB_DataR_ha_end or LB_DataR_la_start or LB_DataR_ha_start;

end impl;
