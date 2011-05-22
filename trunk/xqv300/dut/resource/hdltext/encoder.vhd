-- **************************************************************
-- Owner:       Xilinx Inc.
-- File:        encoder.vhd
--
-- Purpose:         16B/20B encoder.  Combines upper and lower
--          8B/10B modules.  Connects running disparity
--          from upper module as disparity in on lower
--          module.
--  
-- Author:      Jennifer Jenkins
-- Date:        3-31-2000
--      
-- ****************************************************************


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity ENC_16B20B is
  port(
    clk           : in  std_logic;
    rst           : in  std_logic;
    data_trs      : in  std_logic_vector(15 downto 0);
    k_char        : in  std_logic;
    dis_in        : in  std_logic;
    frame_in_enc  : in  std_logic;
    frame_out_enc : out std_logic;
    serial_data   : out std_logic_vector(19 downto 0);
    dis_out       : out std_logic);

end ENC_16B20B;


architecture BEHAVIOUR of ENC_16B20B is

-- ******************** CONSTANT DECLARATIONS ***********************
  constant RESET_ACTIVE : std_logic := '0';

-- ********************* SIGNAL DECLARATIONS ************************
  signal run_disparity                    : std_logic;
  signal frame_out_upper, frame_out_lower : std_logic;
  signal enc_data_upper, enc_data_lower   : std_logic_vector(9 downto 0);
  signal disparity_rdy                    : std_logic;


-- ******************** COMPONENT DECLARATION ***********************
-- Upper 8B/10B Encoder Function
  component ENCODER_UP
    port(
      clk : in std_logic;
      rst : in std_logic;

      -- Protocol Device Interface                      
      data_in    : in  std_logic_vector(7 downto 0);  -- Parallel byte of incoming data
      k_char     : in  std_logic;  -- Asserted specifies the transmission of 
                                   -- a special character
      frame_in   : in  std_logic;  -- Asserted when parallel data is stable     
      dis_in     : in  std_logic;       -- Disparity in
      dis_out    : out std_logic;       -- Disparity out
      disout_rdy : out std_logic;       -- Asserted when dis_out is stable

      -- Encoder outputs
      encoded_data : out std_logic_vector(9 downto 0);  -- Encoded data to send out
      frame_out    : out std_logic  -- Asserted when data is encoded and ready
                                    -- to be sent through the external serializer
      );

  end component;

-- Upper 8B/10B Encoder Function
  component ENCODER_LOW
    port(
      clk : in std_logic;
      rst : in std_logic;

      -- Protocol Device Interface                      
      data_in   : in  std_logic_vector(7 downto 0);  -- Parallel byte of incoming data
      k_char    : in  std_logic;  -- Asserted specifies the transmission of 
                                  -- a special character
      frame_in  : in  std_logic;  -- Asserted when parallel data is stable
      disin_rdy : in  std_logic;        -- Asserted when dis_in is stable    
      dis_in    : in  std_logic;        -- Disparity in
      dis_out   : out std_logic;        -- Disparity out

      -- Encoder outputs
      encoded_data : out std_logic_vector(9 downto 0);  -- Encoded data to send out
      frame_out    : out std_logic  -- Asserted when data is encoded and ready
                                    -- to be sent through the external serializer
      );

  end component;


begin

  -- ***************** SIGNAL ASSIGNMENTS ************************
  frame_out_enc <= (frame_out_upper) and (frame_out_lower);
  serial_data   <= enc_data_upper & enc_data_lower;

  -- ***************** COMPONENT ASSIGNMENTS *********************
  UPPER_ENC : ENCODER_UP
    port map(
      clk          => clk,
      rst          => rst,
      data_in      => data_trs(15 downto 8),
      k_char       => k_char,
      frame_in     => frame_in_enc,
      dis_in       => dis_in,
      dis_out      => run_disparity,
      disout_rdy   => disparity_rdy,
      encoded_data => enc_data_upper,
      frame_out    => frame_out_upper);


  LOWER_ENC : ENCODER_LOW
    port map(
      clk          => clk,
      rst          => rst,
      data_in      => data_trs(7 downto 0),
      k_char       => k_char,
      frame_in     => frame_in_enc,
      disin_rdy    => disparity_rdy,
      dis_in       => run_disparity,
      dis_out      => dis_out,
      encoded_data => enc_data_lower,
      frame_out    => frame_out_lower);


end BEHAVIOUR;
































