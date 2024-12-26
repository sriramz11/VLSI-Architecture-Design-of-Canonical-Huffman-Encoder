library verilog;
use verilog.vl_types.all;
entity Huffman_Front_Part is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        data_enb        : in     vl_logic;
        data_in         : in     vl_logic_vector(7 downto 0);
        Sort_Freq_Data  : out    vl_logic_vector(7 downto 0);
        Sort_Syml_Data  : out    vl_logic_vector(7 downto 0);
        Sort_enb        : out    vl_logic
    );
end Huffman_Front_Part;
