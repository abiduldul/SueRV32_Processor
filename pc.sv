//This is fetching step in the first step of SueRV32 Processor
//Copyright by Abidul Qohar

module pc(
    input logic clk,        
    input logic rstn,
    input logic [31:0] pc_next, 
    output logic [31:0] pc_curr //terhubung ke addr rom
);

always_ff @(negedge clk or negedge rstn) begin
    if(!rstn) begin
        pc_curr <= 32'h0;
    end
    else begin
        pc_curr <= pc_next;
    end
end
    
endmodule