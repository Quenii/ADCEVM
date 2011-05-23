-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : top_30.vhd
-- Author     :   <Administrator@HEAVEN>
-- Company    : 
-- Created    : 2011-05-10
-- Last update: 2011-05-10
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2011 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2011-05-10  1.0      Administrator   Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity top_30 is
  generic (
    INSTS : integer := 5);
  port (
    clk     : in  std_logic;
    rst     : in  std_logic;
    err     : out std_logic;
    data_in : in  std_logic_vector(INSTS+16-1 downto 0);
    k_char  : in  std_logic_vector(INSTS-1 downto 0);

    decode_o       : out std_logic_vector(15 downto 0);
    ill_char_det_o : out std_logic
    );
end top_30;


architecture impl of top_30 is

  component ENC_16B20B
    port (
      clk           : in  std_logic;
      rst           : in  std_logic;
      data_trs      : in  std_logic_vector(15 downto 0);
      k_char        : in  std_logic;
      dis_in        : in  std_logic;
      frame_in_enc  : in  std_logic;
      frame_out_enc : out std_logic;
      serial_data   : out std_logic_vector(19 downto 0);
      dis_out       : out std_logic);
  end component;

  signal data_trs      : std_logic_vector(15 downto 0);
  signal dis_in        : std_logic;
  signal frame_in_enc  : std_logic;
  signal frame_out_enc : std_logic_vector(INSTS-1 downto 0);
  signal serial_data   : std_logic_vector(20*INSTS-1 downto 0);
  signal dis_out       : std_logic_vector(INSTS-1 downto 0);

  component DEC_16B20B
    port (
      clk           : in  std_logic;
      rst           : in  std_logic;
      serial_data   : in  std_logic_vector(19 downto 0);
      frame_in_dec  : in  std_logic;
      frame_out_dec : out std_logic;
      decoded_data  : out std_logic_vector(15 downto 0);
      ill_char_det  : out std_logic);
  end component;

  signal frame_out_dec : std_logic_vector(INSTS-1 downto 0);
  signal decoded_data  : std_logic_vector(16*INSTS-1 downto 0);
  signal ill_char_det  : std_logic_vector(INSTS-1 downto 0);
  
begin  -- impl

  GEN : for i in 0 to INSTS-1 generate

    ENC_16B20B_1 : ENC_16B20B
      port map (
        clk           => clk,
        rst           => rst,
        data_trs      => data_in(i+15 downto 0+i),
        k_char        => k_char(i),
        dis_in        => k_char(i),
        frame_in_enc  => data_in(i+7),
        frame_out_enc => frame_out_enc(i),
        serial_data   => serial_data(20*(i+1)-1 downto 20*i),
        dis_out       => dis_out(i));

    DEC_16B20B_1 : DEC_16B20B
      port map (
        clk           => clk,
        rst           => rst,
        serial_data   => serial_data(20*(i+1)-1 downto 20*i),
        frame_in_dec  => k_char(i),
        frame_out_dec => frame_out_dec(i),
        decoded_data  => decoded_data(16*(i+1)-1 downto 16*i),
        ill_char_det  => ill_char_det(i));

    
  end generate GEN;

  ill_char_det_o <= ill_char_det(0) or ill_char_det(1)
                    or ill_char_det(2) or ill_char_det(3)
                    or ill_char_det(4);
--                    or ill_char_det(5) or ill_char_det(6);
--                    or ill_char_det(7)
--                    or ill_char_det(8) or ill_char_det(9) or ill_char_det(10) or ill_char_det(11)
--                    or ill_char_det(12) or ill_char_det(13) or ill_char_det(14) or ill_char_det(15);

  decode_o <=
--    decoded_data(16*16-1 downto 16*15) and decoded_data(16*15-1 downto 16*14)
--              and decoded_data(16*14-1 downto 16*13) and decoded_data(16*13-1 downto 16*12)
--              and decoded_data(16*12-1 downto 16*11) and decoded_data(16*11-1 downto 16*10)
--              and decoded_data(16*10-1 downto 16*9) and decoded_data(16*9-1 downto 16*8)
--              and decoded_data(16*8-1 downto 16*7) and decoded_data(16*7-1 downto 16*6)
--              and
--    decoded_data(16*6-1 downto 16*5) and
    decoded_data(16*5-1 downto 16*4)
    and decoded_data(16*4-1 downto 16*3) and decoded_data(16*3-1 downto 16*2)
    and decoded_data(16*2-1 downto 16*1) and decoded_data(16*1-1 downto 16*0);
  

end impl;

