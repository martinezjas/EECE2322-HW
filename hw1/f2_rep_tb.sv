module f2_rep_tb;

  // Inputs
  logic a, b, c, d;

  // Outputs
  logic f2;

  // Instantiate the Unit Under Test (UUT)
  f2_rep uut (
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .f2(f2)
  );

  // Dump waveforms to VCD file
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end

  // Monitor the inputs and outputs
  initial begin
    $monitor("Time=%0t a=%b b=%b c=%b d=%b f2=%b", $time, a, b, c, d, f2);
  end

  initial begin
    // Initialize inputs
    a = 0;
    b = 0;
    c = 0;
    d = 0;

    // Wait for 10ns for the inputs to settle
    #10;

    // Test case 1
    a = 1;
    b = 1;
    c = 1;
    d = 1;
    #10;

    // Test case 2
    a = 1;
    b = 1;
    c = 1;
    d = 0;
    #10;

    // Test case 3
    a = 1;
    b = 1;
    c = 0;
    d = 1;
    #10;

    // Test case 4
    a = 1;
    b = 1;
    c = 0;
    d = 0;
    #10;

    // Test case 5
    a = 1;
    b = 0;
    c = 1;
    d = 1;
    #10;

    // Test case 6
    a = 1;
    b = 0;
    c = 1;
    d = 0;
    #10;

    // Test case 7
    a = 1;
    b = 0;
    c = 0;
    d = 1;
    #10;

    // Test case 8
    a = 1;
    b = 0;
    c = 0;
    d = 0;
    #10;

    // Test case 9
    a = 0;
    b = 1;
    c = 1;
    d = 1;
    #10;

    // Test case 10
    a = 0;
    b = 1;
    c = 1;
    d = 0;
    #10;

    // Test case 11
    a = 0;
    b = 1;
    c = 0;
    d = 1;
    #10;

    // Test case 12
    a = 0;
    b = 1;
    c = 0;
    d = 0;
    #10;

    // Test case 13
    a = 0;
    b = 0;
    c = 1;
    d = 1;
    #10;

    // Test case 14
    a = 0;
    b = 0;
    c = 1;
    d = 0;
    #10;

    // Test case 15
    a = 0;
    b = 0;
    c = 0;
    d = 1;
    #10;

    // Test case 16
    a = 0;
    b = 0;
    c = 0;
    d = 0;
    #10;

    // End the simulation
    $finish;
  end

endmodule