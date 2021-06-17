import cocotb
from cocotb.triggers import Timer
from adder_model import adder_model
import random


@cocotb.test()
async def adder_basic_test(dut):
    """Test for 5 + 10"""
    A = 5
    B = 10
    C = 0 

    dut.i_a <= A
    dut.i_b <= B
    dut.i_c <= C

    await Timer(2, units='ns')
    assert dut.o_s.value == adder_model(A, B), f"Adder result is incorrect: {dut.o_s.value} != 15"

@cocotb.test()
async def adder_randomised_test(dut):
    """Test for adding 2 random numbers multiple times"""
    dut.i_c <= 0

    for i in range(10):

        A = random.randint(0, 15)
        B = random.randint(0, 15)

        dut.i_a <= A
        dut.i_b <= B

        await Timer(2, units='ns')

        assert dut.o_s.value == adder_model(A, B), "Randomised test failed with: {A} + {B} = {X}".format(
            A=dut.i_a.value, B=dut.i_b.value, X=dut.o_s.value)
