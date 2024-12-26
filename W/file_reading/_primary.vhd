library verilog;
use verilog.vl_types.all;
entity file_reading is
    generic(
        K_IMG_INPUT     : integer := 255;
        K_H_SYNC        : integer := 255;
        K_V_SYNC        : integer := 255
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        img_write_addr  : out    vl_logic_vector(7 downto 0);
        img_write_data  : out    vl_logic_vector(159 downto 0);
        img_wr_enb      : out    vl_logic;
        hsync           : out    vl_logic;
        vsync           : out    vl_logic;
        start           : out    vl_logic
    );
end file_reading;
