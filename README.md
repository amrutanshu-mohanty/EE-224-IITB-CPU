# EE 224 IITB CPU
*Course Project for EE 224*

## Authors
*Shaileshram Sivakumar 23B1205 \
Amrutanshu Mohanty 23B1208 \
Daksh Sawke 23B1254 \
Arjoe Basak 23B1295*

## Problem Statement
 We were tasked with building a simple 8-register, 16-bit computer system using point-to-point infrastructure, in a Hardware Descriptive Language. VHDL has been used for the same. The CPU features 8 general-purpose registers (R0 to R7), a Program Counter (PC) pointing to the next instruction, and a Condition Code Register with Carry (C) and Zero (Z) flags. The system supports 15 instructions across three formats (R, I, and J types) and initializes the PC to 0000H on power-up. 
 
## CPU Overview
 - Our CPU is a finite state machine with 22 different states. Each
 instruction has been broken down into 2-3 states, based on the tasks
 being performed.
 - Appropriate state tables are made, which has the tasks to be per
formed when in a state. A circuit has also been designed for each
 instruction, based on the components used in the states.
 - Finally, a top-level circuit has been designed, which incorporates sev
eral multiplexers that are used to control the inputs fed into compo
nents. Their select lines controlled by outputs of the FSM.
 - All components have been designed structurally in VHDL, from
 using logic gates for the 16-bit Kogge-Stone adder to using D-flipflops
 for every register. Only the final FSM uses behavioural architecture.
 - In order to verify our handiwork, the code in VHDL is supported by
 a comprehensive Testbench, to simulate the instructions.
 - For the ease of loading various instructions into the CPU, a python
 script has been created which takes in assembly line inputs and gen
erates a text file which is then read by the VHDL code for the memory.
 - A synchronous reset signal has been implemented, that sets the
 FSM to a default state while resetting the program counter, tem
poarary registers and register file too.

