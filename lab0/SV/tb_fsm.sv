module stimulus ();

   logic   clk;
   logic   a; 
   logic   reset;
   
   logic   y; 
   
   integer handle3;
   integer desc3;
   
   // Instantiate DUT
   fsm dut (clk, reset, a, y);

   // Setup the clock to toggle every 1 time units 
   initial 
     begin	
	clk = 1'b1;
	forever #5 clk = ~clk;
     end

   initial
     begin
	// Gives output file name
	handle3 = $fopen("test.out");
	// Tells when to finish simulation
	#500 $finish;		
     end

   always 
     begin
	desc3 = handle3;
	#5 $fdisplay(desc3, "%b %b || %b", 
		     reset, a, y);
     end   
   
   initial 
     begin //added to this so its 01_0011_0111     
	#0  reset = 1'b1;
	#12 reset = 1'b0;	
	#0  a = 1'b0;
	#10 a = 1'b1;
	#10 a = 1'b0;
     #10 a = 1'b0;
     #10 a = 1'b1;
     #10 a = 1'b1;
     #10 a = 1'b0;
     #10 a = 1'b1;
     #10 a = 1'b1;
     #10 a = 1'b1;
     end

endmodule // stimulus


