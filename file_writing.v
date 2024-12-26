
`timescale 1 ns / 1 ps

module file_writing
	(
	       input              clk,       
	       input              reset,     
	       input              done,      
     	       output wire [7:0] qpo_rd_addr,
	       input       [7:0]  qpo_rd_data 
	);

	parameter [7:0] K_IMG_OUTPUT = 256;

	reg         done_s;
	reg         flag;
	reg  [7:0] read_addr;
	wire signed [7:0]  outimg_read_data;
        integer     read_file;

	assign qpo_rd_addr      = read_addr;
	assign outimg_read_data = qpo_rd_data;

	initial begin
               read_file   <= $fopen("data_out.txt","w");
        end


       always@(negedge clk or posedge reset)

	begin
		if (reset == 1'b0) begin
			read_addr <= 'b0;
			done_s    <= 1'b0;
			flag      <= 1'b0;
		end
		else begin
			done_s <= done;

			if ((done == 1'b1)|  (done_s == 1'b1)) begin

				if (flag == 1'b0) begin
					flag      <= 1'b1;
					read_addr <= read_addr + 1'b1;
				end
				else if (read_addr < K_IMG_OUTPUT-1'b1) begin
					read_addr <= read_addr + 1'b1;
				        $fwrite(read_file,"%c",outimg_read_data); 
				end
				else if ((done == 1'b0) & (done_s == 1'b1)) begin
				        $fwrite(read_file,"%c",outimg_read_data); 
				end
			end

		end

	end

endmodule
