-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : ssram_tester.vhd
-- Author     :   <Liu Peng@GKHY-LIUPENG>
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
-- 2011-04-19  1.0      Liu Peng        Created
-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity ssram_tester is

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
    q_i    : in std_logic_vector(DATA_WIDTH - 1 downto 0));

end ssram_tester;

architecture archi of ssram_tester is
  
  constant DEPTH : integer := 20;       --  2 ** ADDR_WIDTH;

  type state_t is (s_idle, s_write, s_read);

  signal state   : state_t;
  signal cnt_int : integer range DEPTH - 1 downto 0;
  signal rd, we  : std_logic;
  
begin  -- archi

  we_o   <= we;
  rd_o   <= rd;
  addr_o <= conv_std_logic_vector(cnt_int, ADDR_WIDTH);
  d_o    <= conv_std_logic_vector(cnt_int, DATA_WIDTH);

  process (clk_i, rst_i)
  begin
    if rst_i = '1' then
      state <= s_idle;
      rd    <= '0';
      we    <= '0';
    elsif rising_edge(clk_i) then
      case state is
        when s_idle =>
          state   <= s_write;
          rd      <= '0';
          we      <= '1';
          cnt_int <= 0;

        when s_write =>
          if cnt_int = DEPTH - 1 then
            state   <= s_read;
            cnt_int <= 0;
            rd      <= '1';
            we      <= '0';
          else
            cnt_int <= cnt_int + 1;
          end if;

        when s_read =>
          if cnt_int = DEPTH - 1 then
            state   <= s_idle;
            cnt_int <= 0;
            rd      <= '0';
            we      <= '0';
          else
            cnt_int <= cnt_int + 1;
          end if;

        when others =>
          state <= s_idle;
      end case;
    end if;
  end process;

end archi;
