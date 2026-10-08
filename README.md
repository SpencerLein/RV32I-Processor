# RISC-V RV32I Processor with Custom Matrix Multiplication Coprocessor

A custom implementation of a RISC-V RV32I core integrated with a hardare matrix multiplication accelerator, eventually designed and verified using open-source EDA tools.

## Features

* **RV32I Core(ONGOING):** Implements base integer instructions with support for instruction and data memory interfaces.
* **Matrix Multiplication Coprocessor(ONGOING):** Custom hardware accelerator designed to speed up matrix operations.
* **Simulation Flow(ONGOING):** Verified using Icarus Verilog(`iverilog`) and `vvp`, with waveform inspection using GTKWave.
* **Synthesis Ready(ONGOING):** Configured for logic synthesis and netlist generation using Yosys.

## Project structure

rtl/
    rv32i_top.sv
sim/
    tb_rv32i_top.sv
sw/

synth/
    constraints.sdc
    synth.ys
LICENSE
README.md

### Prerequisites

Ensure that you have **Icarus Verilog** and **GTKWave** installed and added to your system PATH.

### Running (Windows / Icarus Verilog)

1. Compile the RTL and testbench using `iverilog`:

   ```bash
    iverilog -g2012 -o sim/temp.out rtl/rv32i_top.sv sim/tb_rv32i_top.sv

2. Execute compiled simulation via `vvp` to generate VCD waveform:

   ```bash
    vvp sim/temp.out

3. Open waveform in GTKWave to inspect signals:

   ```bash
    gtkwave sim\tb_rv32i_top.vcd

4. To run logic synthesis and export a structural netlist using YoWASP yosys via `python`:

    ```bash
    yowasp yosys -s synth.ys

   To run via `yosys`:

    ```bash
    yosys -s synth.ys
