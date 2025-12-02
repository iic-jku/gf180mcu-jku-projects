//`timescale 1ns/1ps
`timescale 1us/1ns
module clockRenderer_tb;


	reg clk;
	reg slow_clk;
	reg reset;
	reg [3:0] hour;
	reg [5:0] minute;
	reg [5:0] second;
	reg [3:0] al_hour;
	reg [5:0] al_minute;

	reg [9:0] horizCounter;
	reg [9:0] vertCounter;
	reg [9:0] x_offset;
	reg [9:0] y_offset;
	
	wire pixel_bw;

  clockRenderer crMod (	//modified CR for test
    .clk(clk),
    .slow_clk(slow_clk),
    .reset(reset),
    .hour(hour),
    .minute(minute),
    .second(second),
    .al_hour(al_hour),
    .al_minute(al_minute),
	.horizCounter(horizCounter),
	.vertCounter(vertCounter),
	.x_offset(x_offset),
	.y_offset(y_offset),
    .pixel_bw(bw)
  );
    initial begin
		$dumpfile("clocRend_tb.vcd");
		$dumpvars;
	

	end
	integer fd;
	localparam H_MAX = 800; 
    localparam V_MAX = 525; 
	localparam H_VISIBLE = 640;
    localparam V_VISIBLE = 480
	

    // VGA
    always @(posedge clk) begin
        if (horizCounter == H_MAX-1) begin
            horizCounter <= 0;
            if (vertCounter == V_MAX-1)
                vertCounter <= 0;
            else
                vertCounter <= vertCounter + 1;
        end else begin
            horizCounter <= horizCounter + 1;
        end
    end

    initial begin
        clk = 0;
        forever #0.02 clk = ~clk;  
    end

 initial begin
        slow_clk = 0;
        forever #5000 slow_clk = ~slow_clk;  
    end


  initial begin
	fd = $fopen("vga_out.txt", "w");

	horizCounter = 0;
	vertCounter = 0;
	x_offset = 0;
	y_offset = 0;
    reset = 1; #0.02 reset = 0;
    hour = 4'd0; 	
    minute = 6'd0;
    second = 6'd0;
    al_hour = 4'd4;
    al_minute = 6'd30;

    

    // 10:15:45 willk
    hour   = 4'd2;
    minute = 6'd40;
    second = 6'd47;

    #20000000;

	$fclose(fd);
    $finish;
  end

  always @(posedge clk) begin
        if (horizCounter < H_VISIBLE && vertCounter < V_VISIBLE) begin
            $fwrite(fd, "%0d", pixel_bw);

            if (horizCounter == H_VISIBLE-1)
                $fwrite(fd, "\n");
        end
    end

endmodule
