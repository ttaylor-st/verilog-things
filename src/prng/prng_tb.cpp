#include <verilated.h>
#include "Vprng.h"

int main(int argc, char **argv) {
    Verilated::commandArgs(argc, argv);
    Vprng* top = new Vprng;

    top->seed = 0x2A;
    top->clk = 0;

    // Simulate for 20 clock cycles
    for (int i = 0; i < 20; i++) {
        top->clk = !top->clk; // Toggle clock
        top->eval();

        if (i % 2 == 1) {
            printf("Random number %0d: %u\n", i/2, top->rand_num);
        }

        // Change seed value every 5 cycles as an example
        if (i % 5 == 0) {
            top->seed = i + 1;
        }
    }

    delete top;
    return 0;
}
