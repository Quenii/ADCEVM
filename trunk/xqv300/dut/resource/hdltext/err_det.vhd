-- **************************************************************************
-- Owner:       Xilinx Inc.
-- File:        err_det.vhd
--
-- Purpose:         16B/20B error detect module.  Determines if an error has
--          been detected in the transmission of data.  Determines the
--          difference between special characters and error flags
--          asserted in each 8B/10B decode module.
--
-- Author:      Jennifer Jenkins
-- Date:        3-31-2000
--
-- **************************************************************************


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity ERR_DET is
  port(

    clk : in std_logic;
    rst : in std_logic;

    di        : in std_logic_vector(15 downto 0);  -- Incoming decoded data
    start_det : in std_logic;           -- Asserted starts detecting of errors

    k1     : in std_logic;              -- KOUT of upper decoder
    k2     : in std_logic;              -- KOUT of lower decoder
    error1 : in std_logic;              -- ERROR_OUT of upper decoder
    error2 : in std_logic;              -- ERROR_OUT of lower decoder

    -- Output signals
    ill_char_det : out std_logic  -- Asserted when error has been detected

    );

end ERR_DET;



architecture BEHAVIOUR of ERR_DET is

-- ******************** CONSTANT DECLARATIONS ***********************
  constant RESET_ACTIVE : std_logic := '0';


-- ********************* SIGNAL DECLARATIONS ************************

-- Define states for download state machine
  type   STATE is (IDLE, PREL, DETECT, DONE);
  signal prs_state, nxt_state : STATE;

  signal ill_cl1, ill_cl2, ill_cl3 : std_logic;

begin

  -- ******************** SIGNAL ASSIGNMENTS ********************
  ill_cl1 <= (((di(7) xor di(15)) or (di(6) xor di(14)) or
               (di(5) xor di(13))) and (k1 and k2))
             when ((prs_state = PREL) or (prs_state = DETECT)) else '0';

  ill_cl2 <= (((di(4) xor di(12)) or (di(3) xor di(11)) or
                 (di(2) xor di(10))) and (k1 and k2))
               when ((prs_state = PREL) or (prs_state = DETECT)) else '0';

  ill_cl3 <= (((di(1) xor di(9)) or (di(0) xor di(8)))
              and (k1 and k2))  
             when ((prs_state = PREL) or (prs_state = DETECT)) else '0';


  -- ***************** Process: SEQUENTIAL ************************
  -- Purpose:   Synchronize ENC_FUNC target state machine
  -- Components:    none
  
  SEQUENTIAL : process (rst, clk)
  begin
    if rst = RESET_ACTIVE then
      prs_state <= IDLE;
      
    elsif clk'event and (clk = '1') then
      prs_state <= nxt_state;
      
    end if;

  end process SEQUENTIAL;



  -- ******************** Process: ERROR_DET ************************
  -- Purpose:   Detect transmission errors between special characters
  --        and errors in each 8B/10B decode module.
  --        
  -- Components:    none

  ERROR_DET : process (prs_state, start_det)
  begin
    
    nxt_state    <= prs_state;
    ill_char_det <= '0';

    case prs_state is

      ----------------------- IDLE State -------------------------
      when IDLE =>

        -- Waits for go signal from decode logic
        if start_det = '1' then
          nxt_state <= PREL;
        end if;

        ----------------------- PREL State -------------------------
      when PREL =>

        -- Preliminary signal assignments
        nxt_state <= DETECT;

        ---------------------- DETECT State -------------------------
      when DETECT =>

        -- Determine if an illegal character has been detected
        ill_char_det <= ill_cl1 or ill_cl2 or ill_cl3 or
                        (error1 or error2 or (k1 xor k2));
        
        nxt_state <= DONE;


        --------------------- DONE State -------------------------
      when DONE =>

        -- Wait for encoding signal to be deasserted
        if start_det = '0' then
          nxt_state <= IDLE;
        end if;


        --------------------- DEFAULT State ------------------------
      when others =>
        nxt_state <= IDLE;
        
        
    end case;
    
  end process ERROR_DET;

end BEHAVIOUR;





















