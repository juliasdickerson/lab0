module stimulus ();

    //Inputs
    logic         clk;
    logic         we3; 
    logic [4:0]   ra1, ra2, wa3;
    logic [31:0]  wd3; 

    // wd3 = write data 3
    // ra1 = read address 1
    // ra2 = read address 2
    // we3 = write enable 3
    // wa3 = write address 3

    //Outputs
    logic [31:0]  rd1, rd2;
    //rd1 is read data 1
    //rd2 is read data 2 

    rf dut (clk, we3, ra1, ra2, wa3, wd3, rd1, rd2);

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
        //initializing the inputs
        we3 = 0;
        ra1 = 0;
        ra2 = 0;
        wa3 = 0;
        wd3 = 0;

        //test 1 read a register while it is being updated
        #10;
        we3 = 1; //because you want to write to resister 6 
        ra1 = 0; //read resister 6
        ra2 = 0; //read resister 6
        wa3 = 6; //setting the write address to the resister
        wd3 = 32'hCA; // data being written number is 00000000_00000000_00000000_11001010
        #10;


        //test 2 read the same register with both read ports at the same time
        #10;
        we3 = 0; //disabling write bc you dont want it
        ra1 = 6; //reading resister 6 with both ports
        ra2 = 6; //reading resister 6 with both ports
        #10;

        //test 3 reset the register file and ensure that all the behavior of your register file
        #10;
        we3 = 1; //doing one because reseting so enable writing
        ra1 = 0; //resetting read address back to 0
        ra2 = 0; //resetting read address back to 0
        wa3 = 0; //resetting write address to 0
        wd3 = 0; //resetting write data to 0
        #10;

        // Test 4: Write to register 1 and read it back
        #10;
        we3 = 1; //because you want to write to resister 6 
        ra1 = 0; //read resister 6
        ra2 = 0; //read resister 6
        wa3 = 2; //setting the write address to the resister
        wd3 = 32'hC; // data being written number is 00000000_00000000_00000000_11001010
        #10;

        
        #10;
        we3 = 0;
        ra1 = 2;
        #10;

       // Test 5: Write to register 2 and read both registers
       #10;
       we3 =1;
       ra1 =0;
       ra2 =0;
       wa3 =4;
       wd3 = 32'hA;
       #10;

       #10;
       we3 = 0;
       ra2 = 4;
       #10;

      //test 6: write to register 0
      #10;
      ra1 = 0;
      ra2 = 0;
      we3 = 1;
      wa3 = 0;
      wd3 = 32'hD;
      #10;

      #10;
      we3 = 0;
      #10;

      //resetting
      #10;
      we3=0;
      wd3=0;
      wa3=0;
      ra1=0;
      ra2=0;
      #10;

    
     end
endmodule
   
  
   
