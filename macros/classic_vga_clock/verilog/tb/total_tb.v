`timescale 1us/1ns

module total_tb;	//not actually used -> vga emulator 

    
    reg video_clk;
    reg reset_n;
    reg hour_in;
    reg min_in;
    reg sec_in;
    reg al_in;
    reg al_on_off_toggle_in;

    
    wire buzzer_out;
    wire vga_horizSync;
    wire vga_vertSync;
    wire black_white;

    classic_vga_clock cvc (
        .clk(video_clk),
        .reset_n(reset_n),
        .hour_in(hour_in),
        .min_in(min_in),
        .sec_in(sec_in),
        .al_in(al_in),
        .al_on_off_toggle_in(al_on_off_toggle_in),
        .buzzer_out(buzzer_out),
        .vga_horizSync(vga_horizSync),
        .vga_vertSync(vga_vertSync),
        .black_white(black_white)
    );

    
    initial begin
        video_clk = 0;
        forever #0.02 video_clk = ~video_clk;
    end

    initial begin
        $dumpfile("total_df_tb.vcd");
		$dumpvars;
        reset_n = 0;
        hour_in = 0; min_in = 0; sec_in = 0; al_in = 0; al_on_off_toggle_in = 0;
        #100;         // 100 us
        reset_n = 1;
    end

    
    task pulse_input;
        output reg sig;
        begin
            sig = 1;
            #50000;     
            sig = 0;
            #100000;     // 100 ms
        end
    endtask

    // 1:29:52, set alarm, toggle alarm on
    initial begin
        @(posedge reset_n);

        // hour = 1
        pulse_input(hour_in);

        
        repeat (29) pulse_input(min_in);

        
        repeat (52) pulse_input(sec_in);

        repeat (9)  pulse_input(al_in);

        pulse_input(al_on_off_toggle_in);
    end

    
    integer frame_file;
    integer x, y;

    initial begin
        frame_file = $fopen("vga_frames.txt", "w");
        if (!frame_file) begin
            $finish;
        end
    end

    always begin
        #1000000; // 1 s
        $fwrite(frame_file, "Frame at time %0t us\n", $time);

        
        @(negedge vga_vertSync);

        for (y = 0; y < 480; y = y + 1) begin
            
            @(negedge vga_horizSync);
            for (x = 0; x < 640; x = x + 1) begin
                @(posedge video_clk); 
                $fwrite(frame_file, "%0d", black_white);
            end
            $fwrite(frame_file, "\n");
        end
        $fwrite(frame_file, "\n");
    end

    initial begin
        #5000000; // 5
        $fclose(frame_file);
        $finish;
    end
endmodule
