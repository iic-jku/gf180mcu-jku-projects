`timescale 1ns / 1ps

module cordic_tb #(parameter A1=0, 
                   parameter A2=360 
    );
    reg clk;  
    reg start;    
    reg [8:0] angle; 
    wire signed [8:0] sint;  
    wire signed [8:0] cost;  
    wire done; //goes 1 whenver N iteraions are done
    reg reset;

cordic_sin_cos cordTB(
    .clk(clk),
    .start(start),
    .reset(reset),
    .i_angle(angle),
    .sine_out(sint),
    .cosine_out(cost),
    .done(done)
    );
integer deg;
integer i,wrapped_angle;
integer file;
//integer signed j;
reg signed [12:0] j;

reg [4:0] scalingIterator;

initial clk = 0;
initial start = 1;
always #20 clk = ~clk;
reg signS;
reg signC;
reg signed [8:0] scaledCos;
reg signed [8:0] scaledSin;
reg [7:0] shiftedC;
reg [7:0] shiftedS;
reg [7:0] shiftedCt;
reg [7:0] shiftedSt;
reg [19:0] scaC;
reg [19:0] scaS;

reg signed [8:0] sine;
reg signed [8:0] cosine;

parameter scaleFactor = 16;

function real conv; 
    input signed [8:0] fixed;
    begin
        conv = fixed / 256.0;
    end
endfunction

initial begin
    $dumpfile("cordic_tb.vcd");
		$dumpvars;
    reset = 1; #1 reset = 0; 
    $display ("washere");
    //#1
    //$display ("sineOut= %h; cosineOut= %h",sint, cost);
    //$fwrite(file, "Angle (deg), Sine (Q2.14), Cosine (Q2.14), Sine, Cosine\n");
    //$display("================================== CORDIC Output ==================================");
    //for (i = A1; i <= A2; i = i + 1) begin
        i = 359;
        angle = i;
        deg = i;
        start = 1; #1 start = 0;
        wait (done);
        //scaledS = sint * 64;
        //scaledSin = $signed(scaledS / 16384) - 32;
        //scaledC = cost * 64;
        //scaledCos = $signed(scaledC /16384) -32;
        
        signS = sint >>> 8;
        signC = cost >>> 8;

        shiftedC = cost;
        shiftedS = sint;
        $display ("sint= %f; cost= %f",sint, cost);
        $display ("signS= %f; signC= %f",signS, signC);
        $display ("shiftedS= %h; shiftedC= %h",shiftedS, shiftedC);
        for (scalingIterator = 1; scalingIterator <= scaleFactor; scalingIterator = scalingIterator + 1) begin
            j = scalingIterator;
            if (sint >= 0) begin
                scaledSin = ((sint * j) >>> 8);
            end else begin
                scaledSin = ((sint * j) / 256);
            end
            if (cost >= 0) begin
                scaledCos = ((cost * j) >>> 8);
            end else begin
                scaledCos = ((cost * j) / 256);
            end

             //scaledSin = $signed((sint * j) >>> 8);//(sint * j) >>> 8;
             //scaledCos = $signed((cost * j) >>> 8);//(cost * j) >>> 8;
            //scaledSin = (sint * j + (sint >= 0 ? 0 : -128)) >>> 8;
            //scaledCos = (cost * j + (cost >= 0 ? 0 : -128)) >>> 8;
            

            //scaledSin = ($signed(sint * 10000) / 16384);
            //scaledCos = ($signed(cost * 10000) / 16384);
            //scaledSin = sint / 16384;
            //scaledCos = cost / 16384;
            //$display ("sineOut123= %h; cosineOut123= %h",sint, cost);
            //#10
            $display("scaledCos = %f, scaledSin = %f, scf = %f", scaledCos, scaledSin, j);
        end
        $display ("sineOutAA= %f; cosineOutAA= %f",conv(sint), conv(cost));
        $fwrite(file, "%0.1f,%h,%h,%f,%f, %f, %f\n", deg, sint, cost, conv(sint), conv(cost), scaledSin, scaledCos);
    #10; //end
   
    //$display("======== All angles processed ========");
    $fclose(file);
    //$finish; 
    //$dumpfile("cordic_tb.vcd");
	//	$dumpvars;
	
		/* verilator lint_off STMTDLY */
		#50 reset = 1'b0; // deassert reset
	    #200 $finish; // finish
		/* verilator lint_on STMTDLY */
    end
endmodule