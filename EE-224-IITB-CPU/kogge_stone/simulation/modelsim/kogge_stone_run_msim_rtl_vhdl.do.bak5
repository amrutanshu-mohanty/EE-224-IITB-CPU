transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/amrut/Downloads/cpu/kogge_stone/Gates.vhdl}
vcom -93 -work work {C:/Users/amrut/Downloads/cpu/kogge_stone/DUT.vhdl}
vcom -93 -work work {C:/Users/amrut/Downloads/cpu/kogge_stone/kogge_stone.vhd}
vcom -93 -work work {C:/Users/amrut/Downloads/cpu/kogge_stone/AND_16.vhd}
vcom -93 -work work {C:/Users/amrut/Downloads/cpu/kogge_stone/XOR_16.vhd}

vcom -93 -work work {C:/Users/amrut/Downloads/cpu/kogge_stone/Testbench.vhdl}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run -all
