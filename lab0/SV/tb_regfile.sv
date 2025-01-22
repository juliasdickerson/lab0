module stimulus ();

    //Inputs
    logic         clk;
    logic         we3; 
    logic [4:0]   ra1, ra2, wa3;
    logic [31:0]  wd3

    //Outputs
    logic [31:0]  rd1, rd2;

    regfile dut (clk, we3, ra1, ra2, wa3, wd3, rd1, rd2);

    integer handle3;
    integer desc3;

    initial 
      begin	
	      clk = 1'b1;
	      forever #5 clk = ~clk;
      end

    
    initial
      begin
	      handle3 = $fopen("testrf.out"); // Gives output file name
	      #500 $finish;	// Tells when to finish simulation	
      end

    always 
      begin
	      desc3 = handle3;
	      #5 $fdisplay(desc3, "%b %b %b %b %b %b", 
		    ra1, ra2, wa3, wd3, rd1, rd2);
     end 

    initial 
      begin

      //test 1 read a register while it is being updated

      //test 2 read the same register with both read ports at the same time

      //test 3 rest the register file and ensure that all the behavior of your register file
endmodule
   
  
   
