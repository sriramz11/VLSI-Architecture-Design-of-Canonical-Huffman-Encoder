`timescale 1 ns / 1 ps

module file_reading
	(
	        input                clk, 
	        input                reset,     
		output wire [7:0]    img_write_addr,
	        output reg  [159:0]  img_write_data,
	        output reg           img_wr_enb,
	        output reg           hsync,
	        output reg           vsync,
	        output reg           start
	);

	parameter [7:0] K_IMG_INPUT = 255;
	parameter [7:0] K_H_SYNC    = 255;
	parameter [7:0] K_V_SYNC    = 255; 

	reg [7:0] inimg_addr;

	reg        first_flag;
	reg        wr_enb;
	reg [7:0] wr_addr;
	reg [7:0]  wr_data;

	integer    hsync_cnt;
	integer    vsync_cnt;

        integer    file_in;
        reg  [7:0] read_line;
	integer    r;
	reg        flag;
	integer    cnt;
	
        assign img_write_addr   = wr_addr;

	initial begin
 	      file_in          <=  $fopen("data.txt", "r");
        end
		

	always@ (negedge clk or posedge reset)
	begin
		if (reset == 1'b0) begin
			hsync_cnt       <=  'd0 ;
			vsync_cnt       <=  'd0 ;
			hsync           <= 1'b0;
			vsync           <= 1'b0;
			wr_addr         <= 'b0;
			img_wr_enb      <= 1'b0;
			img_write_data  <= 'b0;
			flag            <= 'b0;
			cnt             <=  0;
		end

		else begin

			hsync          <= 1'b0;
			vsync          <= 1'b0;
			wr_addr        <= inimg_addr;

			if (wr_enb == 1'b1) begin
				cnt            <= cnt + 1;
				img_wr_enb     <= 1'b1;
				case (cnt)
					'd0  : begin img_write_data[7:0]   <= wr_data; end
					'd1  : begin img_write_data[15:8]  <= wr_data; end
					'd2  : begin img_write_data[23:16] <= wr_data; end
					'd3  : begin img_write_data[31:24] <= wr_data; end
					'd4  : begin img_write_data[39:32] <= wr_data; end
					'd5  : begin img_write_data[47:40] <= wr_data; end
					'd6  : begin img_write_data[55:48] <= wr_data; end
					'd7  : begin img_write_data[63:56] <= wr_data; end
					'd8  : begin img_write_data[71:64] <= wr_data; end
					'd9  : begin img_write_data[79:72] <= wr_data; end
					'd10 : begin img_write_data[87:80] <= wr_data; end
					'd11 : begin img_write_data[95:88] <= wr_data; end
					'd12 : begin img_write_data[103:96] <= wr_data; end
					'd13 : begin img_write_data[111:104] <= wr_data; end
					'd14 : begin img_write_data[119:112] <= wr_data; end
					'd15 : begin img_write_data[127:120] <= wr_data; end
					'd16 : begin img_write_data[135:128] <= wr_data; end
					'd17 : begin img_write_data[143:136] <= wr_data; end
					'd18 : begin img_write_data[151:144] <= wr_data; end
					'd19 : begin img_write_data[159:152] <= wr_data; end
					default : begin end
				endcase
			end	
			else begin
				img_wr_enb <= 1'b0;
			end

			if (wr_enb == 1'b1) begin

				if (hsync_cnt < K_H_SYNC-1) begin 
				   hsync_cnt <= hsync_cnt + 1;
			        end
				else begin
			           hsync_cnt <= 'd0;
				   hsync     <= 1'b1;
				   if (vsync_cnt < K_V_SYNC-1) begin
					   vsync_cnt <= vsync_cnt + 1;
				   end
				   else begin
				      vsync     <= 1'b1;
				      vsync_cnt <= 'd0;
			           end
			        end
			end

		end
	end

	always@ (negedge clk or posedge reset)
	begin
		
	      if (reset == 1'b0) begin
			wr_enb         <= 1'b0;
			start          <= 1'b0;
			inimg_addr     <= 'b0;
			first_flag     <= 1'b0;
			read_line      <=  'b0; 
			wr_data        <= 'b0;
			
		end
		else begin

                        read_line <= $fscanf(file_in,"%c", wr_data);
			

			if (!$feof(file_in)) begin 
			       wr_enb           <= 1'b1;
			       first_flag       <= 1'b1;

			       if ((inimg_addr < K_IMG_INPUT)) begin
				       inimg_addr <= inimg_addr + 1'b1;
			       end

		        end
		        else begin
			       start           <= 1'b1;
			       wr_enb          <= 1'b0;
                        end

		       

		end

	end
endmodule;
