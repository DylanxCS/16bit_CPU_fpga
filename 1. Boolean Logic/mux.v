//	Truth Table
// a	b	sel	out
// 0	0	 0	 0
// 0	0	 1	 0
// 1	0	 0	 1
// 1	0	 1	 0
// 0	1	 0	 0
// 0	1	 1	 1
// 1	1	 0	 1
// 1	1	 1	 1

// 2x1 mux

module m_mux (
  input i_a,
  input i_b,
  input i_sel, 
  output o_out);

wire not_sel_to_and1;
wire and1_to_or;
wire and2_to_or;

m_not not_sel (
  .i_a(i_sel),
  .o_out(not_sel_to_and1)
  );

m_and and1 (
  .i_a(i_a),
  .i_b(not_sel_to_and1),
  .o_out(and1_to_or)
  );

m_and and2 (
  .i_a(i_sel),
  .i_b(i_b),
  .o_out(and2_to_or)
  );
  
m_or or_gate (
  .i_a(and1_to_or),
  .i_b(and2_to_or),
  .o_out(o_out)
  );
  
endmodule
