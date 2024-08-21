module m_ALU (
  input [15:0] x,
  input [15:0] y,
  input zx,
  input nx,
  input zy,
  input ny,
  input f,
  input no,
  output o_out,
  output o_zr, 
  output o_ng)
  
reg [15:0] r_x;
reg [15:0] r_y;
assign r_x = x;
assign r_y = y;
reg [15:0] r_out;
  
if (zx = 1)
begin
  r_x <= 16b'0;
end

if (nx = 1)
begin 
  m_not16 not_x (
    .i_a(r_x),
    .o_out(r_x)
    );
end

if (zy = 1)
begin
  r_y <= 16b'0;
end

if (ny = 1)
begin 
  m_not16 not_y (
    .i_a(r_y),
    .o_out(r_y)
    );
end

if (f = 1)
begin
  m_Add16 Add_xy (
    .i_a(r_x),
    .i_b(r_y),
    .o_out(r_out)
    );
end
else
begin
  m_and16 and_xy (
    .i_a(r_x),
    .i_b(r_y),
    .o_out(r_out)
    );
end

if (no = 1)
begin 
  m_not16 not_out (
    .i_a(r_out),
    .o_out(r_out)
    );
end

assign o_out = r_out

endmodule
