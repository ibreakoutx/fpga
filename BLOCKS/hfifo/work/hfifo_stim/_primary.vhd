library verilog;
use verilog.vl_types.all;
entity hfifo_stim is
    port(
        SYSTEM_CLOCK    : in     vl_logic;
        LED_0           : out    vl_logic;
        LED_1           : out    vl_logic;
        LED_2           : out    vl_logic;
        LED_3           : out    vl_logic
    );
end hfifo_stim;
