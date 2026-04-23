# gf180mcuD - JKU - Projects

Project `JKU1` for wafer.space MPW run using the `gf180mcuD` PDK.

- [x] **GDS Submission:** https://platform.wafer.space/
- [x] **Precheck:** https://github.com/wafer-space/gf180mcu-precheck
- [x] **Projects (Pass):**
  - [x] Multiplexer (Simon Dorrer - JKU)
    - **N/A Reg to Reg Paths**
  - [x] TinyWhisper RISC-V (Jonathan Hager - JMU)
    - **setup violation for SS corner**
  - [x] TinyTone (Jakob Schaumberger - JKU)
  - [x] Decimation Filter (Michael Köfinger - JKU)
    - **N/A Reg to Reg Paths**
  - [x] Octowave (Max Golser - JKU)
    - **setup violation for SS corner**
  - [x] Tetris (Dominik Brandstetter - JKU & HTL Leonding)
    - **setup violation for SS corner**
  - [x] TinyStack (Linzer Technikum)
  - [x] TinyBF (Rene Hahn - JKU)
  - [x] SAR ADC Controller (Ilir Shala - JKU)
  - [x] LED Spinner (Tim Tremetsberger - JKU)
    - **N/A Reg to Reg Paths**
  - [x] TinyToneGen (Felix Feierabend - JKU)
    - **N/A Reg to Reg Paths**
  - [x] Digital Filter (Gregor Flachs - JKU)
  - [x] Traffic Light Controller (Maximilian Kernmaier - JKU)
  - [x] VGA Clock (Timo Laimer - JKU)
    - **setup violation for SS corner**

<p align="center">
  <a href="img/die_foto.JPG">
    <img src="img/die_foto.JPG" alt="Die foto of the wafer.space gf180mcuD MPW Multi-Project Chip (4mm x 5mm)" width=70%>
  </a>
  <br>
  <em>Die foto of the wafer.space gf180mcuD MPW Multi-Project Chip (4mm x 5mm).</em>
</p>

<p align="center">
  <a href="img/chip_top_white.png">
    <img src="img/chip_top_white.png" alt="Render of the wafer.space gf180mcuD MPW Multi-Project Chip (4mm x 5mm)" width=70%>
  </a>
  <br>
  <em>Render of the wafer.space gf180mcuD MPW Multi-Project Chip (4mm x 5mm).</em>
</p>


## Prerequisites

We use a custom fork of the [gf180mcuD PDK variant](https://github.com/wafer-space/gf180mcu) until all changes have been upstreamed.

To clone the latest PDK version, simply run `make clone-pdk`.

In the next step, use LibreLane within the IIC-OSIC-TOOLS container with tag `2026.04` or later or install LibreLane by following the Nix-based installation instructions: https://librelane.readthedocs.io/en/latest/installation/nix_installation/index.html

## Implement the Design

This repository contains a Nix flake that provides a shell with the [`leo/gf180mcu`](https://github.com/librelane/librelane/tree/leo/gf180mcu) branch of LibreLane.

Simply run `nix-shell` in the root of this repository.

> [!NOTE]
> Since we are working on a branch of LibreLane, OpenROAD needs to be compiled locally. This will be done automatically by Nix, and the binary will be cached locally. 

With this shell enabled, run the implementation:

```
make librelane
```

This command is also available for the macros.

## View the Design

After completion, you can view the design using the OpenROAD GUI:

```
make librelane-openroad
```

Or using KLayout:

```
make librelane-klayout
```

These commands are also available for the macros.

## Copying important Reports to the Reports Folder

To copy yosys, antenna violations, hold & setup timing and manufacturability reports of the latest run to the `reports/` folder in the root directory of the repository, run the following command:

```
make copy-reports
```

This will only work if the last run was completed without errors. This command is also available for the macros.

## Copying the Design to the Final Folder

To copy your latest run to the `final/` folder in the root directory of the repository, run the following command:

```
make copy-final
```

This will only work if the last run was completed without errors. This command is also available for the macros.

## Copying the final GDS to the GDS Folder

To copy and ZIP your latest GDS in the `final/` folder in the root directory of the repository and save it in the `gds/` folder, run the following command:

```
make copy-gds
```

This will only work if the last run was completed without errors.

## Render Layout of the Design

To render your latest GDS in the `final/` folder in the root directory of the repository and save it in the `img/` folder, run the following command:

```
make render-image
```

This will only work if the last run was completed without errors. This command is also available for the macros.

## Build Macros

To build a specific macro, look into the `Makefile` and run the corresponding command. For example, the following command builds the `tetris` macro:

```
make build-tetris
```

To build all macros, run the following command:

```
make build-all-macros
```

For each macro the following commands are executed: `make librelane`, `make copy-reports`, `make copy-final` and `make render-image`.

## Build All

To clone the PDK, build all macros, build the top-level chip, copy its reports, copy its `final/` folder, copy and ZIP its GDS, render its GDS and display it in the OpenROAD GUI, run the following command:

```
make build-all
```

This is especially useful for people who want to rebuild our chip from scratch. Just clone this repo, run `nix-shell` in the root of this repository and run `make build-all`. Enjoy. :-)

## Verification and Simulation

We use [cocotb](https://www.cocotb.org/), a Python-based testbench environment, for the verification of the chip.
The underlying simulator is Icarus Verilog (https://github.com/steveicarus/iverilog).

The testbench is located in `cocotb/chip_top_tb.py`. To run the RTL simulation, run the following command:

```
make sim
```

To run the GL (gate-level) simulation, run the following command:

```
make sim-gl
```

> [!NOTE]
> You need to have the latest implementation of your design in the `final/` folder. After implementing the design, execute 'make copy-final' to copy all necessary files.

In both cases, a waveform file will be generated under `cocotb/sim_build/chip_top.fst`.
You can view it using a waveform viewer, for example, [GTKWave](https://gtkwave.github.io/gtkwave/).

```
make sim-view
```

You can now update the testbench according to your design.


## Cite This Work

```
@software{2025_WS_MPW,
	author = {Dorrer, Simon and Hager, Jonathan},
	month = dec,
	year = {2025},
	title = {{GitHub Repository for a wafer.space MPW Multi-Project Chip}},
	url = {https://github.com/iic-jku/gf180mcu-jku-projects},
	doi = {10.5281/zenodo.19654471}
}
```
