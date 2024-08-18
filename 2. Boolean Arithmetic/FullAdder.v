module m_FullAdder (
  input i_a,
  input i_b,
  input i_c,
  output o_sum,
  output o_carry)
  
wire sum1_to_HalfAdder2;
wire carry1_to_or;
wire carry2_to_or;
  
m_HalfAdder HalfAdder1 (
  .i_a(i_a),
  .i_b(i_b),
  .o_sum(sum1_to_HalfAdder2),
  .o_carry(carry1_to_or)
  );

m_HalfAdder HalfAdder2 (
  .i_a(sum1_to_HalfAdder2),
  .i_b(i_c),
  .o_sum(o_sum),
  .o_carry(carry2_to_or)
  );
  
m_or or_gate (
  .i_a(carry1_to_or),
  .i_b(carry2_to_or),
  o_out(o_carry)
  );

