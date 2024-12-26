library verilog;
use verilog.vl_types.all;
entity Huffman_Back_Part is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        Buffer_Data     : in     vl_logic_vector(159 downto 0);
        Sort_Freq_Data  : in     vl_logic_vector(7 downto 0);
        Sort_Syml_Data  : in     vl_logic_vector(7 downto 0);
        Sort_enb        : in     vl_logic;
        Code_Words      : out    vl_logic_vector(44 downto 0);
        Metadata        : out    vl_logic_vector(51 downto 0)
    );
end Huffman_Back_Part;
