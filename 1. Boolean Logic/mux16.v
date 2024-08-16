// 2x1 mux with 16 bit wide inputs
module m_mux16 (
  input [15:0] i_a,
  input [15:0] i_b,
  input i_sel,
  input [15:0] o_out)

wire not_sel;
wire [15:0] not_sel_to_and1;
wire [15:0] and1_to_or;
wire [15:0] and2_to_or;

m_not not_sel (
  .i_a(i_sel),
  .o_out(not_sel)
  );

assign not_sel_to_and1 = {16{not_sel}};

m_and16 and1 (
  .i_a(i_a),
  .i_b(not_sel_to_and1),
  .o_out(and1_to_or)
  );

m_and16 and2 (
  .i_a(i_b),
  .i_b(sel16),
  .o_out(and2_to_or)
  );

m_or16 or_gate (
  .i_a(and1_to_or),
  .i_b(and2_to_or),
  .o_out(o_out)
  );
  
endmodule
