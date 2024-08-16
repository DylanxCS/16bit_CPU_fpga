// 16-bit, 4-way multiplexer

module m_mux4way16_OLD (
  input [15:0] i_a,
  input [15:0] i_b,
  input [15:0] i_c,
  input [15:0] i_d,
  input i_sel1,
  input i_sel2,
  output [15:0] o_out)
  
  wire not_sel1;
  wire not_sel2;
  wire [15:0] not_sel1_to_and1;
  wire [15:0] not_sel1_to_and3;
  wire [15:0] not_sel2_to_and1;
  wire [15:0] not_sel2_to_and2;
  wire and1_to_or;
  wire and2_to_or;
  wire and3_to_or;
  wire and4_to_or;
  
m_not not1 (
  .i_a(i_sel1),
  .o_out(not_sel1)
  );
assign not_sel1_to_and1 = {16{not_sel1}};
assign not_sel1_to_and3 = {16{not_sel1}};
  
m_not not2 (
  .i_a(i_sel2),
  .o_out(not_sel2)
  );
assign not_sel2_to_and1 = {16{not_sel2}};
assign not_sel2_to_and2 = {16{not_sel2}};
  
m_and16 and1 (
  .i_a(i_a),
  .i_b(not_sel1_to_and1),
  .o_out(and1_to_or)
  );

m_and16 and2 (
  .i_a(i_b),
  .i_b(not_sel2_to_and1),
  .o_out(and2_to_or)
  );

m_and16 and3 (
  .i_a(i_c),
  .i_b(not_sel1_to_and1),
  .o_out(and1_to_or)
  );

m_and16 and1 (
  .i_a(i_a),
  .i_b(not_sel1_to_and1),
  .o_out(and1_to_or)
  );
