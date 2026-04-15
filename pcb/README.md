# PCB Notes

## Authors

- Simon Dorrer
- Dominik Brandstetter
- Jakob Schaumberger
- Max Zaglmayr
- Max Golser

## TODO

- Order DIP breakout boards: Simon Dorrer

## Links

- CoB breakout board: https://github.com/wafer-space/chip-on-board-wire-bonded-pcbs
- Tiny Tapeout demo PCB: https://github.com/TinyTapeout/tt-demo-pcb
- Tiny Tapeout PCB files: https://github.com/TinyTapeout/pcb-files
- VGA breakout board: https://github.com/mole99/tiny-vga
- GF180MCU-D JKU projects: https://github.com/iic-jku/gf180mcu-jku-projects

## Required Components

### General

- 1x 3-bit DIP switch
- 3x buttons + reset
- Copy the Tiny Tapeout VGA breakout board
- External GPIO headers (see Tiny Tapeout demo PCB)
- Fan for cooling (optional)

### MCU

- See Tiny Tapeout demo PCB
- Connect all inputs to the MCU
- Connect all outputs to the MCU
- USB-C
- I2C display
- Pin count TBD: PCA9555 IO/I2C or RP2350
- Level shifter (3.3 V / 5 V)

### Octowave

- Multiple-feedback filters (Max Golser)

### TinyWhisper

- See TinyWhisper PCB (Simon Dorrer)

### Decimation Filter

- SPI

### TinyTone

- Switching transistor + buzzer

### Tetris

- SNES connector to MCU (copy from Tiny Tapeout demo PCB)
- VGA output (see Tiny Tapeout demo PCB)
- Dominik Brandstetter + HTL Leonding

### TinyStack

- 8x LEDs

### TinyBF

- Waiting for response (Rene Hahn)

### SAR ADC Controller

- Waiting for response (Ilir Shala)

### LED Spinner

- 7-segment display (see Tiny Tapeout boards)
- Buttons

### TinyToneGen

- Low-pass active filter

### Digital Filter

- MCU only

### Traffic Light Control

- LED matrix for pedestrian signs
- LEDs for traffic lights
- Silkscreen for pedestrian crossing

### VGA Clock

- Combine VGA with Tetris (OR)
