-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : ssram_fifo_tester.vhd
-- Author     :   <Administrator@HEAVEN>
-- Company    : 
-- Created    : 2011-04-19
-- Last update: 2011-04-19
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

entity ssram_fifo_tester is

  generic (
    DATA_WIDTH : integer := 32;
    ADDR_WIDTH : integer := 19);
  port (
    clk_i : in std_logic;
    rst_i : in std_logic;

    reset_fifo_o : out std_logic;
    count_o      : in  integer range 2**ADDR_WIDTH downto 0;
    empty_o      : in  std_logic;
    full_o       : in  std_logic;

    wr_i  : out std_logic;
    d_i   : out std_logic_vector(DATA_WIDTH - 1 downto 0);
    rd_i  : out std_logic;
    vld_o : in  std_logic;
    q_o   : in  std_logic_vector(DATA_WIDTH - 1 downto 0));

end ssram_fifo_tester;

architecture arcdhi of ssram_fifo_tester is

  constant DEPTH : integer := 2**ADDR_WIDTH;
  signal   cnt   : integer range DEPTH - 1 downto 0;

  type   state_t is (s_idle, s_reset_fifo , s_write, s_read);
  signal state : state_t;
  
begin  -- arcdhi

  d_i <= conv_std_logic_vector(cnt, d_i'length);

  process (clk_i, rst_i)
  begin
    if rst_i = '1' then
      state        <= s_idle;
      rd_i         <= '0';
      wr_i         <= '0';
      reset_fifo_o <= '1';
    elsif rising_edge(clk_i) then
      case state is
        when s_idle =>
          state        <= s_reset_fifo;
          rd_i         <= '0';
          wr_i         <= '0';
          reset_fifo_o <= '1';


        when s_reset_fifo =>
          state        <= s_write;
          cnt          <= 0;
          rd_i         <= '0';
          wr_i         <= '1';
          reset_fifo_o <= '0';

        when s_write =>
          if cnt = DEPTH - 1 then
            state <= s_read;
            cnt   <= 0;
            rd_i  <= '1';
            wr_i  <= '0';
          else
            cnt <= cnt + 1;
          end if;

        when s_read =>
          if cnt = DEPTH - 1 then
            state <= s_idle;
            cnt   <= 0;
            rd_i  <= '0';
            wr_i  <= '0';
          else
            cnt <= cnt + 1;
          end if;
          
        when others =>
          state <= s_idle;
      end case;
    end if;
  end process;

end arcdhi;
