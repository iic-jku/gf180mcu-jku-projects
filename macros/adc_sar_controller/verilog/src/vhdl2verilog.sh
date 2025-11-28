#!/usr/bin/env bash

# =====================================================
# Author: Simon Dorrer & Ilir Shala
# Last Modified: 05.11.2025
# Description: This .sh file converts the VHDL files into one Verilog file.
# =====================================================

set -e -x

cd $(dirname "$0")

RTL=${RTL:-../../vhdl/src}
SRC_FOLDER=${SRC_FOLDER:-.}

mkdir -p build

# Analyze sources
ghdl -a --std=93c --work=sar_adc --workdir=build -Pbuild \
  "$RTL"/sar_adc_8bit_ea.vhd \

# Top entity
ghdl -m --std=93c --work=sar_adc --workdir=build -Pbuild sar_adc_spi_oversampling

# Synthesize: generate Verilog output
ghdl synth --std=93c --no-formal --work=sar_adc --workdir=build -Pbuild --out=verilog sar_adc_spi_oversampling > "$SRC_FOLDER"/sar_adc_8bit_ea.v

# Show interface of generated Verilog module
echo ""
echo "------ counter_board interface ------"
sed -n "/module counter_board/,/);/p" "$SRC_FOLDER"/sar_adc_8bit_ea.v
echo ""
