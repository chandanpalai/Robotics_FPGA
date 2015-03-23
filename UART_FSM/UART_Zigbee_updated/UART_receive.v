`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:34:57 08/25/2010 
// Design Name: 
// Module Name:    UART_receive 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module uart_receive(
    input rx,
    output tx,
    output reg [0:7] LEDS,
    input clock,
    output error
    );
	 wire [7:0] rx_byte;
	 wire receive;
	
uart MyInstanceName (.clk(clock),.rx(rx),.tx(tx),.received(receive),.rx_byte(rx_byte),.recv_error(error));

always@(posedge receive)
begin
	if(!error)
		LEDS=rx_byte;
	else
		LEDS=255;
end


endmodule
