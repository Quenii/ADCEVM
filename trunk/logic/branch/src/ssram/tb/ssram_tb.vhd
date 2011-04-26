-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : ssram_tb.vhd
-- Author     :   <Liu Peng@GKHY-LIUPENG>
-- Company    : 
-- Created    : 2011-04-19
-- Last update: 2011-04-26
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2011 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2011-04-19  1.0      Liu Peng        Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity ssram_tb is

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

end ssram_tb;

architecture archi of ssram_tb is

  component ssram_tester
    generic (
      DATA_WIDTH : integer;
      ADDR_WIDTH : integer);
    port (
      clk_i  : in  std_logic;
      rst_i  : in  std_logic;
      we_o   : out std_logic;
      rd_o   : out std_logic;
      addr_o : out std_logic_vector(ADDR_WIDTH - 1 downto 0);
      d_o    : out std_logic_vector(DATA_WIDTH - 1 downto 0);
      q_i    : in  std_logic_vector(DATA_WIDTH - 1 downto 0));
  end component;
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
      ssram_bw_n_o  : out std_logic;
      ssram_oe_n_o  : out std_logic;
      ssram_cke_n_o : out std_logic;
      ssram_zz_o    : out std_logic;
      ssram_mode_o  : out std_logic);
  end component;
  component iobuf
    port (
      i  : in    std_logic;
      o  : out   std_logic;
      oe : in    std_logic;
      io : inout std_logic);
  end component;

  signal we   : std_logic;
  signal rd   : std_logic;
  signal addr : std_logic_vector(ADDR_WIDTH - 1 downto 0);
  signal d    : std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal q    : std_logic_vector(DATA_WIDTH - 1 downto 0);

  signal ssram_d_i   : std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal ssram_d_o   : std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal ssram_d_t_o : std_logic;

  signal rst_cnt : integer range 0 to 1000;
  signal rst     : std_logic := '1';
  
begin  -- archi

  process (clk_i)
  begin  -- process
    if clk_i'event and clk_i = '1' then  -- rising clock edge
      if rst_cnt < 800 then
        rst_cnt <= rst_cnt + 1;
        rst     <= '1';
      else
        rst_cnt <= rst_cnt;
        rst     <= '0';
      end if;
    end if;
  end process;

  ssram_tester_1 : ssram_tester
    generic map (
      DATA_WIDTH => DATA_WIDTH,
      ADDR_WIDTH => ADDR_WIDTH)
    port map (
      clk_i  => clk_i,
      rst_i  => rst,
      we_o   => we,
      rd_o   => rd,
      addr_o => addr,
      d_o    => d,
      q_i    => q);
  ssram_inf_1 : ssram_inf
    generic map (
      DATA_WIDTH => DATA_WIDTH,
      ADDR_WIDTH => ADDR_WIDTH)
    port map (
      clk_i         => clk_i,
      rst_i         => rst,
      we_i          => we,
      rd_i          => rd,
      addr_i        => addr,
      d_i           => d,
      q_o           => q,
      ssram_clk_o   => ssram0_clk_o,
      ssram_ce1_n_o => ssram0_ce1_n_o,
      ssram_ce2_n_o => ssram0_ce2_n_o,
      ssram_ce2_o   => ssram0_ce2_o,
      ssram_addr_o  => ssram0_addr_o,
      ssram_d_i     => ssram_d_i,
      ssram_d_o     => ssram_d_o,
      ssram_d_t_o   => ssram_d_t_o,
      ssram_adv_o   => ssram0_adv_o,
      ssram_we_n_o  => ssram0_we_n_o,
      ssram_bw_n_o  => ssram0_bw_n_o,
      ssram_oe_n_o  => ssram0_oe_n_o,
      ssram_cke_n_o => ssram0_cke_n_o,
      ssram_zz_o    => ssram0_zz_o,
      ssram_mode_o  => ssram0_mode_o);

  for_gen : for i in ssram_d_o'length - 1 downto 0 generate
    ssram0_dq_io(i) <= ssram_d_o(i) when ssram_d_t_o = '1' else 'Z';
    ssram_d_i(i)    <= ssram0_dq_io(i);
  end generate;
  
  
end archi;
