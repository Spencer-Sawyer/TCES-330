onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /StepperSM_testbench/clock
add wave -noupdate /StepperSM_testbench/dir
add wave -noupdate -expand /StepperSM_testbench/drive
add wave -noupdate /StepperSM_testbench/reset
add wave -noupdate /StepperSM_testbench/step
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {110 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 220
configure wave -valuecolwidth 108
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {826 ps}
