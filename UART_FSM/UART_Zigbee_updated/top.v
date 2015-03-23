`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:49:00 08/25/2010 
// Design Name: 
// Module Name:    top 
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
module top(
		input rx,
		output tx,
		input clock,
		input reset,
		input disp,
		output reg [7:0] ve,
		output reg [7:0] dirs,
		output reg [0:7] LEDS,
		output reg rdone
	);
	
	wire [7:0] rx_byte;
	wire receive;
	reg  [7:0] UDR;
	reg [15:0] length;
	reg [3:0] count;
	reg [63:0] addr;
	reg [7:0] chcksum;
		
   uart MyInstanceName (.clk(clock),.rst(reset),.rx(rx),.tx(tx),.received(receive),.rx_byte(rx_byte),.recv_error(error));
	reg [3:0] state=0;
	
	parameter S0 = 4'b0000; 	//Check for Start Delimiter 8'h7E (byte 1)
	parameter S1 = 4'b0001;		//Length MSB (byte 2)
	parameter S2 = 4'b0010;		//Length LSB (byte 3)
	parameter S3 = 4'b0011;		//
	parameter S4 = 4'b0100;		//
	parameter S5 = 4'b0101;    //
	parameter S6 = 4'b0110;		//
	parameter S7 = 4'b0111;		//
	
always@(posedge clock)
begin
		if(reset == 1'b1)
		begin
			state = S0;
			length = 16'h0000;
			count = 16'h0000;
			rdone = 1'b0;
			ve = 8'd0;
			dirs = 8'd0;
		end
		else if(receive == 1'b1)
		begin
			if(!error)
				UDR=rx_byte;
			else
				state = S0;
			if(UDR == 8'h7E && state == S0)
			begin		
					state = S1;
					length = 16'h0000;
					count = 16'h0000;
					rdone = 1'b0;
			end	
			else if(state == S1)
			begin
					length = {UDR,8'h00};
					state = S2;
			end	
			else if(state == S2)
			begin
					length = length + UDR;
					state = S3;
			end
			else if(state == S3)
			begin
					if(UDR == 8'h90)
					begin
							state=S4;
							count=count+4'd1;
					end	
					else
							state=S0;
			end		
			else if(state == S4)
			begin
					count = count+4'd1;
					if(count<=4'd9)
					begin
							addr = addr + UDR<<((4'd8-count)<<4'd3);
					end
					if(count == 4'd9)
					begin
							state=S5;
					end
			end
			else if(state == S5)
			begin
					count = count+4'd1;
					if(count==4'd12)
					begin
							state = S6;
					end
			end
			else if(state == S6)
			begin
					if(count>=5'd12)
					begin
							case (count)
							5'd12: ve = UDR;
							5'd13: 
									begin
											dirs = UDR;
											state = S7;
									end
							default:state = S0;
							endcase
							count = count+4'd1;
					end
			end
			else if(state == S7)
			begin
					chcksum = UDR;
					rdone = 1'b1;
					state = S0;
			end
		end		
end

always@(*)
begin
		if(reset == 0)
		begin
			case(disp)
				1'b0:LEDS = ve;
				1'b1:LEDS = dirs;
			endcase
		end
		else
			LEDS = 0;
end
	
endmodule