module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       // Make sound
    output motor         // Vibrate
);
    
    always @(*) begin
        ringer = 1'b0;
        motor = 1'b0;
        if (ring == 1'b1) begin
            if (vibrate_mode == 1'b1) begin
                motor = 1'b1;
            end
            else begin 
                ringer = 1'b1;
            end
        end
    end

endmodule
