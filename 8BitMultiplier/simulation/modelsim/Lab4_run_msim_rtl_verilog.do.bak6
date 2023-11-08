transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Miscallaneous/lab4code {C:/Miscallaneous/lab4code/Reg_4.sv}
vlog -sv -work work +incdir+C:/Miscallaneous/lab4code {C:/Miscallaneous/lab4code/nine_bit_adder.sv}
vlog -sv -work work +incdir+C:/Miscallaneous/lab4code {C:/Miscallaneous/lab4code/HexDriver.sv}
vlog -sv -work work +incdir+C:/Miscallaneous/lab4code {C:/Miscallaneous/lab4code/control.sv}
vlog -sv -work work +incdir+C:/Miscallaneous/lab4code {C:/Miscallaneous/lab4code/Register_unit.sv}
vlog -sv -work work +incdir+C:/Miscallaneous/lab4code {C:/Miscallaneous/lab4code/multiplier.sv}

vlog -sv -work work +incdir+C:/Users/ayanj/Projects/8BitMultiplier/../../../../Miscallaneous/lab4code {C:/Users/ayanj/Projects/8BitMultiplier/../../../../Miscallaneous/lab4code/testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run 5000 ns
