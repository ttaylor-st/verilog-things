# lsc pseudo-random number generator (prng)

implements a basic prng using systemverilog using the linear congruential
generator algorithm.

## structure

- `prng.sv` : the prng module
- `prng_tb.cpp` : the testbench

## usage

to run the testbench, you need to have a systemverilog simulator installed. i
used `verilator`.

```bash
$ verilator -cc prng.sv --exe prng_tb.cpp
$ make -C obj_dir -j -f Vprng.mk Vprng
$ ./obj_dir/Vprng

# or, all together:
$ verilator --cc src/prng.sv --exe src/prng_tb.cpp --build -o Vprng --timing
$ ./Vprng
```



## how it work

### `prng.sv`

the prng module is a simple linear congruential generator. it uses the formula:
$`X_{n+1} = (a \cdot X_n + c) \mod m`$ (fancy math notation woah)

where:
- $`a`$ is the multiplier
- $`c`$ is the increment
- $`m`$ is the modulus

the module takes in the following inputs:
- `seed`: 32-bit input, the initial seed value
- `clk`: the clock signal for generating numbers on each positive edge

and gives the following outputs:
- `rand_num`: 32-bit output, the pseudo-random number generated

### `prng_tb.cpp`

todo

## license

prng follows the same license as its parent project, view
[LICENSE](../../LICENSE) for more information.
