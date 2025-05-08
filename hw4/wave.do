onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /divider_tb/clk
add wave -noupdate /divider_tb/LA
add wave -noupdate /divider_tb/EB
add wave -noupdate /divider_tb/Resetn
add wave -noupdate -radix unsigned /divider_tb/DataA
add wave -noupdate -radix unsigned /divider_tb/DataB
add wave -noupdate -radix unsigned /divider_tb/Q
add wave -noupdate -radix unsigned /divider_tb/R
add wave -noupdate -radix unsigned /divider_tb/dut/Count
add wave -noupdate /divider_tb/dut/z
add wave -noupdate /divider_tb/dut/y
add wave -noupdate /divider_tb/dut/Cout
add wave -noupdate -radix binary /divider_tb/DataA
add wave -noupdate -radix binary /divider_tb/DataB
add wave -noupdate -radix binary /divider_tb/Q
add wave -noupdate -radix binary /divider_tb/R
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {915 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 100
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1061 ps}
