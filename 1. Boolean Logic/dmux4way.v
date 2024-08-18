module m_dmux4way (
  input i_in,
  input [1:0] i_sel,
  output o_a,
  output o_b,
  output o_c,
  output o_d)
  
wire dmux1_to_dmux2;
wire dmux1_to_dmux3;

m_dmux dmux1 (
  .i_in(i_in),
  .i_sel(i_sel[1]),
  .o_a(dmux1_to_dmux2),
  .o_b(dmux1_to_dmux3)
  );
  
m_dmux dmux2 (
  .i_in(dmux1_to_dmux2),
  .i_sel(i_sel[0]),
  .o_a(o_a),
  .o_b(o_b)
  );

m_dmux dmux3 (
  .i_in(dmux1_to_dmux3),
  .i_sel(i_sel[0]),
  .o_a(o_c),
  .o_b(o_d)
  );
  
endmodule  
