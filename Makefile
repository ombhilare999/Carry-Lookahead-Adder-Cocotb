# This file is public domain, it can be freely copied without restrictions.
# SPDX-License-Identifier: CC0-1.0

PWD=$(shell pwd)

export PYTHONPATH := $(PWD)/model:$(PYTHONPATH)

TOPLEVEL_LANG ?= verilog
VERILOG_SOURCES = $(shell pwd)/adder.v

TOPLEVEL = adder
MODULE = test_adder

include $(shell cocotb-config --makefiles)/Makefile.sim
