module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

    wire [31:0] b_xor;
    wire carry;

    // Invert b when sub = 1
    assign b_xor = b ^ {32{sub}};

    // Lower 16 bits
    add16 adder1 (
        .a(a[15:0]),
        .b(b_xor[15:0]),
        .cin(sub),
        .sum(sum[15:0]),
        .cout(carry)
    );

    // Upper 16 bits
    add16 adder2 (
        .a(a[31:16]),
        .b(b_xor[31:16]),
        .cin(carry),
        .sum(sum[31:16]),
        .cout()
    );

endmodule
