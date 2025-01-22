module stimulus ();

    logic         clk;
    logic         we3; 
    logic [4:0]   ra1, ra2, wa3;
    logic [31:0]  wd3
    logic [31:0]  rd1, rd2;

    reg dut (clk, we3, ra1, ra2, wa3, wd3, rd1, rd2);

    integer handle3;
    integer desc3;

    initial 
      begin	
	  clk = 1'b1;
	  forever #5 clk = ~clk;
      end

    
    initial
      begin
	  // Gives output file name
	  handle3 = $fopen("testrf.out");
	  // Tells when to finish simulation
	  #500 $finish;		
      end

    always 
     begin
	 desc3 = handle3;
	 #5 $fdisplay(desc3, "%b %b || %b", 
		     reset, In, Out);
     end 

endmodule
   
  
   
