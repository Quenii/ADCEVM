open ddc_tb.mdl

cd ../modelsim

vsim('tclstart','do ddc_tb.fdo')

cd ../matlab

config_ddc_tb;