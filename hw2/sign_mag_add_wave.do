onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /sign_mag_add_tb/clk
add wave -noupdate /sign_mag_add_tb/a
add wave -noupdate /sign_mag_add_tb/b
add wave -noupdate /sign_mag_add_tb/sum
add wave -noupdate /sign_mag_add_tb/data
add wave -noupdate /sign_mag_add_tb/dut2/addr
add wave -noupdate /sign_mag_add_tb/dut2/rom
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {66 ps} 0}
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
configure wave -gridperiod 10
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {575 ps} {759 ps}
