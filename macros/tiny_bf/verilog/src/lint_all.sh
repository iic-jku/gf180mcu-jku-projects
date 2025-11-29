#!/bin/bash
# lint_all.sh
# Run verilator/iverilog linting on all Verilog source files in src/

set -e

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# List of source files to lint (excluding testbenches)
SOURCE_FILES=(
    "baud_gen.v"
    "uart_tx.v"
    "uart_rx.v"
    "reset_sync.v"
    "program_memory.v"
    "tape_memory.v"
    "control_unit.v"
    "bf_top.v"
    "tt_um_rh_bf_top.v"
    "programmer.v"
)

echo "========================================="
echo "Running linter on all source files..."
echo "========================================="

# Run linter on each file
for file in "${SOURCE_FILES[@]}"; do
    if [ -f "$SCRIPT_DIR/$file" ]; then
        echo ""
        echo "--- Linting $file ---"
        iic-vlint.sh "$file"
    else
        echo "Warning: $file not found, skipping..."
    fi
done

echo ""
echo "========================================="
echo "Linting complete!"
echo "========================================="
