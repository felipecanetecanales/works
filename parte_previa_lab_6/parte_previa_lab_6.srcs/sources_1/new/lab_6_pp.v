`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2017 22:25:54
// Design Name: 
// Module Name: lab_6_pp
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

module lab_6(
	input CLK100MHZ,
	input [15:0]SW,
	input PS2_CLK,
	input PS2_DATA,
	input CPU_RESETN,
	output VGA_HS,
	output VGA_VS,
	output [3:0] VGA_R,
	output [3:0] VGA_G,
	output [3:0] VGA_B
	);
	
	localparam CUADRILLA_XI = 		212;
	localparam CUADRILLA_XF = 		812;
	
	localparam CUADRILLA_YI = 		184;
	localparam CUADRILLA_YF = 		584;
	
	localparam CUADRILLA_XI2=       212; //definimos nuevos parametros para el display de la 
	localparam CUADRILLA_XF2=       612; //calculadora
	
	localparam CUADRILLA_YI2=       50;
	localparam CUADRILLA_YF2=       150;
	
	localparam CUADRILLA_YF3=       712;
	
	wire [10:0]vc_visible,hc_visible;
	wire CLK82MHZ;
	
	clk_wiz_0 inst(
		// Clock out ports  
		.clk_out1(CLK82MHZ),
		// Status and control signals               
		.reset(1'b0), 
		//.locked(locked),
		// Clock in ports
		.clk_in1(CLK100MHZ)
		);
		
    	wire kbs_tot;
        wire [7:0] data;
        wire [2:0] data_type;
        wire parity_error;
    
	/*driver_vga_640x480 m_driver(CLK82MHZ, VGA_HS, VGA_VS,hc_visible,vc_visible);*/
	driver_vga_1024x768 m_driver(CLK82MHZ, VGA_HS, VGA_VS, hc_visible, vc_visible);
	//kbd_ms m_kd(CLK82MHZ, 1'b0, PS2_DATA, PS2_CLK, data, data_type, kbs_tot, parity_error);
	
    wire [10:0]pos_x,pos_y; //posicion del cursor en la cuadrilla de calculos
	cursor cursor_inst0(.clock(CLK82MHZ),.reset(~CPU_RESETN),.kd(PS2_DATA),.kc(PS2_CLK),.ubic_x(pos_x),.ubic_y(pos_y));
	
	wire [10:0]hc_template, vc_template;
	wire [2:0]matrix_x;
	wire [1:0]matrix_y;
	wire lines;
	
    template_6x4_600x400 template_1(CLK82MHZ, hc_visible, vc_visible, matrix_x, matrix_y, lines);
	
	//caracteres que van en la calculadora
	wire in_sq0,in_sq1,in_sq2,in_sq3,in_sq4,in_sq5,in_sq6,in_sq7,in_sq8,in_sq9,in_sqa,in_sqb,in_sqc,in_sqd,in_sqe,in_sqf,in_sq_suma,in_sq_resta, in_sq_mult,in_sq_and,in_sq_or,in_sq_EXE,in_sq_CE, in_sq_hex, in_sq_dec, in_sq_space;
	wire dr0,dr1,dr2,dr3,dr4,dr5,dr6,dr7,dr8,dr9,dra,drb,drc,drd,dre,drf,dr_suma,dr_resta,dr_mult,dr_and, dr_or, dr_CE,dr_EXE, dr_dec, dr_hex, dr_space;
	
	show_one_char #
	(.MENU_X_LOCATION(11'd239),
	 .MENU_Y_LOCATION(11'd209))show_ins0(.clk(CLK82MHZ),.rst(~CPU_RESETN),.hc_visible(hc_visible),.vc_visible(vc_visible),.the_char("0"),.in_square(in_sq0),.in_character(dr0));
	show_one_char #
         (.MENU_X_LOCATION(11'd339),
          .MENU_Y_LOCATION(11'd209))
          show_ins1(.clk(CLK82MHZ),.rst(~CPU_RESETN),.hc_visible(hc_visible),.vc_visible(vc_visible),.the_char("1"),.in_square(in_sq1),.in_character(dr1));
	show_one_char #
         (.MENU_X_LOCATION(11'd439),
          .MENU_Y_LOCATION(11'd209))
         show_ins2(.clk(CLK82MHZ),.rst(~CPU_RESETN),.hc_visible(hc_visible),.vc_visible(vc_visible),.the_char("2"),.in_square(in_sq2),.in_character(dr2));
	show_one_char #
          (.MENU_X_LOCATION(11'd539),
           .MENU_Y_LOCATION(11'd209))
          show_ins3(.clk(CLK82MHZ),.rst(~CPU_RESETN),.hc_visible(hc_visible),.vc_visible(vc_visible),.the_char("3"),.in_square(in_sq3),.in_character(dr3));
	show_one_char #
          (.MENU_X_LOCATION(11'd239),
           .MENU_Y_LOCATION(11'd309))
          show_ins4(.clk(CLK82MHZ),.rst(~CPU_RESETN),.hc_visible(hc_visible),.vc_visible(vc_visible),.the_char("4"),.in_square(in_sq4),.in_character(dr4));
	show_one_char #
          (.MENU_X_LOCATION(11'd339),
           .MENU_Y_LOCATION(11'd309))
          show_ins5(.clk(CLK82MHZ),.rst(~CPU_RESETN),.hc_visible(hc_visible),.vc_visible(vc_visible),.the_char("5"),.in_square(in_sq5),.in_character(dr5));
	show_one_char #
          (.MENU_X_LOCATION(11'd439),
           .MENU_Y_LOCATION(11'd309))
          show_ins6(.clk(CLK82MHZ),.rst(~CPU_RESETN),.hc_visible(hc_visible),.vc_visible(vc_visible),.the_char("6"),.in_square(in_sq6),.in_character(dr6));
	show_one_char #
           (.MENU_X_LOCATION(11'd539),
            .MENU_Y_LOCATION(11'd309))
           show_ins7(.clk(CLK82MHZ),.rst(~CPU_RESETN),.hc_visible(hc_visible),.vc_visible(vc_visible),.the_char("7"),.in_square(in_sq7),.in_character(dr7));
	show_one_char #
           (.MENU_X_LOCATION(11'd239),
            .MENU_Y_LOCATION(11'd409))
           show_ins8(.clk(CLK82MHZ),.rst(~CPU_RESETN),.hc_visible(hc_visible),.vc_visible(vc_visible),.the_char("8"),.in_square(in_sq8),.in_character(dr8));
	show_one_char #
           (.MENU_X_LOCATION(11'd339),
            .MENU_Y_LOCATION(11'd409))
           show_ins9(.clk(CLK82MHZ),.rst(~CPU_RESETN),.hc_visible(hc_visible),.vc_visible(vc_visible),.the_char("9"),.in_square(in_sq9),.in_character(dr9));
    show_one_char #
           (.MENU_X_LOCATION(11'd439),
            .MENU_Y_LOCATION(11'd409))
           show_insa(.clk(CLK82MHZ),.rst(~CPU_RESETN),.hc_visible(hc_visible),.vc_visible(vc_visible),.the_char(8'd97),.in_square(in_sqa),.in_character(dra));
    show_one_char #
           (.MENU_X_LOCATION(11'd539),
            .MENU_Y_LOCATION(11'd409))
           show_insb(.clk(CLK82MHZ),.rst(~CPU_RESETN),.hc_visible(hc_visible),.vc_visible(vc_visible),.the_char(8'd98),.in_square(in_sqb),.in_character(drb));
    show_one_char #
          (.MENU_X_LOCATION(11'd239),
           .MENU_Y_LOCATION(11'd509))
           show_insc(.clk(CLK82MHZ),.rst(~CPU_RESETN),.hc_visible(hc_visible),.vc_visible(vc_visible),.the_char(8'd99),.in_square(in_sqc),.in_character(drc));
    show_one_char #
           (.MENU_X_LOCATION(11'd339),
            .MENU_Y_LOCATION(11'd509))
           show_insd(.clk(CLK82MHZ),.rst(~CPU_RESETN),.hc_visible(hc_visible),.vc_visible(vc_visible),.the_char(8'd100),.in_square(in_sqd),.in_character(drd));
    show_one_char #
           (.MENU_X_LOCATION(11'd439),
            .MENU_Y_LOCATION(11'd509))
            show_inse(.clk(CLK82MHZ),.rst(~CPU_RESETN),.hc_visible(hc_visible),.vc_visible(vc_visible),.the_char(8'd101),.in_square(in_sqe),.in_character(dre));
    show_one_char #
           (.MENU_X_LOCATION(11'd539),
            .MENU_Y_LOCATION(11'd509))
           show_insf(.clk(CLK82MHZ),.rst(~CPU_RESETN),.hc_visible(hc_visible),.vc_visible(vc_visible),.the_char(8'd102),.in_square(in_sqf),.in_character(drf));
    show_one_char #
           (.MENU_X_LOCATION(11'd639),
            .MENU_Y_LOCATION(11'd209))
           show_in_suma(.clk(CLK82MHZ),.rst(~CPU_RESETN),.hc_visible(hc_visible),.vc_visible(vc_visible),.the_char(8'd43),.in_square(in_sq_suma),.in_character(dr_suma));
    show_one_char #
           (.MENU_X_LOCATION(11'd739),
            .MENU_Y_LOCATION(11'd209))
           show_ins_resta(.clk(CLK82MHZ),.rst(~CPU_RESETN),.hc_visible(hc_visible),.vc_visible(vc_visible),.the_char(8'd45),.in_square(in_sq_resta),.in_character(dr_resta));
    show_one_char #
            (.MENU_X_LOCATION(11'd639),
             .MENU_Y_LOCATION(11'd309))
            show_ins_mult(.clk(CLK82MHZ),.rst(~CPU_RESETN),.hc_visible(hc_visible),.vc_visible(vc_visible),.the_char(8'd42),.in_square(in_sq_mult),.in_character(dr_mult));
    show_one_char #
            (.MENU_X_LOCATION(11'd639),
             .MENU_Y_LOCATION(11'd409))
            show_ins_and(.clk(CLK82MHZ),.rst(~CPU_RESETN),.hc_visible(hc_visible),.vc_visible(vc_visible),.the_char(8'd38),.in_square(in_sq_and),.in_character(dr_and));
    show_one_char #
            (.MENU_X_LOCATION(11'd739),
             .MENU_Y_LOCATION(11'd309))
            show_ins_or(.clk(CLK82MHZ),.rst(~CPU_RESETN),.hc_visible(hc_visible),.vc_visible(vc_visible),.the_char(8'd47),.in_square(in_sq_or),.in_character(dr_or));
    show_one_char #
            (.MENU_X_LOCATION(11'd712),
             .MENU_Y_LOCATION(11'd484))
             show_ins_space(.clk(CLK82MHZ),.rst(~CPU_RESETN),.hc_visible(hc_visible),.vc_visible(vc_visible),.the_char(8'd32),.in_square(in_sq_space),.in_character(dr_space));
                
    show_one_line #
            (.MENU_X_LOCATION(11'd739),
             .MENU_Y_LOCATION(11'd409),
             .MAX_CHARACTER_LINE(2),
             .ancho_pixel(3'd4))
             show_one_line_ce(.clk(CLK82MHZ),.rst(~CPU_RESETN),.hc_visible(hc_visible),.vc_visible(vc_visible),.the_line({8'd67,8'd69}),.in_square(in_sq_CE),.in_character(dr_CE));
    show_one_line #
            (.MENU_X_LOCATION(11'd639),
             .MENU_Y_LOCATION(11'd509),
             .MAX_CHARACTER_LINE(3),
             .ancho_pixel(3'd4))
            show_one_line_exe(.clk(CLK82MHZ),.rst(~CPU_RESETN),.hc_visible(hc_visible),.vc_visible(vc_visible),.the_line({8'd69,8'd88,8'd69}),.in_square(in_sq_EXE),.in_character(dr_EXE));
    show_one_line #
            (.MENU_X_LOCATION(11'd639),
             .MENU_Y_LOCATION(11'd60),
             .MAX_CHARACTER_LINE(3),
             .ancho_pixel(3'd2))
             show_one_line_hex(.clk(CLK82MHZ),.rst(~CPU_RESETN),.hc_visible(hc_visible),.vc_visible(vc_visible),.the_line({8'd72,8'd69,8'd88}),.in_square(in_sq_hex),.in_character(dr_hex));
    show_one_line #
            (.MENU_X_LOCATION(11'd639),
             .MENU_Y_LOCATION(11'd109),
             .MAX_CHARACTER_LINE(3),
             .ancho_pixel(3'd2))
            show_one_line_dec(.clk(CLK82MHZ),.rst(~CPU_RESETN),.hc_visible(hc_visible),.vc_visible(vc_visible),.the_line({8'd68,8'd69,8'd67}),.in_square(in_sq_dec),.in_character(dr_dec));
                              		
	reg [11:0]VGA_COLOR;
	
	wire in_sq, dr;
	/*hello_world m_hw(CLK82MHZ, 1'b0, hc_visible, vc_visible, in_sq, dr);
	*/
	wire lines_resultado;
	wire [1:0]matrix_y2;
	wire [2:0]matrix_x2;
	
	template_resultado temp_res(CLK82MHZ, hc_visible, vc_visible, matrix_x2, matrix_y2, lines_resultado);
	
	
	always@(*)
		if((hc_visible != 0) && (vc_visible != 0))
		begin         
			if(dr == 1'b1)
				VGA_COLOR = {12'h000}; //COLOR DE LAS LETRAS H555
			else if (in_sq == 1'b1)
				VGA_COLOR = {12'hFFF}; // COLOR DE FONDO DE LAS LETRAS HFFF
			else if((hc_visible > CUADRILLA_XI) && (hc_visible <= CUADRILLA_XF) && (vc_visible > CUADRILLA_YI) && (vc_visible <= CUADRILLA_YF))
				if(lines)
					VGA_COLOR = {12'h000}; // COLOR DE LAS LINEAS DEL TEMPLATE H000
			    else if (dr0 == 1'b1 || dr1 ==1'b1 || dr2==1'b1 || dr3==1'b1 ||dr4==1'b1 || dr5==1'b1 || dr6==1'b1 || dr7==1'b1 || dr8==1'b1 || dr9==1'b1)
			         VGA_COLOR = 12'h000;
			    else if (dra == 1'b1 || drb==1'b1 || drc==1'b1 || drd==1'b1 || dre==1'b1 || drf==1'b1)
			         VGA_COLOR= 12'h000;
			    else if(dr_suma==1'b1 || dr_resta == 1'b1 || dr_mult==1'b1 || dr_and == 1'b1 || dr_or==1'b1 || dr_space ==1'b1)
			         VGA_COLOR = 12'h000;
			    else if (dr_EXE==1'b1 || dr_CE==1'b1 )
			         VGA_COLOR = 12'h000;
			    else if((pos_x && in_sq_space)&& (pos_y && in_sq_space))
			         VGA_COLOR = 12'hF00;
			    else if ((pos_x && in_sq4)&& (pos_y && in_sq4))
			         VGA_COLOR = 12'hF0F;
				else
					VGA_COLOR = {3'h7, {2'b0, matrix_x} + {3'b00, matrix_y}, 4'h3};
		    else if ((hc_visible > CUADRILLA_XI2) && (hc_visible <= CUADRILLA_XF2) && (vc_visible > CUADRILLA_YI2) && (vc_visible <= CUADRILLA_YF2))
			     if (lines_resultado)
			         VGA_COLOR = {12'h000};
			     else   
			         VGA_COLOR = {12'hFFF};
			else if (hc_visible > CUADRILLA_XF2 && vc_visible <= CUADRILLA_YF2 && hc_visible <= CUADRILLA_YF3 && vc_visible >= CUADRILLA_YI2)
                 if ( dr_hex == 1'b1 || dr_dec == 1'b1)
                      VGA_COLOR = 12'h000;
                 else
                      VGA_COLOR = 12'hFFF; 
			else
				VGA_COLOR = {12'hFFF}; // COLOR DE FONDO DE LA PANTALLA H00F
		end
		else
			VGA_COLOR = {12'd0};

	assign {VGA_R, VGA_G, VGA_B} = VGA_COLOR;
	
endmodule
