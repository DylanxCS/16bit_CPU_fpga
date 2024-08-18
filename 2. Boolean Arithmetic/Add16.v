module m_Add16 (
  input [15:0] i_a,
  input [15:0] i_b,
  output [15:0] o_out)
  
wire HA_carry_to_FA1;
wire [14:0] FA_carry_chain;

m_HalfAdder HA (
  .i_a(i_a[0]),
  .i_b(i_b[0]),
  .o_sum(o_out[0]),
  .o_carry(HA_carry_to_FA1);
  );

genvar i;
generate
  for (i = 0; i < 14; i = i + 1)
  begin
    m_FullAdder FA (
      .i_a(i_a[i]),
      .i_b(i_b[i]),
      .o_sum(
