module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
); 
    
    assign heater = mode & too_cold;
    assign aircon = ~mode & too_hot;
    assign fan = (mode & too_cold) | (~mode & too_hot) | fan_on;

endmodule
