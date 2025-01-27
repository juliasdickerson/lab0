These files are used for Laboratory 0 within ECEN 4243 : Computer
Architecture.  The files can be simulated with any SystemVerilog simulator,
however, are designed to work with Siemens Questa.  To simulate, type
the following at a terminal or in the command prompt:

    vsim -do fsm.do

The DO file will compile all Verilog files and its associated
testbench.  The files can be modified to run with any SystemVerilog file.

The regfile.sv contains a stub for the 2-port register file (RF) 
associated with Lab 0.  It should be modified to handle its behavior.
The fsm_tb.sv and fsm.do should be modified to simulate the register
file.  For more information on a register file see Chapter 5 in DDCA. 

For the FSM testbench we added the test 01_0011_0111 so we could see if FSM was working correctly. After doing the FSM we moved onto the regfile. We had to add a third port on the rising edge of the clock as well as combinationly reading the two ports. Once the regfile was completed we moved onto the regfile testbench. We took the FSM testbench and changed it a little bit. Once changed we add different tests to see if the regfile was working correctly. We tested to see if reading a register while it is being updated, reading the same register with both read ports at the same time and a few more test to see if they worked. Once we made enough tests we took the FSM do file and alerted it so it would work for the regfile. To simulate the regfile type the following in the command prompt:
    
    vsim -do regfile.do

