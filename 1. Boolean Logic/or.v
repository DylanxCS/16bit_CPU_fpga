module m_or (
  input i_a,
  input i_b,
  output o_out)
  
if (i_a == 1)
  assign o_out = 1;
else if (i_b == 1)
  assign o_out = 1;
else
  assign o_out = 0;