-------------------------------------------------------------------------------
-- Title      : testbench
-- Project    : 
-------------------------------------------------------------------------------
-- File       : ddc_tb.vhd
-- Author     :   <Administrator@PC-201210061941>
-- Company    : 
-- Created    : 2013-02-04
-- Last update: 2013-02-07
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2013 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2013-02-04  1.0      Administrator   Created
-------------------------------------------------------------------------------

-- library verilog;
-- use verilog.vl_types.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all;

entity ddc_tb is

  generic (
    ADBITWIDTH     : integer := 16;
    NCOBITWIDTH    : integer := 25;
    FILTERBITWIDTH : integer := 18;
    MIXBITWIDTH    : integer := 22;
    COEBITWIDTH    : integer := 16;
    FIRBITWIDTH    : integer := 26);
  port (
    clk : in std_logic;

    config : in std_logic_vector(1+4+COEBITWIDTH-1 downto 0);

    nco_pass_flag      : in std_logic;
    hb_i_testpass_flag : in std_logic;
    cic_pass_flag      : in std_logic;
    fir_pass_flag      : in std_logic;
    hb_pass_flag       : in std_logic;

    data_in : in std_logic_vector(ADBITWIDTH-1 downto 0);

    nco_sine_test        : out std_logic_vector(NCOBITWIDTH-1 downto 0);
    nco_cosine_test      : out std_logic_vector(NCOBITWIDTH-1 downto 0);
    mixer_i_test         : out std_logic_vector(MIXBITWIDTH-1 downto 0);
    mixer_q_test         : out std_logic_vector(MIXBITWIDTH-1 downto 0);
    nco_i_pass_data_test : out std_logic_vector(FILTERBITWIDTH-1 downto 0);
    nco_q_pass_data_test : out std_logic_vector(FILTERBITWIDTH-1 downto 0);
    hb_i_test            : out std_logic_vector(MIXBITWIDTH-1 downto 0);
    hb_q_test            : out std_logic_vector(MIXBITWIDTH-1 downto 0);
    cic_i_test           : out std_logic_vector(MIXBITWIDTH-1 downto 0);
    cic_q_test           : out std_logic_vector(MIXBITWIDTH-1 downto 0);
    hb_flag              : out std_logic;
    cic_flag             : out std_logic;
    fir_i_result_test    : out std_logic_vector(FIRBITWIDTH-1 downto 0);
    fir_q_result_test    : out std_logic_vector(FIRBITWIDTH-1 downto 0);
    fir_flag             : out std_logic;
    ddc_i_data           : out std_logic_vector(ADBITWIDTH-1 downto 0);
    ddc_q_data           : out std_logic_vector(ADBITWIDTH-1 downto 0);
    ddc_flag             : out std_logic;
    nco_test             : out std_logic_vector(14 downto 0);
    freq_word            : out std_logic_vector(31 downto 0));

end ddc_tb;

architecture archi of ddc_tb is

  component ddc_for_asic
    generic (
      ADBITWIDTH     : integer;
      NCOBITWIDTH    : integer;
      FILTERBITWIDTH : integer;
      MIXBITWIDTH    : integer;
      COEBITWIDTH    : integer;
      FIRBITWIDTH    : integer);
    port (
      clk                  : in  std_logic;
      rst_m0               : in  std_logic;
      rst_start            : in  std_logic;
      rst                  : in  std_logic;
      config_sync          : in  std_logic;
      nco_param            : in  std_logic_vector(COEBITWIDTH-1 downto 0);
      ncogain_param        : in  std_logic_vector(COEBITWIDTH-1 downto 0);
      hb_param             : in  std_logic_vector(COEBITWIDTH-1 downto 0);
      cic_param            : in  std_logic_vector(COEBITWIDTH-1 downto 0);
      decimgain_param      : in  std_logic_vector(COEBITWIDTH-1 downto 0);
      hbgain_param         : in  std_logic_vector(COEBITWIDTH-1 downto 0);
      fir_param            : in  std_logic_vector(COEBITWIDTH-1 downto 0);
      firgain_param        : in  std_logic_vector(COEBITWIDTH-1 downto 0);
      orp                  : in  std_logic;
      data_in              : in  std_logic_vector(ADBITWIDTH-1 downto 0);
      nco_indicator        : in  std_logic;
      nco_pass_flag        : in  std_logic;
      ncogain_indicator    : in  std_logic;
      hb_indicator         : in  std_logic;
      hb_pass_flag         : in  std_logic;
      decimgain_indicator  : in  std_logic;
      cic_indicator        : in  std_logic;
      cic_pass_flag        : in  std_logic;
      hbgain_indicator     : in  std_logic;
      fir_indicator        : in  std_logic;
      fir_pass_flag        : in  std_logic;
      firgain_indicator    : in  std_logic;
      sin_val              : in  std_logic_vector(15 downto 0);
      nco_test_en          : in  std_logic;
      nco_sine_test        : out std_logic_vector(NCOBITWIDTH-1 downto 0);
      nco_cosine_test      : out std_logic_vector(NCOBITWIDTH-1 downto 0);
      mixer_i_test         : out std_logic_vector(MIXBITWIDTH-1 downto 0);
      mixer_q_test         : out std_logic_vector(MIXBITWIDTH-1 downto 0);
      nco_i_pass_data_test : out std_logic_vector(FILTERBITWIDTH-1 downto 0);
      nco_q_pass_data_test : out std_logic_vector(FILTERBITWIDTH-1 downto 0);
      hb_i_test            : out std_logic_vector(MIXBITWIDTH-1 downto 0);
      hb_q_test            : out std_logic_vector(MIXBITWIDTH-1 downto 0);
      cic_i_test           : out std_logic_vector(MIXBITWIDTH-1 downto 0);
      cic_q_test           : out std_logic_vector(MIXBITWIDTH-1 downto 0);
      hb_flag              : out std_logic;
      cic_flag             : out std_logic;
      fir_i_result_test    : out std_logic_vector(FIRBITWIDTH-1 downto 0);
      fir_q_result_test    : out std_logic_vector(FIRBITWIDTH-1 downto 0);
      fir_flag             : out std_logic;
      ddc_i_data           : out std_logic_vector(ADBITWIDTH-1 downto 0);
      ddc_q_data           : out std_logic_vector(ADBITWIDTH-1 downto 0);
      ddc_flag             : out std_logic;
      nco_test             : out std_logic_vector(14 downto 0);
      freq_word            : out std_logic_vector(31 downto 0));
  end component;


  --signal clk                  : std_logic;
  signal rst_m0              : std_logic;
  signal rst_start           : std_logic;
  signal rst                 : std_logic;
  signal config_sync         : std_logic;
  signal nco_param           : std_logic_vector(COEBITWIDTH-1 downto 0);
  signal ncogain_param       : std_logic_vector(COEBITWIDTH-1 downto 0);
  signal hb_param            : std_logic_vector(COEBITWIDTH-1 downto 0);
  signal cic_param           : std_logic_vector(COEBITWIDTH-1 downto 0);
  signal decimgain_param     : std_logic_vector(COEBITWIDTH-1 downto 0);
  signal hbgain_param        : std_logic_vector(COEBITWIDTH-1 downto 0);
  signal fir_param           : std_logic_vector(COEBITWIDTH-1 downto 0);
  signal firgain_param       : std_logic_vector(COEBITWIDTH-1 downto 0);
  signal orp                 : std_logic;
  signal nco_indicator       : std_logic;
  signal ncogain_indicator   : std_logic;
  signal hb_indicator        : std_logic;
  signal decimgain_indicator : std_logic;
  signal cic_indicator       : std_logic;
  signal hbgain_indicator    : std_logic;
  signal fir_indicator       : std_logic;
  signal firgain_indicator   : std_logic;
  signal sin_val             : std_logic_vector(15 downto 0);
  signal nco_test_en         : std_logic;


  signal config_add : integer range 15 downto 0;
  
begin  -- archi

  ddc_for_asic_1 : ddc_for_asic
    generic map (
      ADBITWIDTH     => ADBITWIDTH,
      NCOBITWIDTH    => NCOBITWIDTH,
      FILTERBITWIDTH => FILTERBITWIDTH,
      MIXBITWIDTH    => MIXBITWIDTH,
      COEBITWIDTH    => COEBITWIDTH,
      FIRBITWIDTH    => FIRBITWIDTH)
    port map (
      clk                  => clk,
      rst_m0               => rst_m0,
      rst_start            => rst_start,
      rst                  => rst,
      config_sync          => config_sync,
      nco_param            => nco_param,
      ncogain_param        => ncogain_param,
      hb_param             => hb_param,
      cic_param            => cic_param,
      decimgain_param      => decimgain_param,
      hbgain_param         => hbgain_param,
      fir_param            => fir_param,
      firgain_param        => firgain_param,
      orp                  => orp,
      data_in              => data_in,
      nco_indicator        => nco_indicator,
      nco_pass_flag        => nco_pass_flag,
      ncogain_indicator    => ncogain_indicator,
      hb_indicator         => hb_indicator,
      hb_pass_flag         => hb_pass_flag,
      decimgain_indicator  => decimgain_indicator,
      cic_indicator        => cic_indicator,
      cic_pass_flag        => cic_pass_flag,
      hbgain_indicator     => hbgain_indicator,
      fir_indicator        => fir_indicator,
      fir_pass_flag        => fir_pass_flag,
      firgain_indicator    => firgain_indicator,
      sin_val              => sin_val,
      nco_test_en          => nco_test_en,
      nco_sine_test        => nco_sine_test,
      nco_cosine_test      => nco_cosine_test,
      mixer_i_test         => mixer_i_test,
      mixer_q_test         => mixer_q_test,
      nco_i_pass_data_test => nco_i_pass_data_test,
      nco_q_pass_data_test => nco_q_pass_data_test,
      hb_i_test            => hb_i_test,
      hb_q_test            => hb_q_test,
      cic_i_test           => cic_i_test,
      cic_q_test           => cic_q_test,
      hb_flag              => hb_flag,
      cic_flag             => cic_flag,
      fir_i_result_test    => fir_i_result_test,
      fir_q_result_test    => fir_q_result_test,
      fir_flag             => fir_flag,
      ddc_i_data           => ddc_i_data,
      ddc_q_data           => ddc_q_data,
      ddc_flag             => ddc_flag,
      nco_test             => nco_test,
      freq_word            => freq_word);

  
  config_add <= TO_INTEGER(unsigned(config(COEBITWIDTH+3 downto COEBITWIDTH)));

  config_sync <= '1' when config_add /= 0 else '0';

  ncogain_indicator <= '1' when config_add = 1 else '0';

  hb_indicator <= '1' when config_add = 1 else '0';

  decimgain_indicator <= '1' when config_add = 2 else '0';
  cic_indicator       <= '1' when config_add = 3 else '0';
  hbgain_indicator    <= '1' when config_add = 4 else '0';
  fir_indicator       <= '1' when config_add = 5 else '0';
  firgain_indicator   <= '1' when config_add = 6 else '0';

  nco_param       <= config(COEBITWIDTH-1 downto 0);
  ncogain_param   <= config(COEBITWIDTH-1 downto 0);
  hb_param        <= config(COEBITWIDTH-1 downto 0);
  cic_param       <= config(COEBITWIDTH-1 downto 0);
  decimgain_param <= config(COEBITWIDTH-1 downto 0);
  hbgain_param    <= config(COEBITWIDTH-1 downto 0);
  fir_param       <= config(COEBITWIDTH-1 downto 0);
  firgain_param   <= config(COEBITWIDTH-1 downto 0);
  
end archi;

