
`timescale 1 ns / 1 ps

module Bitmapping (
	          input              clk,
                  input              reset,
     		  input       [7:0]  Sort_Freq_Data,
		  input       [7:0]  Sort_Syml_Data,
		  input              Sort_enb,
		  output wire [19:0] Bitmap_Table,
		  output reg         Bitmap_done,
		  output reg  [7:0]  Bitmap_Syml_out,
		  output reg         Bitmap_enb
	  );
    
reg [7:0] sm [0:19];
reg [7:0] syml_reg [0:19];
reg       bm [0:19];
reg       flag0;
reg       flag1;
reg       Sort_samp;
integer   i;
integer   k;

integer   length;

assign Bitmap_Table[0]  = bm[0];
assign Bitmap_Table[1]  = bm[1];
assign Bitmap_Table[2]  = bm[2];
assign Bitmap_Table[3]  = bm[3];
assign Bitmap_Table[4]  = bm[4];
assign Bitmap_Table[5]  = bm[5];
assign Bitmap_Table[6]  = bm[6];
assign Bitmap_Table[7]  = bm[7];
assign Bitmap_Table[8]  = bm[8];
assign Bitmap_Table[9]  = bm[9];
assign Bitmap_Table[10] = bm[10];
assign Bitmap_Table[11] = bm[11];
assign Bitmap_Table[12] = bm[12];
assign Bitmap_Table[13] = bm[13];
assign Bitmap_Table[14] = bm[14];
assign Bitmap_Table[15] = bm[15];
assign Bitmap_Table[16] = bm[16];
assign Bitmap_Table[17] = bm[17];
assign Bitmap_Table[18] = bm[18];
assign Bitmap_Table[19] = bm[19];

	  always @ (posedge clk or negedge reset)
	  begin
		  if (reset == 1'b0) begin

			 length          <=   0;
			 flag0           <= 'b0;
			 flag1           <= 'b0;
			 Sort_samp       <= 'b0;
			 Bitmap_done     <= 'b0;
			 Bitmap_Syml_out <= 'b0;
			 Bitmap_enb      <= 'b0;
			 k               <=  0;
			 for (i = 0; i < 20; i = i + 1) begin
				 sm[i]       <=  8'b0;
				 bm[i]       <=  1'b0;
                         end
		  end
		  else begin

			  Sort_samp <= Sort_enb;
			  
			  if (Sort_enb == 1'b1 || Sort_samp == 1'b1) begin

				  length <= length + 1;
				  
				  case (length)
				  'd0 : begin 
				               sm[0]       <= Sort_Freq_Data;
					       bm[0]       <= 1'b0;
					       syml_reg[0] <= Sort_Syml_Data;
				        end
				  'd1 : begin 
				               sm[1]       <= Sort_Freq_Data;
					       sm[2]       <= sm[0] + Sort_Freq_Data;
					       bm[1]       <= 1'b1;            /// 1st set completed                  
					       syml_reg[1] <= Sort_Syml_Data;
				        end
				  'd2 : begin
					       sm[3]       <= Sort_Freq_Data;
					       bm[3]       <= 1'b0;
					       syml_reg[2] <= Sort_Syml_Data;
				        end
				  'd3 : begin
					       sm[4]       <= Sort_Freq_Data;
					       sm[5]       <= sm[3] + Sort_Freq_Data;
					       bm[4]       <= 1'b1;          /// 2nd set completed
					       syml_reg[3] <= Sort_Syml_Data;
				        end
				  'd4 : begin
					       sm[6]       <= Sort_Freq_Data;
					       syml_reg[4] <= Sort_Syml_Data;

					       if (Sort_Freq_Data > sm[2]) begin      //  Checking the next priority which one is lowest with new data
					
						       sm[7] <= sm[2] + Sort_Freq_Data;
						       flag0 <= 1'b1;
						       bm[2] <= 1'b0;
						       bm[6] <= 1'b1;

					       end
					       else if (Sort_Freq_Data > sm[5]) begin
						       
						       sm[7] <= sm[5] + Sort_Freq_Data;
						       flag1 <= 1'b1;
						       bm[5] <= 1'b0;
						       bm[6] <= 1'b1;

					       end
					end
				  'd5 : begin
					       Bitmap_done <=  'b1;
					       syml_reg[5] <= Sort_Syml_Data;
					       
					       if (flag0 == 1'b1) begin
						       
						       sm[8] <= sm[5] + sm[7];
						       
						       if (sm[5] < sm[7]) begin
							       bm[5] <= 1'b0;
							       bm[7] <= 1'b1;
						       end
						       else begin
							       bm[5] <= 1'b1;
							       bm[7] <= 1'b0;
						       end

					       end
					       if (flag1 == 1'b1) begin
						       
						       sm[8] <= sm[2] + sm[7];
						       
						       if (sm[2] < sm[7]) begin
							       bm[2] <= 1'b0;
							       bm[7] <= 1'b1;
						       end
						       else begin
							       bm[2] <= 1'b1;
							       bm[7] <= 1'b0;
						       end

					       end
				       end			       

				  default : begin end
				  endcase       
			  end
			  else begin

				   if ((k < 5) && (length == 6)) begin
					   k <= k +1;
       					   if (|syml_reg[k]) begin
       						   Bitmap_Syml_out <= syml_reg[k];
       						   Bitmap_enb      <= 1'b1;
       					   end
				   end
				   else begin
					   Bitmap_Syml_out <=  'b0;
					   Bitmap_enb      <= 1'b0;
				   end
			  end
		  end
	  end

endmodule

