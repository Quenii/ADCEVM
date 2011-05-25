-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : dat_buf.vhd
-- Author     :   <Administrator@CHINA-6C7FF0513>
-- Company    : 
-- Created    : 2010-05-17
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
-- 2010-05-17  1.0      Administrator   Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity dat_buf is
  
  port (
    clk_i        : in  std_logic;
    din_i        : in  std_logic_vector(7 downto 0);
    -- cmd port
    rst_i        : in  std_logic;
    task_start_i : in  std_logic;
    -- data out port
    rd_clk_i     : in  std_logic;
    rd_i         : in  std_logic;
    empty_o      : out std_logic;
    dout_o       : out std_logic_vector(15 downto 0)
    );

end dat_buf;

architecture behave of dat_buf is
  component fifo8to16
    port
      (
        aclr    : in  std_logic := '0';
        data    : in  std_logic_vector (7 downto 0);
        rdclk   : in  std_logic;
        rdreq   : in  std_logic;
        wrclk   : in  std_logic;
        wrreq   : in  std_logic;
        q       : out std_logic_vector (15 downto 0);
        rdempty : out std_logic;
        rdusedw : out std_logic_vector (10 downto 0);
        wrfull  : out std_logic;
        wrusedw : out std_logic_vector (11 downto 0)
        );
  end component;
  signal wrreq       : std_logic;
  signal wrfull      : std_logic;
  signal almost_full : std_logic;
  signal wrusedw     : std_logic_vector (11 downto 0);

  -- FSM define
  type FSMState is (
    IDLE,
    STORE,
    MID_STATE,
    RECEPTION,
    WT_RECEPTION);

  signal cs, ns                                     : FSMState;
  signal task_start_r, task_start_rr, task_start_r3 : std_logic;
  signal cnt                                        : integer;
  
begin  -- behave

  task_start_r <= '1' when task_start_i = '1' else
                  '0' when rst_i = '1' else
                  task_start_r;

-- FSM
-- purpose: Generate next cs state
  FSM_CS_GEN : process (clk_i, rst_i)
  begin  -- process FSM_CS_GEN
    if rst_i = '1' then                     -- asynchronous reset (active low)
      cs            <= IDLE;
      task_start_rr <= '0';
      task_start_r3 <= '0';
    elsif clk_i'event and clk_i = '1' then  -- rising clock edge
      cs            <= ns;
      task_start_rr <= task_start_r;
      task_start_r3 <= task_start_rr;
    end if;
  end process FSM_CS_GEN;
-- purpose: Generate output
  FSM_OUTPUT_GEN : process (clk_i, rst_i)
  begin  -- process FSM_NS_GEN
    if rst_i = '1' then                     -- asynchronous reset (active low)
      wrreq <= '0';
      cnt   <= 0;
    elsif clk_i'event and clk_i = '1' then  -- rising clock edge
      case cs is
        when IDLE =>
          wrreq <= '0';
          cnt   <= 0;
        when STORE =>
          wrreq <= '1';
          cnt   <= 0;
        when MID_STATE =>
          wrreq <= '0';
          cnt   <= cnt + 1;
        when others => null;
      end case;
    end if;
  end process FSM_OUTPUT_GEN;
-- purpose: Generate next ns state
  FSM_NS_GEN : process (cs, task_start_r3, task_start_rr, cnt, almost_full)
  begin  -- process FSM_NS_GEN
    case cs is
      when IDLE =>
        if task_start_rr = '1' and task_start_r3 = '0' then
          ns <= MID_STATE;
        else
          ns <= IDLE;
        end if;
      when MID_STATE =>
        if cnt /= 16 then
          ns <= MID_STATE;
        else
          ns <= STORE;
        end if;
      when STORE =>
        if almost_full = '1' then
          ns <= IDLE;
        else
          ns <= STORE;
        end if;
      when others =>
        ns <= IDLE;
    end case;
  end process FSM_NS_GEN;

  -- fifo
  fifo8to16_1 : fifo8to16
    port map (
      aclr    => rst_i,
      data    => din_i,
      rdclk   => rd_clk_i,
      rdreq   => rd_i,
      wrclk   => clk_i,
      wrreq   => wrreq,
      q       => dout_o,
      rdempty => empty_o,
      rdusedw => open,
      wrfull  => wrfull,
      wrusedw => wrusedw);


  almost_full <= '1' when wrusedw > x"7FF" or wrfull = '1' else '0';

end behave;
