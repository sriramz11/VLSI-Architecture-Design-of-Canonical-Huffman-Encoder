library verilog;
use verilog.vl_types.all;
entity Huffman_Buffer is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        data_enb        : in     vl_logic;
        data_in         : in     vl_logic_vector(159 downto 0);
        buffer_data     : out    vl_logic_vector(7 downto 0);
        buffer_enb      : out    vl_logic
    );
end Huffman_Buffer;
