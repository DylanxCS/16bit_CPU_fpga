// 1-bit, 8-way or gate
module m_or8way (
  input [7:0] i_a,
  output o_out)
  
wire out1, out2, out3, out4, out5, out6, out;
  
m_or or1 (
  .i_a(i_a[0]),
  .i_b(i_a[1]),
  .o_out(out1)
  );

m_or or2 (
  .i_a(i_a[2]),
  .i_b(i_a[3]),
  .o_out(out2)
  );

m_or or3 (
  .i_a(i_a[4]),
  .i_b(i_a[5]),
  .o_out(out3)
  );

m_or or4 (
  .i_a(i_a[6]),
  .i_b(i_a[7]),
  .o_out(out4)
  );

m_or or5 (
  .i_a(i_a[out1]),
  .i_b(i_a[out2]),
  .o_out(out5)
  );

m_or or6 (
  .i_a(i_a[out3]),
  .i_b(i_a[out4]),
  .o_out(out6)
  );

m_or or7 (
  .i_a(i_a[out6]),
  .i_b(i_a[out5]),
  .o_out(o_out)
  );

endmodule
