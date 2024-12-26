library verilog;
use verilog.vl_types.all;
entity Bitmapping is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        Sort_Freq_Data  : in     vl_logic_vector(7 downto 0);
        Sort_Syml_Data  : in     vl_logic_vector(7 downto 0);
        Sort_enb        : in     vl_logic;
        Bitmap_Table    : out    vl_logic_vector(19 downto 0);
        Bitmap_done     : out    vl_logic;
        Bitmap_Syml_out : out    vl_logic_vector(7 downto 0);
        Bitmap_enb      : out    vl_logic
    );
end Bitmapping;
