`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2017 22:34:11
// Design Name: 
// Module Name: m_driver_1024x768
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

/*
module driver_vga_640x480(clk_vga, hs, vs,hc_visible,vc_visible);
	input clk_vga;                      // 25 MHz !
	output hs, vs; 
	output [9:0]hc_visible;
	output [9:0]vc_visible; 

	//640x480 original
	parameter hpixels = 10'd800;  // --Value of pixels in a horizontal line
	parameter vlines  = 10'd500;  // --Number of horizontal lines in the display

	parameter hfp  = 10'd16;      // --Horizontal front porch
	parameter hsc  = 10'd64;      // --Horizontal sync
	parameter hbp  = 10'd80;      // --Horizontal back porch
	
	parameter vfp  = 10'd3;       // --Vertical front porch
	parameter vsc  = 10'd4;       // --Vertical sync
	parameter vbp  = 10'd13;      // --Vertical back porch
	
	
	reg [9:0] hc, hc_next, vc, vc_next;             // --These are the Horizontal and Vertical counters    
	
	assign hc_visible = ((hc < (hpixels - hfp)) && (hc > (hsc + hbp)))?(hc -(hsc + hbp)):10'd0;
	assign vc_visible = ((vc < (vlines - vfp)) && (vc > (vsc + vbp)))?(vc - (vsc + vbp)):10'd0;
	
	
	// --Runs the horizontal counter

	always@(*)
		if(hc == hpixels)				// --If the counter has reached the end of pixel count
			hc_next = 10'd0;			// --reset the counter
		else
			hc_next = hc + 10'd1;		// --Increment the horizontal counter

	
	// --Runs the vertical counter
	always@(*)
		if(hc == 10'd0)
			if(vc == vlines)
				vc_next = 10'd0;
			else
				vc_next = vc + 10'd1;
		else
			vc_next = vc;
	
	always@(posedge clk_vga)
		{hc, vc} <= {hc_next, vc_next};
		
	assign hs = (hc < hsc) ? 1'b0 : 1'b1;   // --Horizontal Sync Pulse
	assign vs = (vc < vsc) ? 1'b0 : 1'b1;   // --Vertical Sync Pulse
	
endmodule
*/

module driver_vga_1024x768(
	input clk_vga,              // 82 MHz !
	output hs, vs, 

	//FILL HERE
    output [10:0]hc_visible,
    output [10:0]vc_visible
);
    //1024*768 original
    parameter hpixels = 11'd1360;  // --Value of pixels in a horizontal line
    parameter vlines  = 11'd805;  // --Number of horizontal lines in the display

    parameter hfp  = 11'd64;      // --Horizontal front porch
    parameter hsc  = 11'd104;      // --Horizontal sync
    parameter hbp  = 11'd168;      // --Horizontal back porch
    
    parameter vfp  = 11'd3;       // --Vertical front porch
    parameter vsc  = 11'd4;       // --Vertical sync
    parameter vbp  = 11'd30;      // --Vertical back porch
    
    
    reg [10:0] hc, hc_next, vc, vc_next;             // --These are the Horizontal and Vertical counters    
    
    assign hc_visible = ((hc < (hpixels - hfp)) && (hc > (hsc + hbp)))?(hc -(hsc + hbp)):11'd0;
    assign vc_visible = ((vc < (vlines - vfp)) && (vc > (vsc + vbp)))?(vc - (vsc + vbp)):11'd0;
    
    
    // --Runs the horizontal counter

    always@(*)
        if(hc == hpixels)                // --If the counter has reached the end of pixel count
            hc_next = 11'd0;            // --reset the counter
        else
            hc_next = hc + 11'd1;        // --Increment the horizontal counter

    
    // --Runs the vertical counter
    always@(*)
        if(hc == 11'd0)
            if(vc == vlines)
                vc_next = 11'd0;
            else
                vc_next = vc + 11'd1;
        else
            vc_next = vc;
    
    always@(posedge clk_vga)
        {hc, vc} <= {hc_next, vc_next};
        
    assign hs = (hc < hsc) ? 1'b0 : 1'b1;   // --Horizontal Sync Pulse
    assign vs = (vc < vsc) ? 1'b0 : 1'b1;   // --Vertical Sync Pulse


endmodule


