module rv32i_top(
    input logic     clk,
    input logic    rst_n,

    //Instruction Memory Interface

    //32-bit address bus sent from CPU to instruction memory
    output logic [31:0] imem_addr,
    //32-bit instruction data read back from memory into CPU
    input logic [31:0] imem_rdata,

    //Data Memory Interface

    //Data Memory Write Enable (when 1 CPU is writing to memory, when 0 CPU is reading from memory)
    output logic        dmem_we,
    //Target address for load (LW) or store (SW) instruction
    output logic [31:0] dmem_addr,
    //32-bit data value coming out of a reg file to be written to memory
    output logic [31:0] dmem_wdata,
    //32-bit data value read from memory during load instruction, eventually written back into a reg
    input logic [31:0] dmem_rdata
);

//internal wires

endmodule 