![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/test/badge.svg) ![](../../workflows/fpga/badge.svg)

# TinyBF - Brainfuck CPU for GF180 Tapeout

TinyBF is a complete hardware implementation of a Brainfuck interpreter designed for ASIC fabrication through the GF180 tapeout. The design includes a full CPU with UART I/O capabilities, programmable RAM-based instruction storage, and a UART-based program uploader.

## Features

- **Complete Brainfuck interpreter** with all 8 commands plus optimized instruction encoding
- **11-state FSM CPU core** with one-hot encoding for minimal gate count
- **32×8-bit RAM program memory** for user-uploadable programs via UART
- **16×8-bit RAM tape memory** (data cells) for program execution
- **UART-based programmer** for uploading instructions at runtime
- **Full UART subsystem** (TX/RX) at 115200 baud for I/O operations
- **Optimized instruction set** with 5-bit arguments for compact programs
- **Debug outputs** for program counter and data pointer

## Quick Start

1. **Power on**: Release reset (`rst_n` high) - default program loads into RAM
2. **Upload program (optional)**: Set `PROG_MODE` (`ui[3]`) high, send program bytes via UART RX, set low when done
3. **Start execution**: Pulse `START` input (`ui[1]`)
4. **Send input**: Type lowercase letters via UART RX at 115200 baud (default program), end with null (0x00)
5. **Monitor via UART**: Observe uppercase output on `UART_TX` (`uo[0]`)
6. **Debug**: Observe PC on `uo[6:2]`, DP on `uio[3:0]`

## Documentation

- **[Detailed documentation](docs/info.md)** - Complete project description, architecture, and usage guide
- **[Pin assignments](info.yaml)** - Full pinout configuration

## Pin Mapping

### Inputs
- `ui[0]` - UART RX (serial input for program upload or `,` command)
- `ui[1]` - START (begin execution)
- `ui[2]` - HALT (stop execution)
- `ui[3]` - PROG_MODE (high=upload program, low=execute)

### Outputs  
- `uo[0]` - UART TX (serial output for `.` command)
- `uo[1]` - CPU_BUSY or PROG_BUSY (execution/upload status)
- `uo[6:2]` - Program Counter [4:0] (current instruction address, 0-31)
- `uo[7]` - Unused

### Bidirectional (all outputs)
- `uio[3:0]` - Data Pointer [3:0] (current tape position, 0-15)
- `uio[7:4]` - Unused

## Default Program

The RAM initializes with a UART case converter demonstration (16 instructions). This program can be replaced by uploading new instructions via UART:

```brainfuck
,      Read character from UART into cell[0]
>      Move to cell[1]
+10    cell[1] = 10 (newline character)
<      Back to cell[0]
[      Loop while cell[0] != 0:
-15      Subtract 15
-15      Subtract 15 (total -30)
-2       Subtract 2 (total -32, lowercase→uppercase)
.        Output converted character
,        Read next character
]      End loop
>      Move to cell[1]
.      Output newline (0x0A)
HALT   End of program
```

**Function:** Interactive UART-based case converter that converts lowercase ASCII to uppercase.

**Example Usage:**
- Input: `"abc"` followed by null (0x00)
- Output: `"ABC\n"`
- Conversion: 'a' (0x61) - 32 = 'A' (0x41), 'b' (0x62) - 32 = 'B' (0x42), etc.

**Features Demonstrated:**
1. UART input (`,` command) - reads characters from serial
2. UART output (`.` command) - writes characters to serial
3. Arithmetic operations - subtracts 32 via three decrements (-15, -15, -2)
4. Conditional loops (`[`, `]`) - processes until null terminator
5. Multi-cell usage - cell[0] for data, cell[1] for newline constant

**Programmability:** This is just the default program. Upload custom Brainfuck programs via UART in programming mode (set `ui[3]` high, send instruction bytes, set `ui[3]` low).


## Resources

- [GF180MCU Documentation](https://gf180mcu-pdk.readthedocs.io/)
- [Wafer.space GF180 Tapeout](https://wafer.space/)

## Author

René Hahn - 2025
