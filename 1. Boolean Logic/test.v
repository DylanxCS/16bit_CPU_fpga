`timescale 1ns/10ps

module test ();

reg r_CLK = 0;
reg a = 1;
reg b = 1;
reg sel = 0;
wire w_outa;
wire w_outb;

// Clock generation
always #20 r_CLK = ~r_CLK;

m_not16 inst (
  .i_in(a),
  //.i_out(b),
  .i_sel(sel),
  .o_a(w_outa),
  .o_b(w_outb)
);

initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0);
  #60;
  sel = 1;
  #100; 
  $finish;
end

endmodule

