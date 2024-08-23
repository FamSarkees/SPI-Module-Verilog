module spi
(
    input wire clk,nrst,
    output reg clk_out,
    input wire [7:0] SHIFT_REG_DATA_IN,
    output reg [7:0] SHIFT_REG_DATA_OUT,

    input wire [7:0] MISO,
    output reg MOSI
);

reg [2:0] COUNTER;
reg [7:0] i;

always @(posedge clk or negedge nrst) begin
    if (~nrst) begin
        COUNTER <= 3'b000;
        clk_out <= 0;
        SHIFT_REG_DATA_OUT <= 0;
        i <= 8'b00000000;
    end
    else begin
        COUNTER <= COUNTER + 1;
        if (COUNTER < 4) begin
                    clk_out <= clk;
        end
        else begin
            case (COUNTER)
             3'b100: clk_out <= ~clk;
            endcase  
        end
        SHIFT_REG_DATA_OUT <= SHIFT_REG_DATA_IN;
        end
end 

    // MOSI <= SHIFT_REG_DATA_OUT;

    always @(posedge clk_out) begin
        MOSI <= SHIFT_REG_DATA_OUT[i];
         i   <= i+1;
    end
 
endmodule