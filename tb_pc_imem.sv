`timescale 1ns/1ps

module tb_pc_imem;

    // sinyal uji
    logic clk;
    logic rstn;
    logic [31:0] pc_next;
    logic [31:0] pc_curr;
    logic [31:0] instr;

    // instansiasi modul PC
    pc uut_pc (
        .clk(clk),
        .rstn(rstn),
        .pc_next(pc_next),
        .pc_curr(pc_curr)
    );

    // instansiasi modul Instruction Memory
    rom uut_rom (
        .addr(pc_curr),
        .instr(instr)
    );

    // clock generator (periode 10ns)
    always #5 clk = ~clk;

    always_comb begin
        pc_next = pc_curr + 4;
    end

    initial begin
        clk   = 0;
        rstn = 0;
        #10 rstn = 1;

        #50 $finish;
    end

    // monitor output
    initial begin
        $monitor("time=%0t | PC=%h | INSTR=%h", $time, pc_curr, instr);
        $dumpfile("dump.vcd");
        $dumpvars;
    end
endmodule
