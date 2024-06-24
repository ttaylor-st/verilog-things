# register_4bit

implements a simple 4-bit register using systemverilog.

## structure

- `register_4bit.sv`: the 4-bit register module
- `register_4bit_tb.sv`: the testbench

## usage

to run the testbench, you need to have a systemverilog simulator installed. i
used `verilator`.

tracing is required.

```bash
$ verilator -cc register_4bit.sv --exe register_4bit_tb.cpp
$ make -C obj_dir -j -f Vregister_4bit.mk Vregister_4bit
$ ./obj_dir/
```

or, all together:

```bash
$ verilator --cc register_4bit.sv --exe register_4bit_tb.cpp --build -o Vregister_4bit --timing --top-module register_4bit --trace
$ ./Vregister_4bit
```
