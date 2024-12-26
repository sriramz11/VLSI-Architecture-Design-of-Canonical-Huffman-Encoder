library verilog;
use verilog.vl_types.all;
entity Frequency_count is
    generic(
        K_MAX           : integer := 20
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        data_enb        : in     vl_logic;
        data_in         : in     vl_logic_vector(7 downto 0);
        Syml_out        : out    vl_logic_vector(7 downto 0);
        Freq_out        : out    vl_logic_vector(7 downto 0);
        Syml_pulse      : out    vl_logic;
        fdone           : out    vl_logic
    );
end Frequency_count;
