module debouncer(
    input  wire CLK,
    input  wire BTN_IN,
    output reg  BTN_OUT
);

    reg [19:0] count;
    reg sync_0, sync_1;

    initial begin
        count = 0;
        sync_0 = 0;
        sync_1 = 0;
        BTN_OUT = 0;
    end

    always @(posedge CLK) begin
        sync_0 <= BTN_IN;
        sync_1 <= sync_0;
    end

    always @(posedge CLK) begin
        if (BTN_OUT == sync_1) begin
            count <= 0;
        end else begin
            count <= count + 1'b1;
            if (count == 20'hFFFFF) begin
                BTN_OUT <= sync_1;
            end
        end
    end

endmodule