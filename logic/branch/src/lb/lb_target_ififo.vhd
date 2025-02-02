-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : lb_target_ififo.vhd
-- Author     :   <roc@ROCS-LAPTOP>
-- Company    : 
-- Created    : 2010-01-12
-- Last update: 2014-06-15
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2010 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2010-01-12  1.0      roc     Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity lb_target_ififo is

  generic (
    CNT_REG_ADDR_4B  : integer;
    --  VALVE_REG_ADDR : integer;
    DATA_REG_ADDR_4B : integer);  
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

    fifo_cnt_i    : in  std_logic_vector(15 downto 0);
    fifo_q_i      : in  std_logic_vector(15 downto 0);
    fifo_rd_en_o  : out std_logic;
    fifo_rd_ack_i : in  std_logic);

end lb_target_ififo;

architecture archi of lb_target_ififo is

  component lb_target_reg
    generic (
      ADDR_4B : integer);
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
      updated_o  : out std_logic;
      ctrl_o     : out std_logic_vector(15 downto 0);
      sta_i      : in  std_logic_vector(15 downto 0));
  end component;


  signal LB_ACK_cnt_reg   : std_logic;
  signal LB_Ready_cnt_reg : std_logic;
  signal LB_DataR_cnt_reg : std_logic_vector(15 downto 0);
  signal LB_ACK_fifo      : std_logic;
  signal LB_Ready_fifo    : std_logic;
  signal LB_DataR_fifo    : std_logic_vector(15 downto 0);
  signal fifo_selected    : std_logic;
  signal fifo_rd_en       : std_logic;
  type   state_t is (s_idle, s_read_pre, s_read_fifo, s_write_fifo);
  signal state            : state_t;

  signal ctl, sta    : std_logic_vector(15 downto 0);
  signal ctl_updated : std_logic;

  signal read_cnt : std_logic_vector(15 downto 0);

  signal pre_data_vld : std_logic;
  signal pre_data     : std_logic_vector(15 downto 0);

  signal seal : std_logic;
  
begin  -- archi


  cnt_reg : lb_target_reg
    generic map (
      ADDR_4B => CNT_REG_ADDR_4B)
    port map (
      LB_Clk_i   => LB_Clk_i,
      LB_Reset_i => LB_Reset_i,
      LB_CS_i    => LB_CS_i,
      LB_ADS_i   => LB_ADS_i,
      LB_ACK_o   => LB_ACK_cnt_reg,
      LB_Addr_i  => LB_Addr_i,
      LB_Write_i => LB_Write_i,
      LB_Valid_i => LB_Valid_i,
      LB_DataW_i => LB_DataW_i,
      LB_Ready_o => LB_Ready_cnt_reg,
      LB_DataR_o => LB_DataR_cnt_reg,
      updated_o  => ctl_updated,        -- cnt_reg_updated,
      ctrl_o     => ctl,
      sta_i      => sta);
  sta <= fifo_cnt_i;

  -----------------------------------------------------------------------------


  fifo_selected <= '1' when (LB_CS_i and LB_ADS_i) = '1' and DATA_REG_ADDR_4B = conv_integer(LB_Addr_i) else
                   '0';

  process (LB_Clk_i, LB_Reset_i)
  begin
    if LB_Reset_i = '1' then
      state <= s_idle;
    elsif rising_edge(LB_Clk_i) then
      case state is
        when s_idle =>
          if fifo_selected = '1' then
            if LB_Write_i = '1' then
              state <= s_write_fifo;
            else
--              if pre_data_vld = '1' then
--                state <= s_read_pre;
--              else
                state <= s_read_fifo;
--              end if;
            end if;
          end if;

        when s_read_pre =>
          state <= s_read_fifo;

        when s_read_fifo =>
          if LB_CS_i = '0' then
            state <= s_idle;
          end if;

        when s_write_fifo =>
          if LB_CS_i = '0' then
            state <= s_idle;
          end if;
          
        when others =>
          state <= s_idle;
      end case;
    end if;
  end process;

  process (LB_Clk_i, LB_Reset_i)
  begin
    if LB_Reset_i = '1' then
      pre_data_vld <= '0';
      pre_data     <= (others => '0');
    elsif rising_edge(LB_Clk_i) then
      if state = s_read_fifo and LB_CS_i = '1' then
        pre_data_vld <= fifo_rd_ack_i;
        pre_data     <= fifo_q_i;
      end if;
    end if;
  end process;

  process (fifo_q_i, fifo_rd_ack_i, pre_data, pre_data_vld, state)
  begin
    if state = s_write_fifo then
      LB_Ready_fifo <= '1';
      LB_DataR_fifo <= (others => '0');
    elsif state = s_read_pre then
      LB_Ready_fifo <= pre_data_vld;
      LB_DataR_fifo <= pre_data;
    elsif state = s_read_fifo then
      LB_Ready_fifo <= fifo_rd_ack_i;
      LB_DataR_fifo <= fifo_q_i;
    else
      LB_Ready_fifo <= '0';
      LB_DataR_fifo <= (others => '0');
    end if;
  end process;

  process (LB_Clk_i, LB_Reset_i)
    variable new_read_cnt : std_logic_vector(15 downto 0);
  begin
    if LB_Reset_i = '1' then
      read_cnt <= (others => '0');
      seal     <= '0';
    elsif rising_edge(LB_Clk_i) then
      if ctl_updated = '1' then
        read_cnt <= (others => '0');
        seal     <= '0';
--      elsif fifo_selected = '1' and fifo_rd_ack_i = '1' then
      elsif fifo_rd_ack_i = '1' then
        new_read_cnt := read_cnt + 1;
        read_cnt     <= new_read_cnt;
        if new_read_cnt >= ctl then
          seal <= '1';
        end if;
      end if;
    end if;
  end process;

--  seal <= '1' when read_cnt >= ctl else '0';
--  seal_o <= seal;

  fifo_rd_en <= '1' when state = s_read_fifo and LB_CS_i = '1' and seal = '0' else '0';

  LB_ACK_fifo  <= fifo_selected;
  fifo_rd_en_o <= fifo_rd_en;
  LB_Ready_o   <= LB_Ready_fifo or LB_Ready_cnt_reg;
  LB_DataR_o   <= LB_DataR_fifo or LB_DataR_cnt_reg;
  LB_ACK_o     <= LB_ACK_fifo or LB_ACK_cnt_reg;


end archi;
