-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : dac_wrap.vhd
-- Author     :   <Administrator@CHINA-6C7FF0513>
-- Company    : 
-- Created    : 2010-05-16
-- Last update: 2011-05-03
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

entity dac_wrap is
  
  generic (
    ADDR_LEN_L : std_logic_vector(15 downto 0) := x"1006";
    ADDR_LEN_H : std_logic_vector(15 downto 0) := x"1007";
    ADDR_LEN  : std_logic_vector(15 downto 0) := x"1004";
    ADDR_FIFO : std_logic_vector(15 downto 0) := x"1005");
  port (
    sys_clk_i : in std_logic;

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
    dac_data_o    : out std_logic_vector (15 downto 0);
    dac_dco_i     : in  std_logic;
    -- had SPI port
    chip_rst_n_o  : out std_logic;
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

end dac_wrap;

architecture behave of dac_wrap is

  constant DATA_WIDTH : integer := 64;
  constant ADDR_WIDTH : integer := 19;

  signal dm_data_i  : std_logic_vector(15 downto 0);
  signal rd_req_i   : std_logic;
  signal rd_q_o     : std_logic_vector(63 downto 0);
  signal rd_empty_o : std_logic;

  signal LB_Ready_sw : std_logic;
  signal LB_DataR_sw : std_logic_vector(15 downto 0);
  signal updated_sw  : std_logic;
  signal ctrl_sw     : std_logic_vector(15 downto 0);
  signal sta_sw      : std_logic_vector(15 downto 0);

-- data buffer

  -- signal define
  signal buf_task_start : std_logic                     := '0';
  signal task_length    : std_logic_vector(15 downto 0) := (others => '0');

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

  signal fifo_ful_i  : std_logic;
  signal fifo_wr_o   : std_logic;
  signal fifo_dout_o : std_logic_vector(15 downto 0);

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

  component ram_manager_v2
    generic (
      DATA_WIDTH : integer;
      ADDR_WIDTH : integer);
    port (
      sys_clk_i     : in  std_logic;
      rst_i         : in  std_logic;
      LB_Clk_i      : in  std_logic;
      wr_start_i    : in  std_logic;
      rd_start_i    : in  std_logic;
      rd_len_i      : in  std_logic_vector(31 downto 0);
      data_i        : in  std_logic_vector(15 downto 0);
      wrreq_i       : in  std_logic;
      wrrdy_o       : out std_logic;
      dco_i         : in  std_logic;
      q_o           : out std_logic_vector(15 downto 0);
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

  signal wr_start_i : std_logic;
  signal rd_start_i : std_logic;
  signal rd_len_i   : std_logic_vector(31 downto 0);
  signal wrrdy_o    : std_logic;

  signal LB_Ready_ll : std_logic;
  signal LB_DataR_ll : std_logic_vector(15 downto 0);
  signal updated_ll  : std_logic;
  signal ctrl_ll     : std_logic_vector(15 downto 0);
  signal sta_ll      : std_logic_vector(15 downto 0);
  
  signal LB_Ready_lh : std_logic;
  signal LB_DataR_lh : std_logic_vector(15 downto 0);
  signal updated_lh  : std_logic;
  signal ctrl_lh     : std_logic_vector(15 downto 0);
  signal sta_lh      : std_logic_vector(15 downto 0);

begin  -- behave

  process (LB_Clk_i)
  begin  -- process
    if LB_Clk_i'event and LB_Clk_i = '1' then  -- rising clock edge
--      if cnt = "1111111" then           -- 40MHz divide by 128 => 312.5KHz
      clk_500K_i <= cnt(8);                    --not clk_500K_i;
      cnt        <= cnt + 1;
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
      tm_o         => open,
      gpio1_o      => open,
      gpio3_o      => open,
      adc_rst_n_o  => chip_rst_n_o,
      spi_clk_o    => spi_clk_o,
      spi_out_en_o => spi_out_en_o,
      spi_di_i     => spi_di_i,
      spi_do_o     => spi_do_o,
      spi_cs_n_o   => spi_cs_n_o,
      i2c_sdo_o    => i2c_sdo_o,
      i2c_scl_o    => i2c_scl_o,
      i2c_sda_o    => i2c_sda_o);

  lb_target_reg_wr_start : lb_target_reg
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
      updated_o  => wr_start_i,
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
      fifo_ful_i  => fifo_ful_i,
      fifo_wr_o   => fifo_wr_o,
      fifo_dout_o => fifo_dout_o
      );

  fifo_ful_i <= not wrrdy_o;

  ram_manager_1 : ram_manager_v2
    generic map (
      DATA_WIDTH => DATA_WIDTH,
      ADDR_WIDTH => ADDR_WIDTH)
    port map (
      sys_clk_i     => sys_clk_i,
      rst_i         => LB_Reset_i,
      LB_Clk_i      => LB_Clk_i,
      wr_start_i    => wr_start_i,
      rd_start_i    => rd_start_i,
      rd_len_i      => rd_len_i,
      data_i        => fifo_dout_o,
      wrreq_i       => fifo_wr_o,
      wrrdy_o       => wrrdy_o,
      dco_i         => dac_dco_i,
      q_o           => dac_data_o,
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

  lb_target_reg_ll: lb_target_reg
    generic map (
      ADDR => ADDR_LEN_L)
    port map (
      LB_Clk_i   => LB_Clk_i,
      LB_Reset_i => LB_Reset_i,
      LB_Addr_i  => LB_Addr_i,
      LB_Write_i => LB_Write_i,
      LB_Read_i  => LB_Read_i,
      LB_Ready_o => LB_Ready_ll,
      LB_DataW_i => LB_DataW_i,
      LB_DataR_o => LB_DataR_ll,
      updated_o  => updated_ll,
      ctrl_o     => ctrl_ll,
      sta_i      => sta_ll);

  lb_target_reg_lh: lb_target_reg
    generic map (
      ADDR => ADDR_LEN_H)
    port map (
      LB_Clk_i   => LB_Clk_i,
      LB_Reset_i => LB_Reset_i,
      LB_Addr_i  => LB_Addr_i,
      LB_Write_i => LB_Write_i,
      LB_Read_i  => LB_Read_i,
      LB_Ready_o => LB_Ready_lh,
      LB_DataW_i => LB_DataW_i,
      LB_DataR_o => LB_DataR_lh,
      updated_o  => updated_lh,
      ctrl_o     => ctrl_lh,
      sta_i      => sta_lh);

  rd_start_i <= updated_lh;
  rd_len_i <= ctrl_lh & ctrl_ll;

  LB_DataR_o <= LB_DataR_had_fifo or LB_DataR_adc_config or LB_DataR_ll or LB_DataR_lh;
  LB_Ready_o <= LB_Ready_had_fifo or LB_Ready_dat_buf or LB_Ready_adc_config
                or LB_Ready_ll or LB_Ready_lh;

end behave;
