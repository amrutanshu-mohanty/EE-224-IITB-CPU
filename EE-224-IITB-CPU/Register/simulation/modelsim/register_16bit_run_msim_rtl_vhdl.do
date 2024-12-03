transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Ze actual stuff/IITB/Sem 3/Digital Systems/Register/dflip.vhd}
vcom -93 -work work {C:/Ze actual stuff/IITB/Sem 3/Digital Systems/Register/register_16bit.vhd}

vcom -93 -work work {C:/Ze actual stuff/IITB/Sem 3/Digital Systems/Register/Testbench.vhdl}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  Testbench

add wave *
view structure
view signals
run 100 ns
