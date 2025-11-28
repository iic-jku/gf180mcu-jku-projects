`timescale 1ns/1ps

module display_vga_tb;

    reg clk;
    reg sys_rst;
    wire hsync;
    wire vsync;
    wire [9:0] horizPos;
    wire [9:0] vertPos;
    wire active;

    display_vga vgatest (
        .clk(clk),
        .sys_rst(sys_rst),
        .hsync(hsync),
        .vsync(vsync),
        .horizPos(horizPos),
        .vertPos(vertPos),
        .active(active)
    );

    
    initial begin
        clk = 0;
        forever #20 clk = ~clk;  
    end

    initial begin
        $dumpfile("vga2_tb.vcd");
        $dumpvars;
        sys_rst = 1;
        #100;          
        sys_rst = 0;
    end

  
    initial begin
        
        #15000000;      
        $finish;
    end


    initial begin
        $monitor("Time=%0t | hsync=%b vsync=%b horizPos=%d vertPos=%d active=%b",
                 $time, hsync, vsync, horizPos, vertPos, active);
    end

endmodule