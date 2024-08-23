module tst_spi ();

 wire clk_out;
 wire [7:0] SHIFT_REG_DATA_OUT;
 wire MOSI;
 reg [7:0] MISO;
 reg clk,nrst;
 reg [7:0] SHIFT_REG_DATA_IN;



always
begin
#50 clk=~clk;
end

initial
begin 
clk<=1'b1;
nrst<=1'b0;

#100
nrst<=1'b1;
SHIFT_REG_DATA_IN <= 8'b10101010;

end 

spi DUT(
.nrst(nrst),
.clk(clk),
.clk_out(clk_out),
.SHIFT_REG_DATA_IN(SHIFT_REG_DATA_IN),
.SHIFT_REG_DATA_OUT(SHIFT_REG_DATA_OUT),
.MISO(MISO),
.MOSI(MOSI)
);
endmodule
