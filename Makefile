default : 
	iverilog -o my_and_gate.vvp AND_gate.sv testbench.sv
	vvp my_and_gate.vvp

wave :
	gtkwave dump.vcd