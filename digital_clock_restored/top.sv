module top (
    input  logic CLOCK_50,
    input  logic [1:0] KEY,        // KEY[0] = start/stop, KEY[1] = reset
    output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5
);

    // Signalregister
    logic tick_1hz;
    logic [5:0] sec, min;
    logic [4:0] hour;
    logic enable, toggle;
    logic start_flank;

    // Flankdetektering för KEY0 (start/stop)
    edge_detector edge_start (
        .clk(CLOCK_50),
        .reset_n(KEY[1]),
        .signal_in(KEY[0]),
        .rising_edge(start_flank)
    );

    // Enable toggle: tryck = byt mellan start/stopp
    always_ff @(posedge CLOCK_50 or negedge KEY[1]) begin
        if (!KEY[1])
            toggle <= 0;
        else if (start_flank)
            toggle <= ~toggle;
    end

    assign enable = toggle;

    // 1 Hz-timer
    timer_1hz timer (
        .clk(CLOCK_50),
        .reset_n(KEY[1]),
        .enable(enable),
        .tick_1hz(tick_1hz)
    );

    // Tidsräknare
    time_counter clock_logic (
        .clk(CLOCK_50),
        .reset_n(KEY[1]),
        .tick(tick_1hz),
        .sec(sec),
        .min(min),
        .hour(hour)
    );

    // HEX-visning (sekunder, minuter, timmar)
    hex_decoder hex0 (.bcd(sec % 10),  .seg(HEX0));
    hex_decoder hex1 (.bcd(sec / 10),  .seg(HEX1));
    hex_decoder hex2 (.bcd(min % 10),  .seg(HEX2));
    hex_decoder hex3 (.bcd(min / 10),  .seg(HEX3));
    hex_decoder hex4 (.bcd(hour % 10), .seg(HEX4));
    hex_decoder hex5 (.bcd(hour / 10), .seg(HEX5));

endmodule
