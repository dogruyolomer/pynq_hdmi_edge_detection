module color_invert_filter (
    input  wire        clk_pixel,
    
    // came through dvi2rgb
    input  wire [23:0] data_in,
    input  wire        hsync_in,
    input  wire        vsync_in,
    input  wire        vde_in,
    
    // going to rgb2dvi
    output reg  [23:0] data_out,
    output reg         hsync_out,
    output reg         vsync_out,
    output reg         vde_out
);

    // --- pipeline 1: save the inputs ---
    reg [7:0] r_reg, g_reg, b_reg;
    reg hsync_r1, vsync_r1, vde_r1;
    
    // --- pipeline  2: greyscale ---
    reg [7:0] gray_reg;
    reg hsync_r2, vsync_r2, vde_r2;
    
    // --- pipeline  3: edge detection output ---
    reg [7:0] prev_gray;
    
    always @(posedge clk_pixel) begin
        
        r_reg <= data_in[23:16];
        g_reg <= data_in[15:8];
        b_reg <= data_in[7:0];
        hsync_r1 <= hsync_in;
        vsync_r1 <= vsync_in;
        vde_r1   <= vde_in;
        
        //  (R + 2G + B) / 4
        gray_reg <= (r_reg + (g_reg << 1) + b_reg) >> 2;
        hsync_r2 <= hsync_r1;
        vsync_r2 <= vsync_r1;
        vde_r2   <= vde_r1;
        
        prev_gray <= gray_reg; 
        
        hsync_out <= hsync_r2;
        vsync_out <= vsync_r2;
        vde_out   <= vde_r2;
        
        if (vde_r2) begin

            if (gray_reg > prev_gray && (gray_reg - prev_gray) > 15)
                data_out <= 24'hFFFFFF; // white (there is an edge here) 
            else if (prev_gray > gray_reg && (prev_gray - gray_reg) > 15)
                data_out <= 24'hFFFFFF; // white (there is an edge here) 
            else
                data_out <= 24'h000000; // black
        end else begin
            data_out <= 24'h000000;
        end
    end

endmodule