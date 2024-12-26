library verilog;
use verilog.vl_types.all;
entity Sorting is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        Syml_pulse      : in     vl_logic;
        fdone           : in     vl_logic;
        Syml            : in     vl_logic_vector(7 downto 0);
        Freq            : in     vl_logic_vector(7 downto 0);
        Sort_Freq_Data  : out    vl_logic_vector(7 downto 0);
        Sort_Syml_Data  : out    vl_logic_vector(7 downto 0);
        Sort_enb        : out    vl_logic
    );
end Sorting;
