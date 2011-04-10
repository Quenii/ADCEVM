-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : ssr_buffer.vhd
-- Author     :   <Administrator@HEAVEN-DESKTOP>
-- Company    : 
-- Created    : 2011-04-10
-- Last update: 2011-04-10
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2011 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2011-04-10  1.0      Administrator   Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity ssr_buffer is

    port (
        clk_i : in std_logic;
        rst_i : in std_logic;

        tsk_start_i : in  std_logic;
        full_o      : out std_logic;
        empty_o     : out std_logic;

        start_adr_i : in std_logic_vector(18 downto 0);
        end_adr_i   : in std_logic_vector(18 downto 0);

        -- ififo read
        ififo_rdclk_o : out std_logic;
        ififo_rdreq_o : out std_logic;
        ififo_q_i     : in  std_logic_vector(63 downto 0);
        ififo_empty_i : in  std_logic;

        -- ssram i/os
        ssram_adr_o  : out std_logic_vector(18 downto 0);
        ssram_dout_o : out std_logic_vector(63 downto 0);
        ssram_din_i  : out std_logic_vector(63 downto 0);

        ssram_oe_o  : out std_logic;
        ssram_we_o  : out std_logic;
        ssram_ce_o  : out std_logic;
        ssram_clk_o : out std_logic;
        ssram_adv_o : out std_logic
        );
end ssr_buffer;

architecture impl of ssr_buffer is

    signal start_adr : std_logic_vector(18 downto 0);
    signal end_adr   : std_logic_vector(18 downto 0);

    signal rdptr : std_logic_vector(18 downto 0);
    signal wrptr : std_logic_vector(18 downto 0);

    signal full : std_logic;
    signal empty : std_logic;

    type   state_t is (s_rdy, s_pre_read , s_read, s_pre_write, s_write);
    signal state : state_t;

    component fifo64to16
        port (
            aclr    : in  std_logic := '0';
            data    : in  std_logic_vector (63 downto 0);
            wrclk   : in  std_logic;
            wrreq   : in  std_logic;
            q       : out std_logic_vector (15 downto 0);
            rdclk   : in  std_logic;
            rdreq   : in  std_logic;
            rdempty : out std_logic;
            rdusedw : out std_logic_vector (14 downto 0);
            wrfull  : out std_logic;
            wrusedw : out std_logic_vector (12 downto 0));
    end component;

    signal ofifo_aclr    : std_logic := '0';
    signal ofifo_data    : std_logic_vector (63 downto 0);
    signal ofifo_wrclk   : std_logic;
    signal ofifo_wrreq   : std_logic;
    signal ofifo_q       : std_logic_vector (15 downto 0);
    signal ofifo_rdclk   : std_logic;
    signal ofifo_rdreq   : std_logic;
    signal ofifo_rdempty : std_logic;
    signal ofifo_rdusedw : std_logic_vector (14 downto 0);
    signal ofifo_wrfull  : std_logic;
    signal ofifo_wrusedw : std_logic_vector (12 downto 0);
    
begin  -- impl

    process (clk_i, rst_i)
    begin  -- process
        if rst_i = '1' then             -- asynchronous reset (active low)
            state <= s_rdy;
        elsif clk_i'event and clk_i = '1' then  -- rising clock edge
            case state is
                when s_rdy =>
                    if tsk_start_i = '1' then
                        state <= s_pre_write;
                    end if;

                when s_pre_write =>
                    state <= s_write;
                    wrptr <= start_adr;

                when s_write =>
                    if wrptr = end_adr then
                        state <= s_pre_read;
                    end if;

                    if ififo_empty_i = '0' then
                        wrptr <= wrptr + '1';
                    end if;
                when s_pre_read =>
                    state <= s_read;
                    rdptr <= start_adr;
                    
                when s_read =>
                    if rdptr = end_adr then
                        state <= s_rdy;
                    end if;
                    
                    if ofifo_wrreq = '1' then
                        rdptr <= rdptr + '1';
                    end if;
                    wrptr <= start_adr;
                when others => null;
            end case;
        end if;
    end process;


    ofifo_aclr <= tsk_start_i;
    ofifo_data <= ssram_din_i;
    ofifo_wrclk <= clk_i;
    ofifo_wrreq <= (not empty) and (not ofifo_wrfull);

    ofifo_rdclk <= ;
    ofifo_rdreq <= ;
    
    fifo64to16_1: fifo64to16
        port map (
            aclr    => ofifo_aclr,
            data    => ofifo_data,
            wrclk   => ofifo_wrclk,
            wrreq   => ofifo_wrreq,
            q       => ofifo_q,
            rdclk   => ofifo_rdclk,
            rdreq   => ofifo_rdreq,
            rdempty => ofifo_rdempty,
            rdusedw => ofifo_rdusedw,
            wrfull  => ofifo_wrfull,
            wrusedw => ofifo_wrusedw);

    empty_o <= ofifo_rdempty;
    
    process (clk_i, rst_i)
    begin  -- process
        if rst_i = '1' then             -- asynchronous reset (active high)
            start_adr <= (others => '0');
            end_adr   <= (others => '1');
        elsif clk_i'event and clk_i = '1' then  -- rising clock edge
            if tsk_start_i = '1' then
                start_adr <= start_adr_i;
                end_adr   <= end_adr;
            end if;
        end if;
    end process;

    process (clk_i, rst_i)
    begin  -- process
        if rst_i = '1' then             -- asynchronous reset (active low)
            full <= '0';
        elsif clk_i'event and clk_i = '1' then  -- rising clock edge
            if wrptr = end_adr then
                full <= '1';
            end if;

            if rdptr = end_adr then
                empty <= '1';
            end if;
--      if rdptr = end rdy = 0     
        end if;
    end process;

end impl;
