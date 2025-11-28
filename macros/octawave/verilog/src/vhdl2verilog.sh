#!/usr/bin/env bash

# =====================================================
# Author: Simon Dorrer
# Last Modified: 05.11.2025
# Description: This .sh file converts the VHDL files into one Verilog file.
# =====================================================

set -e -x

cd $(dirname "$0")

RTL=${RTL:-../../vhdl/src}
SRC_FOLDER=${SRC_FOLDER:-.}

mkdir -p build

# Analyze sources
ghdl -a --std=93c --work=octawave --workdir=build -Pbuild \
  "$RTL"/constants_pkg.vhd \
  "$RTL"/lut_pkg.vhd \
  "$RTL"/phase_to_amplitude.vhd \
  "$RTL"/phase_accumulator.vhd \
  "$RTL"/direct_digital_synthesis.vhd \
  "$RTL"/sigma_delta_modulator.vhd \
  "$RTL"/channel.vhd \
  "$RTL"/synthesizer.vhd \
  "$RTL"/UART_DECODER.vhd \
  "$RTL"/UART_TX.vhd \
  "$RTL"/UART_RX.vhd \
  "$RTL"/UART_CORE.vhd \
  "$RTL"/octawave.vhd

# Top entity
ghdl -m --std=93c --work=octawave --workdir=build -Pbuild octawave

# Synthesize: generate Verilog output
ghdl synth --std=93c --work=octawave --workdir=build -Pbuild --out=verilog octawave > "$SRC_FOLDER"/octawave.v

# Show interface of generated Verilog module
echo ""
echo "------ counter_board interface ------"
sed -n "/module counter_board/,/);/p" "$SRC_FOLDER"/octawave.v
echo ""
