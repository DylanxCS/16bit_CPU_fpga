module m_HalfAdder (
  input i_a,
  input i_b,
  output o_sum,
  output o_carry)
  
m_xor xor_gate (
  .i_a(i_a),
  .i_b(i_b),
  .o_out(o_sum)
  );
  
m_and and_gate (
  .i_a(i_a),
  .i_b(i_b),
  .o_out(o_carry)
  );
  
endmodule
