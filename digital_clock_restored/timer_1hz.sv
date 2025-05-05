module timer_1hz #(
    parameter int CLK_HZ = 50_000_000
)(
    input  logic clk,
    input  logic reset_n,
    input  logic enable,       // styrs av KEY0 (start/stopp)
    output logic tick_1hz
);

    logic [$clog2(CLK_HZ)-1:0] counter;

    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            counter   <= 0;
            tick_1hz  <= 0;
        end else if (!enable) begin
            counter   <= 0;
            tick_1hz  <= 0;
        end else if (counter >= CLK_HZ - 1) begin
            counter   <= 0;
            tick_1hz  <= 1;
        end else begin
            counter   <= counter + 1;
            tick_1hz  <= 0;
        end
    end

endmodule
