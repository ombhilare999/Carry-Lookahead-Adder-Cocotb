//Carry Lookahead Adder

`include "full_adder.v"

module adder
(
    input [3:0] i_a,
    input [3:0] i_b,
    input       i_c,
    output [4:0] o_s
);

    wire [3:0] w_gc;
    wire [3:0] w_pc;
    wire [4:0] w_c;
    wire [3:0] w_sum;

    //Produce Generated Carry
    assign w_gc = i_a & i_b;

    //Produce Propogate Carry
    assign w_pc = i_a | i_b;

    //Predicate CARRY bits
    assign w_c[0] = i_c;        //Input Carry
    assign w_c[1] = w_gc[0] | (w_pc[0] & w_c[0]);
    assign w_c[2] = w_gc[1] | (w_pc[1] & w_c[1]);
    assign w_c[3] = w_gc[2] | (w_pc[2] & w_c[2]);
    assign w_c[4] = w_gc[3] | (w_pc[3] & w_c[3]);

    //Instants the full adder module

    full_adder bit_0
    (
        .i_a(i_a[0]),
        .i_b(i_b[0]),
        .i_c(w_c[0]),
        .o_s(w_sum[0]),
        .o_c()   
    );

    full_adder bit_1
    (
        .i_a(i_a[1]),
        .i_b(i_b[1]),
        .i_c(w_c[1]),
        .o_s(w_sum[1]),
        .o_c()   
    );

    full_adder bit_2
    (
        .i_a(i_a[2]),
        .i_b(i_b[2]),
        .i_c(w_c[2]),
        .o_s(w_sum[2]),
        .o_c()   
    );

    full_adder bit_3
    (
        .i_a(i_a[3]),
        .i_b(i_b[3]),
        .i_c(w_c[3]),
        .o_s(w_sum[3]),
        .o_c()   
    );

    //Assigning output 
    assign o_s = {w_c[4], w_sum};

    // Dump waves
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(1, adder);
    end
endmodule
