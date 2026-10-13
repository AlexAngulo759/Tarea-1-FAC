vlib work
vmap work work
vlog -sv *.sv tb.v altera_primitives.v
vsim -pli modelsim.vpi tb
add wave -position insertpoint sim:/tb/*
run -all