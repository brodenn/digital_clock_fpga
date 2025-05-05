# Digital Clock in SystemVerilog ⏰

A digital clock implemented on the DE0-CV FPGA board using SystemVerilog.

![FPGA Clock](./path/to/your/image.jpg)  
*Figure: Digital Clock running on the DE0-CV FPGA board*

## Features
🕒 **24-hour clock**: Displays time from 00:00:00 to 23:59:59.  
🔁 **Roll-over logic**: Automatically wraps to 00:00:00 after 23:59:59.  
⏯️ **Start/Stop with key_n**: Toggle the clock using a button.  
🧼 **Clean button input**: Rising-edge detection on `key_n` to avoid bouncing.  
🔄 **Reset with reset_n**: Asynchronous system reset to 00:00:00 and pause.  
🔍 **Modular design**: Clear separation of logic into reusable modules.  
⚙️ **Clock divider**: Converts 50 MHz system clock to 1 Hz ticks.  
🔢 **BCD Counters**: Separate counters for seconds, minutes, and hours.  
🔧 **Generic design**: Easy to change parameters such as tick speed or digit limits.  
💡 **Seven-segment display driver**: BCD to 7-segment decoder for real-time display.  
📦 **Testbenches**: Simulation for critical modules to verify correctness.

## Modules
| Module             | Description                                           |
| ------------------ | ----------------------------------------------------- |
| `top.sv`           | Integrates all submodules, connects IO to the board   |
| `clock_divider.sv` | Converts 50 MHz input to 1 Hz output for timing       |
| `bcd_counter.sv`   | Handles counting up with carry and digit limit        |
| `timer.sv`         | Coordinates seconds, minutes, hours with carry logic  |
| `statemachine.sv`  | FSM to toggle clock run state via `key_n`             |
| `edge_detector.sv` | Detects rising edge on `key_n` input                  |
| `hex_decoder.sv`   | Converts 4-bit BCD digit to 7-segment active-low code |

## Getting Started
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/digital-clock-sv.git
   ```
2. Open the project in Quartus.
3. Compile the design and program it onto the DE0-CV FPGA board.
4. Observe the digital clock functionality on the 7-segment display.

## Directory Structure
- **`top.sv`**: Main entry point for the design
- **`simulation/`**: Contains testbenches for simulation
- **`output_files/`**: Stores compiled files and reports
- **`db/`**: Internal Quartus database files
- **`incremental_db/`**: Incremental compilation data

## Requirements
- Quartus Prime software
- DE0-CV FPGA board
- Basic knowledge of SystemVerilog

## License
This project is licensed under the MIT License. See the LICENSE file for details.
