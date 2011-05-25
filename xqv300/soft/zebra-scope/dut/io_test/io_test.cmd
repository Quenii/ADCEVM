setMode -bscan
setCable -p auto
addDevice -p 1 -part xcf04s
addDevice -p 2 -file ./dut/io_test/top.bit
program -p 2
quit