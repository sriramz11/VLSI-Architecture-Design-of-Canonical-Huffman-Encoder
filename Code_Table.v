
`timescale 1 ns / 1 ps

module Code_Table (
	          input              clk,
		  input              reset,
		  input      [159:0] Buffer_Data,
      		  input       [19:0] Bitmap_Table,
		  input              Bitmap_done,
		  input       [7:0]  Bitmap_Syml_out,
		  input              Bitmap_enb,
  		  output reg  [89:0] Code_Words
	  );

reg [7:0] data_reg1;
reg [7:0] data_reg2;
reg [7:0] data_reg3;
reg [7:0] data_reg4;
reg [7:0] data_reg5;
reg       start_scnt;
integer   i;
integer   cnt;
reg [7:0]  buffer [0:19];
reg [89:0] code_data;
integer   data_cnt;
integer   scnt;


	  always @ (posedge clk or negedge reset)
	  begin
		  if (reset == 1'b0) begin
			  data_reg1    <= 'b0;
			  data_reg2    <= 'b0;
			  data_reg3    <= 'b0;
			  data_reg4    <= 'b0;
			  data_reg5    <= 'b0;
			  cnt          <=  0;
			  data_cnt     <=  0;
			  scnt         <=  0;
			  start_scnt   <= 1'b0;
			  code_data    <=  'b0;
			  Code_Words   <=  'b0;
			  for (i = 0; i < 20; i = i + 1) begin
				 buffer[i]       <=  8'b0;

                          end
		  end
		  else begin

		      
			  if (Bitmap_done == 1'b1) begin

				  if (data_cnt < 20) begin
				  data_cnt <= data_cnt + 1;
				  case (data_cnt)
  					  'd0  : begin buffer[0]  <= Buffer_Data[7:0]   ; end
  					  'd1  : begin buffer[1]  <= Buffer_Data[15:8]  ; end
  					  'd2  : begin buffer[2]  <= Buffer_Data[23:16] ; end
  					  'd3  : begin buffer[3]  <= Buffer_Data[31:24] ; end
  					  'd4  : begin buffer[4]  <= Buffer_Data[39:32] ; end
  					  'd5  : begin buffer[5]  <= Buffer_Data[47:40] ; end
  					  'd6  : begin buffer[6]  <= Buffer_Data[55:48] ; end
  					  'd7  : begin buffer[7]  <= Buffer_Data[63:56] ; end
  					  'd8  : begin buffer[8]  <= Buffer_Data[71:64] ; end
  					  'd9  : begin buffer[9]  <= Buffer_Data[79:72] ; end
  					  'd10 : begin buffer[10] <= Buffer_Data[87:80] ; end
  					  'd11 : begin buffer[11] <= Buffer_Data[95:88] ; end
  					  'd12 : begin buffer[12] <= Buffer_Data[103:96]  ; end
  					  'd13 : begin buffer[13] <= Buffer_Data[111:104] ; end
  					  'd14 : begin buffer[14] <= Buffer_Data[119:112] ; end
  					  'd15 : begin buffer[15] <= Buffer_Data[127:120] ; end
  					  'd16 : begin buffer[16] <= Buffer_Data[135:128] ; end
  					  'd17 : begin buffer[17] <= Buffer_Data[143:136] ; end
  					  'd18 : begin buffer[18] <= Buffer_Data[151:144] ; end
              		                  'd19 : begin buffer[19] <= Buffer_Data[159:152] ; 
			              		     start_scnt <= 1'b1; end
  					  default : begin end
				  endcase
			          end

				if (Bitmap_enb == 1'b1) begin
					   cnt <= cnt + 1;
					   case (cnt) 
 					          'd0 : begin data_reg1  <= Bitmap_Syml_out; end
						  'd1 : begin data_reg2  <= Bitmap_Syml_out; end
						  'd2 : begin data_reg3  <= Bitmap_Syml_out; end
						  'd3 : begin data_reg4  <= Bitmap_Syml_out; end
						  'd4 : begin data_reg5  <= Bitmap_Syml_out; 
						        end
				              default : begin end
				            endcase
				end
				else begin

					if (start_scnt == 1'b1) begin   // Canonical Huffman Code Encoding

					   if (scnt < 20) begin
						   scnt <= scnt + 1;
						   if (data_reg1 == buffer[scnt]) begin // -- D 6 bit Shifting
							   code_data[89:0] <= {code_data[83:0],3'b0,Bitmap_Table[7],Bitmap_Table[2],Bitmap_Table[0]}; // 100
						   end
						   else if (data_reg2 == buffer[scnt]) begin // -- C 6 bit Shifting
							   code_data[89:0] <= {code_data[83:0],3'b011,Bitmap_Table[7],Bitmap_Table[2],Bitmap_Table[1]};  // 101
						   end
						   else if (data_reg5 == buffer[scnt]) begin // -- B 4 bit Shifting
							   code_data[89:0] <= {code_data[85:0],2'b10,Bitmap_Table[7],Bitmap_Table[6]}; // 11
						   end
						   else if (data_reg4 == buffer[scnt]) begin  // -- E 4 Bit Shifting 
							   code_data[89:0] <= {code_data[85:0],2'b10,Bitmap_Table[5],Bitmap_Table[3]}; // 00
						   end
						   else if (data_reg3 == buffer[scnt]) begin  // -- A 4 Bit Shifting
							   code_data[89:0] <= {code_data[85:0],2'b10,Bitmap_Table[5],Bitmap_Table[4]}; // 01 
						   end
				           end
					   else begin
						   start_scnt <= 1'b0;
						   Code_Words <= code_data;
					   end
				      end
				end
			  end

		  end
	  end


endmodule


