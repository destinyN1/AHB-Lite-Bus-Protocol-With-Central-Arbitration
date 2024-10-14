# AHB-Lite Arbiter and SubSystem

## Overview

The `AHB-Lite Arbiter and SubSystem` project implements an Advanced High-performance Bus (AHB)-Lite arbiter and a corresponding subsystem using VHDL. The arbiter manages bus access among multiple masters (I2C, SPI, CCP, UART, SSI, SOSSI, and CPU) in a round-robin fashion, ensuring efficient and conflict-free communication over the shared AHB-Lite bus. The subsystem integrates various IP cores with the arbiter, facilitating seamless data transfer and interaction between the CPU and peripheral devices.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Pending Tasks](#pending-tasks)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Features

- **Round-Robin Arbitration:** Implements a round-robin arbitration mechanism to manage bus access among multiple masters, ensuring fair and efficient usage of the AHB-Lite bus.
- **AHB-Lite Interface:** Supports AHB-Lite protocol for communication between the CPU and various peripheral IPs (I2C, SPI, CCP, UART, SSI, SOSSI).
- **Bus Access Management:** Manages shared data buses (`HWDATA`, `HRDATA`, `HADDR`, `HTRANS`, `HSIZE`, `HBURST`, `HREADY`, `HRESP`) to facilitate read and write operations.
- **Master Locking:** Supports master locking (`HMASTLOCK`) to allow masters to hold the bus for extended operations when necessary.
- **Scalable Design:** Designed to accommodate additional masters or peripherals with minimal modifications.

## Requirements

- **VHDL Simulator:** Any VHDL simulation tool such as ModelSim, GHDL, Vivado, or similar.
- **Text Editor/IDE:** For viewing and editing the VHDL code (e.g., Visual Studio Code, Sublime Text, Vivado IDE).
- **Version Control (Optional):** Git, for cloning the repository.

## Installation

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/YourUsername/AHB-Lite-Arbiter-SubSystem.git

##Pending-tasks
-Implement HSEL Signal in Arbiter:
-Complete the implementation of the HSEL (Select) signal in the Arbiter module to accurately indicate the active slave based on the current master.
-Configure HSEL After Implementation:
  -Once the HSEL signal is implemented, configure it appropriately within the Arbiter to ensure correct selection of peripheral devices during bus transactions.
  -Verify and Complete Port and Signal Declarations:
  -Review the SubSystem module for any incomplete port and signal declarations.
  -Ensure all necessary signals are declared and correctly connected between the Arbiter and peripherals.



