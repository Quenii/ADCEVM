-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : had_rec.vhd
-- Author     :   <Administrator@CHINA-6C7FF0513>
-- Company    : 
-- Created    : 2010-05-16
-- Last update: 2011-04-20
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2010 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2010-05-16  1.0      Administrator   Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity had_rec is
  
  generic (
    IO_TYPE   : string;
    ADDR_LEN  : std_logic_vector(15 downto 0) := x"1004";
    ADDR_FIFO : std_logic_vector(15 downto 0) := x"1005");
  port (
    clk_i : in std_logic;

    -- lb
    LB_Clk_i      : in  std_logic;
    LB_Reset_i    : in  std_logic;
    LB_Addr_i     : in  std_logic_vector(15 downto 0);
    LB_Write_i    : in  std_logic;
    LB_Read_i     : in  std_logic;
    LB_Ready_o    : out std_logic;
    LB_DataW_i    : in  std_logic_vector(15 downto 0);
    LB_DataR_o    : out std_logic_vector(15 downto 0);
    -- LVDS
    rx_in_i       : in  std_logic_vector (15 downto 0);
    rx_inclock_i  : in  std_logic;
    -- had SPI port
    tm_o          : out std_logic;
    adc_rst_n_o   : out std_logic;
    spi_clk_o     : out std_logic;
    spi_out_en_o  : out std_logic;
    spi_di_i      : in  std_logic;
    spi_do_o      : out std_logic;
    spi_cs_n_o    : out std_logic;
    i2c_sdo_o     : out std_logic;
    i2c_scl_o     : out std_logic;
    i2c_sda_o     : out std_logic;
    -- SSRAM 0
    ssram_clk_o   : out std_logic;
    ssram_ce1_n_o : out std_logic;
    ssram_ce2_n_o : out std_logic;
    ssram_ce2_o   : out std_logic;
    ssram_addr_o  : out std_logic_vector(18 downto 0);
    ssram_d_i     : in  std_logic_vector(63 downto 0);
    ssram_d_o     : out std_logic_vector(63 downto 0);
    ssram_d_t_o   : out std_logic;
    ssram_adv_o   : out std_logic;
    ssram_we_n_o  : out std_logic;
    ssram_bw_n_o  : out std_logic;
    ssram_oe_n_o  : out std_logic;
    ssram_cke_n_o : out std_logic;
    ssram_zz_o    : out std_logic;
    ssram_mode_o  : out std_logic
    );

end had_rec;

architecture behave of had_rec is

  constant DATA_WIDTH : integer := 64;
  constant ADDR_WIDTH : integer := 19;

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

  signal rd_req_i   : std_logic;
  signal rd_q_o     : std_logic_vector(63 downto 0);
  signal rd_empty_o : std_logic;

  -- data buffer
--    component dat_buf
--        port (
--            clk_i               : in  std_logic;
--            rst_i               : in  std_logic;
--            task_start          : in  std_logic;
--            task_length         : in  std_logic_vector(15 downto 0);
--            din_i               : in  std_logic_vector(63 downto 0);
--            fifo_almost_empty_i : in  std_logic;
--            fifo_rd_o           : out std_logic;
--            fifo_rst_n_o        : out std_logic;
--            rd_clk_i            : in  std_logic;
--            rd_i                : in  std_logic;
--            empty_o             : out std_logic;
--            dout_o              : out std_logic_vector(15 downto 0);
--            ssram_din_i         : in  std_logic_vector(63 downto 0);
--            ssram_dout_o        : out std_logic_vector(63 downto 0);
--            ssram0_adr_o        : out std_logic_vector(18 downto 0);
--            ssram0_dout_en_o    : out std_logic;
--            ssram0_adv_n_o      : out std_logic;
--            ssram0_adsp_n_o     : out std_logic;
--            ssram0_adsc_n_o     : out std_logic;
--            ssram0_gw_n_o       : out std_logic;
--            ssram0_ce_n_o       : out std_logic;
--            ssram0_ce2_n_o      : out std_logic;
--            ssram0_ce2_o        : out std_logic;
--            ssram0_bwa_n_o      : out std_logic;
--            ssram0_bwb_n_o      : out std_logic;
--            ssram0_bwc_n_o      : out std_logic;
--            ssram0_bwd_n_o      : out std_logic;
--            ssram0_bwe_n_o      : out std_logic;
--            ssram0_oe_n_o       : out std_logic;
--            ssram0_zz_o         : out std_logic;
--            ssram0_mode_o       : out std_logic;
--            ssram1_bwa_n_o      : out std_logic;
--            ssram1_bwb_n_o      : out std_logic;
--            ssram1_bwc_n_o      : out std_logic;
--            ssram1_bwd_n_o      : out std_logic);
--    end component;
  component dat_buf_v2
    generic (
      DATA_WIDTH : integer;
      ADDR_WIDTH : integer);
    port (
      clk_i       : in  std_logic;
      rst_i       : in  std_logic;
      task_start  : in  std_logic;
      task_length : in  std_logic_vector(15 downto 0);
      fifo_rd_o   : out std_logic;
      din_i       : in  std_logic_vector(63 downto 0);

      LB_Clk_i      : in  std_logic;
      rd_empty_i    : in  std_logic;
      rd_i          : in  std_logic;
      empty_o       : out std_logic;
      dout_o        : out std_logic_vector(15 downto 0);
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
  end component;

  -- signal define
  signal buf_task_start : std_logic                     := '0';
  signal task_length    : std_logic_vector(15 downto 0) := (others => '0');

  -- SPI converter
  component spi
    port (
      clk_i         : in  std_logic;
      rst_i         : in  std_logic;
      -- control port
      task_start_i  : in  std_logic;
      ack_o         : out std_logic;
      updata_da_n_i : in  std_logic;
      data_i        : in  std_logic_vector(23 downto 0);
      data_o        : out std_logic_vector(23 downto 0);
      -- SPI port
      sck_o         : out std_logic;
      sdi_i         : in  std_logic;
      sdo_o         : out std_logic;
      ld_cs_n_o     : out std_logic;
      ldac_n_o      : out std_logic);
  end component;
  -- signal define
  signal ack_o : std_logic := '0';

  -- register define
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
  -- signal define
  signal updated_had_spi_h : std_logic                     := '0';
  signal spi_din           : std_logic_vector(31 downto 0) := (others => '0');
  signal spi_dout          : std_logic_vector(31 downto 0) := (others => '0');
  signal LB_Ready_dat_buf  : std_logic                     := '0';
  -- fifo register define
  component lb_target_fifo_rome
    generic (
      ADDR : std_logic_vector(15 downto 0));
    port (
      LB_Clk_i    : in  std_logic;
      LB_Reset_i  : in  std_logic;
      LB_Addr_i   : in  std_logic_vector(15 downto 0);
      LB_Write_i  : in  std_logic;
      LB_Read_i   : in  std_logic;
      LB_Ready_o  : out std_logic;
      LB_DataW_i  : in  std_logic_vector(15 downto 0);
      LB_DataR_o  : out std_logic_vector(15 downto 0);
      fifo_emp_i  : in  std_logic;
      fifo_rd_o   : out std_logic;
      fifo_din_i  : in  std_logic_vector(15 downto 0);
      fifo_ful_i  : in  std_logic;
      fifo_wr_o   : out std_logic;
      fifo_dout_o : out std_logic_vector(15 downto 0));
  end component;
  -- signal define
  signal LB_Ready_had_fifo : std_logic                     := '0';
  signal LB_DataR_had_fifo : std_logic_vector(15 downto 0) := (others => '0');
  signal rd                : std_logic                     := '0';
  signal empty             : std_logic                     := '0';
  signal dout              : std_logic_vector(15 downto 0) := (others => '0');
  signal clk_500K_i        : std_logic                     := '0';
  signal cnt               : std_logic_vector(8 downto 0)  := (others => '0');
  signal buf_task_start_r  : std_logic                     := '0';

  --
  component adc_config
    port (
      LB_Clk_i     : in  std_logic;
      LB_Reset_i   : in  std_logic;
      LB_Addr_i    : in  std_logic_vector(15 downto 0);
      LB_Write_i   : in  std_logic;
      LB_Read_i    : in  std_logic;
      LB_Ready_o   : out std_logic;
      LB_DataW_i   : in  std_logic_vector(15 downto 0);
      LB_DataR_o   : out std_logic_vector(15 downto 0);
      clk_500K_i   : in  std_logic;
      tm_o         : out std_logic;
      gpio1_o      : out std_logic;
      gpio3_o      : out std_logic;
      adc_rst_n_o  : out std_logic;
      spi_clk_o    : out std_logic;
      spi_out_en_o : out std_logic;
      spi_di_i     : in  std_logic;
      spi_do_o     : out std_logic;
      spi_cs_n_o   : out std_logic;
      i2c_sdo_o    : out std_logic;
      i2c_scl_o    : out std_logic;
      i2c_sda_o    : out std_logic);
  end component;
  --
  signal LB_Ready_adc_config : std_logic                     := '0';
  signal LB_DataR_adc_config : std_logic_vector(15 downto 0) := (others => '0');

  signal test : std_logic_vector(15 downto 0);

  component dcm45
    port (
      areset : in  std_logic := '0';
      inclk0 : in  std_logic := '0';
      c0     : out std_logic;
      c1     : out std_logic;
      locked : out std_logic);
  end component;

  signal clk : std_logic;

begin  -- behave

  dcm45_1 : dcm45
    port map (
      areset => LB_Reset_i,
      inclk0 => clk_i,
      c0     => open,  --ssram0_clk_o,     -- 180 degree
      c1     => clk,                    -- 0 degree
      locked => open);

--  ssram_clk_o <= clk;

  process (rx_inclock_i, LB_Reset_i)
  begin  -- process
    if LB_Reset_i = '1' then            -- asynchronous reset (active low)
      test <= (others => '0');
    elsif rx_inclock_i'event and rx_inclock_i = '1' then  -- rising clock edge
      test <= test + x"10";
    end if;
  end process;

  demux_1 : demux
    generic map (
      IO_TYPE => IO_TYPE)
    port map (
      rst_i      => LB_Reset_i,
      clk_i      => rx_inclock_i,
      enable_i   => buf_task_start_r,
      data_i     => rx_in_i,
      rd_clk_i   => clk,
      rd_req_i   => rd_req_i,
      rd_q_o     => rd_q_o,
      rd_empty_o => rd_empty_o);

  dat_buf_v2_1 : dat_buf_v2
    generic map (
      DATA_WIDTH => DATA_WIDTH,
      ADDR_WIDTH => ADDR_WIDTH)
    port map (
      clk_i         => clk,
      rst_i         => LB_Reset_i,
      task_start    => buf_task_start,
      task_length   => task_length,
      fifo_rd_o     => rd_req_i,
      din_i         => rd_q_o,
      rd_empty_i    => rd_empty_o,
      LB_Clk_i      => LB_Clk_i,
      rd_i          => rd,
      empty_o       => empty,
      dout_o        => dout,
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
      ssram_bw_n_o  => ssram_bw_n_o,
      ssram_cke_n_o => ssram_cke_n_o,
      ssram_zz_o    => ssram_zz_o,
      ssram_mode_o  => ssram_mode_o);
--    dat_buf_1 : dat_buf
--        port map (
--            clk_i               => clk,
--            rst_i               => LB_Reset_i,
--            task_start          => buf_task_start_r,
--            task_length         => task_length,
--            din_i               => rd_q_o,
--            fifo_almost_empty_i => rd_empty_o,
--            fifo_rd_o           => rd_req_i,
--            fifo_rst_n_o        => open,

--            rd_clk_i            => LB_Clk_i,
--            rd_i                => rd,
--            empty_o             => empty,
--            dout_o              => dout,

--            ssram_din_i         => ssram_din_i,
--            ssram_dout_o        => ssram_dout_o,
--            ssram0_adr_o        => ssram0_adr_o,
--            ssram0_dout_en_o    => ssram0_dout_en_o,
--            ssram0_adv_n_o      => ssram0_adv_n_o,
--            ssram0_adsp_n_o     => ssram0_adsp_n_o,
--            ssram0_adsc_n_o     => ssram0_adsc_n_o,
--            ssram0_gw_n_o       => ssram0_gw_n_o,
--            ssram0_ce_n_o       => ssram0_ce_n_o,
--            ssram0_ce2_n_o      => ssram0_ce2_n_o,
--            ssram0_ce2_o        => ssram0_ce2_o,
--            ssram0_bwa_n_o      => ssram0_bwa_n_o,
--            ssram0_bwb_n_o      => ssram0_bwb_n_o,
--            ssram0_bwc_n_o      => ssram0_bwc_n_o,
--            ssram0_bwd_n_o      => ssram0_bwd_n_o,
--            ssram0_bwe_n_o      => ssram0_bwe_n_o,
--            ssram0_oe_n_o       => ssram0_oe_n_o,
--            ssram0_zz_o         => ssram0_zz_o,
--            ssram0_mode_o       => ssram0_mode_o,
--            ssram1_bwa_n_o      => ssram1_bwa_n_o,
--            ssram1_bwb_n_o      => ssram1_bwb_n_o,
--            ssram1_bwc_n_o      => ssram1_bwc_n_o,
--            ssram1_bwd_n_o      => ssram1_bwd_n_o);

  process (LB_Clk_i)
  begin  -- process
    if LB_Clk_i'event and LB_Clk_i = '1' then  -- rising clock edge
--      if cnt = "1111111" then           -- 40MHz divide by 128 => 312.5KHz
      clk_500K_i <= cnt(8);                    --not clk_500K_i;
      cnt        <= cnt + 1;
    end if;
  end process;

  process(LB_Clk_i, LB_Reset_i)
  begin
    if LB_Reset_i = '1' then
      buf_task_start_r <= '0';
    elsif LB_Clk_i'event and LB_Clk_i = '1' then
      if buf_task_start = '1' then
        buf_task_start_r <= '1';
      end if;
    end if;
  end process;

  adc_config_1 : adc_config
    port map (
      LB_Clk_i     => LB_Clk_i,
      LB_Reset_i   => LB_Reset_i,
      LB_Addr_i    => LB_Addr_i,
      LB_Write_i   => LB_Write_i,
      LB_Read_i    => LB_Read_i,
      LB_Ready_o   => LB_Ready_adc_config,
      LB_DataW_i   => LB_DataW_i,
      LB_DataR_o   => LB_DataR_adc_config,
      -- JTAG and SPI
      clk_500K_i   => clk_500K_i,
      tm_o         => tm_o,
      gpio1_o      => open,
      gpio3_o      => open,
      adc_rst_n_o  => adc_rst_n_o,
      spi_clk_o    => spi_clk_o,
      spi_out_en_o => spi_out_en_o,
      spi_di_i     => spi_di_i,
      spi_do_o     => spi_do_o,
      spi_cs_n_o   => spi_cs_n_o,
      i2c_sdo_o    => i2c_sdo_o,
      i2c_scl_o    => i2c_scl_o,
      i2c_sda_o    => i2c_sda_o);

  lb_target_had_dat_buf_ctrl : lb_target_reg
    generic map (
      ADDR => ADDR_LEN)
    port map (
      LB_Clk_i   => LB_Clk_i,
      LB_Reset_i => LB_Reset_i,
      LB_Addr_i  => LB_Addr_i,
      LB_Write_i => LB_Write_i,
      LB_Read_i  => LB_Read_i,
      LB_Ready_o => LB_Ready_dat_buf,
      LB_DataW_i => LB_DataW_i,
      LB_DataR_o => open,
      updated_o  => buf_task_start,
      ctrl_o     => task_length,
      sta_i      => x"0000");

  lb_target_had_fifo_rome_1 : lb_target_fifo_rome
    generic map (
      ADDR => ADDR_FIFO)
    port map (
      LB_Clk_i    => LB_Clk_i,
      LB_Reset_i  => LB_Reset_i,
      LB_Addr_i   => LB_Addr_i,
      LB_Write_i  => LB_Write_i,
      LB_Read_i   => LB_Read_i,
      LB_Ready_o  => LB_Ready_had_fifo,
      LB_DataW_i  => LB_DataW_i,
      LB_DataR_o  => LB_DataR_had_fifo,
      fifo_emp_i  => empty,
      fifo_rd_o   => rd,
      fifo_din_i  => dout,
      fifo_ful_i  => '0',
      fifo_wr_o   => open,
      fifo_dout_o => open
      );

  LB_DataR_o <= LB_DataR_had_fifo or LB_DataR_adc_config;
  LB_Ready_o <= LB_Ready_had_fifo or LB_Ready_dat_buf or LB_Ready_adc_config;

end behave;
