#include <verilated.h>
#include "Vprng.h"

int main(int argc, char **argv) {
    Verilated::commandArgs(argc, argv);
    Vprng* top = new Vprng;

    // Simulate for 20 clock cycles
    for (int i = 0; i < 20; i++) {
        top->clk = !top->clk;
        top->eval();

        if (i % 2 == 1) {
            printf("Random number %0d: %u\n", i/2, top->rand_num);
        }
    }

    delete top;
    return 0;
}
