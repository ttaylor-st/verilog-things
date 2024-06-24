// Verilog module to print "Hello World!" to the console
//
// Running:
// $ verilator --binary -j 0 --cc hello_world.sv
// $ ./obj_dir/Vhello_world

module hello_world ();

    initial begin
        $display("Hello World!");
        $finish;
    end

endmodule
