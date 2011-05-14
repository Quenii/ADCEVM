-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : ssram_fifo.vhd
-- Author     :   <Administrator@HEAVEN>
-- Company    : 
-- Created    : 2011-04-19
-- Last update: 2011-04-26
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description:
--
-- wr_i has higher priority than rd_i.
-- 
-------------------------------------------------------------------------------
-- Copyright (c) 2011 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2011-04-19  1.0      Administrator   Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity ssram_fifo is

  generic (
    DATA_WIDTH : integer := 32;
    ADDR_WIDTH : integer := 19);
  port (
    clk_i : in std_logic;
    rst_i : in std_logic;

    count_o : out integer range 2**ADDR_WIDTH downto 0;
    empty_o : out std_logic;
    full_o  : out std_logic;

    wr_i : in std_logic;
    d_i  : in std_logic_vector(DATA_WIDTH - 1 downto 0);

    rd_i  : in  std_logic;
    vld_o : out std_logic;
    q_o   : out std_logic_vector(DATA_WIDTH - 1 downto 0);

    ssram_clk_o   : out std_logic;
    ssram_ce1_n_o : out std_logic;
    ssram_ce2_n_o : out std_logic;
    ssram_ce2_o   : out std_logic;
    ssram_addr_o  : out std_logic_vector(ADDR_WIDTH - 1 downto 0);
    ssram_d_i     : in  std_logic_vector(DATA_WIDTH - 1 downto 0);
    ssram_d_t_o   : out std_logic;
    ssram_d_o     : out std_logic_vector(DATA_WIDTH - 1 downto 0);
    ssram_adv_o   : out std_logic;
    ssram_we_n_o  : out std_logic;
    ssram_oe_n_o  : out std_logic;
    ssram_bw_n_o  : out std_logic;
    ssram_cke_n_o : out std_logic;
    ssram_zz_o    : out std_logic;
    ssram_mode_o  : out std_logic);

end ssram_fifo;

architecture archi of ssram_fifo is

  component ssram_inf
    generic (
      DATA_WIDTH : integer;
      ADDR_WIDTH : integer); 
    port (
      clk_i         : in  std_logic;
      rst_i         : in  std_logic;
      we_i          : in  std_logic;
      rd_i          : in  std_logic;
      addr_i        : in  std_logic_vector(ADDR_WIDTH - 1 downto 0);
      d_i           : in  std_logic_vector(DATA_WIDTH - 1 downto 0);
      q_o           : out std_logic_vector(DATA_WIDTH - 1 downto 0);
      ssram_clk_o   : out std_logic;
      ssram_ce1_n_o : out std_logic;
      ssram_ce2_n_o : out std_logic;
      ssram_ce2_o   : out std_logic;
      ssram_addr_o  : out std_logic_vector(ADDR_WIDTH - 1 downto 0);
      ssram_d_i     : in  std_logic_vector(DATA_WIDTH - 1 downto 0);
      ssram_d_o     : out std_logic_vector(DATA_WIDTH - 1 downto 0);
      ssram_d_t_o   : out std_logic;
      ssram_adv_o   : out std_logic;
      ssram_we_n_o  : out std_logic;
      ssram_oe_n_o  : out std_logic;
      ssram_bw_n_o  : out std_logic;
      ssram_cke_n_o : out std_logic;
      ssram_zz_o    : out std_logic;
      ssram_mode_o  : out std_logic); 
  end component;
  component dff_en_r_pline
    generic (
      Pipeline : integer);
    port (
      CK     : in  std_logic;
      Clear  : in  std_logic := '0';
      Data   : in  std_logic;
      Enable : in  std_logic := '1';
      Q      : out std_logic);
  end component;

  signal ram_we_i   : std_logic;
  signal ram_rd_i   : std_logic;
  signal ram_addr_i : std_logic_vector(ADDR_WIDTH - 1 downto 0);
  signal ram_d_i    : std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal ram_q_o    : std_logic_vector(DATA_WIDTH - 1 downto 0);

  constant DEPTH : integer := 2**ADDR_WIDTH;

  signal full, empty    : std_logic;
  signal wr_en, rd_en   : std_logic;
  signal wr_ptr, rd_ptr : integer range DEPTH - 1 downto 0;
  signal cnt            : integer range DEPTH downto 0;

  signal vld : std_logic;
  signal q   : std_logic_vector(DATA_WIDTH - 1 downto 0);
  
begin  -- archi

  count_o <= cnt;
  full_o  <= full;
  empty_o <= empty;
  vld_o   <= vld;
  q_o     <= q;
  -----------------------------------------------------------------------------

  full  <= '1' when cnt = 2**ADDR_WIDTH else '0';
  empty <= '1' when cnt = 0             else '0';

  wr_en <= wr_i and not full;
  rd_en <= rd_i and (not empty) and (not wr_en);

  rd_en_ffd : dff_en_r_pline
    generic map (
      Pipeline => 1)  
    port map (
      CK     => clk_i,
      Clear  => rst_i,
      Data   => rd_en,
      Enable => '1',
      Q      => vld);

  process (clk_i, rst_i)
  begin
    if rst_i = '1' then
      wr_ptr <= 0;
      rd_ptr <= 0;
      cnt    <= 0;
    elsif rising_edge(clk_i) then
      if wr_en = '1' then
        if wr_ptr = DEPTH - 1 then
          wr_ptr <= 0;
        else
          wr_ptr <= wr_ptr + 1;
        end if;
      end if;
      if rd_en = '1' then
        if rd_ptr = DEPTH - 1 then
          rd_ptr <= 0;
        else
          rd_ptr <= rd_ptr + 1;
        end if;
      end if;
      if wr_en = '1' and rd_en = '0' then
        cnt <= cnt + 1;
      elsif wr_en = '0' and rd_en = '1' then
        cnt <= cnt - 1;
      end if;
    end if;
  end process;

  ram_we_i   <= wr_en;
  ram_rd_i   <= rd_en;
  ram_addr_i <= conv_std_logic_vector(wr_ptr, ADDR_WIDTH) when wr_en = '1' else
                conv_std_logic_vector(rd_ptr, ADDR_WIDTH);
  ram_d_i <= d_i;
  q       <= ram_q_o;

  ram : ssram_inf
    generic map (
      DATA_WIDTH => DATA_WIDTH,
      ADDR_WIDTH => ADDR_WIDTH)
    port map (
      clk_i         => clk_i,
      rst_i         => rst_i,
      we_i          => ram_we_i,
      rd_i          => ram_rd_i,
      addr_i        => ram_addr_i,
      d_i           => ram_d_i,
      q_o           => ram_q_o,
      ssram_clk_o   => ssram_clk_o,
      ssram_ce1_n_o => ssram_ce1_n_o,
      ssram_ce2_n_o => ssram_ce2_n_o,
      ssram_ce2_o   => ssram_ce2_o,
      ssram_addr_o  => ssram_addr_o,
      ssram_d_i     => ssram_d_i,
      ssram_d_t_o   => ssram_d_t_o,
      ssram_d_o     => ssram_d_o,
      ssram_adv_o   => ssram_adv_o,
      ssram_we_n_o  => ssram_we_n_o,
      ssram_oe_n_o  => ssram_oe_n_o,
      ssram_cke_n_o => ssram_cke_n_o,
      ssram_bw_n_o  => ssram_bw_n_o,
      ssram_zz_o    => ssram_zz_o,
      ssram_mode_o  => ssram_mode_o);



end archi;
