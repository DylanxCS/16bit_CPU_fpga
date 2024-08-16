// and gate with two 16-bit wide inputs
module m_and16 #(parameter N = 16)
  (
  input [N-1:0] i_a,
  input [N-1:0] i_b,
  output [N-1:0] o_out
  )
  
genvar i;
generate
  for (i = 0; i < N; i = i + 1)
  begin
    m_and N_and_insts (
      .i_a(i_a[i]),
      .i_b(i_b[i]),
      .o_out(o_out[i])
      );
   end
endgenerate
  
endmodule
