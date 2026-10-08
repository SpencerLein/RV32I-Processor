module tb_rv32i_top;

    //clock and reset signals
    logic clk;
    logic rst_n;

    //instruction memory interface signals
    logic [31:0] imem_addr;
    logic [31:0] imem_rdata;

    //data memory interface signals
    logic       dmem_we;
    logic [31:0] dmem_addr;
    logic [31:0] dmem_wdata;
    logic [31:0] dmem_rdata;

    //Behavioral Instruction Array
    logic [31:0] imem [0:255]; 

    //instantiate the rv32i_top module
    rv32i_top dut(
        .clk(clk),
        .rst_n(rst_n),
        .imem_addr(imem_addr),
        .imem_rdata(imem_rdata),
        .dmem_we(dmem_we),
        .dmem_addr(dmem_addr),
        .dmem_wdata(dmem_wdata),
        .dmem_rdata(dmem_rdata)
    );

    //Continuous assignment to read instruction memory based on address from CPU
    assign imem_rdata = imem[imem_addr[31:2]];

    //clock generation 
    always #5 clk = ~clk;

    //Reset Sequence
    initial begin 
        clk = 0;
        rst_n = 0;
        #10;
        rst_n = 1;
    end

    //Simulation control
    initial begin
        $dumpfile("sim/tb_rv32i_top.vcd");
        $dumpvars(0, tb_rv32i_top);

        //Load instruction memory from hex file
        $readmemh("imem.hex", imem); 

        #1000; //run simulation for 1000 time units
        $finish;
    end
endmodule
    