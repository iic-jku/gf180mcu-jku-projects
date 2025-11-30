#!/usr/bin/env bash

# =====================================================
# Author: Simon Dorrer
# Last Modified: 02.10.2025
# Description: This .sh file loads the Verilog file and outputs stats, such as cells, AND, OR, NOT, XOR, MUX, and registers.
# =====================================================

set -e -x

cd $(dirname "$0")

# Name as input parameter (counter)
name=$1

yosys -p "read_verilog "$name".v; proc; opt; flatten; techmap; stat"
