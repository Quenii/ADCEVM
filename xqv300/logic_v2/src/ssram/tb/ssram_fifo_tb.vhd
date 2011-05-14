-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : ssram_fifo_tb.vhd
-- Author     :   <Administrator@HEAVEN>
-- Company    : 
-- Created    : 2011-04-19
-- Last update: 2011-04-27
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: 
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

entity ssram_fifo_tb is

  generic (
    DATA_WIDTH : integer := 36;
    ADDR_WIDTH : integer := 19);
  port(
    clk_i : in std_logic;
--    rst_i : in std_logic;

    -- SSRAM 0
    ssram0_clk_o   : out std_logic;
    ssram0_cke_n_o : out std_logic;
    ssram0_ce1_n_o : out std_logic;
    ssram0_ce2_n_o : out std_logic;
    ssram0_ce2_o   : out std_logic;

    ssram0_oe_n_o : out   std_logic;
    ssram0_we_n_o : out   std_logic;
    ssram0_bw_n_o : out   std_logic;
    ssram0_addr_o : out   std_logic_vector(ADDR_WIDTH - 1 downto 0);
    ssram0_dq_io  : inout std_logic_vector(DATA_WIDTH - 1 downto 0);
    ssram0_adv_o  : out   std_logic;

    ssram0_zz_o   : out std_logic;
    ssram0_mode_o : out std_logic);

end ssram_fifo_tb;

architecture impl of ssram_fifo_tb is

  component ssram_fifo_tester
    generic (
      DATA_WIDTH : integer;
      ADDR_WIDTH : integer);
    port (
      clk_i        : in  std_logic;
      rst_i        : in  std_logic;
      reset_fifo_o : out std_logic;
      count_o      : in  integer range 2**ADDR_WIDTH downto 0;
      empty_o      : in  std_logic;
      full_o       : in  std_logic;
      wr_i         : out std_logic;
      d_i          : out std_logic_vector(DATA_WIDTH - 1 downto 0);
      rd_i         : out std_logic;
      vld_o        : in  std_logic;
      q_o          : in  std_logic_vector(DATA_WIDTH - 1 downto 0));
  end component;

  component ssram_fifo
    generic (
      DATA_WIDTH : integer;
      ADDR_WIDTH : integer);
    port (
      clk_i         : in  std_logic;
      rst_i         : in  std_logic;
      count_o       : out integer range 2**ADDR_WIDTH downto 0;
      empty_o       : out std_logic;
      full_o        : out std_logic;
      wr_i          : in  std_logic;
      d_i           : in  std_logic_vector(DATA_WIDTH - 1 downto 0);
      rd_i          : in  std_logic;
      vld_o         : out std_logic;
      q_o           : out std_logic_vector(DATA_WIDTH - 1 downto 0);
      ssram_clk_o   : out std_logic;
      ssram_ce1_n_o : out std_logic;
      ssram_ce2_n_o : out std_logic;
      ssram_ce2_o   : out std_logic;
      ssram_addr_o  : out std_logic_vector(ADDR_WIDTH - 1 downto 0);
      ssram_d_i     : in  std_logic_vector(DATA_WIDTH - 1 downto 0);
      ssram_d_o     : out std_logic_vector(DATA_WIDTH - 1 downto 0);
      ssram_d_t_o   : out std_logic;
      ssram_oe_n_o  : out std_logic;
      ssram_adv_o   : out std_logic;
      ssram_we_n_o  : out std_logic;
      ssram_bw_n_o : out std_logic;
      ssram_cke_n_o : out std_logic;
      ssram_zz_o    : out std_logic;
      ssram_mode_o  : out std_logic);
  end component;

  component dcm45
    port (
      areset : in  std_logic := '0';
      inclk0 : in  std_logic := '0';
      c0     : out std_logic;
      c1     : out std_logic;
      locked : out std_logic); 
  end component;

  signal count_o : integer range 2**ADDR_WIDTH downto 0;
  signal empty_o : std_logic;
  signal full_o  : std_logic;
  signal wr_i    : std_logic;
  signal d_i     : std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal rd_i    : std_logic;
  signal vld_o   : std_logic;
  signal q_o     : std_logic_vector(DATA_WIDTH - 1 downto 0);

  signal ssram_d_i    : std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal ssram_oe_n_o : std_logic;
  signal ssram_d_o    : std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal ssram_we_n_o : std_logic;
  signal ssram_d_t_o  : std_logic;

  signal reset_fifo_o : std_logic;

  signal rst_i : std_logic := '0';

  signal clk : std_logic;
  signal locked : std_logic;
  
begin  -- impl

  dcm45_1: dcm45
    port map (
      areset => '0',
      inclk0 => clk_i,
      c0     => open,
      c1     => clk,
      locked => locked);

  rst_i <= not locked;
  ssram_fifo_tester_1 : ssram_fifo_tester
    generic map (
      DATA_WIDTH => DATA_WIDTH,
      ADDR_WIDTH => ADDR_WIDTH)
    port map (
      clk_i        => clk,
      rst_i        => rst_i,
      reset_fifo_o => reset_fifo_o,
      count_o      => count_o,
      empty_o      => empty_o,
      full_o       => full_o,
      wr_i         => wr_i,
      d_i          => d_i,
      rd_i         => rd_i,
      vld_o        => vld_o,
      q_o          => q_o);

  ssram_fifo_1 : ssram_fifo
    generic map (
      DATA_WIDTH => DATA_WIDTH,
      ADDR_WIDTH => ADDR_WIDTH)
    port map (
      clk_i         => clk,
      rst_i         => reset_fifo_o,
      count_o       => count_o,
      empty_o       => empty_o,
      full_o        => full_o,
      wr_i          => wr_i,
      d_i           => d_i,
      rd_i          => rd_i,
      vld_o         => vld_o,
      q_o           => q_o,
      ssram_clk_o   => ssram0_clk_o,
      ssram_ce1_n_o => ssram0_ce1_n_o,
      ssram_ce2_n_o => ssram0_ce2_n_o,
      ssram_ce2_o   => ssram0_ce2_o,
      ssram_addr_o  => ssram0_addr_o,
      ssram_d_i     => ssram_d_i,
      ssram_d_o     => ssram_d_o,
      ssram_d_t_o   => ssram_d_t_o,
      ssram_we_n_o  => ssram0_we_n_o,
      ssram_oe_n_o  => ssram0_oe_n_o,
      ssram_adv_o   => ssram0_adv_o,
      ssram_cke_n_o => ssram0_cke_n_o,
      ssram_bw_n_o => ssram0_bw_n_o,
      ssram_zz_o    => ssram0_zz_o,
      ssram_mode_o  => ssram0_mode_o);


  for_gen : for i in ssram_d_o'length - 1 downto 0 generate
    ssram0_dq_io(i) <= ssram_d_o(i) when ssram_d_t_o = '1' else 'Z';
    ssram_d_i(i)    <= ssram0_dq_io(i);

  end generate;

  
end impl;
