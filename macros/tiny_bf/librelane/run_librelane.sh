#!/usr/bin/env bash

# =====================================================
# Author: Simon Dorrer
# Last Modified: 02.10.2025
# Description: This .sh file switches to the GF180 PDK, runs the LibreLane flow and opens the layout in the OpenROAD GUI.
# =====================================================

set -e -x

cd $(dirname "$0")

# Switch to gf180mcuD PDK
source sak-pdk-script.sh gf180mcuD gf180mcu_fd_sc_mcu7t5v0 > /dev/null

# Run LibreLane
librelane --manual-pdk --run-tag latest --overwrite config.yaml

# Open Layout in OpenROAD GUI
librelane --manual-pdk --last-run config.yaml --flow OpenInOpenROAD
