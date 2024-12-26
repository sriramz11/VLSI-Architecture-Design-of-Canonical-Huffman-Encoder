library verilog;
use verilog.vl_types.all;
entity Huffman_Machine is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        data_enb        : in     vl_logic;
        data_in         : in     vl_logic_vector(159 downto 0);
        Code_Words      : out    vl_logic_vector(44 downto 0);
        Metadata        : out    vl_logic_vector(51 downto 0)
    );
end Huffman_Machine;
