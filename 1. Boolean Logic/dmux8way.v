m_dmdux8way (
  input i_in,
  input [2:0] i_sel,
  output o_a,
  output o_b,
  output o_c,
  output o_d,
  output o_e,
  output o_f,
  output o_g,
  output o_h,
  )
  
wire dmux1_to_dmux2;
wire dmux1_to_dmux3;
  
m_dmux dmux1 (
  .i_in(i_in),
  .i_sel(i_sel[2]),
  .o_a(dmux1_to_dmux2),
  .o_b(dmux1_to_dmux3)
  );
  
m_dmux4way dmux2 (
  .i_in(dmux1_to_dmux2),
  .i_sel(i_sel[0:1]),
  .o_a(o_a),
  .o_b(o_b),
  .o_c(o_c),
  .o_d(o_d)
  );
  
m_dmux4way dmux3 (
  .i_in(dmux1_to_dmux3),
  .i_sel(i_sel[0:1]),
  .o_a(o_e),
  .o_b(o_f),
  .o_c(o_g),
  .o_d(o_h)
  );

endmodule
