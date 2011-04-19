-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : top.vhd%
-- Author     :   <Administrator@CHINA-6C7FF0513>
-- Company    : 
-- Created    : 2010-05-09
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
-- 2010-05-09  1.0      Rome    Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity top is
    
    port (
        clk_80m              : in    std_logic;
        -- System reset in
        sys_rst_i            : in    std_logic;
        -- Power reset out, active low
        UMR                  : out   std_logic;
        -- 68013 port
        -- FX2 SLAV FIFO
        FX_CLK_i             : in    std_logic;
        FX2FD_io             : inout std_logic_vector (15 downto 0);  -- fifo data/q
        FLAGA_i              : in    std_logic;  -- program strobe
        FLAGB_i              : in    std_logic;  -- full
        FLAGC_i              : in    std_logic;  -- empty
        FLAGD_i              : in    std_logic;  -- not used
        SLRD_n_o             : out   std_logic;  -- fifo_rd
        SLWR_n_o             : out   std_logic;  -- fifo_wr
        SL_OE_n_o            : out   std_logic;
        PKTEND_o             : out   std_logic;  -- not used
        FIFOADR_o            : out   std_logic_vector(1 downto 0);  -- fifo adr
        -- high ADC data port and SPI port
        rx_in_i              : in    std_logic_vector(15 downto 0);
        rx_inclock_i         : in    std_logic := '0';
        --
        KAD5514P_tm_o        : out   std_logic;
        KAD5514P_gpio1_o     : out   std_logic;
        KAD5514P_gpio3_o     : out   std_logic;
        KAD5514P_adc_rst_n_o : out   std_logic;
        KAD5514P_spi_clk_o   : out   std_logic;
        KAD5514P_spi_di_i    : inout std_logic;
        KAD5514P_spi_cs_n_o  : out   std_logic;
        KAD5514P_i2c_sdo_o   : out   std_logic;
        KAD5514P_i2c_scl_o   : out   std_logic;
        KAD5514P_i2c_sda_o   : out   std_logic;
        -- TLC3548 SPI port
        TLC3548_sck_o        : out   std_logic;
        TLC3548_sdi_i        : in    std_logic;
        TLC3548_sdo_o        : out   std_logic;
        TLC3548_cs_n_o       : out   std_logic;
        TLC3548_fs_o         : out   std_logic;
        TLC3548_start_n_o    : out   std_logic;  -- do not use it, pull it up
        TLC3548_eco          : in    std_logic;  -- not used yet
        -- LTC2656 SPI port and configuration port
        LTC2656_sck_o        : out   std_logic;
        LTC2656_sdi_i        : in    std_logic;
        LTC2656_sdo_o        : out   std_logic;
        LTC2656_clr_o        : out   std_logic;
        LTC2656_pos_o        : out   std_logic;
        LTC2656_ld_cs_n_o    : out   std_logic;
        LTC2656_ldac_n_o     : out   std_logic;
        -- SSRAM 0
        ssram0_clk_o         : out   std_logic;
        ssram0_ce_n_o        : out   std_logic;
        ssram0_cke_n_o       : out   std_logic;
        ssram0_adr_o         : out   std_logic_vector(18 downto 0);
        ssram0_dq_io         : inout std_logic_vector(35 downto 0);
        ssram0_adv_n_o       : out   std_logic;
        ssram0_bw_n_o        : out   std_logic;
        ssram0_we_n_o        : out   std_logic;
        ssram0_oe_n_o        : out   std_logic;
        -- SSRAM 1
        ssram1_clk_o         : out   std_logic;
        ssram1_ce_n_o        : out   std_logic;
        ssram1_cke_n_o       : out   std_logic;
        ssram1_adr_o         : out   std_logic_vector(18 downto 0);
        ssram1_dq_io         : inout std_logic_vector(35 downto 0);
        ssram1_adv_n_o       : out   std_logic;
        ssram1_bw_n_o        : out   std_logic;
        ssram1_we_n_o        : out   std_logic;
        ssram1_oe_n_o        : out   std_logic
        );

end top;

architecture behave of top is
-------------------------------------------------------------------------------

    constant ADDR_RESET_REG : std_logic_vector(15 downto 0) := x"FFFF";
    constant ADDR_LEN_REG   : std_logic_vector(15 downto 0) := x"1004";
    constant ADDR_FIFO      : std_logic_vector(15 downto 0) := x"1005";
    constant ADDR_3548      : std_logic_vector(15 downto 0) := x"0009";
    constant ADDR_2656_L    : std_logic_vector(15 downto 0) := x"0005";
    constant ADDR_2656_H    : std_logic_vector(15 downto 0) := x"0006";
-- high ADC controller
    component had_rec
        generic (
            IO_TYPE   : string;
            ADDR_LEN  : std_logic_vector(15 downto 0);
            ADDR_FIFO : std_logic_vector(15 downto 0));
        port (
            clk_i            : in  std_logic;
            LB_Clk_i         : in  std_logic;
            LB_Reset_i       : in  std_logic;
            LB_Addr_i        : in  std_logic_vector(15 downto 0);
            LB_Write_i       : in  std_logic;
            LB_Read_i        : in  std_logic;
            LB_Ready_o       : out std_logic;
            LB_DataW_i       : in  std_logic_vector(15 downto 0);
            LB_DataR_o       : out std_logic_vector(15 downto 0);
            rx_in_i          : in  std_logic_vector (15 downto 0);
            rx_inclock_i     : in  std_logic;
            --
            tm_o             : out std_logic;
            gpio1_o          : out std_logic;  -- tie it to gnd
            gpio3_o          : out std_logic;  -- tie it to gnd
            adc_rst_n_o      : out std_logic;
            spi_clk_o        : out std_logic;
            spi_out_en_o     : out std_logic;
            spi_di_i         : in  std_logic;
            spi_do_o         : out std_logic;
            spi_cs_n_o       : out std_logic;
            i2c_sdo_o        : out std_logic;
            i2c_scl_o        : out std_logic;
            i2c_sda_o        : out std_logic;
            --
            ssram_din_i      : in  std_logic_vector(63 downto 0);
            ssram_dout_o     : out std_logic_vector(63 downto 0);
            ssram0_adr_o     : out std_logic_vector(18 downto 0);
            ssram0_dout_en_o : out std_logic;
            ssram0_adv_n_o   : out std_logic;
            ssram0_adsp_n_o  : out std_logic;
            ssram0_adsc_n_o  : out std_logic;
            ssram0_gw_n_o    : out std_logic;
            ssram0_clk_o     : out std_logic;
            ssram0_ce_n_o    : out std_logic;
            ssram0_ce2_n_o   : out std_logic;
            ssram0_ce2_o     : out std_logic;
            ssram0_bwa_n_o   : out std_logic;
            ssram0_bwb_n_o   : out std_logic;
            ssram0_bwc_n_o   : out std_logic;
            ssram0_bwd_n_o   : out std_logic;
            ssram0_bwe_n_o   : out std_logic;
            ssram0_oe_n_o    : out std_logic;
            ssram0_zz_o      : out std_logic;
            ssram0_mode_o    : out std_logic;
            ssram1_bwa_n_o   : out std_logic;
            ssram1_bwb_n_o   : out std_logic;
            ssram1_bwc_n_o   : out std_logic;
            ssram1_bwd_n_o   : out std_logic);
    end component;
    --
    signal ssram_dout            : std_logic_vector(63 downto 0);
    signal ssram_din             : std_logic_vector(63 downto 0);
    signal KAD5514P_spi_out_en_o : std_logic;
    signal KAD5514P_spi_do_o     : std_logic;
    signal KAD5514P_spi_di_input : std_logic;

    signal ssram0_clk   : std_logic;
    signal ssram0_ce_n  : std_logic;
    signal ssram0_cke_n : std_logic;
    signal ssram0_adr   : std_logic_vector(18 downto 0);
                                        --signal   ssram0_dinout     : std_logic_vector(63 downto 0);
    signal ssram0_adv_n : std_logic;
    signal ssram0_bw_n  : std_logic;
    signal ssram0_we_n  : std_logic;
    signal ssram0_oe_n  : std_logic;
-------------------------------------------------------------------------------
    -- local bus
    component lb
        generic (
            FIFO_WR_PORT : std_logic_vector(1 downto 0);
            FIFO_RD_PORT : std_logic_vector(1 downto 0));
        port (
            sys_rst_i      : in  std_logic;
            LB_Clk_i       : in  std_logic;
            LB_Addr_o      : out std_logic_vector(15 downto 0);
            LB_Write_o     : out std_logic;
            LB_Read_o      : out std_logic;
            LB_Ready_i     : in  std_logic;
            LB_DataW_o     : out std_logic_vector(15 downto 0);
            LB_DataR_i     : in  std_logic_vector(15 downto 0);
            -- 68013 port
            PKTEND_o       : out std_logic;
            fifo_emp_i     : in  std_logic;
            fifo_ful_i     : in  std_logic;
            fifo_progful_i : in  std_logic;
            fifo_progemp_i : in  std_logic;
            fifo_wr_o      : out std_logic;
            fifo_rd_o      : out std_logic;
            fifo_adr_o     : out std_logic_vector(1 downto 0);
            fifo_din_i     : in  std_logic_vector(15 downto 0);
            fifo_dout_o    : out std_logic_vector(15 downto 0));
    end component;
    -- local bus
    signal LB_Clk_i       : std_logic;
    signal LB_Addr_o      : std_logic_vector(15 downto 0);
    signal LB_Write_o     : std_logic;
    signal LB_Read_o      : std_logic;
    signal LB_Ready_i     : std_logic;
    signal LB_DataW_o     : std_logic_vector(15 downto 0);
    signal LB_DataR_i     : std_logic_vector(15 downto 0);
    -- 68013 port
    signal fifo_emp_i     : std_logic;
    signal fifo_ful_i     : std_logic;
    signal fifo_progful_i : std_logic;
    signal fifo_progemp_i : std_logic;
    signal fifo_wr_o      : std_logic;
    signal fifo_rd_o      : std_logic;
    signal fifo_adr_o     : std_logic_vector(1 downto 0);
    signal fifo_din_i     : std_logic_vector(15 downto 0);
    signal fifo_dout_o    : std_logic_vector(15 downto 0);
-------------------------------------------------------------------------------
    component ltc2656b
        generic (
            ADDR_L : std_logic_vector(15 downto 0);
            ADDR_H : std_logic_vector(15 downto 0)
            );
        port (
            LB_Clk_i          : in  std_logic;
            LB_Reset_i        : in  std_logic;
            LB_Addr_i         : in  std_logic_vector(15 downto 0);
            LB_Write_i        : in  std_logic;
            LB_Read_i         : in  std_logic;
            LB_Ready_o        : out std_logic;
            LB_DataW_i        : in  std_logic_vector(15 downto 0);
            LB_DataR_o        : out std_logic_vector(15 downto 0);
            LTC2656_sck_o     : out std_logic;
            LTC2656_sdi_i     : in  std_logic;
            LTC2656_sdo_o     : out std_logic;
            LTC2656_ld_cs_n_o : out std_logic;
            LTC2656_ldac_n_o  : out std_logic);
    end component;
    signal LB_Ready_2656_i : std_logic;
    signal LB_Ready_had_i  : std_logic;
    signal LB_DataR_had_i  : std_logic_vector(15 downto 0);
    signal LB_DataR_2656_i : std_logic_vector(15 downto 0);
-------------------------------------------------------------------------------
    component lb_target_reg
        generic (
            ADDR : std_logic_vector(15 downto 0));
        port (
            LB_Clk_i   : in  std_logic;
            LB_Reset_i : in  std_logic;
            LB_Addr_i  : in  std_logic_vector(15 downto 0);
            LB_Write_i : in  std_logic;
            LB_Read_i  : in  std_logic;
            LB_Ready_o : out std_logic;
            LB_DataW_i : in  std_logic_vector(15 downto 0);
            LB_DataR_o : out std_logic_vector(15 downto 0);
            updated_o  : out std_logic;
            ctrl_o     : out std_logic_vector(15 downto 0);
            sta_i      : in  std_logic_vector(15 downto 0));
    end component;
    --
    signal LB_Ready_reset_ctr_i : std_logic;
    signal LB_DataR_reset_ctr_i : std_logic_vector(15 downto 0);
    signal reset_ctr_o          : std_logic_vector(15 downto 0);
    signal ssram0_gw_n          : std_logic;
-------------------------------------------------------------------------------
    component tlc3548
        generic (
            ADDR : std_logic_vector(15 downto 0));
        port (
            LB_Clk_i          : in  std_logic;
            LB_Reset_i        : in  std_logic;
            LB_Addr_i         : in  std_logic_vector(15 downto 0);
            LB_Write_i        : in  std_logic;
            LB_Read_i         : in  std_logic;
            LB_Ready_o        : out std_logic;
            LB_DataW_i        : in  std_logic_vector(15 downto 0);
            LB_DataR_o        : out std_logic_vector(15 downto 0);
            TLC3548_sck_o     : out std_logic;
            TLC3548_sdi_i     : in  std_logic;
            TLC3548_sdo_o     : out std_logic;
            TLC3548_cs_n_o    : out std_logic;
            TLC3548_fs_o      : out std_logic;
            TLC3548_start_n_o : out std_logic;
            TLC3548_eco       : in  std_logic);
    end component;
    --
    signal LB_Ready_tlc3548_i : std_logic;
    signal LB_DataR_tlc3548_i : std_logic_vector(15 downto 0);
-------------------------------------------------------------------------------
    component dcm_user
        port (
            areset : in  std_logic := '0';
            inclk0 : in  std_logic := '0';
            c0     : out std_logic);
    end component;
    
begin  -- behave
    
    dcm_user_1 : dcm_user
        port map (
            areset => '0',
            inclk0 => FX_CLK_i,
            c0     => LB_Clk_i);
-------------------------------------------------------------------------------
    -- 68013 port
    FX2FD_io       <= fifo_dout_o when fifo_adr_o(1) = '1' else (others => 'Z');
    fifo_din_i     <= FX2FD_io    when fifo_adr_o(1) = '0' else (others => '0');
    fifo_progful_i <= not FLAGC_i;
    fifo_progemp_i <= not FLAGA_i;
    fifo_ful_i     <= not FLAGC_i;
    fifo_emp_i     <= not FLAGA_i;
    FIFOADR_o      <= fifo_adr_o;
    SLRD_n_o       <= not fifo_rd_o;
    SLWR_n_o       <= not fifo_wr_o;
    SL_OE_n_o      <= fifo_adr_o(1);

    LTC2656_clr_o <= '1';
    LTC2656_pos_o <= '1';
    UMR           <= '1';               -- not reset

    -- SSRAM data bus
    ssram0_adr_o               <= ssram0_adr;
    ssram0_clk_o               <= ssram0_clk;
    ssram0_cke_n_o             <= '0';
    ssram0_bw_n_o              <= '0';
    ssram0_we_n_o              <= ssram0_gw_n;
    ssram0_dq_io(35 downto 32) <= (others                                                     => '0');
    ssram0_dq_io(31 downto 0)  <= ssram_dout(31 downto 0) when ssram0_gw_n = '0' else (others => 'Z');
    ssram0_ce_n_o              <= ssram0_ce_n;  --
    ssram0_adv_n_o             <= ssram0_adv_n;
    ssram0_oe_n_o              <= ssram0_oe_n;

    ssram1_adr_o               <= ssram0_adr;
    ssram1_clk_o               <= ssram0_clk;
    ssram1_cke_n_o             <= '0';
    ssram1_bw_n_o              <= '0';
    ssram1_we_n_o              <= ssram0_gw_n;
    ssram1_dq_io(35 downto 32) <= (others                                                      => '0');
    ssram1_dq_io(31 downto 0)  <= ssram_dout(63 downto 32) when ssram0_gw_n = '0' else (others => 'Z');
    ssram1_ce_n_o              <= ssram0_ce_n;
    ssram1_adv_n_o             <= ssram0_adv_n;
    ssram1_oe_n_o              <= ssram0_oe_n;


                                        --ssram0_dinout_io(63 downto 0)  <= ssram_dout_o when ssram0_gw_n = '0' else (others => 'Z');
    ssram_din(31 downto 0)  <= ssram0_dq_io(31 downto 0);
    ssram_din(63 downto 32) <= ssram1_dq_io(31 downto 0);

    LB_Ready_i <= LB_Ready_had_i or LB_Ready_2656_i or LB_Ready_reset_ctr_i or LB_Ready_tlc3548_i;
    LB_DataR_i <= LB_DataR_had_i or LB_DataR_2656_i or LB_DataR_reset_ctr_i or LB_DataR_tlc3548_i;

-------------------------------------------------------------------------------
    -- high ADC data buffer
    had_rec_2 : had_rec
        generic map (
            IO_TYPE   => "CMOS",
            ADDR_LEN  => ADDR_LEN_REG,
            ADDR_FIFO => ADDR_FIFO
            )
        port map (
            clk_i            => clk_80m,
            -- lb
            LB_Clk_i         => LB_Clk_i,
            LB_Reset_i       => reset_ctr_o(0),
            LB_Addr_i        => LB_Addr_o,
            LB_Write_i       => LB_Write_o,
            LB_Read_i        => LB_Read_o,
            LB_Ready_o       => LB_Ready_had_i,
            LB_DataW_i       => LB_DataW_o,
            LB_DataR_o       => LB_DataR_had_i,
            -- high ADC LVDS port
            rx_in_i          => rx_in_i,
            rx_inclock_i     => rx_inclock_i,
            -- high ADC SPI port
            tm_o             => KAD5514P_tm_o,
            gpio1_o          => KAD5514P_gpio1_o,
            gpio3_o          => KAD5514P_gpio3_o,
            adc_rst_n_o      => KAD5514P_adc_rst_n_o,
            spi_clk_o        => KAD5514P_spi_clk_o,
            spi_out_en_o     => KAD5514P_spi_out_en_o,
            spi_di_i         => KAD5514P_spi_di_input,
            spi_do_o         => KAD5514P_spi_do_o,
            spi_cs_n_o       => KAD5514P_spi_cs_n_o,
            i2c_sdo_o        => KAD5514P_i2c_sdo_o ,
            i2c_scl_o        => KAD5514P_i2c_scl_o,
            i2c_sda_o        => KAD5514P_i2c_sda_o,
            -- SSRAM0
            ssram_dout_o     => ssram_dout,
            ssram_din_i      => ssram_din,
            --
            ssram0_adr_o     => ssram0_adr,
            ssram0_dout_en_o => open,
            ssram0_adv_n_o   => ssram0_adv_n,
            ssram0_adsp_n_o  => open,
            ssram0_adsc_n_o  => open,
            ssram0_gw_n_o    => ssram0_gw_n,
            ssram0_clk_o     => ssram0_clk,
            ssram0_ce_n_o    => ssram0_ce_n,
            ssram0_ce2_n_o   => open,
            ssram0_ce2_o     => open,
            ssram0_bwa_n_o   => open,
            ssram0_bwb_n_o   => open,
            ssram0_bwc_n_o   => open,
            ssram0_bwd_n_o   => open,
            ssram0_bwe_n_o   => open,
            ssram0_oe_n_o    => ssram0_oe_n,
            ssram0_zz_o      => open,
            ssram0_mode_o    => open,
            -- SSRAM1
            ssram1_bwa_n_o   => open,
            ssram1_bwb_n_o   => open,
            ssram1_bwc_n_o   => open,
            ssram1_bwd_n_o   => open
            );

    KAD5514P_spi_di_i     <= KAD5514P_spi_do_o when KAD5514P_spi_out_en_o = '1' else 'Z';
    KAD5514P_spi_di_input <= KAD5514P_spi_di_i when KAD5514P_spi_out_en_o = '0' else '0';
-------------------------------------------------------------------------------
    -- local bus
    lb_1 : lb
        generic map (
            FIFO_WR_PORT => "10",
            FIFO_RD_PORT => "00")
        port map (
            sys_rst_i      => '0',      --sys_rst_i,
            LB_Clk_i       => LB_Clk_i,
            LB_Addr_o      => LB_Addr_o,
            LB_Write_o     => LB_Write_o,
            LB_Read_o      => LB_Read_o,
            LB_Ready_i     => LB_Ready_i,
            LB_DataW_o     => LB_DataW_o,
            LB_DataR_i     => LB_DataR_i,
            PKTEND_o       => PKTEND_o,
            fifo_emp_i     => fifo_emp_i,
            fifo_ful_i     => fifo_ful_i,
            fifo_progful_i => fifo_progful_i,
            fifo_progemp_i => fifo_progemp_i,
            fifo_wr_o      => fifo_wr_o,
            fifo_rd_o      => fifo_rd_o,
            fifo_adr_o     => fifo_adr_o,
            fifo_din_i     => fifo_din_i,
            fifo_dout_o    => fifo_dout_o);
-------------------------------------------------------------------------------
    ltc2656b_1 : ltc2656b
        generic map (
            ADDR_L => ADDR_2656_L,
            ADDR_H => ADDR_2656_H)

        port map (
            LB_Clk_i          => LB_Clk_i,
            LB_Reset_i        => reset_ctr_o(1),
            LB_Addr_i         => LB_Addr_o,
            LB_Write_i        => LB_Write_o,
            LB_Read_i         => LB_Read_o,
            LB_Ready_o        => LB_Ready_2656_i,
            LB_DataW_i        => LB_DataW_o,
            LB_DataR_o        => LB_DataR_2656_i,
            LTC2656_sck_o     => LTC2656_sck_o,
            LTC2656_sdi_i     => LTC2656_sdi_i,
            LTC2656_sdo_o     => LTC2656_sdo_o,
            LTC2656_ld_cs_n_o => LTC2656_ld_cs_n_o,
            LTC2656_ldac_n_o  => LTC2656_ldac_n_o
            );
-------------------------------------------------------------------------------
    tlc3548_1 : tlc3548
        generic map (
            ADDR => ADDR_3548)
        port map (
            LB_Clk_i          => LB_Clk_i,
            LB_Reset_i        => reset_ctr_o(2),
            LB_Addr_i         => LB_Addr_o,
            LB_Write_i        => LB_Write_o,
            LB_Read_i         => LB_Read_o,
            LB_Ready_o        => LB_Ready_tlc3548_i,
            LB_DataW_i        => LB_DataW_o,
            LB_DataR_o        => LB_DataR_tlc3548_i,
            TLC3548_sck_o     => TLC3548_sck_o,
            TLC3548_sdi_i     => TLC3548_sdi_i,
            TLC3548_sdo_o     => TLC3548_sdo_o,
            TLC3548_cs_n_o    => TLC3548_cs_n_o,
            TLC3548_fs_o      => TLC3548_fs_o,
            TLC3548_start_n_o => TLC3548_start_n_o,
            TLC3548_eco       => TLC3548_eco);

-------------------------------------------------------------------------------
    lb_target_reset_ctr : lb_target_reg
        generic map (
            ADDR => ADDR_RESET_REG)
        port map (
            LB_Clk_i   => LB_Clk_i,
            LB_Reset_i => '0',
            LB_Addr_i  => LB_Addr_o,
            LB_Write_i => LB_Write_o,
            LB_Read_i  => LB_Read_o,
            LB_Ready_o => LB_Ready_reset_ctr_i,
            LB_DataW_i => LB_DataW_o,
            LB_DataR_o => LB_DataR_reset_ctr_i,
            updated_o  => open,
            ctrl_o     => reset_ctr_o,
            sta_i      => x"0000");

end behave;
