add_wave double_counter.clk double_counter.rst  double_counter.c0  double_counter.c1
force double_counter.clk 1 0, 0 5 -repeat 10
force double_counter.rst  1'b0 0, 1'b1 20ns, 1'b0 300ns, 1'b1 320ns -freeze
run 4587780ns
