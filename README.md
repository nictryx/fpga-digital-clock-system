FPGA Digital Clock System (Nexys 4 DDR)

A Verilog-based digital clock and calendar implemented on the Nexys 4 DDR Artix-7 FPGA board.

The system tracks time and date, supports manual configuration through the board inputs, displays AM/PM, and drives the eight-digit seven-segment display using multiplexing logic.

Features

12-hour digital clock

Hours, minutes, and seconds tracking

AM/PM indication

Day, month, and year tracking

Automatic time and date incrementing

Configurable time and date values

Time and date display modes

Reset functionality

Multiplexed seven-segment display output

How It Works

The FPGA clock is divided to generate the required timing intervals.

Counters track seconds, minutes, hours, days, months, and years.

The time and date values automatically roll over when their limits are reached.

Board inputs are used to select the display mode and modify individual values.

The selected time or date values are converted and multiplexed across the eight-digit seven-segment display.

Main Components

Nexys 4 DDR Development Board

AMD Xilinx Artix-7 FPGA

Eight-Digit Seven-Segment Display

Board Switches and Push Buttons

100 MHz Onboard Clock

The design consists of a top-level I/O module, a main clock and calendar module, and a dedicated seven-segment decoder module.

Tech Stack

Verilog HDL

Xilinx Vivado

FPGA Digital Logic Design

Clock Counters and Registers

Seven-Segment Display Multiplexing

FPGA I/O Control

Project Goal

The goal of this project is to demonstrate how counters, registers, timing logic, user inputs, and display interfacing can be combined to implement a complete digital clock and calendar on FPGA hardware.
