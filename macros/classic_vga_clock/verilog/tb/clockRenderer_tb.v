`timescale 1ns/1ps

module clockRenderer_tb;


  reg clk;
  reg slow_clk;
  reg reset;
  reg [3:0] hour;
  reg [5:0] minute;
  reg [5:0] second;
  reg [3:0] al_hour;
  reg [5:0] al_minute;

  wire [31:0] framebuffer [0:31];

  clockRenderer crMod (	//modified CR for test
    .clk(clk),
    .slow_clk(slow_clk),
    .reset(reset),
    .hour(hour),
    .minute(minute),
    .second(second),
    .al_hour(al_hour),
    .al_minute(al_minute),
    .framebuffer(framebuffer)
  );
    initial begin
		$dumpfile("clocRend_tb.vcd");
		$dumpvars;
	

	end

    initial begin
        clk = 0;
        forever #20 clk = ~clk;  
    end

 initial begin
        slow_clk = 0;
        forever #5000000 slow_clk = ~slow_clk;  
    end


  initial begin

    reset = 1;#1 reset = 0;
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

    dump_framebuffer();

    $finish;
  end

  task dump_framebuffer;
    integer f, i;
    begin
      f = $fopen("framebuffer_output.txt", "w");
      if (f == 0) begin
        $finish;
      end
      for (i = 0; i < 32; i = i + 1) begin
        $fwrite(f, "32'b%032b;\n", i, framebuffer[i]);
      end
      $fclose(f);
    end
  endtask

endmodule
