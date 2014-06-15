-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : fx2local.vhd
-- Author     :   <Quenii@QUENII-NB>
-- Company    : 
-- Created    : 2014-01-16
-- Last update: 2014-02-18
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: interface between fx2 slavefifo and localbus, read/write
-- respect to localbus;
-------------------------------------------------------------------------------
-- Copyright (c) 2014 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-01-16  1.0      Quenii  Created
-------------------------------------------------------------------------------
-- 
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity fx2local is
  generic (
    WR_ADDR : std_logic_vector(1 downto 0) := "00";
    RD_ADDR : std_logic_vector(1 downto 0) := "10"
    );
  port (
    FX_CLK_i  : in    std_logic;
    FX2FD_io  : inout std_logic_vector (15 downto 0);  -- fifo data/q
    FLAGA_i   : in    std_logic;                       -- program strobe
    FLAGB_i   : in    std_logic;                       -- full
    FLAGC_i   : in    std_logic;                       -- empty
    FLAGD_i   : in    std_logic;                       -- not used
    SLRD_n_o  : out   std_logic;                       -- fifo_rd
    SLWR_n_o  : out   std_logic;                       -- fifo_wr
    SLOE_n_o  : out   std_logic;
    PKTEND_o  : out   std_logic;                       -- not used
    FIFOADR_o : out   std_logic_vector(1 downto 0);    -- fifo adr

    LB_Clk_o   : out std_logic;
    LB_Reset_o : out std_logic;
    LB_CS_o    : out std_logic;
    LB_ADS_o   : out std_logic;
    LB_ACK_i   : in  std_logic;         -- in resonse to ads
    LB_Addr_o  : out std_logic_vector(15 downto 0);
    LB_Write_o : out std_logic;
    LB_Valid_o : out std_logic;
    LB_DataW_o : out std_logic_vector(15 downto 0);

    LB_Ready_i : in std_logic;
    LB_DataR_i : in std_logic_vector(15 downto 0)
    );    
end fx2local;

architecture impl of fx2local is

  type   state_t is (s_idle, s_ads, s_dir, s_read, s_write, s_wait);
  signal state  : state_t;
  signal nstate : state_t;

  signal clk   : std_logic;
  signal rst   : std_logic;
  signal wr_en : std_logic;
  signal rd_en : std_logic;

  signal SLRD    : std_logic;
  signal SLWR    : std_logic;
  signal SLOE    : std_logic;
  signal PKTEND  : std_logic;
  signal FIFOADR : std_logic_vector(1 downto 0);

  signal LB_Clk   : std_logic;
  signal LB_Reset : std_logic;
  signal LB_CS    : std_logic;
  signal LB_ADS   : std_logic;
  signal LB_ACK   : std_logic;
  signal LB_Addr  : std_logic_vector(15 downto 0);
  signal LB_Write : std_logic;
  signal LB_Valid : std_logic;
  signal LB_DataW : std_logic_vector(15 downto 0);
  signal LB_Ready : std_logic;
  signal LB_DataR : std_logic_vector(15 downto 0);

  signal reg_space : std_logic;

  signal length : std_logic_vector(14 downto 0);
  signal cnt    : std_logic_vector(14 downto 0);
begin  -- impl

  LB_Clk_o   <= FX_CLK_i;
  LB_Addr_o  <= LB_Addr;
  LB_ADS_o   <= LB_CS;
  LB_CS_o    <= LB_CS;
  LB_DataW_o <= LB_DataW when state = s_write                 else (others => '0');
  LB_Write_o <= '1'      when state = s_write                 else '0';
  LB_Valid_o <= '1'      when state = s_write and wr_en = '1' else '0';
  LB_Ready   <= LB_Ready_i;

  clk   <= FX_CLK_i;
  wr_en <= FLAGA_i;
  rd_en <= FLAGC_i;                     -- not sure

  LB_DataW  <= FX2FD_io;
  FX2FD_io  <= LB_DataR_i when SLWR = '1' else (others => 'Z');
  FIFOADR_o <= FIFOADR;
  SLWR_n_o  <= not SLWR;
  SLRD_n_o  <= not SLRD;
  SLOE_n_o  <= not SLRD;
  PKTEND_o  <= not PKTEND;

  FIFOADR <= RD_ADDR when state = s_read else WR_ADDR;

--  SLRD <= wr_en and LB_Ready when state /= s_read else '0';
  SLWR <= rd_en and LB_Ready when state = s_read  else '0';
--  SLOE <= '1';

  LB_CS <= '1' when state = s_read or state = s_write else '0';

  process (LB_Ready, state, wr_en)
  begin  -- process
    if state = s_read then
      SLRD <= '0';
    elsif state = s_write then
      SLRD <= wr_en and LB_Ready;
    else
      SLRD <= wr_en;
    end if;
  end process;

  process (clk, rst)
  begin  -- process
    if rst = '1' then
      state     <= s_idle;
      nstate    <= s_idle;
      reg_space <= '1';
      PKTEND    <= '0';
    elsif rising_edge(clk) then
      case state is
        when s_idle =>
          if wr_en = '1' and LB_DataW = x"BC95" then
            state <= s_ads;
          else
            state <= s_idle;
          end if;
          PKTEND <= '0';
        when s_ads =>
          if wr_en = '1' then
            reg_space <= LB_DataW(15);
            LB_Addr <= '0' & LB_DataW(14 downto 0);
            state   <= s_dir;
          end if;

        when s_dir =>
          if wr_en = '1' then
            length    <= LB_DataW(14 downto 0);
            if LB_DataW(15) = '1' then
              state <= s_read;
            else
              state <= s_write;
            end if;
          end if;

        when s_read =>
          if (cnt = length-'1' and reg_space = '0')
            or (cnt = x"FF" and reg_space = '1')
          then
            state <= s_idle;
--            PKTEND <= '1';
          end if;

        when s_write =>
          if reg_space = '1' or cnt = length then
            state <= s_idle;
          end if;
        when others => null;
      end case;
    end if;
  end process;

  process (clk, rst)
  begin  -- process
    if rst = '1' then
      cnt <= (others => '0');
    elsif rising_edge(clk) then
      if state = s_write then
        cnt <= cnt + (wr_en and LB_Ready);
      elsif state = s_read then
        cnt <= cnt + (rd_en and LB_Ready);
      else
        cnt <= (others => '0');
      end if;
      
    end if;
  end process;

end impl;
