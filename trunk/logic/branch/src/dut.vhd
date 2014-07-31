-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : dut.vhd
-- Author     :   <Quenii@QUENII-NB>
-- Company    : 
-- Created    : 2014-02-18
-- Last update: 2014-07-09
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2014 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-02-18  1.0      Quenii  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity dut is
  generic (
    ADDR_4B    : integer;
    ADDR_WIDTH : integer;
    DATA_WIDTH : integer
    );

  port (
    LB_Clk_i   : in  std_logic;
    LB_Reset_i : in  std_logic;
    LB_CS_i    : in  std_logic;
    LB_ADS_i   : in  std_logic;
    LB_ACK_o   : out std_logic;
    LB_Addr_i  : in  std_logic_vector(15 downto 0);
    LB_Write_i : in  std_logic;
    LB_Valid_i : in  std_logic;
    LB_DataW_i : in  std_logic_vector(15 downto 0);
    LB_Ready_o : out std_logic;
    LB_DataR_o : out std_logic_vector(15 downto 0);

    adc_rst_o     : out std_logic;      --- AD reset signal
    ddc_mode_o    : out std_logic;      --- AD original data
    fifo_i_cs_o   : out std_logic;
    fifo_q_cs_i   : in  std_logic;
    fifo_rd_en_o  : out std_logic;
    fifo_rd_clk_o : out std_logic;
    fifo_full_i   : in  std_logic;
    fifo_empty_i  : in  std_logic;
    dat_i         : in  std_logic_vector(31 downto 0);

--    clk_i : in  std_logic;
--    dat_i : in  std_logic_vector(15 downto 0);
--    vld_i : in  std_logic;
--    sel_o : out std_logic;

    sys_clk_i : in std_logic;

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

end dut;

architecture impl of dut is

  type   state_t is (s_idle, s_dump);
  signal dstate : state_t;

  signal buf_rst : std_logic;

  signal ibuf_rdreq   : std_logic;
  signal ibuf_q       : std_logic_vector (31 downto 0);
  signal ibuf_rdempty : std_logic;
  signal ibuf_wrfull  : std_logic;

  signal obuf_rdreq   : std_logic;
  signal obuf_wrreq   : std_logic;
  signal obuf_q       : std_logic_vector (15 downto 0);
  signal obuf_rdempty : std_logic;
  signal obuf_wrfull  : std_logic;
  signal obuf_ack     : std_logic;

  signal mbuf_rdreq : std_logic;
  signal mbuf_wrreq : std_logic;
  signal mbuf_empty : std_logic;
  signal mbuf_full  : std_logic;
  signal mbuf_q     : std_logic_vector (31 downto 0);
  signal mbuf_usedw : std_logic_vector (14 downto 0);

  signal LB_ACK_reg1   : std_logic;
  signal LB_Ready_reg1 : std_logic;
  signal LB_DataR_reg1 : std_logic_vector(15 downto 0);
  signal updated_reg1  : std_logic;
  signal ctrl_reg1     : std_logic_vector(15 downto 0);
  signal sta_reg1      : std_logic_vector(15 downto 0);

  signal LB_ACK_fifo   : std_logic;
  signal LB_Ready_fifo : std_logic;
  signal LB_DataR_fifo : std_logic_vector(15 downto 0);

  signal dat_o : std_logic_vector(31 downto 0);
  signal vld_o : std_logic;
  signal rst_dut : std_logic;
begin  -- impl

  LB_ACK_o   <= LB_ACK_fifo or LB_ACK_reg1;
  LB_Ready_o <= LB_Ready_fifo or LB_Ready_reg1;
  LB_DataR_o <= LB_DataR_fifo or LB_DataR_reg1;

  ibuf : entity work.async_w32r32d256
    port map (
      aclr    => buf_rst,
      data    => dat_o,
      wrclk   => sys_clk_i,
      wrreq   => vld_o,
      wrfull  => ibuf_wrfull,
      rdclk   => sys_clk_i,
      rdreq   => ibuf_rdreq,
      q       => ibuf_q,
      rdempty => ibuf_rdempty
      );

  mbuf_wrreq <= (not ibuf_rdempty) when dstate = s_dump else '0';
  ibuf_rdreq <= mbuf_wrreq;

  mbuf : entity work.sync_w32d32k
    port map (
      aclr  => buf_rst,
      clock => sys_clk_i,
      data  => ibuf_q,
      rdreq => mbuf_rdreq,
      wrreq => mbuf_wrreq,
      empty => mbuf_empty,
      full  => mbuf_full,
      q     => mbuf_q,
      usedw => mbuf_usedw);

  mbuf_rdreq <= (not mbuf_empty) and (not obuf_wrfull);
  obuf_wrreq <= mbuf_rdreq;

  obuf : entity work.async_w32r16d256
    port map (
      aclr    => buf_rst,
      data    => mbuf_q,
      wrclk   => sys_clk_i,
      wrreq   => obuf_wrreq,
      wrfull  => obuf_wrfull,
      rdclk   => LB_Clk_i,
      rdreq   => obuf_rdreq,
      q       => obuf_q,
      rdempty => obuf_rdempty
      );

  ififo : entity work.lb_target_ififo
    generic map (
      CNT_REG_ADDR_4B  => ADDR_4B+1,
      DATA_REG_ADDR_4B => ADDR_4B)
    port map (
      LB_Clk_i      => LB_Clk_i,
      LB_Reset_i    => LB_Reset_i,
      LB_CS_i       => LB_CS_i,
      LB_ADS_i      => LB_ADS_i,
      LB_ACK_o      => LB_ACK_fifo,
      LB_Addr_i     => LB_Addr_i,
      LB_Write_i    => LB_Write_i,
      LB_Valid_i    => LB_Valid_i,
      LB_DataW_i    => LB_DataW_i,
      LB_Ready_o    => LB_Ready_fifo,
      LB_DataR_o    => LB_DataR_fifo,
      fifo_cnt_i    => '0' & mbuf_usedw,
      fifo_q_i      => obuf_q,
      fifo_rd_en_o  => obuf_rdreq,
      fifo_rd_ack_i => obuf_ack);

  obuf_ack <= obuf_rdreq and (not obuf_rdempty);

  reg1 : entity work.lb_target_reg
    generic map (
      ADDR_4B => ADDR_4B+2)
    port map (
      LB_Clk_i   => LB_Clk_i,
      LB_Reset_i => LB_Reset_i,
      LB_CS_i    => LB_CS_i,
      LB_ADS_i   => LB_ADS_i,
      LB_ACK_o   => LB_ACK_reg1,
      LB_Addr_i  => LB_Addr_i,
      LB_Write_i => LB_Write_i,
      LB_Valid_i => LB_Valid_i,
      LB_DataW_i => LB_DataW_i,
      LB_Ready_o => LB_Ready_reg1,
      LB_DataR_o => LB_DataR_reg1,
      updated_o  => updated_reg1,
      ctrl_o     => ctrl_reg1,
      sta_i      => sta_reg1);

  sta_reg1(5 downto 0) <= ibuf_wrfull & ibuf_rdempty & mbuf_full & mbuf_empty
                          & obuf_wrfull & obuf_rdempty;

  buf_rst <= ctrl_reg1(0);
  ddc_mode_o <= ctrl_reg1(1);
  rst_dut <= ctrl_reg1(2);
  
  process (LB_Reset_i, sys_clk_i)
  begin  -- process
    if LB_Reset_i = '1' then
      dstate <= s_idle;
    elsif rising_edge(sys_clk_i) then
      case dstate is
        when s_idle =>
          if updated_reg1 = '1' then
            dstate <= s_dump;
          end if;

        when s_dump =>
          if mbuf_full = '1' then
            dstate <= s_idle;
          end if;
        when others => null;
      end case;
      
    end if;
  end process;

  ddc_1: entity work.ddc
    port map (
      clk_p         => sys_clk_i,
      rst_i         => rst_dut,
      adc_rst_o     => adc_rst_o,
      ddc_mode_o    => open,-- ddc_mode_o,
      fifo_i_cs_o   => fifo_i_cs_o,
      fifo_q_cs_i   => fifo_q_cs_i,
      fifo_rd_en_o  => fifo_rd_en_o,
      fifo_rd_clk_o => fifo_rd_clk_o,
      fifo_full_i   => fifo_full_i,
      fifo_empty_i  => fifo_empty_i,
      dat_i         => dat_i,
      dat_o         => dat_o,
      vld_o         => vld_o);
  
--  dat_buf_v2_1 : entity work.dat_buf_v2
--    generic map (
--      DATA_WIDTH => DATA_WIDTH,
--      ADDR_WIDTH => ADDR_WIDTH)
--    port map (
--      sys_clk_i     => sys_clk_i,
--      rst_i         => rst_i,
--      task_start    => task_start,
--      task_length   => task_length,
--      fifo_full_o   => fifo_full_o,
--      fifo_rd_o     => fifo_rd_o,
--      din_i         => din_i,
--      rd_empty_i    => rd_empty_i,
--      LB_Clk_i      => LB_Clk_i,
--      rd_i          => rd_i,
--      empty_o       => empty_o,
--      dout_o        => dout_o,
--      ssram_clk_o   => ssram_clk_o,
--      ssram_ce1_n_o => ssram_ce1_n_o,
--      ssram_ce2_n_o => ssram_ce2_n_o,
--      ssram_ce2_o   => ssram_ce2_o,
--      ssram_addr_o  => ssram_addr_o,
--      ssram_d_i     => ssram_d_i,
--      ssram_d_t_o   => ssram_d_t_o,
--      ssram_d_o     => ssram_d_o,
--      ssram_adv_o   => ssram_adv_o,
--      ssram_we_n_o  => ssram_we_n_o,
--      ssram_oe_n_o  => ssram_oe_n_o,
--      ssram_bw_n_o  => ssram_bw_n_o,
--      ssram_cke_n_o => ssram_cke_n_o,
--      ssram_zz_o    => ssram_zz_o,
--      ssram_mode_o  => ssram_mode_o);

end impl;
