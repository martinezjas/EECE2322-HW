module DFlipFlop_tb;

  // Inputs
  logic D;
  logic clock;
  logic clear;

  // Outputs
  logic Q;

  // Instantiate the Unit Under Test (UUT)
  DFlipFlop uut (
    .D(D),
    .clock(clock),
    .clear(clear),
    .Q(Q)
  );

  initial begin
    // Initialize inputs
    D = 0;
    clock = 0;
    clear = 0;

    // Wait for 10ns for the inputs to settle
    #10;

    // Test case 1
    D = 1;
    clock = 0;
    clear = 0;
    #10;
    if (Q !== 1'b0) $error;

    // Test case 2
    D = 1;
    clock = 1;
    clear = 0;
    #10;
    if (Q !== 1'b1) $error;

    // Test case 3
    D = 0;
    clock = 1;
    clear = 0;
    #10;
    if (Q !== 1'b1) $error;

    // Test case 4
    D = 0;
    clock = 0;
    clear = 0;
    #10;
    if (Q !== 1'b1) $error;

    // Test case 5
    D = 1;
    clock = 0;
    clear = 1;
    #10;
    if (Q !== 1'b0) $error;

    // Test case 6
    D = 1;
    clock = 1;
    clear = 1;
    #10;
    if (Q !== 1'b0) $error;

    // Test case 7
    D = 0;
    clock = 1;
    clear = 1;
    #10;
    if (Q !== 1'b0) $error;

    // Test case 8
    D = 0;
    clock = 0;
    clear = 1;
    #10;
    if (Q !== 1'b0) $error;

    // End the simulation
    $finish;
  end

endmodule