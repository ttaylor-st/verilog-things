module and_gate (
    input  a,
    input  b,
    output y
);
    assign y = a & b;
endmodule

module or_gate (
    input  a,
    input  b,
    output y
);
    assign y = a | b;
endmodule

module xor_gate (
    input  a,
    input  b,
    output y
);
    assign y = a ^ b;
endmodule

module not_gate (
    input  a,
    output y
);
    assign y = ~a;
endmodule

module d_flip_flop (
    input d,
    input clk,
    input reset,
    input load,
    input enable,
    output reg q
);
    always_ff @(posedge clk) begin
        if (reset) begin
            q <= 1'b0;
        end else if (enable) begin
            if (load) begin
                q <= d;
            end
        end
    end
endmodule


module jk_flip_flop (
    input j,
    input k,
    input clk,
    output reg q
);
    always_ff @(posedge clk) begin
        if (j & ~k) begin
            q <= 1;
        end else if (~j & k) begin
            q <= 0;
        end else if (j & k) begin
            q <= ~q;
        end
    end
endmodule

module sr_flip_flop (
    input s,
    input r,
    input clk,
    output reg q
);
    always_ff @(posedge clk) begin
        if (s & ~r) begin
            q <= 1;
        end else if (~s & r) begin
            q <= 0;
        end
    end
endmodule

module binary_counter (
    input clk,
    input reset,
    output reg [3:0] count
);
    always_ff @(posedge clk) begin
        if (reset) begin
            count <= 4'b0000;  // reset to 0
        end else begin
            count <= count + 1'b1;  // increment by 1
        end
    end
endmodule

module register (
    input [7:0] data,
    input clk,
    input load,
    output reg [7:0] q
);
    always_ff @(posedge clk) begin
        if (load) begin
            q <= data;
        end
    end
endmodule


module shift_register (
    input [7:0] data,
    input clk,
    input shift,
    output reg [7:0] q
);
    always_ff @(posedge clk) begin
        if (shift) begin
            q <= {q[6:0], q[7]};
        end else begin
            q <= data;
        end
    end
endmodule

module register_4bit (
    input [3:0] data,
    input clk,
    input reset,
    input load,
    input enable,
    output reg [3:0] q
);

    d_flip_flop dff0 (
        .d(data[0]),
        .clk(clk),
        .reset(reset),
        .load(load),
        .enable(enable),
        .q(q[0])
    );
    d_flip_flop dff1 (
        .d(data[1]),
        .clk(clk),
        .reset(reset),
        .load(load),
        .enable(enable),
        .q(q[1])
    );
    d_flip_flop dff2 (
        .d(data[2]),
        .clk(clk),
        .reset(reset),
        .load(load),
        .enable(enable),
        .q(q[2])
    );
    d_flip_flop dff3 (
        .d(data[3]),
        .clk(clk),
        .reset(reset),
        .load(load),
        .enable(enable),
        .q(q[3])
    );

endmodule
