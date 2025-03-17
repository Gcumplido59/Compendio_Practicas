transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/gaelm/Desktop/Decodificador_BCD {C:/Users/gaelm/Desktop/Decodificador_BCD/BCD.v}
vlog -vlog01compat -work work +incdir+C:/Users/gaelm/Desktop/Decodificador_BCD {C:/Users/gaelm/Desktop/Decodificador_BCD/decoder_7_seg.v}

vlog -sv -work work +incdir+C:/Users/gaelm/Desktop/Decodificador_BCD {C:/Users/gaelm/Desktop/Decodificador_BCD/BCD_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  BCD_tb

add wave *
view structure
view signals
run -all
