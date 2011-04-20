-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : demux.vhd
-- Author     :   <Administrator@HEAVEN>
-- Company    : 
-- Created    : 2011-04-10
-- Last update: 2011-04-20
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

entity demux is
    
    generic (
        IO_TYPE : string := "LVDS");

    port (
        rst_i    : in std_logic;
        clk_i    : in std_logic;
        enable_i : in std_logic;
        data_i   : in std_logic_vector(15 downto 0);

        rd_clk_i   : in  std_logic;
        rd_req_i   : in  std_logic;
        rd_q_o     : out std_logic_vector(63 downto 0);
        rd_empty_o : out std_logic);

end demux;

architecture impl of demux is

--    GEN_LVDS : if IO_TYPE = "LVDS" generate
    component lvds_i
        port (
            pll_areset  : in  std_logic;
            rx_in       : in  std_logic_vector (15 downto 0);
            rx_inclock  : in  std_logic := '0';
            rx_out      : out std_logic_vector (63 downto 0);
            rx_outclock : out std_logic;
            rx_locked   : out std_logic);
    end component;

    signal pll_areset      : std_logic;
    signal rx_in           : std_logic_vector (15 downto 0);
    signal rx_inclock      : std_logic := '0';
    signal rx_out          : std_logic_vector (63 downto 0);
    signal rx_out_disorder : std_logic_vector (63 downto 0);
    signal rx_outclock     : std_logic;
    signal rx_locked       : std_logic;

    component fifo64to64
        port (
            aclr    : in  std_logic;
            data    : in  std_logic_vector (63 downto 0);
            rdclk   : in  std_logic;
            rdreq   : in  std_logic;
            wrclk   : in  std_logic;
            wrreq   : in  std_logic;
            q       : out std_logic_vector (63 downto 0);
            rdempty : out std_logic;
            rdfull  : out std_logic;
            rdusedw : out std_logic_vector (7 downto 0);
            wrempty : out std_logic;
            wrfull  : out std_logic;
            wrusedw : out std_logic_vector (7 downto 0));
    end component;

    signal fifo64to64_data    : std_logic_vector (63 downto 0);
    signal fifo64to64_rdclk   : std_logic;
    signal fifo64to64_rdreq   : std_logic;
    signal fifo64to64_wrclk   : std_logic;
    signal fifo64to64_wrreq   : std_logic;
    signal fifo64to64_q       : std_logic_vector (63 downto 0);
    signal fifo64to64_rdempty : std_logic;
    signal fifo64to64_rdfull  : std_logic;
    signal fifo64to64_rdusedw : std_logic_vector (7 downto 0);
    signal fifo64to64_wrempty : std_logic;
    signal fifo64to64_wrfull  : std_logic;
    signal fifo64to64_wrusedw : std_logic_vector (7 downto 0);
--    end generate GEN_LVDS;

    component fifo16to64
        port (
            aclr    : in  std_logic;
            data    : in  std_logic_vector (15 downto 0);
            rdclk   : in  std_logic;
            rdreq   : in  std_logic;
            wrclk   : in  std_logic;
            wrreq   : in  std_logic;
            q       : out std_logic_vector (63 downto 0);
            rdempty : out std_logic;
            rdfull  : out std_logic;
            rdusedw : out std_logic_vector (5 downto 0);
            wrempty : out std_logic;
            wrfull  : out std_logic;
            wrusedw : out std_logic_vector (7 downto 0));
    end component;

    signal fifo16to64_data    : std_logic_vector (15 downto 0);
    signal fifo16to64_rdclk   : std_logic;
    signal fifo16to64_rdreq   : std_logic;
    signal fifo16to64_wrclk   : std_logic;
    signal fifo16to64_wrreq   : std_logic;
    signal fifo16to64_q       : std_logic_vector (63 downto 0);
    signal fifo16to64_rdempty : std_logic;
    signal fifo16to64_rdfull  : std_logic;
    signal fifo16to64_rdusedw : std_logic_vector (5 downto 0);
    signal fifo16to64_wrempty : std_logic;
    signal fifo16to64_wrfull  : std_logic;
    signal fifo16to64_wrusedw : std_logic_vector (7 downto 0);
    
begin  -- impl

    GEN_LVDS_IMPL : if IO_TYPE = "LVDS" generate
        pll_areset <= rst_i;
        rx_in      <= data_i;
        rx_inclock <= clk_i;

        lvds_i_1 : lvds_i
            port map (
                pll_areset  => pll_areset,
                rx_in       => rx_in,
                rx_inclock  => rx_inclock,
                rx_out      => rx_out_disorder,
                rx_outclock => rx_outclock,
                rx_locked   => rx_locked);

        order_data_bus_i : for i in 0 to 3 generate
            order_data_bus_j : for j in 1 to 16 generate
                rx_out(16 * (3-i) + j - 1) <= rx_out_disorder((j - 1) * 4 + i);
            end generate order_data_bus_j;
        end generate order_data_bus_i;

        fifo64to64_data  <= rx_out;
        fifo64to64_wrclk <= rx_outclock;
        fifo64to64_wrreq <= rx_locked and enable_i and (not fifo64to64_wrfull);
        fifo64to64_rdreq <= rd_req_i;
        fifo64to64_rdclk <= rd_clk_i;

        fifo64to64_1 : fifo64to64
            port map (
                aclr    => rst_i,
                data    => fifo64to64_data,
                wrclk   => fifo64to64_wrclk,
                wrreq   => fifo64to64_wrreq,
                wrempty => fifo64to64_wrempty,
                wrfull  => fifo64to64_wrfull,
                wrusedw => fifo64to64_wrusedw,
                q       => fifo64to64_q,
                rdclk   => fifo64to64_rdclk,
                rdreq   => fifo64to64_rdreq,
                rdempty => fifo64to64_rdempty,
                rdfull  => fifo64to64_rdfull,
                rdusedw => fifo64to64_rdusedw);

        rd_q_o     <= fifo64to64_q;
--        rd_empty_o <= fifo64to64_rdempty;
        process (rd_clk_i, rst_i)
        begin  -- process
            if rst_i = '1' then         -- asynchronous reset (active low)
                rd_empty_o <= '1';
            elsif rd_clk_i'event and rd_clk_i = '1' then  -- rising clock edge
                if fifo64to64_rdempty = '1' or fifo64to64_rdusedw < x"08" then
                    rd_empty_o <= '1';
                else
                    rd_empty_o <= '0';
                end if;
            end if;
        end process;
        
    end generate GEN_LVDS_IMPL;

    GEN_CMOS_IMPL : if IO_TYPE = "CMOS" generate

        process (clk_i, rst_i)
        begin  -- process
            if rst_i = '1' then         -- asynchronous reset (active high)
                fifo16to64_data <= (others => '0');
            elsif clk_i'event and clk_i = '1' then  -- rising clock edge
                fifo16to64_data <= data_i;
            end if;
        end process;

        fifo16to64_wrclk <= clk_i;
        fifo16to64_wrreq <= enable_i;
        fifo16to64_rdreq <= rd_req_i;
        fifo16to64_rdclk <= rd_clk_i;

        fifo16to64_1 : fifo16to64
            port map (
                aclr    => rst_i,
                data    => fifo16to64_data,
                wrclk   => fifo16to64_wrclk,
                wrreq   => fifo16to64_wrreq,
                q       => fifo16to64_q,
                rdclk   => fifo16to64_rdclk,
                rdreq   => fifo16to64_rdreq,
                rdempty => fifo16to64_rdempty,
                rdfull  => fifo16to64_rdfull,
                rdusedw => fifo16to64_rdusedw,
                wrempty => fifo16to64_wrempty,
                wrfull  => fifo16to64_wrfull,
                wrusedw => fifo16to64_wrusedw);

        rd_q_o     <= fifo16to64_q;
--        rd_empty_o <= fifo16to64_rdempty;
        process (rd_clk_i, rst_i)
        begin  -- process
            if rst_i = '1' then         -- asynchronous reset (active low)
                rd_empty_o <= '1';
            elsif rd_clk_i'event and rd_clk_i = '1' then  -- rising clock edge
                if fifo16to64_rdempty = '1' or fifo16to64_rdusedw < "000111" then
                    rd_empty_o <= '1';
                else
                    rd_empty_o <= '0';
                end if;
            end if;
        end process;

    end generate GEN_CMOS_IMPL;
    
end impl;
