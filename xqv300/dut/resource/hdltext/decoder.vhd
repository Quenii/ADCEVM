-- **************************************************************
-- Owner:       Xilinx Inc.
-- File:        decoder.vhd
--
-- Purpose:         16B/20B decoder module.  Combines two parallel
--          working 8B/10B decoder modules.
--  
-- Author:      Jennifer Jenkins
-- Date:        3-31-2000
--      
-- ****************************************************************


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity DEC_16B20B is
  port(
    clk           : in  std_logic;
    rst           : in  std_logic;
    serial_data   : in  std_logic_vector(19 downto 0);
    frame_in_dec  : in  std_logic;
    frame_out_dec : out std_logic;
    decoded_data  : out std_logic_vector(15 downto 0);
    ill_char_det  : out std_logic);     

end DEC_16B20B;


architecture BEHAVIOUR of DEC_16B20B is

-- ******************** CONSTANT DECLARATIONS ***********************
  constant RESET_ACTIVE : std_logic := '0';

-- ********************* SIGNAL DECLARATIONS ************************
  signal data_out                 : std_logic_vector(15 downto 0);
  signal frame_out_u, frame_out_l : std_logic;
  signal start_det_u, start_det_l : std_logic;
  signal kout_u, kout_l           : std_logic;
  signal error_u, error_l         : std_logic;
  signal start_det                : std_logic;


-- ******************** COMPONENT DECLARATION ***********************
-- 8B/10B Decoder Function
  component DECODER
    port(
      clk : in std_logic;
      rst : in std_logic;

      -- Decoder inputs                      
      data_in  : in std_logic_vector(9 downto 0);  -- Parallel byte of incoming data
      frame_in : in std_logic;          -- Asserted when data stream is stable

      -- Decoder outputs
      data_out  : out std_logic_vector(7 downto 0);  -- Decoded data to present
      frame_out : out std_logic;   -- Asserted when data is encoded and ready
                                   -- to be sent through the external serializer     
      kout      : out std_logic;        -- Asserted when transmission of 
                                        -- special character is detected
      err_out   : out std_logic;   -- Asserted when a non-valid 8B/10B data 
                                   -- stream is detected
      start_det : out std_logic);  -- Asserted to start 16B/20B error detect
                                   -- state machine    
  end component;

-- Illegal Character Detect Function
  component ERR_DET
    port(
      clk          : in  std_logic;
      rst          : in  std_logic;
      di           : in  std_logic_vector(15 downto 0);  -- Incoming decoded data
      start_det    : in  std_logic;  -- Asserted starts detecting of errors      
      k1           : in  std_logic;
      k2           : in  std_logic;
      error1       : in  std_logic;
      error2       : in  std_logic;
      ill_char_det : out std_logic);  -- Asserted when error has been detected

  end component;

begin

  -- ******************* SIGNAL ASSIGNMENTS *********************
  decoded_data  <= data_out;
  frame_out_dec <= frame_out_u and frame_out_l;
  start_det     <= start_det_u and start_det_l;


  -- ***************** COMPONENT ASSIGNMENTS *********************
  UPPER_DEC : DECODER
    port map(
      clk       => clk,
      rst       => rst,
      data_in   => serial_data(19 downto 10),
      frame_in  => frame_in_dec,
      data_out  => data_out(15 downto 8),
      frame_out => frame_out_u,
      kout      => kout_u,
      err_out   => error_u,
      start_det => start_det_u);    

  LOWER_DEC : DECODER
    port map(
      clk       => clk,
      rst       => rst,
      data_in   => serial_data(9 downto 0),
      frame_in  => frame_in_dec,
      data_out  => data_out(7 downto 0),
      frame_out => frame_out_l,
      kout      => kout_l,
      err_out   => error_l,
      start_det => start_det_l);    

  ERR : ERR_DET
    port map(
      clk          => clk,
      rst          => rst,
      di           => data_out,
      k1           => kout_u,
      k2           => kout_l,
      error1       => error_u,
      error2       => error_l,
      start_det    => start_det,
      ill_char_det => ill_char_det);


end BEHAVIOUR;








































