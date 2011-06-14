-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : ram_manager_v2.vhd
-- Author     :   <Administrator@HEAVEN>
-- Company    : 
-- Created    : 2011-05-02
-- Last update: 2011-06-14
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2011 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2011-05-02  1.0      Administrator   Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ram_manager_v2 is
  generic (
    DATA_WIDTH : integer;
    ADDR_WIDTH : integer);
  port (
    sys_clk_i : in std_logic;
    rst_i     : in std_logic;

    LB_Clk_i      : in std_logic;
    wr_start_i    : in std_logic;
    task_length_i : in std_logic_vector(15 downto 0);
    rd_start_i    : in std_logic;
    rd_len_i      : in std_logic_vector(31 downto 0);

    data_i  : in  std_logic_vector(15 downto 0);
    wrreq_i : in  std_logic;
    wrrdy_o : out std_logic;

    dco_i : in  std_logic;
    q_o   : out std_logic_vector(15 downto 0);

    ssram_clk_o   : out std_logic;
    ssram_ce1_n_o : out std_logic;
    ssram_ce2_n_o : out std_logic;
    ssram_ce2_o   : out std_logic;
    ssram_addr_o  : out std_logic_vector(ADDR_WIDTH - 1 downto 0);
    ssram_d_i     : in  std_logic_vector(DATA_WIDTH - 1 downto 0);
    ssram_d_o     : out std_logic_vector(DATA_WIDTH - 1 downto 0);
    ssram_d_t_o   : out std_logic;
    ssram_adv_o   : out std_logic;
    ssram_we_n_o  : out std_logic;
    ssram_bw_n_o  : out std_logic;
    ssram_oe_n_o  : out std_logic;
    ssram_cke_n_o : out std_logic;
    ssram_zz_o    : out std_logic;
    ssram_mode_o  : out std_logic
    );

end ram_manager_v2;

architecture impl of ram_manager_v2 is

  component ram20k
    port (
      wraddress : in  std_logic_vector (14 downto 0);
      wrclock   : in  std_logic;
      wren      : in  std_logic := '1';
      data      : in  std_logic_vector (15 downto 0);
      rdaddress : in  std_logic_vector (14 downto 0);
      rdclock   : in  std_logic;
      rden      : in  std_logic := '1';
      q         : out std_logic_vector (15 downto 0));
  end component;

  signal wraddress : std_logic_vector (14 downto 0);
  signal wrclock   : std_logic;
  signal wren      : std_logic := '1';
  signal data      : std_logic_vector (15 downto 0);
  signal rdaddress : std_logic_vector (14 downto 0);
  signal rdclock   : std_logic;
  signal rden      : std_logic := '1';
  signal q         : std_logic_vector (15 downto 0);


  type   state_t is (s_idle, s_write, s_wait, s_read);
  signal cs    : state_t;
  signal cs_r  : state_t;
  signal cs_rr : state_t;
  

  
begin  -- impl

  process (LB_Clk_i, rst_i)
  begin  -- process
    if rst_i = '1' then                 -- asynchronous reset (active low)
      cs <= s_idle;
    elsif LB_Clk_i'event and LB_Clk_i = '1' then  -- rising clock edge
      case cs is
        when s_idle =>
          if wr_start_i = '1' then
            cs <= s_write;
          else
            cs <= s_idle;
          end if;

        when s_write =>
          if rd_start_i = '1' then
            cs <= s_read;
          else
            cs <= s_write;
          end if;

        when s_read =>
          if wr_start_i = '1' then
            cs <= s_write;
          else
            cs <= s_read;
          end if;
        when others => null;
      end case;
    end if;
  end process;

  process (LB_Clk_i, rst_i)
  begin  -- process
    if rst_i = '1' then                 -- asynchronous reset (active low)
      wraddress <= (others => '0');
    elsif LB_Clk_i'event and LB_Clk_i = '1' then       -- rising clock edge
      if cs = s_write then
--        if wrreq_i = '1' and wraddress < x"4E20" then  -- 20000 in decimal
        if wrreq_i = '1' and wraddress < task_length_i then  -- 20000 in decimal
          wraddress <= wraddress + 1;
        else
          wraddress <= wraddress;
        end if;
      else
        wraddress <= (others => '0');
      end if;
    end if;
  end process;

  wren <= wrreq_i when cs = s_write
          else '0';

  process (dco_i, rst_i)
  begin  -- process
    if rst_i = '1' then                     -- asynchronous reset (active low)
      cs_r  <= s_idle;
      cs_rr <= s_idle;
    elsif dco_i'event and dco_i = '1' then  -- rising clock edge
      cs_r  <= cs;
      cs_rr <= cs_r;
    end if;
  end process;

  process (dco_i, rst_i)
  begin  -- process
    if rst_i = '1' then                     -- asynchronous reset (active low)
      rdaddress <= (others => '0');
    elsif dco_i'event and dco_i = '1' then  -- rising clock edge
      if cs_rr = s_read then
--        if rdaddress < x"4E1F" then
        if rdaddress < task_length_i-1 then
          rdaddress <= rdaddress + 1;
        else
          rdaddress <= (others => '0');
        end if;
      else
        rdaddress <= (others => '0');
      end if;
    end if;
  end process;

  rden <= '1' when cs_rr = s_read
          else '0';

  wrclock <= LB_Clk_i;
  rdclock <= dco_i;
  data    <= data_i;

  ram20k_1 : ram20k
    port map (
      wraddress => wraddress,
      wrclock   => wrclock,
      wren      => wren,
      data      => data,
      rdaddress => rdaddress,
      rdclock   => rdclock,
      rden      => rden,
      q         => q);


  wrrdy_o <= '0' when cs = s_read
             else '1';

  process (rdclock)
  begin  -- process
    if rising_edge(rdclock) then
      q_o <= q;
    end if;
  end process;
  
end impl;


