# AHB-Lite Arbiter and SubSystem

## Overview

The `AHB-Lite Arbiter and SubSystem` project provides a robust implementation of an Advanced High-performance Bus (AHB)-Lite Arbiter and an associated subsystem in VHDL. The arbiter efficiently manages bus access among multiple masters (I2C, SPI, CCP, UART, SSI, SOSSI, and CPU) using a round-robin algorithm. The subsystem integrates various IP cores and peripherals, enabling seamless data transfer and interaction between the CPU and connected devices.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Architecture](#architecture)
- [Requirements](#requirements)
- [Usage](#usage)
- [Pending Tasks](#pending-tasks)

## Features

- **Round-Robin Arbitration**  
  Implements round-robin arbitration to ensure fair access to the AHB-Lite bus for multiple masters.
  
- **AHB-Lite Protocol Compliance**  
  Supports standard AHB-Lite signals for communication, including `HWDATA`, `HRDATA`, `HADDR`, `HTRANS`, `HSIZE`, `HBURST`, `HREADY`, `HRESP`, and `HSEL`.

- **Master Locking Mechanism**  
  Enables master locking (`HMASTLOCK`) to hold the bus for uninterrupted transactions when required.

- **Seamless Peripheral Integration**  
  Interfaces the CPU with various peripherals such as I2C, SPI, CCP, UART, SSI, and SOSSI through a shared AHB-Lite bus.

- **Dynamic Signal Forwarding**  
  Implements logic to dynamically forward signals (e.g., `HADDR`, `HWDATA`, `HRDATA`) based on the active master.

- **Scalability**  
  Designed to allow easy addition of new masters or peripherals with minimal modifications.

## Architecture

The system comprises the following components:

1. **Arbiter**  
   - Manages bus access among multiple masters using round-robin arbitration.
   - Forwards appropriate signals (e.g., `HADDR`, `HTRANS`, `HSIZE`, `HREADY`) to and from the shared bus.

2. **Subsystem**  
   - Integrates the arbiter and various IP cores (e.g., I2C, SPI, CCP, UART, SSI, SOSSI).
   - Connects the CPU with the peripherals through the shared bus.

3. **Peripheral Interfaces**  
   - Each peripheral (I2C, SPI, etc.) has its own AHB-Lite interface, ensuring smooth communication over the bus.

## Requirements

- **VHDL Simulator**: Any standard VHDL simulation tool such as ModelSim, GHDL, or Vivado.
- **Text Editor/IDE**: For editing VHDL code (e.g., Visual Studio Code, Vivado IDE).
- **Version Control (Optional)**: Git, for cloning the repository.

## Usage

1. **Clone the Repository**  
   ```bash
   git clone https://github.com/DestinyN1/AHB-Lite-Arbiter-SubSystem.git
