library verilog;
use verilog.vl_types.all;
entity file_writing is
    generic(
        K_IMG_OUTPUT    : integer := 256
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        done            : in     vl_logic;
        qpo_rd_addr     : out    vl_logic_vector(7 downto 0);
        qpo_rd_data     : in     vl_logic_vector(7 downto 0)
    );
end file_writing;
