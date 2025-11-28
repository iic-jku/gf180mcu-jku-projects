`timescale 1us/1ns

module button_debounce_tb;

  reg regular_clk;
  reg slow_clk;
  reg button_signal;
  wire output_pulse;

 
  button_debounce bdb (
    .regular_clk(regular_clk),
    .slow_clk(slow_clk),
    .button_signal(button_signal),
    .output_pulse(output_pulse)
  );

  initial begin
    regular_clk = 0;
    forever #0.02 regular_clk = ~regular_clk; // 25 MHz 
  end

  initial begin
    slow_clk = 0;
    forever #5000 slow_clk = ~slow_clk; // 100 Hz
  end

 
  initial begin
    $dumpfile("bdb_tb.vcd");
	$dumpvars;

    button_signal = 0;

    #100000; 

    simulate_button_press_with_bounce(1, 5000);


    #100000;

    simulate_button_press_with_bounce(0, 5000);

    #200000;
    $finish;
  end


  task simulate_button_press_with_bounce;
    input final_state;
    input integer bounce_time_ns;
    integer i;
    begin
      
      for (i = 0; i < 10; i = i + 1) begin
        button_signal = ~button_signal;
        #(bounce_time_ns/10); 
      end
      button_signal = final_state;
    end
  endtask

endmodule