// Attempt at implementing a simple pseudo-random number generator (PRNG) in SystemVerilog
// References:
// - https://en.wikipedia.org/wiki/Linear_congruential_generator

module prng (
    input logic [31:0] seed,
    output logic [31:0] rand_num,
    input logic clk
);
    // Internal state of the generator
    logic [31:0] state;

    // Parameters for the LCG
    parameter int unsigned A = 1103515245;
    parameter int unsigned C = 12345;
    parameter int unsigned M = 2 ** 31;

    // Initialize the state
    initial begin
        state = seed;
    end

    // Generate (the next) random number
    always_ff @(posedge clk) begin
        if (seed != state) begin
            state <= seed;
        end else begin
            state <= (A * state + C) % M;
        end
        rand_num <= state;
    end
endmodule
