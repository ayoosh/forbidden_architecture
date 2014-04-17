puts {
	ModelSimSE general compile script version 0.1
	Copyright (c) Tiago Martins, 2013
}

# Simply change the project settings in this section
# for each new project. There should be no need to
# modify the rest of the script.

set path ../src/testbenches/

set library_file_list {
	test_library	{Processor_t.v Xilinx.v}
}
set main_module		Processor
set top_level		test_library.${main_module}_t

# After sourcing the script from ModelSim for the
# first time use these commands to recompile.

proc r		{} {uplevel #0 source ../compile.tcl}
proc rr		{} {global last_compile_time
				set last_compile_time 0
				r								}
proc rst	{} {restart -f; run -all			}
proc q  	{} {quit -force						}

#Does this installation support Tk?
set tk_ok 0
if [catch {package require Tk}] {set tk_ok 0}

# Prefer a fixed point font for the transcript
set PrefMain(font) {Courier 10 roman normal}

# Compile out of date files
set time_now [clock seconds]
if [catch {set last_compile_time}] {
	set last_compile_time 0
}
foreach {library file_list} $library_file_list {
	vlib $library
	vmap work $library
	foreach file $file_list {
		if {$last_compile_time < [file mtime ${path}${file}]} {
			if [regexp {.vhdl?$} $file] {
				vcom -93 $file
			} else {
				vlog $path$file +incdir+$path
			}
			set last_compile_time 0
		}
	}
}
set last_compile_time $time_now

# Load the simulation
eval vsim -novopt $top_level

# Display waveform signals
do ${main_module}.do

# Run the simulation
run -all

puts {
	Script commands are:

	r	= Recompile changed and dependent files
	rr	= Recompile everything
	rst	= Restart and run
	q	= Quit without confirmation
}

# How long since project began?
if {[file isfile start_time.txt] == 0} {
	set f [open start_time.txt w]
	puts $f "Start time was [clock seconds]"
	close $f
} else {
	set f [open start_time.txt r]
	set line [gets $f]
	close $f
	regexp {\d+} $line start_time
	set total_time [expr ([clock seconds]-$start_time)/60]
	puts "Project time is $total_time minutes"
}
