//      Truth Table
// in	sel	a	b
// 0	 0	0	0
// 0	 1	0	0
// 1	 0	1	0
// 1	 1	0	1

module dmux (
  input i_in,
  input i_sel,
  output o_a,
  output o_b)
  
wire not_sel_to_and1;
  
m_not not_sel (
  .i_a(i_sel),
  .o_out(not_sel_to_and1)
  );

m_and and1 (
  .i_a(i_in),
  .i_b(not_sel_to_and1),
  .o_out(o_a)
  );

m_and and2 (
  .i_a(i_in),
  .i_b(i_sel),
  .o_out(o_b)
  );
