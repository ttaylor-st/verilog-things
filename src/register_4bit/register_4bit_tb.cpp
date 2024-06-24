#include "Vregister_4bit.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

int main(int argc, char **argv, char **env) {
    if (false && argc && argv && env) {}
    Verilated::commandArgs(argc, argv);
    Verilated::traceEverOn(true);

    Vregister_4bit *top = new Vregister_4bit;
    VerilatedVcdC *tfp = new VerilatedVcdC;
    top->trace(tfp, 99);
    tfp->open("register_4bit.vcd");

    // Initialize signals
    top -> data = 0;
    top -> clk = 0;
    top -> reset = 0;
    top -> load = 0;
    top -> enable = 0;

    // Simulate for 100 clock cycles
    for (int i = 0; i < 100; i++) {
        top->clk = !top->clk;
        top->eval();
        tfp->dump(i);
        if (i == 2) top->reset = 1;
        if (i == 4) top->reset = 0;
        if (i == 6) {
            top->data = 0xA;
            top->load = 1;
            top->enable = 1;
        }
        if (i == 8) top->load = 0;
    }

    top->final();
    tfp->close();
    delete top;
    delete tfp;

    return 0;
}
