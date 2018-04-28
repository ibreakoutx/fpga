library verilog;
use verilog.vl_types.all;
entity hfifo is
    generic(
        size            : integer := 16;
        pwidth          : integer := 4;
        swidth          : integer := 5;
        dwidth          : integer := 4
    );
    port(
        dout            : out    vl_logic_vector;
        rdy             : out    vl_logic;
        not_full        : out    vl_logic;
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        din             : in     vl_logic_vector;
        push            : in     vl_logic;
        pop             : in     vl_logic
    );
end hfifo;
