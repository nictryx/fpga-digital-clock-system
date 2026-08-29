# FPGA Digital Clock System

A Verilog-based digital clock system implemented on the **Nexys 4 DDR Artix-7 FPGA**.

The system provides real-time timekeeping, date tracking, configurable time and date settings, AM/PM indication, and seven-segment display output using FPGA-based digital logic.

## Features

- 12-hour digital clock
- Hours, minutes, and seconds tracking
- AM / PM indication
- Day, month, and year tracking
- Automatic time and date incrementing
- Configurable time and date values
- Time / date display modes
- Reset functionality
- Seven-segment display output
- FPGA-based timing and counter logic

## Tech Stack

- Verilog HDL
- AMD Xilinx Artix-7 FPGA
- Nexys 4 DDR
- Xilinx Vivado
- Digital Logic Design
- Clock Counters & Registers
- Seven-Segment Display Interfacing
- FPGA I/O Control

## System Overview

The FPGA digital clock system uses the onboard clock signal to maintain and display time and date information on the Nexys 4 DDR seven-segment display.

The system manages:

- 12-hour timekeeping with hours, minutes, and seconds
- AM / PM indication
- Day, month, and year tracking
- Automatic time and date incrementing
- Configurable time and date values
- Time / date display modes
- Reset and selection controls
- Seven-segment display multiplexing

The time is displayed in the following format:

```text
Hours : Minutes : Seconds   AM/PM 

## Project Goal

The goal of this project is to design and implement a digital clock system entirely in FPGA hardware using Verilog HDL.

The project demonstrates core digital system design concepts including clock division, counters, registers, time and date logic, user-controlled inputs, modular Verilog design, and seven-segment display interfacing.
