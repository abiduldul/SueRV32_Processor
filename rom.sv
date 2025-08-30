module rom (
    input logic [31:0] addr,
    output logic [31:0] instr
);
    
logic [31:0] mem[0:255];
initial begin
    mem[0] = 32'h00000013; // NOP (ADDI x0, x0, 0)
    mem[1] = 32'h00100093; // ADDI x1, x0, 1
    mem[2] = 32'h00200113; // ADDI x2, x0, 2
    mem[3] = 32'h002081B3; // ADD x3, x1, x2
    mem[4] = 32'h00000073; // ECALL (stop)
end

assign instr = mem[addr[9:2]]; //karena pc+4 jadi buang 2 bit lsbnya
endmodule