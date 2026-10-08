module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire c;
    wire c0, c1;
    wire [15:0] sum0, sum1;

    // Lower 16-bit adder
    add16 adder1 (
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),
        .sum(sum[15:0]),
        .cout(c)
    );

    // Upper 16-bit adder assuming carry-in = 0
    add16 adder2 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b0),
        .sum(sum0),
        .cout(c0)
    );

    // Upper 16-bit adder assuming carry-in = 1
    add16 adder3 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b1),
        .sum(sum1),
        .cout(c1)
    );

    // 2:1 Multiplexer
    assign sum[31:16] = c ? sum1 : sum0;

endmodule
