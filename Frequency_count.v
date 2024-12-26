
`timescale 1 ns / 1 ps

module Frequency_count (
	          input             clk,
		  input             reset,
		  input             data_enb,
		  input       [7:0] data_in,
		  output reg  [7:0] Syml_out,
		  output reg  [7:0] Freq_out,
		  output reg        Syml_pulse,
		  output reg        fdone
	  );

 parameter    K_MAX = 20;

 integer    data_cnt;
 integer    syml_cnt;
 integer    i;
 reg  [7:0] data_reg [0:19];
 reg  [7:0] freq_reg   [0:19];

 always @ (posedge clk or negedge reset)
 begin
	 if (reset == 1'b0) begin
		 Syml_out   <=   'b0;
		 Freq_out   <=   'b0;
		 data_cnt   <=     0;
		 syml_cnt   <=   'b0;
		 fdone      <=   'b0;
		 Syml_pulse <= 1'b0;
		 for (i = 0; i < 20; i = i + 1) begin
			 data_reg[i] <=  8'b0;
			 freq_reg[i] <=  8'b0;
                 end
	 end
	 else begin

		 Syml_pulse  <= 1'b0;

		 if (data_enb == 1'b1 && data_cnt < 20) begin

			 data_cnt           <= data_cnt + 1;
		         data_reg[data_cnt] <= data_in;

			 if  (data_reg[0] == data_in) begin
				 freq_reg[0] <= freq_reg[0] + 1'b1;
			 end
			 else if (data_reg[1] == data_in) begin
				 freq_reg[1] <= freq_reg[1] + 1'b1;				 
			 end
			 else if (data_reg[2] == data_in) begin
				 freq_reg[2] <= freq_reg[2] + 1'b1;
			 end
			 else if (data_reg[3] == data_in) begin
				 freq_reg[3] <= freq_reg[3] + 1'b1;
			 end
			 else if (data_reg[4] == data_in) begin
				 freq_reg[4] <= freq_reg[4] + 1'b1;
			 end
			 else if (data_reg[5] == data_in) begin
				 freq_reg[5] <= freq_reg[5] + 1'b1;
			 end
			 else if (data_reg[6] == data_in) begin
				 freq_reg[6] <= freq_reg[6] + 1'b1;
			 end
			 else if (data_reg[7] == data_in) begin
				 freq_reg[7] <= freq_reg[7] + 1'b1;
			 end
			 else if (data_reg[8] == data_in) begin
				 freq_reg[8] <= freq_reg[8] + 1'b1;
			 end
			 else if (data_reg[9] == data_in) begin
				 freq_reg[9] <= freq_reg[9] + 1'b1;
			 end
			 else if (data_reg[10] == data_in) begin
				 freq_reg[10] <= freq_reg[10] + 1'b1;
			 end
			 else if (data_reg[11] == data_in) begin
				 freq_reg[11] <= freq_reg[11] + 1'b1;
			 end
			 else if (data_reg[12] == data_in) begin				 
				 freq_reg[12] <= freq_reg[12] + 1'b1;
			 end
			 else if (data_reg[13] == data_in) begin
				 freq_reg[13] <= freq_reg[13] + 1'b1;
			 end
			 else if (data_reg[14] == data_in) begin
				 freq_reg[14] <= freq_reg[14] + 1'b1;
			 end
			 else if (data_reg[15] == data_in) begin
				 freq_reg[15] <= freq_reg[15] + 1'b1;
			 end
			 else if (data_reg[16] == data_in) begin
				 freq_reg[16] <= freq_reg[16] + 1'b1;
			 end
			 else if (data_reg[17] == data_in) begin
				 freq_reg[17] <= freq_reg[17] + 1'b1;
			 end
			 else if (data_reg[18] == data_in) begin
				 freq_reg[18] <= freq_reg[18] + 1'b1;
			 end
			 else if (data_reg[19] == data_in) begin
				 freq_reg[19] <= freq_reg[19] + 1'b1;
			 end
		 end

		 if (data_cnt == K_MAX) begin

                          if ( syml_cnt < K_MAX) begin
				  syml_cnt <= syml_cnt + 1;
				  if (|freq_reg[syml_cnt]) begin
					  Syml_out   <= data_reg[syml_cnt];
					  Syml_pulse <= 1'b1;
				          Freq_out   <= freq_reg[syml_cnt] + 1'b1;
				  end
				  else begin
					  Freq_out   <= 'b0;
				  end
			  end
			  else begin
				  fdone      <= 1'b1;
				  syml_cnt   <= 0;
				  data_cnt   <= 0;
				  Syml_pulse <= 1'b0;
			  end
		  end

	 end
 end


endmodule

