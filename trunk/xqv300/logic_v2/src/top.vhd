-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : top.vhd%
-- Author     :   <Administrator@CHINA-6C7FF0513>
-- Company    : 
-- Created    : 2010-05-09
-- Last update: 2011-05-26
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2010 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2010-05-09  1.0      Rome    Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity top is

  generic (
    GPIO_WIDTH : integer := 8);
  port (
    sys_clk_i : in std_logic;
    -- System reset in
    sys_rst_i : in std_logic;

    -- 68013 port
    -- FX2 SLAV FIFO
    u_ifclk_i   : in    std_logic;
    u_fd_io     : inout std_logic_vector (15 downto 0);  -- fifo data/q
    u_flaga_i   : in    std_logic;                       -- program strobe
    u_flagb_i   : in    std_logic;                       -- full
    u_flagc_i   : in    std_logic;                       -- empty
    u_flagd_i   : in    std_logic;                       -- not used
    u_slrd_n_o  : out   std_logic;                       -- fifo_rd
    u_slwr_n_o  : out   std_logic;                       -- fifo_wr
    u_sloe_n_o  : out   std_logic;
    u_pktend_o  : out   std_logic;                       -- not used
    u_fifoadr_o : out   std_logic_vector(1 downto 0);    -- fifo adr

    gpio_o : out std_logic_vector(GPIO_WIDTH-1 downto 0);

    sensor_i : in std_logic;

    -- DAC7612
    dac_sck_o     : out std_logic;
    dac_sdo_o     : out std_logic;
    dac_cs_n_o    : out std_logic;
    dac_ldacs_n_o : out std_logic;

    --ADS7841 for power monitor
    adcp_cs_n_o : out std_logic;
    adcp_busy_i : in  std_logic;
    adcp_sck_o  : out std_logic;
    adcp_sdo_o  : out std_logic;
    adcp_sdi_i  : in  std_logic;

    adcio0_cs_n_o : out std_logic;
    adcio0_busy_i : in  std_logic;
    adcio0_sck_o  : out std_logic;
    adcio0_sdo_o  : out std_logic;
    adcio0_sdi_i  : in  std_logic;

    adcio1_cs_n_o : out std_logic;
    adcio1_busy_i : in  std_logic;
    adcio1_sck_o  : out std_logic;
    adcio1_sdo_o  : out std_logic;
    adcio1_sdi_i  : in  std_logic;

    jtag_tck_i : in std_logic;
    jtag_tdi_i : in std_logic;
    jtag_tdo_i : in std_logic;
    jtag_tms_i : in std_logic;

    b0_io : in std_logic_vector(18 downto 0);
    b1_io : in std_logic_vector(17 downto 0);
    b2_io : in std_logic_vector(16 downto 0);
    b3_io : in std_logic_vector(14 downto 0);
    b4_io : in std_logic_vector(20 downto 0);
    b5_io : in std_logic_vector(18 downto 0);
    b6_io : in std_logic_vector(20 downto 0);
    b7_io : in std_logic_vector(19 downto 0);

    gck_o : out std_logic_vector(3 downto 0)

    );

end top;

architecture behave of top is
-------------------------------------------------------------------------------
  constant ADDR_RESET_REG  : std_logic_vector(15 downto 0) := x"FFFF";
  constant ADDR_CTL_REG    : std_logic_vector(15 downto 0) := x"1004";
  constant ADDR_FIFO       : std_logic_vector(15 downto 0) := x"1005";
  constant ADDR_GPIO       : std_logic_vector(15 downto 0) := x"2000";
  constant ADDR_WD         : std_logic_vector(15 downto 0) := x"2001";
  constant ADDR_SW         : std_logic_vector(15 downto 0) := x"2002";
  constant ADDR_DAC        : std_logic_vector(15 downto 0) := x"2003";
  constant C_SCK_RATIO_DAC : integer                       := 8;
  constant C_REG_WIDTH_DAC : integer                       := 14;

  constant ADDR_ADC_P          : std_logic_vector(15 downto 0) := x"2005";
  constant C_SCK_RATIO_ADC_P   : integer                       := 200;
  constant C_REG_WIDTH_ADC_P   : integer                       := 24;
  constant ADDR_ADC_IO0        : std_logic_vector(15 downto 0) := x"2007";
  constant C_SCK_RATIO_ADC_IO0 : integer                       := 200;
  constant C_REG_WIDTH_ADC_IO0 : integer                       := 24;
  constant ADDR_ADC_IO1        : std_logic_vector(15 downto 0) := x"2009";
  constant C_SCK_RATIO_ADC_IO1 : integer                       := 200;
  constant C_REG_WIDTH_ADC_IO1 : integer                       := 24;

  constant ADDR_TMP03 : std_logic_vector(15 downto 0) := x"200B";

  signal LB_Ready_rst : std_logic;
  signal LB_DataR_rst : std_logic_vector(15 downto 0);
  signal ctrl_rst     : std_logic_vector(15 downto 0);

  signal LB_Ready_gpio : std_logic;
  signal LB_DataR_gpio : std_logic_vector(15 downto 0);
  signal ctrl_gpio     : std_logic_vector(15 downto 0);
  signal updated_gpio  : std_logic;
  signal sta_gpio      : std_logic_vector(15 downto 0);

  signal LB_Ready_wd : std_logic;
  signal LB_DataR_wd : std_logic_vector(15 downto 0);
  signal ctrl_wd     : std_logic_vector(15 downto 0);
  signal updated_wd  : std_logic;
  signal sta_wd      : std_logic_vector(15 downto 0);

  signal LB_Ready_tmp03 : std_logic;
  signal LB_DataR_tmp03 : std_logic_vector(15 downto 0);

-------------------------------------------------------------------------------
  -- local bus
  component lb
    generic (
      FIFO_WR_PORT : std_logic_vector(1 downto 0);
      FIFO_RD_PORT : std_logic_vector(1 downto 0));
    port (
      sys_rst_i      : in  std_logic;
      LB_Clk_i       : in  std_logic;
      LB_Addr_o      : out std_logic_vector(15 downto 0);
      LB_Write_o     : out std_logic;
      LB_Read_o      : out std_logic;
      LB_Ready_i     : in  std_logic;
      LB_DataW_o     : out std_logic_vector(15 downto 0);
      LB_DataR_i     : in  std_logic_vector(15 downto 0);
      -- 68013 port
      PKTEND_o       : out std_logic;
      fifo_emp_i     : in  std_logic;
      fifo_ful_i     : in  std_logic;
      fifo_progful_i : in  std_logic;
      fifo_progemp_i : in  std_logic;
      fifo_wr_o      : out std_logic;
      fifo_rd_o      : out std_logic;
      fifo_adr_o     : out std_logic_vector(1 downto 0);
      fifo_din_i     : in  std_logic_vector(15 downto 0);
      fifo_dout_o    : out std_logic_vector(15 downto 0));
  end component;
  -- local bus
  signal LB_Clk_i       : std_logic;
  signal LB_Addr_o      : std_logic_vector(15 downto 0);
  signal LB_Write_o     : std_logic;
  signal LB_Read_o      : std_logic;
  signal LB_Ready_i     : std_logic;
  signal LB_DataW_o     : std_logic_vector(15 downto 0);
  signal LB_DataR_i     : std_logic_vector(15 downto 0);
  -- 68013 port
  signal fifo_emp_i     : std_logic;
  signal fifo_ful_i     : std_logic;
  signal fifo_progful_i : std_logic;
  signal fifo_progemp_i : std_logic;
  signal fifo_wr_o      : std_logic;
  signal fifo_rd_o      : std_logic;
  signal fifo_adr_o     : std_logic_vector(1 downto 0);
  signal fifo_din_i     : std_logic_vector(15 downto 0);
  signal fifo_dout_o    : std_logic_vector(15 downto 0);
-------------------------------------------------------------------------------
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
  --
  component lb_target_spi
    generic (
      C_SCK_RATIO : integer;
      C_REG_WIDTH : integer;
      ADDR        : std_logic_vector(15 downto 0));
    port (
      LB_Clk_i   : in  std_logic;
      LB_Reset_i : in  std_logic;
      LB_Addr_i  : in  std_logic_vector(15 downto 0);
      LB_Write_i : in  std_logic;
      LB_Read_i  : in  std_logic;
      LB_Ready_o : out std_logic;
      LB_DataW_i : in  std_logic_vector(15 downto 0);
      LB_DataR_o : out std_logic_vector(15 downto 0);
      spi_en_o   : out std_logic;
      sck_o      : out std_logic;
      sdi_i      : in  std_logic;
      sdo_o      : out std_logic;
      ldacs_n_o  : out std_logic;
      cs_n_o     : out std_logic);
  end component;

  signal LB_Ready_dac : std_logic;
  signal LB_DataR_dac : std_logic_vector(15 downto 0);
  signal dac_spi_en_o : std_logic;
  signal dac_sdi_i    : std_logic;
  signal dac_cs_n     : std_logic;

  signal LB_Ready_adcp   : std_logic;
  signal LB_DataR_adcp   : std_logic_vector(15 downto 0);
  signal LB_Ready_adcio0 : std_logic;
  signal LB_DataR_adcio0 : std_logic_vector(15 downto 0);
  signal LB_Ready_adcio1 : std_logic;
  signal LB_DataR_adcio1 : std_logic_vector(15 downto 0);

-------------------------------------------------------------------------------
  component dcm_user
    port (
      areset : in  std_logic := '0';
      inclk0 : in  std_logic := '0';
      c0     : out std_logic);
  end component;

  component dcm45
    port (
      areset : in  std_logic := '0';
      inclk0 : in  std_logic := '0';
      c0     : out std_logic;
      c1     : out std_logic;
      c2     : out std_logic;
      locked : out std_logic);
  end component;

  signal sys_clk : std_logic;
  signal sys_rst : std_logic;
  signal locked  : std_logic;

  component lb_target_sensor
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
      sensor_i   : in  std_logic);
  end component;

  component io_rec
    generic (
      DATA_WIDTH : integer;
      REG_ADDR   : std_logic_vector(15 downto 0);
      FIFO_ADDR  : std_logic_vector(15 downto 0));
    port (
      rst_n_i    : in  std_logic;
      LB_Clk_i   : in  std_logic;
      LB_Reset_i : in  std_logic;
      LB_Addr_i  : in  std_logic_vector(15 downto 0);
      LB_Write_i : in  std_logic;
      LB_Read_i  : in  std_logic;
      LB_Ready_o : out std_logic;
      LB_DataW_i : in  std_logic_vector(15 downto 0);
      LB_DataR_o : out std_logic_vector(15 downto 0);
      clk_i      : in  std_logic;
      din_i      : in  std_logic_vector(DATA_WIDTH - 1 downto 0));
  end component;

  signal LB_Ready_io : std_logic;
  signal LB_DataR_io : std_logic_vector(15 downto 0);
  signal clk_i      : std_logic;
  signal din_i      : std_logic_vector(7 downto 0);
  
begin  -- behave
  
  PLL_USB_CLK : dcm_user
    port map (
      areset => '0',
      inclk0 => u_ifclk_i,
      c0     => LB_Clk_i);

  PLL_SYS_CLK : dcm45
    port map (
      areset => '0',
      inclk0 => sys_clk_i,
      c0     => gck_o(2),
      c1     => gck_o(1),
      c2     => gck_o(0),
      locked => locked);

--  gck_o(2)       <= sys_clk;
  sys_rst        <= not locked;
-------------------------------------------------------------------------------
  -- 68013 port
  u_fd_io        <= fifo_dout_o when fifo_adr_o(1) = '1' else (others => 'Z');
  fifo_din_i     <= u_fd_io     when fifo_adr_o(1) = '0' else (others => '0');
  fifo_progful_i <= not u_flagc_i;
  fifo_progemp_i <= not u_flaga_i;
  fifo_ful_i     <= not u_flagc_i;
  fifo_emp_i     <= not u_flaga_i;
  u_fifoadr_o    <= fifo_adr_o;
  u_slrd_n_o     <= not fifo_rd_o;
  u_slwr_n_o     <= not fifo_wr_o;
  u_sloe_n_o     <= fifo_adr_o(1);

  LB_Ready_i <= LB_Ready_dac or LB_Ready_rst or LB_Ready_gpio or LB_Ready_wd
                or LB_Ready_adcp or LB_Ready_adcio0 or LB_Ready_adcio1
                or LB_Ready_tmp03 or LB_Ready_io;
  LB_DataR_i <= LB_DataR_dac or LB_DataR_rst or LB_DataR_gpio or LB_DataR_wd
                or LB_DataR_adcp or LB_DataR_adcio0 or LB_DataR_adcio1
                or LB_DataR_tmp03 or LB_DataR_io;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
  -- local bus
  lb_1 : lb
    generic map (
      FIFO_WR_PORT => "10",
      FIFO_RD_PORT => "00")
    port map (
      sys_rst_i      => sys_rst,        --sys_rst_i,
      LB_Clk_i       => LB_Clk_i,
      LB_Addr_o      => LB_Addr_o,
      LB_Write_o     => LB_Write_o,
      LB_Read_o      => LB_Read_o,
      LB_Ready_i     => LB_Ready_i,
      LB_DataW_o     => LB_DataW_o,
      LB_DataR_i     => LB_DataR_i,
      PKTEND_o       => u_pktend_o,
      fifo_emp_i     => fifo_emp_i,
      fifo_ful_i     => fifo_ful_i,
      fifo_progful_i => fifo_progful_i,
      fifo_progemp_i => fifo_progemp_i,
      fifo_wr_o      => fifo_wr_o,
      fifo_rd_o      => fifo_rd_o,
      fifo_adr_o     => fifo_adr_o,
      fifo_din_i     => fifo_din_i,
      fifo_dout_o    => fifo_dout_o);
-------------------------------------------------------------------------------

  io_rec_1: io_rec
    generic map (
      DATA_WIDTH => 8,
      REG_ADDR   => ADDR_CTL_REG,
      FIFO_ADDR  => ADDR_FIFO)
    port map (
      rst_n_i    => locked,
      LB_Clk_i   => LB_Clk_i,
      LB_Reset_i => sys_rst,
      LB_Addr_i  => LB_Addr_o,
      LB_Write_i => LB_Write_o,
      LB_Read_i  => LB_Read_o,
      LB_Ready_o => LB_Ready_io,
      LB_DataW_i => LB_DataW_o,
      LB_DataR_o => LB_DataR_io,
      clk_i      => LB_Clk_i,
      din_i      => din_i);

  din_i <= b0_io(7 downto 0);
  
  DAC7612 : lb_target_spi
    generic map (
      C_SCK_RATIO => C_SCK_RATIO_DAC,
      C_REG_WIDTH => C_REG_WIDTH_DAC,
      ADDR        => ADDR_DAC)
    port map (
      LB_Clk_i   => LB_Clk_i,
      LB_Reset_i => sys_rst,
      LB_Addr_i  => LB_Addr_o,
      LB_Write_i => LB_Write_o,
      LB_Read_i  => LB_Read_o,
      LB_Ready_o => LB_Ready_dac,
      LB_DataW_i => LB_DataW_o,
      LB_DataR_o => LB_DataR_dac,
      spi_en_o   => dac_spi_en_o,
      sck_o      => dac_sck_o,
      sdi_i      => dac_sdi_i,
      sdo_o      => dac_sdo_o,
      ldacs_n_o  => dac_ldacs_n_o,
      cs_n_o     => dac_cs_n_o);

  ADC_POWER : lb_target_spi
    generic map (
      C_SCK_RATIO => C_SCK_RATIO_ADC_P,
      C_REG_WIDTH => C_REG_WIDTH_ADC_P,
      ADDR        => ADDR_ADC_P)
    port map (
      LB_Clk_i   => LB_Clk_i,
      LB_Reset_i => sys_rst,
      LB_Addr_i  => LB_Addr_o,
      LB_Write_i => LB_Write_o,
      LB_Read_i  => LB_Read_o,
      LB_Ready_o => LB_Ready_adcp,
      LB_DataW_i => LB_DataW_o,
      LB_DataR_o => LB_DataR_adcp,
      spi_en_o   => open,
      sck_o      => adcp_sck_o,
      sdi_i      => adcp_sdi_i,
      sdo_o      => adcp_sdo_o,
      ldacs_n_o  => open,
      cs_n_o     => adcp_cs_n_o);

  ADC_IO0 : lb_target_spi
    generic map (
      C_SCK_RATIO => C_SCK_RATIO_ADC_IO0,
      C_REG_WIDTH => C_REG_WIDTH_ADC_IO0,
      ADDR        => ADDR_ADC_IO0)
    port map (
      LB_Clk_i   => LB_Clk_i,
      LB_Reset_i => sys_rst,
      LB_Addr_i  => LB_Addr_o,
      LB_Write_i => LB_Write_o,
      LB_Read_i  => LB_Read_o,
      LB_Ready_o => LB_Ready_adcio0,
      LB_DataW_i => LB_DataW_o,
      LB_DataR_o => LB_DataR_adcio0,
      spi_en_o   => open,
      sck_o      => adcio0_sck_o,
      sdi_i      => adcio0_sdi_i,
      sdo_o      => adcio0_sdo_o,
      ldacs_n_o  => open,
      cs_n_o     => adcio0_cs_n_o);

  ADC_IO1 : lb_target_spi
    generic map (
      C_SCK_RATIO => C_SCK_RATIO_ADC_IO1,
      C_REG_WIDTH => C_REG_WIDTH_ADC_IO1,
      ADDR        => ADDR_ADC_IO1)
    port map (
      LB_Clk_i   => LB_Clk_i,
      LB_Reset_i => sys_rst,
      LB_Addr_i  => LB_Addr_o,
      LB_Write_i => LB_Write_o,
      LB_Read_i  => LB_Read_o,
      LB_Ready_o => LB_Ready_adcio1,
      LB_DataW_i => LB_DataW_o,
      LB_DataR_o => LB_DataR_adcio1,
      spi_en_o   => open,
      sck_o      => adcio1_sck_o,
      sdi_i      => adcio1_sdi_i,
      sdo_o      => adcio1_sdo_o,
      ldacs_n_o  => open,
      cs_n_o     => adcio1_cs_n_o);
-------------------------------------------------------------------------------
  GlobalReset : lb_target_reg
    generic map (
      ADDR => ADDR_RESET_REG)
    port map (
      LB_Clk_i   => LB_Clk_i,
      LB_Reset_i => sys_rst,
      LB_Addr_i  => LB_Addr_o,
      LB_Write_i => LB_Write_o,
      LB_Read_i  => LB_Read_o,
      LB_Ready_o => LB_Ready_rst,
      LB_DataW_i => LB_DataW_o,
      LB_DataR_o => LB_DataR_rst,
      updated_o  => open,
      ctrl_o     => ctrl_rst,
      sta_i      => x"0000");

  GPIO : lb_target_reg
    generic map (
      ADDR => ADDR_GPIO)
    port map (
      LB_Clk_i   => LB_Clk_i,
      LB_Reset_i => sys_rst,
      LB_Addr_i  => LB_Addr_o,
      LB_Write_i => LB_Write_o,
      LB_Read_i  => LB_Read_o,
      LB_Ready_o => LB_Ready_gpio,
      LB_DataW_i => LB_DataW_o,
      LB_DataR_o => LB_DataR_gpio,
      updated_o  => updated_gpio,
      ctrl_o     => ctrl_gpio,
      sta_i      => sta_gpio);

  GEN_GPIO : for i in 0 to GPIO_WIDTH-1 generate
    process (LB_Clk_i)
    begin
      if rising_edge(LB_Clk_i) then
        if updated_gpio = '1' then
          case ctrl_gpio(i*2+1 downto i*2) is
            when "00" =>
              gpio_o(i) <= '0';
            when "01" =>
              gpio_o(i) <= '1';
            when "10" =>
              gpio_o(i) <= 'Z';
            when others =>
              gpio_o(i) <= 'Z';
          end case;
        end if;
      end if;
    end process;
  end generate GEN_GPIO;

  lb_target_reg_2 : lb_target_reg
    generic map (
      ADDR => ADDR_WD)
    port map (
      LB_Clk_i   => LB_Clk_i,
      LB_Reset_i => sys_rst,
      LB_Addr_i  => LB_Addr_o,
      LB_Write_i => LB_Write_o,
      LB_Read_i  => LB_Read_o,
      LB_Ready_o => LB_Ready_wd,
      LB_DataW_i => LB_DataW_o,
      LB_DataR_o => LB_DataR_wd,
      updated_o  => updated_wd,
      ctrl_o     => ctrl_wd,
      sta_i      => sta_wd);

  TMP03 : lb_target_sensor
    generic map (
      ADDR => ADDR_TMP03)
    port map (
      LB_Clk_i   => LB_Clk_i,
      LB_Reset_i => sys_rst,
      LB_Addr_i  => LB_Addr_o,
      LB_Write_i => LB_Write_o,
      LB_Read_i  => LB_Read_o,
      LB_Ready_o => LB_Ready_tmp03,
      LB_DataW_i => LB_DataW_o,
      LB_DataR_o => LB_DataR_tmp03,
      sensor_i   => sensor_i);

end behave;
