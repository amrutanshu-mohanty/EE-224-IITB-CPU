transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/amrut/Downloads/EE-224-IITB-CPU/EE-224-IITB-CPU/top_level/fsm.vhd}
vcom -93 -work work {C:/Users/amrut/Downloads/EE-224-IITB-CPU/EE-224-IITB-CPU/top_level/dflip.vhd}
vcom -93 -work work {C:/Users/amrut/Downloads/EE-224-IITB-CPU/EE-224-IITB-CPU/top_level/register_file.vhd}
vcom -93 -work work {C:/Users/amrut/Downloads/EE-224-IITB-CPU/EE-224-IITB-CPU/top_level/register_16bit.vhd}
vcom -93 -work work {C:/Users/amrut/Downloads/EE-224-IITB-CPU/EE-224-IITB-CPU/top_level/mux_16_wide_8x1.vhd}
vcom -93 -work work {C:/Users/amrut/Downloads/EE-224-IITB-CPU/EE-224-IITB-CPU/top_level/Gates.vhdl}
vcom -93 -work work {C:/Users/amrut/Downloads/EE-224-IITB-CPU/EE-224-IITB-CPU/top_level/decoder_3x8.vhd}
vcom -93 -work work {C:/Users/amrut/Downloads/EE-224-IITB-CPU/EE-224-IITB-CPU/top_level/memory.vhd}
vcom -93 -work work {C:/Users/amrut/Downloads/EE-224-IITB-CPU/EE-224-IITB-CPU/top_level/ZL_ZH_SE.vhd}
vcom -93 -work work {C:/Users/amrut/Downloads/EE-224-IITB-CPU/EE-224-IITB-CPU/top_level/mux_3_bit_wide_4x1.vhd}
vcom -93 -work work {C:/Users/amrut/Downloads/EE-224-IITB-CPU/EE-224-IITB-CPU/top_level/Zero_Check.vhd}
vcom -93 -work work {C:/Users/amrut/Downloads/EE-224-IITB-CPU/EE-224-IITB-CPU/top_level/XOR_16.vhd}
vcom -93 -work work {C:/Users/amrut/Downloads/EE-224-IITB-CPU/EE-224-IITB-CPU/top_level/OR_16.vhd}
vcom -93 -work work {C:/Users/amrut/Downloads/EE-224-IITB-CPU/EE-224-IITB-CPU/top_level/NOT_16.vhd}
vcom -93 -work work {C:/Users/amrut/Downloads/EE-224-IITB-CPU/EE-224-IITB-CPU/top_level/mux_16_bit_wide_8x1.vhd}
vcom -93 -work work {C:/Users/amrut/Downloads/EE-224-IITB-CPU/EE-224-IITB-CPU/top_level/mux_16_bit_wide_2x1.vhd}
vcom -93 -work work {C:/Users/amrut/Downloads/EE-224-IITB-CPU/EE-224-IITB-CPU/top_level/multiplier.vhd}
vcom -93 -work work {C:/Users/amrut/Downloads/EE-224-IITB-CPU/EE-224-IITB-CPU/top_level/kogge_stone.vhd}
vcom -93 -work work {C:/Users/amrut/Downloads/EE-224-IITB-CPU/EE-224-IITB-CPU/top_level/IMPLY_16.vhd}
vcom -93 -work work {C:/Users/amrut/Downloads/EE-224-IITB-CPU/EE-224-IITB-CPU/top_level/AND_16.vhd}
vcom -93 -work work {C:/Users/amrut/Downloads/EE-224-IITB-CPU/EE-224-IITB-CPU/top_level/alu.vhd}
vcom -93 -work work {C:/Users/amrut/Downloads/EE-224-IITB-CPU/EE-224-IITB-CPU/top_level/adder_subtractor.vhd}
vcom -93 -work work {C:/Users/amrut/Downloads/EE-224-IITB-CPU/EE-224-IITB-CPU/top_level/8x1_mux.vhd}
vcom -93 -work work {C:/Users/amrut/Downloads/EE-224-IITB-CPU/EE-224-IITB-CPU/top_level/4x1_mux.vhd}
vcom -93 -work work {C:/Users/amrut/Downloads/EE-224-IITB-CPU/EE-224-IITB-CPU/top_level/2x1_mux.vhd}
vcom -93 -work work {C:/Users/amrut/Downloads/EE-224-IITB-CPU/EE-224-IITB-CPU/top_level/mux_16_bit_wide_4x1.vhd}
vcom -93 -work work {C:/Users/amrut/Downloads/EE-224-IITB-CPU/EE-224-IITB-CPU/top_level/top_level.vhd}

vcom -93 -work work {C:/Users/amrut/Downloads/EE-224-IITB-CPU/EE-224-IITB-CPU/top_level/Testbench.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  Testbench

add wave *
view structure
view signals
run 1000 ns
