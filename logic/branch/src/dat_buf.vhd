-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : dat_buf.vhd
-- Author     :   <Administrator@CHINA-6C7FF0513>
-- Company    : 
-- Created    : 2010-05-17
-- Last update: 2011-04-19
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
    clk_i               : in  std_logic;  -- clk for ADC lvds port
    rst_i               : in  std_logic;
    -- cmd port
    task_start          : in  std_logic;
    task_length         : in  std_logic_vector(15 downto 0);
    -- data in port
    din_i               : in  std_logic_vector(63 downto 0);
    fifo_almost_empty_i : in  std_logic;
    fifo_rd_o           : out std_logic;
    fifo_rst_n_o        : out std_logic;
    --
    rd_clk_i            : in  std_logic;
    rd_i                : in  std_logic;
    empty_o             : out std_logic;
    dout_o              : out std_logic_vector(15 downto 0);
    -- SSRAM 0
    ssram_din_i         : in  std_logic_vector(63 downto 0);
    ssram_dout_o        : out std_logic_vector(63 downto 0);
    ssram0_adr_o        : out std_logic_vector(18 downto 0);
    ssram0_dout_en_o    : out std_logic;
    ssram0_adv_n_o      : out std_logic;
    ssram0_adsp_n_o     : out std_logic;
    ssram0_adsc_n_o     : out std_logic;
    ssram0_gw_n_o       : out std_logic;
    ssram0_ce_n_o       : out std_logic;
    ssram0_ce2_n_o      : out std_logic;
    ssram0_ce2_o        : out std_logic;
    ssram0_bwa_n_o      : out std_logic;
    ssram0_bwb_n_o      : out std_logic;
    ssram0_bwc_n_o      : out std_logic;
    ssram0_bwd_n_o      : out std_logic;
    ssram0_bwe_n_o      : out std_logic;
    ssram0_oe_n_o       : out std_logic;
    ssram0_zz_o         : out std_logic;
    ssram0_mode_o       : out std_logic;
    -- SSRAM 1
    ssram1_bwa_n_o      : out std_logic;
    ssram1_bwb_n_o      : out std_logic;
    ssram1_bwc_n_o      : out std_logic;
    ssram1_bwd_n_o      : out std_logic
    );

end dat_buf;

architecture behave of dat_buf is
  -- fifo define, 64bit input, 16bit output
  component fifo64to16
    port (
      aclr    : in  std_logic := '0';
      data    : in  std_logic_vector (63 downto 0);
      rdclk   : in  std_logic;
      rdreq   : in  std_logic;
      wrclk   : in  std_logic;
      wrreq   : in  std_logic;
      q       : out std_logic_vector (15 downto 0);
      rdempty : out std_logic;
      rdusedw : out std_logic_vector (14 downto 0);
      wrfull  : out std_logic;
      wrusedw : out std_logic_vector (12 downto 0));
  end component;
  --
  signal fifo_data_in : std_logic_vector(63 downto 0);
  signal rdclk        : std_logic;
  signal rdreq        : std_logic;
  signal wrclk        : std_logic;
  signal wrreq        : std_logic;
  signal wrreq_new    : std_logic;

  signal rdempty : std_logic;
  signal rdusedw : std_logic_vector (14 downto 0);

  signal wrfull         : std_logic;
  signal almost_full    : std_logic;
  signal wrusedw        : std_logic_vector (12 downto 0);
  signal buf_dout       : std_logic_vector(15 downto 0);
  signal LB_Ready_buf_o : std_logic;
  signal selected       : std_logic;

  -- FSM define
  type FSMState is (
    IDLE,
    WT_STORE,
    STORE,
    MID_STATE,
    RECEPTION,
    WT_RECEPTION);

  signal cs, ns         : FSMState;
  -- 
  signal ssram_adr      : std_logic_vector(18 downto 0);  -- 
  signal ssram_dout_en  : std_logic;
  signal ssram_adv_n_o  : std_logic;                      -- 
  signal ssram_adsp_n_o : std_logic;                      -- 
  signal ssram_adsc_n_o : std_logic;                      -- 
  signal ssram_gw_n     : std_logic;                      -- 
  signal ssram_ce_n_o   : std_logic;                      -- 
  signal ssram_bwa_n_o  : std_logic;                      --
  signal ssram_bwb_n_o  : std_logic;                      --
  signal ssram_bwc_n_o  : std_logic;                      --
  signal ssram_bwd_n_o  : std_logic;                      --
  signal ssram_bwe_n_o  : std_logic;                      -- 
  signal ssram_oe_n     : std_logic;                      -- 
  signal ssram_zz_o     : std_logic;                      -- 
  signal ssram_mode_o   : std_logic;                      --

  --
  signal task_start_r, task_start_rr, task_start_r3 : std_logic;
  signal temp                                       : std_logic_vector(63 downto 0);
  signal wrreq_r, wrreq_rr                          : std_logic;


  signal clk             : std_logic;
  signal ssram_dout_en_r : std_logic;
  signal ssram_dout_r    : std_logic_vector(63 downto 0);
  signal adv_cnt         : integer   := 0;
  signal fifo_rd_o_r     : std_logic := '0';
  
begin  -- behave

  clk <= clk_i;

  fifo_rst_n_o <= task_start_r3;

  -- ssram0
  ssram0_bwa_n_o  <= ssram_gw_n;
  ssram0_bwb_n_o  <= ssram_gw_n;
  ssram0_bwc_n_o  <= ssram_gw_n;
  ssram0_bwd_n_o  <= ssram_gw_n;
  ssram0_zz_o     <= '0';
  ssram0_bwe_n_o  <= '0';
  ssram0_mode_o   <= '0';                        -- liner burst
  ssram0_adsp_n_o <= '1';
--  ssram0_adv_n_o  <= (ssram_gw_n and ssram_oe_n);  --ssram_gw_n;
  --ssram0_adv_n_o  <= '0' when (cs = STORE and adv_cnt = 0) or (cs = RECEPTION and adv_cnt = 0) else '1';
  ssram0_adsc_n_o <= ssram_gw_n and ssram_oe_n;  --ssram_adsc_n_o;

  process (clk_i, rst_i)
  begin  -- process
    if rst_i = '1' then                     -- asynchronous reset (active low)
      ssram0_adv_n_o <= '1';
    elsif clk_i'event and clk_i = '1' then  -- rising clock edge
      if (cs = STORE and adv_cnt = 0) or (cs = RECEPTION and adv_cnt = 0) then
        ssram0_adv_n_o <= '0';
      else
        ssram0_adv_n_o <= '1';
      end if;
    end if;
  end process;

  ssram0_gw_n_o <= ssram_gw_n;
--  process (clk)
--  begin  -- process
--      if rising_edge(clk) then
--          ssram0_gw_n_o   <= ssram_gw_n;
--      end if;
--  end process;
  ssram0_oe_n_o <= ssram_oe_n;

  ssram0_ce_n_o  <= '0';                --ssram_ce_n_o;
  ssram0_ce2_n_o <= '0';                --ssram_ce_n_o;
  ssram0_ce2_o   <= '1';                --not ssram_ce_n_o;
  -- ssram1
  ssram1_bwa_n_o <= ssram_gw_n;
  ssram1_bwb_n_o <= ssram_gw_n;
  ssram1_bwc_n_o <= ssram_gw_n;
  ssram1_bwd_n_o <= ssram_gw_n;

	fifo_rd_o     <= fifo_rd_o_r;
-- FSM
-- purpose: Generate next cs state
  FSM_CS_GEN : process (clk, rst_i)
  begin  -- process FSM_CS_GEN
    if rst_i = '1' then                 -- asynchronous reset (active low)
      cs            <= IDLE;
      task_start_r  <= '0';
      task_start_rr <= '0';
      task_start_r3 <= '0';
      ssram0_adr_o  <= (others => '0');
      adv_cnt       <= 0;
--      fifo_rd_o     <= '0';
    elsif clk'event and clk = '1' then  -- rising clock edge
      cs            <= ns;
      task_start_r  <= task_start;
      task_start_rr <= task_start_r;
      task_start_r3 <= task_start_rr;
      ssram0_adr_o  <= ssram_adr;
--      fifo_rd_o     <= fifo_rd_o_r;
      if cs = STORE or cs = RECEPTION then
        if adv_cnt /= 3 then
          adv_cnt <= adv_cnt + 1;
        else
          adv_cnt <= 0;
        end if;
      else
        adv_cnt <= 0;
      end if;
    end if;
  end process FSM_CS_GEN;
-- purpose: Generate output
  FSM_OUTPUT_GEN : process (clk, rst_i)
  begin  -- process FSM_NS_GEN
    if rst_i = '1' then                 -- asynchronous reset (active low)
      ssram_adr     <= (others => '0');
      ssram_gw_n    <= '1';
      ssram_oe_n    <= '1';
      ssram_dout_en <= '0';
      wrreq         <= '0';
      fifo_rd_o_r   <= '0';
    elsif clk'event and clk = '1' then  -- rising clock edge
      case cs is
        when IDLE =>
          ssram_adr     <= (others => '0');
          ssram_gw_n    <= '1';
          ssram_oe_n    <= '1';
          ssram_dout_en <= '1';
          wrreq         <= '0';
          fifo_rd_o_r   <= '0';
        when WT_STORE =>
          ssram_adr     <= ssram_adr;
          ssram_gw_n    <= '1';
          ssram_oe_n    <= '1';
          ssram_dout_en <= '1';
          wrreq         <= '0';
          fifo_rd_o_r   <= '0';
        when STORE =>
          ssram_adr     <= ssram_adr + 1;
          ssram_gw_n    <= '0';
          ssram_oe_n    <= '1';
          ssram_dout_en <= '1';
          wrreq         <= '0';
          fifo_rd_o_r   <= '1';
        when MID_STATE =>
          ssram_adr     <= (others => '0');
          ssram_gw_n    <= '1';
          ssram_oe_n    <= '1';
          ssram_dout_en <= '1';
          wrreq         <= '0';
          fifo_rd_o_r   <= '0';
        when WT_RECEPTION =>
          ssram_adr     <= ssram_adr;
          ssram_gw_n    <= '1';
          ssram_oe_n    <= '0';
          ssram_dout_en <= '0';
          wrreq         <= '0';
          fifo_rd_o_r   <= '0';
        when RECEPTION =>
          ssram_adr     <= ssram_adr + 1;
          ssram_gw_n    <= '1';
          ssram_oe_n    <= '0';
          ssram_dout_en <= '0';
          wrreq         <= '1';
          fifo_rd_o_r   <= '0';
        when others => null;
      end case;
    end if;
  end process FSM_OUTPUT_GEN;
-- purpose: Generate next ns state
  FSM_NS_GEN : process (almost_full, cs, fifo_almost_empty_i, ssram_adr,
                        task_length, task_start_r3, task_start_rr)
  begin  -- process FSM_NS_GEN
    case cs is
      when IDLE =>
        if task_start_rr = '1' and task_start_r3 = '0' then
          ns <= STORE;
        else
          ns <= IDLE;
        end if;
      when WT_STORE =>
        
        if fifo_almost_empty_i = '0' then
          ns <= STORE;
        else
          ns <= WT_STORE;
        end if;

      when STORE =>
        if adv_cnt = 3 then
          if fifo_almost_empty_i = '0' then
            if ssram_adr = task_length & "111" then
              ns <= MID_STATE;
            else
              ns <= STORE;
            end if;
          else
            ns <= WT_STORE;
          end if;
        else
          ns <= STORE;
        end if;
      when MID_STATE =>
        ns <= WT_RECEPTION;
      when WT_RECEPTION =>
        if almost_full = '0' then
          ns <= RECEPTION;
        else
          ns <= WT_RECEPTION;
        end if;
      when RECEPTION =>
        if adv_cnt = 3 then
          if almost_full = '1' then
            ns <= WT_RECEPTION;
          else
            if ssram_adr = task_length & "111" then
              ns <= IDLE;
            else
              ns <= RECEPTION;
            end if;
          end if;
        else
          ns <= RECEPTION;
        end if;
      when others =>
        ns <= IDLE;
    end case;
  end process FSM_NS_GEN;

  process (clk, rst_i)
  begin  -- process
    if rst_i = '1' then
      ssram_dout_r     <= (others => '0');
      ssram_dout_o     <= (others => '0');
      ssram_dout_en_r  <= '0';
      ssram0_dout_en_o <= '0';
      fifo_data_in     <= (others => '0');
      wrreq_r          <= '0';
      wrreq_rr         <= '0';
    elsif clk'event and clk = '1' then  -- rising clock edge
      ssram_dout_r    <= din_i;
      ssram_dout_o    <= ssram_dout_r;
      ssram_dout_en_r <= ssram_dout_en;

      ssram0_dout_en_o <= ssram_dout_en_r;
      fifo_data_in     <= ssram_din_i;
      wrreq_r          <= wrreq;
      wrreq_rr         <= wrreq_r;
    end if;
  end process;

  -- fifo
  fifo64to16_1 : fifo64to16
    port map (
      aclr    => rst_i,
      wrclk   => clk,
      wrreq   => wrreq_rr,
      wrfull  => wrfull,
      wrusedw => wrusedw,
      data    => ssram_din_i,
      --
      rdclk   => rd_clk_i,
      rdreq   => rd_i,
      rdempty => rdempty,
      rdusedw => rdusedw,
      q       => dout_o
      );

  almost_full <= '1' when wrusedw(11 downto 0) > x"f00" or wrfull = '1' else '0';  --ext("1", wrusedw'length) or wrfull = '1'  else '0';
--  almost_empty <= '1' when rdusedw < x"040" or rdempty = '1' else '0';  --ext("1", rdusedw'length) or rdempty = '1' else '0';
  empty_o     <= rdempty;               --almost_empty;

  
end behave;
