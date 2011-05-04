-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : ram_manager.vhd
-- Author     :   <Administrator@HEAVEN>
-- Company    : 
-- Created    : 2011-05-02
-- Last update: 2011-05-03
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2011 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2011-05-02  1.0      Administrator   Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ram_manager is
  generic (
    DATA_WIDTH : integer;
    ADDR_WIDTH : integer);
  port (
    sys_clk_i : in std_logic;
    rst_i     : in std_logic;

    LB_Clk_i   : in std_logic;
    wr_start_i : in std_logic;
    rd_start_i : in std_logic;
    rd_len_i   : in std_logic_vector(31 downto 0);

    data_i  : in  std_logic_vector(15 downto 0);
    wrreq_i : in  std_logic;
    wrrdy_o : out std_logic;

    dco_i : in  std_logic;
    q_o   : out std_logic_vector(15 downto 0);

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
    ssram_mode_o  : out std_logic
    );

end ram_manager;

architecture impl of ram_manager is

  component fifo16to64
    port (
      aclr    : in  std_logic := '0';
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

  signal ff_rdreq   : std_logic;
  signal ff_wrclk   : std_logic;
  signal ff_wrreq   : std_logic;
  signal ff_q       : std_logic_vector (63 downto 0);
  signal ff_rdempty : std_logic;
  signal ff_rdfull  : std_logic;
  signal ff_rdusedw : std_logic_vector (5 downto 0);
  signal ff_wrempty : std_logic;
  signal ff_wrfull  : std_logic;
  signal ff_wrusedw : std_logic_vector (7 downto 0);

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

  signal ss_we_i   : std_logic;
  signal ss_rd_i   : std_logic;
  signal ss_addr_i : std_logic_vector(ADDR_WIDTH - 1 downto 0);
  signal ss_d_i    : std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal ss_q_o    : std_logic_vector(DATA_WIDTH - 1 downto 0);

  type   state_t is (s_idle, s_write, s_wait, s_read);
  signal cs : state_t;

  component fifo64to16
    port (
      aclr    : in  std_logic := '0';
      data    : in  std_logic_vector (63 downto 0);
      rdclk   : in  std_logic;
      rdreq   : in  std_logic;
      wrclk   : in  std_logic;
      wrreq   : in  std_logic;
      q       : out std_logic_vector (15 downto 0);
      rdempty : out std_logic;
      rdusedw : out std_logic_vector (14 downto 0);
      wrfull  : out std_logic;
      wrusedw : out std_logic_vector (12 downto 0));
  end component;

  signal rff_aclr    : std_logic := '0';
  signal rff_data    : std_logic_vector (63 downto 0);
  signal rff_rdclk   : std_logic;
  signal rff_rdreq   : std_logic;
  signal rff_wrclk   : std_logic;
  signal rff_wrreq   : std_logic;
  signal rff_q       : std_logic_vector (15 downto 0);
  signal rff_rdempty : std_logic;
  signal rff_rdusedw : std_logic_vector (14 downto 0);
  signal rff_wrfull  : std_logic;
  signal rff_wrusedw : std_logic_vector (12 downto 0);
  
begin  -- impl

  fifo16to64_1 : fifo16to64
    port map (
      aclr    => rst_i,
      data    => data_i,
      wrclk   => LB_Clk_i,
      wrreq   => wrreq_i,
      wrfull  => ff_wrfull,
      q       => ff_q,
      rdclk   => sys_clk_i,
      rdreq   => ff_rdreq,
      rdempty => ff_rdempty,
      rdfull  => open,
      rdusedw => ff_rdusedw,
      wrempty => open,
      wrusedw => open);

  wrrdy_o  <= not ff_wrfull;
  ss_d_i   <= ff_q;
  ff_rdreq <= ss_we_i;

  ssram_inf_1 : ssram_inf
    generic map (
      DATA_WIDTH => DATA_WIDTH,
      ADDR_WIDTH => ADDR_WIDTH)
    port map (
      clk_i         => sys_clk_i,
      rst_i         => rst_i,
      we_i          => ss_we_i,
      rd_i          => ss_rd_i,
      addr_i        => ss_addr_i,
      d_i           => ss_d_i,
      q_o           => ss_q_o,
      ssram_clk_o   => ssram_clk_o,
      ssram_ce1_n_o => ssram_ce1_n_o,
      ssram_ce2_n_o => ssram_ce2_n_o,
      ssram_ce2_o   => ssram_ce2_o,
      ssram_addr_o  => ssram_addr_o,
      ssram_d_i     => ssram_d_i,
      ssram_d_o     => ssram_d_o,
      ssram_d_t_o   => ssram_d_t_o,
      ssram_adv_o   => ssram_adv_o,
      ssram_we_n_o  => ssram_we_n_o,
      ssram_bw_n_o  => ssram_bw_n_o,
      ssram_oe_n_o  => ssram_oe_n_o,
      ssram_cke_n_o => ssram_cke_n_o,
      ssram_zz_o    => ssram_zz_o,
      ssram_mode_o  => ssram_mode_o);

  process (sys_clk_i, rst_i)
  begin  -- process
    if rst_i = '1' then                 -- asynchronous reset (active low)
      cs <= s_idle;
    elsif sys_clk_i'event and sys_clk_i = '1' then  -- rising clock edge
      case cs is
        when s_idle =>
          if wr_start_i = '1' then
            cs <= s_write;
          else
            cs <= s_idle;
          end if;
          ss_addr_i <= (others => '0');

        when s_write =>
          if rd_start_i = '1' then
            cs        <= s_read;
            ss_addr_i <= (others => '0');
            ss_we_i   <= '0';
          else
            cs <= s_write;
            if ff_rdempty = '0' then
              ss_we_i   <= '1';
              ss_addr_i <= ss_addr_i + 1;
            else
              ss_we_i   <= '0';
              ss_addr_i <= ss_addr_i;
            end if;
          end if;

        when s_read =>
          if wr_start_i = '1' then
            cs <= s_wait;
          else
            cs <= s_read;
          end if;

          if rff_wrfull = '0' then
            ss_rd_i <= '1';
            if ss_addr_i = rd_len_i(ADDR_WIDTH-1 downto 0) then
              ss_addr_i <= (others => '0');
            else
              ss_addr_i <= ss_addr_i + 1;
            end if;
          else
            ss_rd_i   <= '0';
            ss_addr_i <= ss_addr_i;
          end if;

        when s_wait =>
          ss_addr_i <= (others => '0');
          cs        <= s_write;
        when others =>
          null;
          
      end case;
    end if;
  end process;

  rff_data  <= ss_q_o;
  rff_wrclk <= sys_clk_i;

  process (sys_clk_i)
  begin  -- process
    if rising_edge(sys_clk_i) then
      rff_wrreq <= ss_rd_i;
    end if;
  end process;

  rff_rdclk <= dco_i;
  rff_rdreq <= not rff_rdempty;

  fifo64to16_1 : fifo64to16
    port map (
      aclr    => rst_i,
      data    => rff_data,
      wrclk   => rff_wrclk,
      wrreq   => rff_wrreq,
      wrfull  => rff_wrfull,
      q       => rff_q,
      rdclk   => rff_rdclk,
      rdreq   => rff_rdreq,
      rdempty => rff_rdempty,
      rdusedw => rff_rdusedw,
      wrusedw => rff_wrusedw);

  q_o <= rff_q;
  
end impl;


