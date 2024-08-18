module m_mux8way16 (
  input [15:0] i_a,
  input [15:0] i_b,
  input [15:0] i_c,
  input [15:0] i_d,
  input [15:0] i_e,
  input [15:0] i_f,
  input [15:0] i_g,
  input [15:0] i_h,
  input [2:0] i_sel,
  ouput [15:0] o_out)
  
wire mux1_to_or;
wire mux2_to_or;
  
m_mux4way16 mux1 (
  .i_a(i_a),
  .i_b(i_b),
  .i_c(i_c),
  .i_d(i_d),
  .i_sel(i_sel[0:1]),
  .o_out(mux1_to_or)
  );

m_mux4way16 mux2 (
  .i_a(i_e),
  .i_b(i_f),
  .i_c(i_g),
  .i_d(i_h),
  .i_sel(i_sel[0:1]),
  .o_out(mux2_to_or)
  );

m_or16 or_gate (
  .i_a(mux1_to_or),
  .i_b(mux2_to_or),
  .o_out(o_out)
  );
  
endmodule
