module time_counter (
    input  logic clk,
    input  logic reset_n,
    input  logic tick,              // 1 Hz
    output logic [5:0] sec,
    output logic [5:0] min,
    output logic [4:0] hour
);

    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            sec  <= 0;
            min  <= 0;
            hour <= 0;
        end else if (tick) begin
            if (sec == 59) begin
                sec <= 0;
                if (min == 59) begin
                    min <= 0;
                    if (hour == 23)
                        hour <= 0;
                    else
                        hour <= hour + 1;
                end else begin
                    min <= min + 1;
                end
            end else begin
                sec <= sec + 1;
            end
        end
    end

endmodule
