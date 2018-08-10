onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /BCD_AddTest/bcd1
add wave -noupdate /BCD_AddTest/bcd2
add wave -noupdate /BCD_AddTest/carry_in
add wave -noupdate /BCD_AddTest/ones
add wave -noupdate /BCD_AddTest/tens
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
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
WaveRestoreZoom {1763 ps} {2013 ps}
