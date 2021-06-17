# Verification test of Carry Lookahead Adder using cocotb

- [Installing Cocotb](https://github.com/cocotb/cocotb#installation):
```
pip install cocotb
```
- To Simulate the HDLs using iVerilog:

```
make sim=icarus
```

- To observe the waveforms

```
gtkwave dump.vcd
```

- To clean the build files

```
make clean
```

- Resources 
    - [Cocotb examples](https://github.com/cocotb/cocotb/tree/master/examples)
    - [Cocotb Docs](https://docs.cocotb.org/en/stable/examples.html#)