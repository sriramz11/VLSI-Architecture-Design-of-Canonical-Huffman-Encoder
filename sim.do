vlib work
vlog -reportprogress 300 -work work defines.v
vlog -reportprogress 300 -work work file_reading.v
vlog -reportprogress 300 -work work file_writing.v
vlog -reportprogress 300 -work work Huffman_Buffer.v
vlog -reportprogress 300 -work work Frequency_count.v
vlog -reportprogress 300 -work work Sorting.v
vlog -reportprogress 300 -work work Bitmapping.v
vlog -reportprogress 300 -work work Code_Table.v
vlog -reportprogress 300 -work work Canonical_Huffman_Machine.v
vlog -reportprogress 300 -work work tb_Canonical_Huffman_Machine.v
vsim -t ns work.tb_Canonical_Huffman_Machine
do wave.do
run 2000 ns
