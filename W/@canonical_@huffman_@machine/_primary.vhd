library verilog;
use verilog.vl_types.all;
entity Canonical_Huffman_Machine is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        data_enb        : in     vl_logic;
        data_in         : in     vl_logic_vector(159 downto 0);
        Code_Words      : out    vl_logic_vector(89 downto 0)
    );
end Canonical_Huffman_Machine;
