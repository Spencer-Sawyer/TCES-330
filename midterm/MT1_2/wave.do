onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /MT1_2test/in
add wave -noupdate {/MT1_2test/in[2]}
add wave -noupdate {/MT1_2test/in[1]}
add wave -noupdate {/MT1_2test/in[0]}
add wave -noupdate /MT1_2test/out
add wave -noupdate /MT1_2test/select
add wave -noupdate {/MT1_2test/select[1]}
add wave -noupdate {/MT1_2test/select[0]}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {274 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ps} {1 ns}
