transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/amrut/Downloads/cpu/alu/Gates.vhdl}
vcom -93 -work work {C:/Users/amrut/Downloads/cpu/alu/DUT.vhdl}
vcom -93 -work work {C:/Users/amrut/Downloads/cpu/alu/4x1_mux.vhd}
vcom -93 -work work {C:/Users/amrut/Downloads/cpu/alu/2x1_mux.vhd}
vcom -93 -work work {C:/Users/amrut/Downloads/cpu/alu/8x1_mux.vhd}

vcom -93 -work work {C:/Users/amrut/Downloads/cpu/alu/Testbench.vhdl}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run -all
