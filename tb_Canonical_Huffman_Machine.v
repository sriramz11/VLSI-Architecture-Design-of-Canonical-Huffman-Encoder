
`timescale 1 ns / 1 ps

module tb_Canonical_Huffman_Machine;

      	reg          clk;
       	reg          clk_2;
	reg          reset;
	wire [7:0]   img_write_addr_org;
	wire [7:0]   qpo_rd_addr;
	wire [159:0] img_write_data_org;
	wire         img_wr_enb_org;
	wire         start_org;
	wire         hsync;
	wire         vsync;
	reg          done ;
	wire [7:0]   Huffman_data;
        wire [89:0]  Code_Words;

initial
begin
	clk        <= 1'b0;
	reset      <= 1'b0;
	#15 reset  <= 1'b1;
        forever #5 clk <= ~clk;	
end

        always@(negedge clk or posedge reset)
	begin
		if (reset == 1'b0) begin
		       done <= 1'b0;
	        end
		else begin
	               //done <= reset;
                end	 
	end	


        Canonical_Huffman_Machine h1(
	         .clk                  (clk),
		 .reset                (reset),
		 .data_enb             (img_wr_enb_org),
		 .data_in              (img_write_data_org),
		 .Code_Words           (Code_Words)
	 );

	file_reading b1 
	(
	        .clk                   (clk),
	        .reset                 (reset),
		.img_write_addr        (img_write_addr_org),
	        .img_write_data        (img_write_data_org),
	        .img_wr_enb            (img_wr_enb_org),
	        .hsync                 (hsync),
	        .vsync                 (vsync),
	        .start                 (start_org)
	);

endmodule;


