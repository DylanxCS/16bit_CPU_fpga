module m_mux4way16 (
  input [15:0] i_a,
  input [15:0] i_b,
  input [15:0] i_c,
  input [15:0] i_d,
  input [1:0] i_sel,
  output [15:0] o_out)

wire mux1_to_mux3;
wire mux2_to_mux3;

m_mux16 mux1 (
  .i_a(i_a),
  .i_b(i_b),
  i_sel(i_sel[0])
  .o_out(mux1_to_mux3)
  );

m_mux16 mux2 (
  .i_a(i_c),
  .i_b(i_d),
  .i_sel(i_sel[0]),
  .o_out(mux2_to_mux3)
  );

m_mux16 mux3 (
  .i_a(mux1_to_mux3),
  .i_b(mux2_to_mux3),
  .i_sel(i_sel[1]),
  .o_out(o_out)
  );

endmodule
