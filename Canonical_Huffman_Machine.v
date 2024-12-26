
`timescale 1 ns / 1 ps

module Canonical_Huffman_Machine (
	         input               clk,
		 input               reset,
		 input               data_enb,
		 input       [159:0] data_in,
		 output wire [89:0]  Code_Words
	 );

wire  [7:0] Sort_Freq_Data;
wire  [7:0] Sort_Syml_Data;
wire        Sort_enb;
wire  [7:0] buffer_data;
wire        buffer_enb;
wire  [7:0] Syml_out;
wire  [7:0] Freq_out;
wire        fdone;
wire        Syml_pulse;
wire [19:0] Bitmap_Table;
wire        Bitmap_done;
wire [7:0]  Bitmap_Syml_out;
wire        Bitmap_enb;

         Huffman_Buffer hbf(
		 .clk                (clk),
		 .reset              (reset),
		 .data_enb           (data_enb),
		 .data_in            (data_in),
		 .buffer_data        (buffer_data),
	         .buffer_enb         (buffer_enb)
	 );

/// ------------------- Frequency Generation -------------------------

         Frequency_count f1 ( 
	          .clk               (clk),
		  .reset             (reset),
		  .data_enb          (buffer_enb),
		  .data_in           (buffer_data),
		  .Syml_out          (Syml_out),
		  .Freq_out          (Freq_out),
		  .Syml_pulse        (Syml_pulse),
		  .fdone             (fdone)
	  );

// -------------------- Code Size Computing & Sorting ----------------

          Sorting s1 ( 
	          .clk               (clk),
	          .reset             (reset),
		  .Syml_pulse        (Syml_pulse),
		  .fdone             (fdone),
	          .Syml              (Syml_out),
	          .Freq              (Freq_out),
	          .Sort_Freq_Data    (Sort_Freq_Data),
  	          .Sort_Syml_Data    (Sort_Syml_Data),
	          .Sort_enb          (Sort_enb)
          );

// -------------------- State Transition Diagram ---------------------

          Bitmapping bm(
	          .clk               (clk),
                  .reset             (reset),
     		  .Sort_Freq_Data    (Sort_Freq_Data),
		  .Sort_Syml_Data    (Sort_Syml_Data),
		  .Sort_enb          (Sort_enb),
 		  .Bitmap_Table      (Bitmap_Table),
		  .Bitmap_done       (Bitmap_done),
		  .Bitmap_Syml_out   (Bitmap_Syml_out),
		  .Bitmap_enb        (Bitmap_enb)
	  );


          Code_Table ct(
	          .clk               (clk),
		  .reset             (reset),
		  .Buffer_Data       (data_in),
      		  .Bitmap_Table      (Bitmap_Table),
		  .Bitmap_done       (Bitmap_done),
		  .Bitmap_Syml_out   (Bitmap_Syml_out),
		  .Bitmap_enb        (Bitmap_enb),
  		  .Code_Words        (Code_Words)
	  );

endmodule

