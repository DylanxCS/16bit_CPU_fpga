//   Truth Table
// a	b	out
// 0	0	 0
// 1	0	 1
// 0	1	 1
// 1	1	 0

module m_xor (
  input i_a,
  input i_b,
  output o_out)
  
  wire not_a_to_and2;
  wire not_b_to_and1;
  
  wire o_and1_to_or;
  wire o_and2_to_or;
  
m_not not_a (
  .i_a(i_a),
  .o_out(not_a_to_and2)
  );
  
m_not not_b (
  .i_a(i_b),
  .o_out(not_b_to_and1)
  );

m_and and1 (
  .i_a(i_a),
  .i_b(not_b_to_and1),
  .o_out(o_and1_to_or)
  );
  
m_and and2 (
  .i_a(not_a_to_and2),
  .i_b(i_b),
  .o_out(o_and2_to_or)
  );

m_or or_gate (
  .i_a(o_and1_to_or),
  .i_b(o_and2_to_or),
  .o_out(o_out)
  );
