-------------------------------------------------------------------------------
-- Title      : testbench
-- Project    : 
-------------------------------------------------------------------------------
-- File       : ddc_tb.vhd
-- Author     :   <Administrator@PC-201210061941>
-- Company    : 
-- Created    : 2013-02-04
-- Last update: 2013-02-04
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

library verilog;
use verilog.vl_types.all;

library ieee;
use ieee.std_logic_1164.all;

entity ddc_tb is

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
      clk                  : in  vl_logic;
      rst_m0               : in  vl_logic;
      rst_start            : in  vl_logic;
      rst                  : in  vl_logic;
      config_sync          : in  vl_logic;
      nco_param            : in  vl_logic_vector;
      ncogain_param        : in  vl_logic_vector;
      hb_param             : in  vl_logic_vector;
      cic_param            : in  vl_logic_vector;
      decimgain_param      : in  vl_logic_vector;
      hbgain_param         : in  vl_logic_vector;
      fir_param            : in  vl_logic_vector;
      firgain_param        : in  vl_logic_vector;
      orp                  : in  vl_logic;
      data_in              : in  vl_logic_vector;
      nco_indicator        : in  vl_logic;
      nco_pass_flag        : in  vl_logic;
      ncogain_indicator    : in  vl_logic;
      hb_indicator         : in  vl_logic;
      hb_pass_flag         : in  vl_logic;
      decimgain_indicator  : in  vl_logic;
      cic_indicator        : in  vl_logic;
      cic_pass_flag        : in  vl_logic;
      hbgain_indicator     : in  vl_logic;
      fir_indicator        : in  vl_logic;
      fir_pass_flag        : in  vl_logic;
      firgain_indicator    : in  vl_logic;
      sin_val              : in  vl_logic_vector(15 downto 0);
      nco_test_en          : in  vl_logic;
      nco_sine_test        : out vl_logic_vector;
      nco_cosine_test      : out vl_logic_vector;
      mixer_i_test         : out vl_logic_vector;
      mixer_q_test         : out vl_logic_vector;
      nco_i_pass_data_test : out vl_logic_vector;
      nco_q_pass_data_test : out vl_logic_vector;
      hb_i_test            : out vl_logic_vector;
      hb_q_test            : out vl_logic_vector;
      cic_i_test           : out vl_logic_vector;
      cic_q_test           : out vl_logic_vector;
      hb_flag              : out vl_logic;
      cic_flag             : out vl_logic;
      fir_i_result_test    : out vl_logic_vector;
      fir_q_result_test    : out vl_logic_vector;
      fir_flag             : out vl_logic;
      ddc_i_data           : out vl_logic_vector;
      ddc_q_data           : out vl_logic_vector;
      ddc_flag             : out vl_logic;
      nco_test             : out vl_logic_vector(14 downto 0);
      freq_word            : out vl_logic_vector(31 downto 0));
  end component;

  signal clk                  : vl_logic;
  signal rst_m0               : vl_logic;
  signal rst_start            : vl_logic;
  signal rst                  : vl_logic;
  signal config_sync          : vl_logic;
  signal nco_param            : vl_logic_vector;
  signal ncogain_param        : vl_logic_vector;
  signal hb_param             : vl_logic_vector;
  signal cic_param            : vl_logic_vector;
  signal decimgain_param      : vl_logic_vector;
  signal hbgain_param         : vl_logic_vector;
  signal fir_param            : vl_logic_vector;
  signal firgain_param        : vl_logic_vector;
  signal orp                  : vl_logic;
  signal data_in              : vl_logic_vector;
  signal nco_indicator        : vl_logic;
  signal nco_pass_flag        : vl_logic;
  signal ncogain_indicator    : vl_logic;
  signal hb_indicator         : vl_logic;
  signal hb_pass_flag         : vl_logic;
  signal decimgain_indicator  : vl_logic;
  signal cic_indicator        : vl_logic;
  signal cic_pass_flag        : vl_logic;
  signal hbgain_indicator     : vl_logic;
  signal fir_indicator        : vl_logic;
  signal fir_pass_flag        : vl_logic;
  signal firgain_indicator    : vl_logic;
  signal sin_val              : vl_logic_vector(15 downto 0);
  signal nco_test_en          : vl_logic;
  signal nco_sine_test        : vl_logic_vector;
  signal nco_cosine_test      : vl_logic_vector;
  signal mixer_i_test         : vl_logic_vector;
  signal mixer_q_test         : vl_logic_vector;
  signal nco_i_pass_data_test : vl_logic_vector;
  signal nco_q_pass_data_test : vl_logic_vector;
  signal hb_i_test            : vl_logic_vector;
  signal hb_q_test            : vl_logic_vector;
  signal cic_i_test           : vl_logic_vector;
  signal cic_q_test           : vl_logic_vector;
  signal hb_flag              : vl_logic;
  signal cic_flag             : vl_logic;
  signal fir_i_result_test    : vl_logic_vector;
  signal fir_q_result_test    : vl_logic_vector;
  signal fir_flag             : vl_logic;
  signal ddc_i_data           : vl_logic_vector;
  signal ddc_q_data           : vl_logic_vector;
  signal ddc_flag             : vl_logic;
  signal nco_test             : vl_logic_vector(14 downto 0);
  signal freq_word            : vl_logic_vector(31 downto 0);

  constant ADBITWIDTH     : integer := 16;
  constant NCOBITWIDTH    : integer := 25;
  constant FILTERBITWIDTH : integer := 18;
  constant MIXBITWIDTH    : integer := 22;
  constant COEBITWIDTH    : integer := 16;
  constant FIRBITWIDTH    : integer := 26
                                          
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

end archi;

