`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:34:39 06/23/2011 
// Design Name: 
// Module Name:    uart_rcv 
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
module uart_test(
    input clk,
	 output tx,
    input rx
    );

reg trans=0;
reg [5:0] i=0;
//reg state=1'b0;

//parameter S0=1'b0;
//parameter S1=1'b1;

wire [7:0] data;
wire rcvd;
wire is_t;
wire is_r;

always@(posedge clk)
begin
	trans=rcvd;
end

uart rcv(
					 .clk(clk), // The master clock for this module
					 .rx(rx), // Incoming serial line
					 .received(rcvd), // Indicated that a byte has been received.
					 .is_receiving(is_r),
					 .rx_byte(data) // Byte received
			 );
			 

uart transmit(
					.clk(clk),
					.tx(tx),
					.tx_byte(data),
					.is_transmitting(is_t),
					.transmit(trans)
				);

endmodule