// 2x1 mux with 16 bit wide inputs
module m_mux16_OLD (
  input [15:0] i_a,
  input [15:0] i_b,
  input i_sel,
  input [15:0] o_out)

wire not_sel_to_and1;
wire [15:0] and1_to_or;
wire [15:0] and2_to_or;

m_not not_sel (
  .i_a(i_sel),
  .o_out(not_sel_to_and1)
  );

genvar i;
generate
  for (i = 0; i < 16; i = i + 1)
  begin
    m_and and1 (
      .i_a(i_a[i]),
      .i_b(not_sel_to_and1),
      .o_out(and1_to_or[i])
      );

    m_and and2 (
      .i_a(i_sel),
      .i_b(i_b[i]),
      .o_out(and2_to_or[i])
      );
  
    m_or or_gate (
      .i_a(and1_to_or[i]),
      .i_b(and2_to_or[i]),
      .o_out(o_out[i])
      );
  
endmodule
