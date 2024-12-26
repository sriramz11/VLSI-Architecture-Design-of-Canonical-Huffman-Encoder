
`timescale 1 ns / 1 ps

module Huffman_Buffer (
		 input               clk,
		 input               reset,
		 input               data_enb,
		 input       [159:0] data_in,
		 output reg    [7:0] buffer_data,
	         output reg          buffer_enb
	 );

integer cnt;

	 always @ (posedge clk or negedge reset)
	 begin
		 if (reset == 1'b0) begin
			 cnt         <= 0;
			 buffer_data <= 'b0;
			 buffer_enb  <= 'b0;
		 end
		 else begin

			 if (data_enb == 1'b1) begin
				cnt <= cnt + 1;
				buffer_enb <= data_enb;
				case (cnt)
					'd0  : begin buffer_data <= data_in[7:0]   ; end
					'd1  : begin buffer_data <= data_in[15:8]  ; end
					'd2  : begin buffer_data <= data_in[23:16] ; end
					'd3  : begin buffer_data <= data_in[31:24] ; end
					'd4  : begin buffer_data <= data_in[39:32] ; end
					'd5  : begin buffer_data <= data_in[47:40] ; end
					'd6  : begin buffer_data <= data_in[55:48] ; end
					'd7  : begin buffer_data <= data_in[63:56] ; end
					'd8  : begin buffer_data <= data_in[71:64] ; end
					'd9  : begin buffer_data <= data_in[79:72] ; end
					'd10 : begin buffer_data <= data_in[87:80] ; end
					'd11 : begin buffer_data <= data_in[95:88] ; end
					'd12 : begin buffer_data <= data_in[103:96]  ; end
					'd13 : begin buffer_data <= data_in[111:104] ; end
					'd14 : begin buffer_data <= data_in[119:112] ; end
					'd15 : begin buffer_data <= data_in[127:120] ; end
					'd16 : begin buffer_data <= data_in[135:128] ; end
					'd17 : begin buffer_data <= data_in[143:136] ; end
					'd18 : begin buffer_data <= data_in[151:144] ; end
					'd19 : begin buffer_data <= data_in[159:152] ; end
					default : begin end
				endcase
			 end
			 else begin
				 buffer_enb <= 'b0;
			 end
		 end
	 end

endmodule	 
