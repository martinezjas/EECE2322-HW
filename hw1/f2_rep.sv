module f2_rep(input logic a, b, c, d,
              output logic f2
              );
    logic f2_1;
    logic f2_2;
    logic f2_3;
    logic f2_4;
    logic f2_5;
    logic f2_6;

    nand g1(f2_1, a, a);
    nand g2(f2_2, f2_1, f2_1);
    nand g3(f2_3, b, b);
    nand g4(f2_4, f2_2, f2_3);
    nand g5(f2_5, d, d);
    nand g6(f2_6, f2_4, f2_5);
    nand g7(f2, f2_6, f2_6);
endmodule