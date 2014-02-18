-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : lb_target_chip.vhd
-- Author     : Liu  <liu@T410>
-- Company    : 
-- Created    : 2013-10-12
-- Last update: 2013-10-31
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2013 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author      Description
-- 2013-10-12  1.0      Liu         Created  
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity lb_target_chip is

  generic (
    BASE_ADDR : integer;
    N_REG     : integer);

  port (
    LB_Clk   : in  std_logic;
    LB_Reset : in  std_logic;
    LB_CS    : in  std_logic;
    LB_ADS   : in  std_logic;
    LB_ACK   : out std_logic;
    LB_Addr  : in  std_logic_vector(13 downto 2);
    LB_Write : in  std_logic;
    LB_Valid : in  std_logic;
    LB_DataW : in  std_logic_vector(31 downto 0);
    LB_Ready : out std_logic;
    LB_DataR : out std_logic_vector(31 downto 0);

    -- ififo
    ififo_space_cnt : in  std_logic_vector(31 downto 0);
    ififo_wr_en     : out std_logic;
    ififo_data      : out std_logic_vector(31 downto 0);

    ofifo_cnt   : in  std_logic_vector(31 downto 0);
    ofifo_empty : in  std_logic;
    ofifo_rd_en : out std_logic;
    ofifo_q     : in  std_logic_vector(31 downto 0);

    -- reg
    reg_updated : out std_logic_vector(N_REG-1 downto 0);
    reg_ctrl    : out std_logic_vector(N_REG*32-1 downto 0);
    reg_sta     : in  std_logic_vector(N_REG*32-1 downto 0));

end lb_target_chip;

architecture archi of lb_target_chip is

  component lb_target_ififo
    generic (
      CNT_REG_ADDR_4B  : integer;
      DATA_REG_ADDR_4B : integer);
    port (
      LB_Clk_i      : in  std_logic;
      LB_Reset_i    : in  std_logic;
      LB_CS_i       : in  std_logic;
      LB_ADS_i      : in  std_logic;
      LB_ACK_o      : out std_logic;
      LB_Addr_i     : in  std_logic_vector(13 downto 2);
      LB_Write_i    : in  std_logic;
      LB_Valid_i    : in  std_logic;
      LB_DataW_i    : in  std_logic_vector(31 downto 0);
      LB_Ready_o    : out std_logic;
      LB_DataR_o    : out std_logic_vector(31 downto 0);
      fifo_cnt_i    : in  std_logic_vector(31 downto 0);
      fifo_q_i      : in  std_logic_vector(31 downto 0);
      fifo_rd_en_o  : out std_logic;
      fifo_rd_ack_i : in  std_logic);
  end component;

  component lb_target_ofifo
    generic (
      CNT_REG_ADDR_4B  : integer;
      DATA_REG_ADDR_4B : integer);
    port (
      LB_Clk_i         : in  std_logic;
      LB_Reset_i       : in  std_logic;
      LB_CS_i          : in  std_logic;
      LB_ADS_i         : in  std_logic;
      LB_ACK_o         : out std_logic;
      LB_Addr_i        : in  std_logic_vector(13 downto 2);
      LB_Write_i       : in  std_logic;
      LB_Valid_i       : in  std_logic;
      LB_DataW_i       : in  std_logic_vector(31 downto 0);
      LB_Ready_o       : out std_logic;
      LB_DataR_o       : out std_logic_vector(31 downto 0);
      fifo_space_cnt_i : in  std_logic_vector(31 downto 0);
      fifo_busy_i      : in  std_logic;
      fifo_d_o         : out std_logic_vector(31 downto 0);
      fifo_wr_en_o     : out std_logic);
  end component;

--  component lb_target_ofifo
--    generic (
--      CNT_REG_ADDR_4B  : integer;
--      DATA_REG_ADDR_4B : integer);
--    port (
--      LB_Clk_i         : in  std_logic;
--      LB_Reset_i       : in  std_logic;
--      LB_CS_i          : in  std_logic;
--      LB_ADS_i         : in  std_logic;
--      LB_ACK_o         : out std_logic;
--      LB_Addr_i        : in  std_logic_vector(13 downto 2);
--      LB_Write_i       : in  std_logic;
--      LB_Valid_i       : in  std_logic;
--      LB_DataW_i       : in  std_logic_vector(31 downto 0);
--      LB_Ready_o       : out std_logic;
--      LB_DataR_o       : out std_logic_vector(31 downto 0);
--      fifo_d_o         : out std_logic_vector(31 downto 0);
--      fifo_wr_en_o     : out std_logic;
--      fifo_space_cnt_i : in  std_logic_vector(31 downto 0);
--      fifo_busy_i      : in  std_logic);
--  end component;
  
  component lb_target_reg
    generic (
      ADDR_4B : integer);
    port (
      LB_Clk_i   : in  std_logic;
      LB_Reset_i : in  std_logic;
      LB_CS_i    : in  std_logic;
      LB_ADS_i   : in  std_logic;
      LB_ACK_o   : out std_logic;
      LB_Addr_i  : in  std_logic_vector(13 downto 2);
      LB_Write_i : in  std_logic;
      LB_Valid_i : in  std_logic;
      LB_DataW_i : in  std_logic_vector(31 downto 0);
      LB_Ready_o : out std_logic;
      LB_DataR_o : out std_logic_vector(31 downto 0);
      updated_o  : out std_logic;
      ctrl_o     : out std_logic_vector(31 downto 0);
      sta_i      : in  std_logic_vector(31 downto 0));
  end component;

  constant N_TARGET : integer := N_REG+2;

  signal LB_ACK_v   : std_logic_vector(N_TARGET-1 downto 0);
  signal LB_Ready_v : std_logic_vector(N_TARGET-1 downto 0);
  signal LB_DataR_v : std_logic_vector((N_TARGET)*32-1 downto 0);

  signal ofifo_rd_ack    : std_logic;
  signal ofifo_rd_en_dup : std_logic;
  
begin  -- archi

  

  LB_ACK   <= '1' when conv_integer(LB_ACK_v) /= 0   else '0';
  LB_Ready <= '1' when conv_integer(LB_Ready_v) /= 0 else '0';

  process(LB_DataR_v)
    variable vec : std_logic_vector(N_TARGET-1 downto 0);
  begin

    -- per bit
    for b in 31 downto 0 loop

      -- collect bit b from all targets
      for n in N_TARGET-1 downto 0 loop
        vec(n) := LB_DataR_v(n*32+b);
      end loop;

      if conv_integer(vec) /= 0 then
        LB_DataR(b) <= '1';
      else
        LB_DataR(b) <= '0';
      end if;
      
    end loop;
  end process;



  ofifo_to_lb : lb_target_ififo
    generic map (
      CNT_REG_ADDR_4B  => BASE_ADDR+1,
      DATA_REG_ADDR_4B => BASE_ADDR)
    port map (
      LB_Clk_i      => LB_Clk,
      LB_Reset_i    => LB_Reset,
      LB_CS_i       => LB_CS,
      LB_ADS_i      => LB_ADS,
      LB_ACK_o      => LB_ACK_v(0),
      LB_Addr_i     => LB_Addr,
      LB_Write_i    => LB_Write,
      LB_Valid_i    => LB_Valid,
      LB_DataW_i    => LB_DataW,
      LB_Ready_o    => LB_Ready_v(0),
      LB_DataR_o    => LB_DataR_v(31 downto 0),
      fifo_cnt_i    => ofifo_cnt,
      fifo_q_i      => ofifo_q,
      fifo_rd_en_o  => ofifo_rd_en_dup,
      fifo_rd_ack_i => ofifo_rd_ack);

  ofifo_rd_en  <= ofifo_rd_en_dup;
  ofifo_rd_ack <= ofifo_rd_en_dup and (not ofifo_empty);

--  lb_to_ififo : lb_target_ofifo
--    generic map (
--      CNT_REG_ADDR_4B  => BASE_ADDR+3,
--      DATA_REG_ADDR_4B => BASE_ADDR+2)
--    port map (
--      LB_Clk_i         => LB_Clk,
--      LB_Reset_i       => LB_Reset,
--      LB_CS_i          => LB_CS,
--      LB_ADS_i         => LB_ADS,
--      LB_ACK_o         => LB_ACK_v(1),
--      LB_Addr_i        => LB_Addr,
--      LB_Write_i       => LB_Write,
--      LB_Valid_i       => LB_Valid,
--      LB_DataW_i       => LB_DataW,
--      LB_Ready_o       => LB_Ready_v(1),
--      LB_DataR_o       => LB_DataR_v(63 downto 32),
--      fifo_space_cnt_i => ififo_space_cnt,
--      fifo_busy_i      => '0',          -- never busy
--      fifo_d_o         => ififo_data,
--      fifo_wr_en_o     => ififo_wr_en);

  lb_to_ififo: lb_target_ofifo
    generic map (
      CNT_REG_ADDR_4B  => BASE_ADDR+3,
      DATA_REG_ADDR_4B => BASE_ADDR+2)
    port map (
      LB_Clk_i         => LB_Clk,
      LB_Reset_i       => LB_Reset,
      LB_CS_i          => LB_CS,
      LB_ADS_i         => LB_ADS,
      LB_ACK_o         => LB_ACK_v(1),
      LB_Addr_i        => LB_Addr,
      LB_Write_i       => LB_Write,
      LB_Valid_i       => LB_Valid,
      LB_DataW_i       => LB_DataW,
      LB_Ready_o       => LB_Ready_v(1),
      LB_DataR_o       => LB_DataR_v(63 downto 32),
      fifo_d_o         => ififo_data,
      fifo_wr_en_o     => ififo_wr_en,
      fifo_space_cnt_i => ififo_space_cnt,
      fifo_busy_i      => '0');

  g : for i in N_REG-1 downto 0 generate
    reg : lb_target_reg
      generic map (
        ADDR_4B => BASE_ADDR+4+i)
      port map (
        LB_Clk_i   => LB_Clk,
        LB_Reset_i => LB_Reset,
        LB_CS_i    => LB_CS,
        LB_ADS_i   => LB_ADS,
        LB_ACK_o   => LB_ACK_v(i+2),
        LB_Addr_i  => LB_Addr,
        LB_Write_i => LB_Write,
        LB_Valid_i => LB_Valid,
        LB_DataW_i => LB_DataW,
        LB_Ready_o => LB_Ready_v(i+2),
        LB_DataR_o => LB_DataR_v((i+2)*32+31 downto (i+2)*32),
        updated_o  => reg_updated(i),
        ctrl_o     => reg_ctrl((i+1)*32-1 downto i*32),
        sta_i      => reg_sta((i+1)*32-1 downto i*32));
  end generate;
  
end archi;
