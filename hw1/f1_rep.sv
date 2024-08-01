module f1_rep(input logic a, b, c, d,
              output logic f1
             );
  assign f1_1 = a;
  assign f1_2 = ~b & d;
  assign f1_3 = ~b & c;
  assign f1_4 = b & ~d;
  assign f1 = f1_1 | f1_2 | f1_3 | f1_4;
endmodule