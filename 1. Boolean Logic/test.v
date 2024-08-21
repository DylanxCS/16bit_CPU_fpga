`timescale 1ns/10ps

module test ();

reg r_CLK = 0;
reg a = 0;
reg b = 0;
wire w_out;

// Clock generation
always #20 r_CLK = ~r_CLK;

m_or inst (
  .i_a(a),
  .i_b(b),
  .o_out(w_out)
);

initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0);
  #60;
  b = 1;
  #100; 
  $finish;
end

endmodule

