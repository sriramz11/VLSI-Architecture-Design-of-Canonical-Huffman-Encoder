library verilog;
use verilog.vl_types.all;
entity Code_Table is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        Buffer_Data     : in     vl_logic_vector(159 downto 0);
        Bitmap_Table    : in     vl_logic_vector(19 downto 0);
        Bitmap_done     : in     vl_logic;
        Bitmap_Syml_out : in     vl_logic_vector(7 downto 0);
        Bitmap_enb      : in     vl_logic;
        Code_Words      : out    vl_logic_vector(89 downto 0)
    );
end Code_Table;
