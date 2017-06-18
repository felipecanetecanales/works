`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2017 11:38:09
// Design Name: 
// Module Name: cursor
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


module cursor(
    input clock,
    input reset,
    input kd,kc,
    output reg [10:0]ubic_x,
    output reg [10:0]ubic_y
    );
    
    parameter posicion_x = 11'd739;
    parameter posicion_y = 11'd509;
    
    reg [10:0]pos_x,pos_y;
    reg [10:0]pos_x_next,pos_y_next;
    wire error_paridad, kbs_tot;
    wire [7:0]dato;
    wire[2:0]tipo_dato;
    reg [10:0]posicion_x_next,posicion_y_next;
    
    
    kbd_ms kbd_ms_ins_cursor(
        .clk(clock),
        .rst(reset),
        .kd(kd),
        .kc(kc),
        .new_data(dato),
        .data_type(tipo_dato),
        .kbs_tot(kbs_tot),
        .parity_error(error_paridad)
        );
    
    
    always@(*)begin
        /*if (dato==8'h1d) begin
            posicion_x_next=11'd239;
            posicion_y_next=11'd309;
            end
        else begin
            posicion_x_next = posicion_x;
            posicion_y_next = posicion_y;
            end
            //posicion_x_next = posicion_x;
            //posicion_y_next = posicion_y;*/
        if (pos_x == 11'd0 && pos_y == 11'd0)begin
            pos_x_next = posicion_x;
            pos_y_next = posicion_y;
            end
        else begin
            case (dato)
            8'h1d:  if((pos_y - 11'd100)>=11'd284)
                         pos_y_next = pos_y - 11'd100;
                    else
                         pos_y_next = pos_y;
            8'h1c:  if ((pos_x - 11'd100)>= 11'd212)
                        posicion_x_next = posicion_x - 11'd100;
                    else
                        pos_x_next = pos_x;
            8'h1b:  if ((pos_y + 11'd100)<=11'd584)
                        pos_y_next = pos_y + 11'd100;
                    else 
                        pos_y_next = pos_y;
            8'h23:  if ((pos_x + 11'd100)<=11'd812)
                        pos_x_next = pos_x + 11'd100; 
                    else
                        pos_x_next = pos_x;
            default: begin
                     pos_x_next = pos_x;
                     pos_y_next = pos_y;
                     end
        endcase
        end
        end
     
     always@(posedge clock or posedge reset)begin
        if (reset) begin
            pos_x <= 11'd739;
            pos_y <= 11'd509;
            end
        else begin
            pos_x <= pos_x_next;
            pos_y <= pos_y_next;
            end      
        end
      
      always@(posedge clock)begin
            ubic_x <= pos_x;
            ubic_y <= pos_y;
        end
        
        
            
        
endmodule
