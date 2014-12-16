-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : lb_target_spi_64b.vhd
-- Author     :   <Administrator@PC-201105271714>
-- Company    : 
-- Created    : 2013-08-03
-- Last update: 2014-11-26
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2013 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2013-08-03  1.0      Administrator   Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity lb_target_spi_64b is
  generic (
    ADDR_4B        : integer;
    CPOL           : std_logic := '0';  -- SPI mode selection (mode 0 default)
    CPHA           : std_logic := '0';  -- CPOL = clock polarity, CPHA = clock phase.
    SPI_2X_CLK_DIV : integer);

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

    sck_o    : out std_logic;
    sdi_i    : in  std_logic;
    sdo_o    : out std_logic;
    cs_n_o   : out std_logic;
    update_o : out std_logic
    );

end lb_target_spi_64b;

architecture impl of lb_target_spi_64b is

  constant MSB             : integer := 4;
  constant C_REG_WIDTH_64B : integer := MSB * 16 + 8;
  constant C_REG_WIDTH_32B : integer := MSB/2 * 16 + 8;
  type     ARRAY_16b is array (MSB downto 0) of std_logic_vector(15 downto 0);

  signal LB_ACK   : std_logic_vector(MSB downto 0);
  signal LB_Ready : std_logic_vector(MSB downto 0);
  signal updated  : std_logic_vector(MSB downto 0);
  signal LB_DataR : ARRAY_16b;
  signal ctrl_l   : ARRAY_16b;
  signal sta_l    : ARRAY_16b;

  signal cnt : integer range 0 to 3;

  signal ctrl_64b   : std_logic_vector(C_REG_WIDTH_64B-1 downto 0);
  signal sta_64b    : std_logic_vector(C_REG_WIDTH_64B-1 downto 0);
  signal data_i_64b : std_logic_vector(C_REG_WIDTH_64B-1 downto 0);
  signal data_o_64b : std_logic_vector(C_REG_WIDTH_64B-1 downto 0);

  signal ctrl_32b   : std_logic_vector(C_REG_WIDTH_32B-1 downto 0);
  signal sta_32b    : std_logic_vector(C_REG_WIDTH_32B-1 downto 0);
  signal data_i_32b : std_logic_vector(C_REG_WIDTH_32B-1 downto 0);
  signal data_o_32b : std_logic_vector(C_REG_WIDTH_32B-1 downto 0);

  signal task_start_i : std_logic;
  signal spi_wren_i   : std_logic := '0';
  signal spi_en_o     : std_logic;
  signal cs_n         : std_logic;
  signal cs_n_r       : std_logic;

  signal spi_ssel_o_64b : std_logic;
  signal spi_sck_o_64b  : std_logic;
  signal spi_mosi_o_64b : std_logic;
  signal spi_miso_i_64b : std_logic := 'X';
  signal update_64b     : std_logic;

  signal spi_ssel_o_32b : std_logic;
  signal spi_sck_o_32b  : std_logic;
  signal spi_mosi_o_32b : std_logic;
  signal spi_miso_i_32b : std_logic := 'X';
  signal update_32b     : std_logic;
  
begin  -- impl

  LB_Ready_o <= LB_Ready(4) or LB_Ready(3) or LB_Ready(2) or LB_Ready(1) or LB_Ready(0);
  LB_ACK_o   <= LB_ACK(4) or LB_ACK(3) or LB_ACK(2) or LB_ACK(1) or LB_ACK(0);
  LB_DataR_o <= LB_DataR(4) or LB_DataR(3) or LB_DataR(2) or LB_DataR(1) or LB_DataR(0);

  GEN_regs : for i in 4 downto 0 generate
    reg_l : entity work.lb_target_reg
      generic map (
        ADDR_4B => ADDR_4B+i)
      port map (
        LB_Clk_i   => LB_Clk_i,
        LB_Reset_i => LB_Reset_i,
        LB_CS_i    => LB_CS_i,
        LB_ADS_i   => LB_ADS_i,
        LB_ACK_o   => LB_ACK(i),
        LB_Addr_i  => LB_Addr_i,
        LB_Write_i => LB_Write_i,
        LB_Valid_i => LB_Valid_i,
        LB_DataW_i => LB_DataW_i,
        LB_Ready_o => LB_Ready(i),
        LB_DataR_o => LB_DataR(i),
        updated_o  => updated(i),
        ctrl_o     => ctrl_l(i),
        sta_i      => sta_l(i));
  end generate GEN_regs;

  ctrl_64b     <= ctrl_l(4)(7 downto 0) & ctrl_l(3) & ctrl_l(2) & ctrl_l(1) & ctrl_l(0);
--  sta_64b <= ;
  task_start_i <= updated(MSB);
  data_i_64b   <= ctrl_64b(C_REG_WIDTH_64B-1 downto 0);

  spi_master_64b : entity work.spi_master
    generic map (
      N              => C_REG_WIDTH_64B,
      CPOL           => CPOL,
      CPHA           => CPHA,
      PREFETCH       => 1,
      SPI_2X_CLK_DIV => SPI_2X_CLK_DIV)
    port map (
      sclk_i     => LB_Clk_i,
      pclk_i     => LB_Clk_i,
      rst_i      => LB_Reset_i,
      spi_ssel_o => spi_ssel_o_64b,
      spi_sck_o  => spi_sck_o_64b,
      spi_mosi_o => spi_mosi_o_64b,
      spi_miso_i => spi_miso_i_64b,
      di_req_o   => open,
      di_i       => data_i_64b,
      wren_i     => task_start_i,
      wr_ack_o   => open,
      do_valid_o => update_64b,
      do_o       => data_o_64b);

  ctrl_32b     <= ctrl_l(4)(7 downto 0) & ctrl_l(1) & ctrl_l(0);
--  sta_64b <= ;
  task_start_i <= updated(MSB);
  data_i_32b   <= ctrl_32b(C_REG_WIDTH_32B-1 downto 0);

  spi_master_32b : entity work.spi_master
    generic map (
      N              => C_REG_WIDTH_32B,
      CPOL           => CPOL,
      CPHA           => CPHA,
      PREFETCH       => 1,
      SPI_2X_CLK_DIV => SPI_2X_CLK_DIV)
    port map (
      sclk_i     => LB_Clk_i,
      pclk_i     => LB_Clk_i,
      rst_i      => LB_Reset_i,
      spi_ssel_o => spi_ssel_o_32b,
      spi_sck_o  => spi_sck_o_32b,
      spi_mosi_o => spi_mosi_o_32b,
      spi_miso_i => spi_miso_i_32b,
      di_req_o   => open,
      di_i       => data_i_32b,
      wren_i     => task_start_i,
      wr_ack_o   => open,
      do_valid_o => update_32b,
      do_o       => data_o_32b);

  process (ctrl_l(MSB)(15))
  begin  -- process
    if ctrl_l(MSB)(15) = '0' then
      cs_n           <= spi_ssel_o_32b;
      sdo_o          <= spi_mosi_o_32b;
      spi_miso_i_32b <= sdi_i;
      sck_o          <= spi_sck_o_32b;
    else
      cs_n           <= spi_ssel_o_64b;
      sdo_o          <= spi_mosi_o_64b;
      spi_miso_i_64b <= sdi_i;
      sck_o          <= spi_sck_o_64b;
    end if;
  end process;

  cs_n_o <= cs_n;

  process (LB_Clk_i)
  begin  -- process
    if rising_edge(LB_Clk_i) then
      cs_n_r <= cs_n;
      case cnt is
        when 0 =>
          if cs_n = '1' and cs_n_r = '0' then
            update_o <= '1';
            cnt      <= cnt + 1;
          else
            update_o <= '0';
            cnt      <= cnt;
          end if;
        when 1 =>
          cnt      <= cnt + 1;
          update_o <= '1';
        when 2 =>
          cnt      <= cnt + 1;
          update_o <= '1';
        when 3 =>
          cnt      <= 0;
          update_o <= '0';
        when others => null;
      end case;
    end if;
  end process;
end impl;
