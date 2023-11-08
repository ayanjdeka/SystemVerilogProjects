transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/ayanj/Downloads/code {C:/Users/ayanj/Downloads/code/Synchronizers.sv}
vlog -sv -work work +incdir+C:/Users/ayanj/Downloads/code {C:/Users/ayanj/Downloads/code/Router.sv}
vlog -sv -work work +incdir+C:/Users/ayanj/Downloads/code {C:/Users/ayanj/Downloads/code/Reg_4.sv}
vlog -sv -work work +incdir+C:/Users/ayanj/Downloads/code {C:/Users/ayanj/Downloads/code/HexDriver.sv}
vlog -sv -work work +incdir+C:/Users/ayanj/Downloads/code {C:/Users/ayanj/Downloads/code/Control.sv}
vlog -sv -work work +incdir+C:/Users/ayanj/Downloads/code {C:/Users/ayanj/Downloads/code/compute.sv}
vlog -sv -work work +incdir+C:/Users/ayanj/Downloads/code {C:/Users/ayanj/Downloads/code/Register_unit.sv}
vlog -sv -work work +incdir+C:/Users/ayanj/Downloads/code {C:/Users/ayanj/Downloads/code/Processor.sv}

vlog -sv -work work +incdir+C:/Users/ayanj/Projects/EightBitCalculator/../../../../Miscallaneous {C:/Users/ayanj/Projects/EightBitCalculator/../../../../Miscallaneous/testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run 1000 ns
