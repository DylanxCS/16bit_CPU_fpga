module m_Inc16 (
  input [15:0] i_a,
  output o_out)
  
m_Add16 Increment_by_one (
  .i_a(i_a),
  .i_b(16b'1),
  .o_out(o_out)
  );

endmodule
