
`timescale 1 ns / 1 ps

module Sorting ( 
	     input             clk,
	     input             reset,
	     input             Syml_pulse,
	     input             fdone,
	     input       [7:0] Syml,
	     input       [7:0] Freq,
	     output reg  [7:0] Sort_Freq_Data,
	     output reg  [7:0] Sort_Syml_Data,
	     output reg        Sort_enb
     );

 reg  [7:0] syml_reg [0:19]; 
 reg  [7:0] freq_reg [0:19]; 

 integer i;
 integer freq_cnt;
 reg     f1;
 reg     f2;
 reg     f_re;
 integer cnt_n;
 integer j;
 integer k;

     always @ (posedge clk or negedge reset)
     begin
	     if (reset == 1'b0) begin
		     Sort_Freq_Data <= 'b0;
		     Sort_Syml_Data <= 'b0;
		     Sort_enb       <= 'b0;
		     freq_cnt       <=   0;
		     f1             <= 'b0;
		     f2             <= 'b0;
		     f_re           <= 'b0;
		     j              <= 0;
		     k              <= 0;
		     cnt_n          <= 0;
		 for (i = 0; i < 20; i = i + 1) begin
			 syml_reg[i] <=  8'b0;
			 freq_reg[i] <=  8'b0;
                 end
	     end
	     else begin

		     f1    <= fdone;
		     f2    <= f1;
		     f_re  <= (~f2) & f1; 

		     if (Syml_pulse == 1'b1) begin
			     freq_cnt           <= freq_cnt + 1;
			     freq_reg[freq_cnt] <= Freq;
			     syml_reg[freq_cnt] <= Syml;
		     end

		    if ((fdone == 1'b1) && (cnt_n < 3)) begin

			    if (j < 20) begin
				    j <= j + 1;
			    end
			    else begin
				    j     <= 0;
				    cnt_n <= cnt_n + 1;
			    end
				     if(freq_reg[j] > freq_reg[j+1]) begin
					     freq_reg[j]   <= freq_reg[j+1];
					     freq_reg[j+1] <= freq_reg[j];
					     syml_reg[j]   <= syml_reg[j+1];
					     syml_reg[j+1] <= syml_reg[j];
				     end

				     if(freq_reg[j+2] > freq_reg[j+3]) begin
					     freq_reg[j+2] <= freq_reg[j+3];
					     freq_reg[j+3] <= freq_reg[j+2];
					     syml_reg[j+2] <= syml_reg[j+3];
					     syml_reg[j+3] <= syml_reg[j+2];
				     end

				     if(freq_reg[j+4] > freq_reg[j+5]) begin
					     freq_reg[j+4] <= freq_reg[j+5];
					     freq_reg[j+5] <= freq_reg[j+4];
					     syml_reg[j+4] <= syml_reg[j+5];
					     syml_reg[j+5] <= syml_reg[j+4];
				     end
		    end
		    else begin

			    if ((k < 20) && (cnt_n == 3)) begin
				    k <= k +1;
				    if (|freq_reg[k]) begin
					    Sort_Freq_Data <= freq_reg[k];
					    Sort_Syml_Data <= syml_reg[k];
					    Sort_enb       <= 1'b1;
				    end
			    end
			    else begin
				    Sort_Freq_Data <=  'b0;
		                    Sort_Syml_Data <=  'b0;
				    Sort_enb       <= 1'b0;
			    end
		    end
	     end
     end


endmodule

