onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Canonical_Huffman_Machine
add wave -noupdate -format Logic /tb_Canonical_Huffman_Machine/h1/clk
add wave -noupdate -format Logic /tb_Canonical_Huffman_Machine/h1/reset
add wave -noupdate -format Logic /tb_Canonical_Huffman_Machine/h1/data_enb
add wave -noupdate -divider Input
add wave -noupdate -format Literal -radix ascii /tb_Canonical_Huffman_Machine/h1/data_in
add wave -noupdate -divider Output
add wave -noupdate -format Literal /tb_Canonical_Huffman_Machine/h1/Code_Words
add wave -noupdate -divider ==
add wave -noupdate -format Literal /tb_Canonical_Huffman_Machine/h1/Sort_Freq_Data
add wave -noupdate -format Literal /tb_Canonical_Huffman_Machine/h1/Sort_Syml_Data
add wave -noupdate -format Logic /tb_Canonical_Huffman_Machine/h1/Sort_enb
add wave -noupdate -format Literal /tb_Canonical_Huffman_Machine/h1/buffer_data
add wave -noupdate -format Logic /tb_Canonical_Huffman_Machine/h1/buffer_enb
add wave -noupdate -format Literal -radix ascii /tb_Canonical_Huffman_Machine/h1/Syml_out
add wave -noupdate -format Literal -radix unsigned /tb_Canonical_Huffman_Machine/h1/Freq_out
add wave -noupdate -format Logic /tb_Canonical_Huffman_Machine/h1/fdone
add wave -noupdate -format Logic /tb_Canonical_Huffman_Machine/h1/Syml_pulse
add wave -noupdate -format Literal /tb_Canonical_Huffman_Machine/h1/Bitmap_Table
add wave -noupdate -format Logic /tb_Canonical_Huffman_Machine/h1/Bitmap_done
add wave -noupdate -format Literal /tb_Canonical_Huffman_Machine/h1/Bitmap_Syml_out
add wave -noupdate -format Logic /tb_Canonical_Huffman_Machine/h1/Bitmap_enb
add wave -noupdate -divider Huffman_Buffer
add wave -noupdate -format Logic /tb_Canonical_Huffman_Machine/h1/hbf/clk
add wave -noupdate -format Logic /tb_Canonical_Huffman_Machine/h1/hbf/reset
add wave -noupdate -format Logic /tb_Canonical_Huffman_Machine/h1/hbf/data_enb
add wave -noupdate -format Literal /tb_Canonical_Huffman_Machine/h1/hbf/data_in
add wave -noupdate -format Literal /tb_Canonical_Huffman_Machine/h1/hbf/buffer_data
add wave -noupdate -format Logic /tb_Canonical_Huffman_Machine/h1/hbf/buffer_enb
add wave -noupdate -format Literal /tb_Canonical_Huffman_Machine/h1/hbf/cnt
add wave -noupdate -divider Frequency_count
add wave -noupdate -format Logic /tb_Canonical_Huffman_Machine/h1/f1/clk
add wave -noupdate -format Logic /tb_Canonical_Huffman_Machine/h1/f1/reset
add wave -noupdate -format Logic /tb_Canonical_Huffman_Machine/h1/f1/data_enb
add wave -noupdate -format Literal /tb_Canonical_Huffman_Machine/h1/f1/data_in
add wave -noupdate -format Literal -radix ascii /tb_Canonical_Huffman_Machine/h1/f1/Syml_out
add wave -noupdate -format Literal -radix unsigned /tb_Canonical_Huffman_Machine/h1/f1/Freq_out
add wave -noupdate -format Logic /tb_Canonical_Huffman_Machine/h1/f1/Syml_pulse
add wave -noupdate -format Logic /tb_Canonical_Huffman_Machine/h1/f1/fdone
add wave -noupdate -format Literal /tb_Canonical_Huffman_Machine/h1/f1/data_cnt
add wave -noupdate -format Literal /tb_Canonical_Huffman_Machine/h1/f1/syml_cnt
add wave -noupdate -format Literal /tb_Canonical_Huffman_Machine/h1/f1/i
add wave -noupdate -divider Sorting
add wave -noupdate -format Logic /tb_Canonical_Huffman_Machine/h1/s1/clk
add wave -noupdate -format Logic /tb_Canonical_Huffman_Machine/h1/s1/reset
add wave -noupdate -format Logic /tb_Canonical_Huffman_Machine/h1/s1/Syml_pulse
add wave -noupdate -format Logic /tb_Canonical_Huffman_Machine/h1/s1/fdone
add wave -noupdate -format Literal -radix ascii /tb_Canonical_Huffman_Machine/h1/s1/Syml
add wave -noupdate -format Literal -radix unsigned /tb_Canonical_Huffman_Machine/h1/s1/Freq
add wave -noupdate -format Literal -radix unsigned /tb_Canonical_Huffman_Machine/h1/s1/Sort_Freq_Data
add wave -noupdate -format Literal -radix ascii /tb_Canonical_Huffman_Machine/h1/s1/Sort_Syml_Data
add wave -noupdate -format Logic /tb_Canonical_Huffman_Machine/h1/s1/Sort_enb
add wave -noupdate -format Literal /tb_Canonical_Huffman_Machine/h1/s1/i
add wave -noupdate -format Literal /tb_Canonical_Huffman_Machine/h1/s1/freq_cnt
add wave -noupdate -format Logic /tb_Canonical_Huffman_Machine/h1/s1/f1
add wave -noupdate -format Logic /tb_Canonical_Huffman_Machine/h1/s1/f2
add wave -noupdate -format Logic /tb_Canonical_Huffman_Machine/h1/s1/f_re
add wave -noupdate -format Literal /tb_Canonical_Huffman_Machine/h1/s1/cnt_n
add wave -noupdate -format Literal /tb_Canonical_Huffman_Machine/h1/s1/j
add wave -noupdate -format Literal /tb_Canonical_Huffman_Machine/h1/s1/k
add wave -noupdate -divider Bitmapping
add wave -noupdate -format Logic /tb_Canonical_Huffman_Machine/h1/bm/clk
add wave -noupdate -format Logic /tb_Canonical_Huffman_Machine/h1/bm/reset
add wave -noupdate -format Literal -radix unsigned /tb_Canonical_Huffman_Machine/h1/bm/Sort_Freq_Data
add wave -noupdate -format Literal -radix ascii /tb_Canonical_Huffman_Machine/h1/bm/Sort_Syml_Data
add wave -noupdate -format Logic /tb_Canonical_Huffman_Machine/h1/bm/Sort_enb
add wave -noupdate -format Literal -radix hexadecimal /tb_Canonical_Huffman_Machine/h1/bm/Bitmap_Table
add wave -noupdate -format Logic /tb_Canonical_Huffman_Machine/h1/bm/Bitmap_done
add wave -noupdate -format Literal -radix ascii /tb_Canonical_Huffman_Machine/h1/bm/Bitmap_Syml_out
add wave -noupdate -format Logic /tb_Canonical_Huffman_Machine/h1/bm/Bitmap_enb
add wave -noupdate -format Logic /tb_Canonical_Huffman_Machine/h1/bm/flag0
add wave -noupdate -format Logic /tb_Canonical_Huffman_Machine/h1/bm/flag1
add wave -noupdate -format Logic /tb_Canonical_Huffman_Machine/h1/bm/Sort_samp
add wave -noupdate -format Literal /tb_Canonical_Huffman_Machine/h1/bm/i
add wave -noupdate -format Literal /tb_Canonical_Huffman_Machine/h1/bm/k
add wave -noupdate -format Literal /tb_Canonical_Huffman_Machine/h1/bm/length
add wave -noupdate -divider Code_Table
add wave -noupdate -format Logic /tb_Canonical_Huffman_Machine/h1/ct/clk
add wave -noupdate -format Logic /tb_Canonical_Huffman_Machine/h1/ct/reset
add wave -noupdate -format Literal -radix ascii /tb_Canonical_Huffman_Machine/h1/ct/Buffer_Data
add wave -noupdate -format Literal -radix hexadecimal /tb_Canonical_Huffman_Machine/h1/ct/Bitmap_Table
add wave -noupdate -format Logic /tb_Canonical_Huffman_Machine/h1/ct/Bitmap_done
add wave -noupdate -format Literal -radix ascii /tb_Canonical_Huffman_Machine/h1/ct/Bitmap_Syml_out
add wave -noupdate -format Logic /tb_Canonical_Huffman_Machine/h1/ct/Bitmap_enb
add wave -noupdate -format Literal /tb_Canonical_Huffman_Machine/h1/ct/Code_Words
add wave -noupdate -format Literal -radix ascii /tb_Canonical_Huffman_Machine/h1/ct/data_reg1
add wave -noupdate -format Literal -radix ascii /tb_Canonical_Huffman_Machine/h1/ct/data_reg2
add wave -noupdate -format Literal -radix ascii /tb_Canonical_Huffman_Machine/h1/ct/data_reg3
add wave -noupdate -format Literal -radix ascii /tb_Canonical_Huffman_Machine/h1/ct/data_reg4
add wave -noupdate -format Literal -radix ascii /tb_Canonical_Huffman_Machine/h1/ct/data_reg5
add wave -noupdate -format Logic /tb_Canonical_Huffman_Machine/h1/ct/start_scnt
add wave -noupdate -format Literal /tb_Canonical_Huffman_Machine/h1/ct/i
add wave -noupdate -format Literal /tb_Canonical_Huffman_Machine/h1/ct/cnt
add wave -noupdate -format Literal /tb_Canonical_Huffman_Machine/h1/ct/code_data
add wave -noupdate -format Literal /tb_Canonical_Huffman_Machine/h1/ct/data_cnt
add wave -noupdate -format Literal /tb_Canonical_Huffman_Machine/h1/ct/scnt
add wave -noupdate -format Literal -radix ascii -expand /tb_Canonical_Huffman_Machine/h1/ct/buffer
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1811 ns} 0} {{Cursor 2} {832 ns} 0}
configure wave -namecolwidth 214
configure wave -valuecolwidth 562
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits us
update
WaveRestoreZoom {0 ns} {2100 ns}
