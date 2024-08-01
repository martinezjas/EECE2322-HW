module DFlipFlop (
  input wire D,
  input wire clock,
  input wire clear,
  output wire Q
);

  always_ff @(posedge clock or posedge clear) begin
    if (clear)
      Q <= 1'b0; // Clear the flip-flop asynchronously when clear is active
    else if (D)
      Q <= 1'b1; // Set Q to 1 when D is high
    else
      Q <= 1'b0; // Reset Q to 0 when D is low
  end

endmodule

