# verilog things

stupid things in (system)verilog.

why am i doing this

## things

- [`helloworld`](./src/hello_world.sv) - a simple hello world module
- [`prng`](./src/prng) - a simple pseudo-random number generator (PRNG) based
on a linear feedback shift register (LFSR).

you can find all the things in the [src](./src) directory.

## usage

make sure you have a systemverilog simulator installed. i'm assuming you have
`verilator` installed.

some things will have instructions on how to run them in their respective
directories in a `README.md` file, others might have instructions in the
top-level comments of the source files (e.g.,
[`hello_world.sv`](src/hello_world.sv)).

otherwise, you can *probably* run the following commands to compile and run the
things:

```bash
$ verilator --binary -j 0 --cc src/thing.sv
$ ./obj_dir/Vthing
```

## license

verilog-things is licensed under MIT, view [LICENSE](./LICENSE) for more
information.
