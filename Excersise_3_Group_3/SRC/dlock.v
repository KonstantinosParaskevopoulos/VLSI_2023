module dlock(
   input [3:0] SW16,
   input Reset,
   input Enter,
   input Open,
   input rstn,
   input clk,
   input lockcomp,
   output reg lock,
   output reg Error,
   output reg [1:0] counter,
   output reg [15:0] Full_Input
   );

   
   reg [2:0]   state;   //4 Καταστάσεις στο FSM άρα 2 Bit για την αναπαράσταση
   reg [2:0]   nextstate;

   parameter [2:0] IDLE=3'b000; //Αρχική κατάσταση-Κατάσταση Αδράνειας
   parameter [2:0] BUTTON_PRESSED_1=3'b001; //Κατάσταση στην οποία ο χρήστης έχει εισάγει 1 αριθμό
   parameter [2:0] BUTTON_PRESSED_2=3'b010; //Κατάσταση στην οποία ο χρήστης έχει εισάγει 2 αριθμούς
   parameter [2:0] BUTTON_PRESSED_3=3'b011; //Κατάσταση στην οποία ο χρήστης έχει εισάγει 3 αριθμούς
   parameter [2:0] BUTTON_PRESSED_4=3'b100; //Κατάσταση στην οποία ο χρήστης έχει εισάγει 4 αριθμούς
   parameter [2:0] UNLOCK_DOOR=3'b101; //Κατάσταση παραγωγής παλμού ξεκλειδώματος της Πόρτας
   parameter [2:0] DOOR_IS_OPEN=3'b110; //Κατάσταση στην οποία η πόρτα είναι ξεκλείδωτη
   parameter [2:0] ERROR_STATE=3'b111; //Κατάσταση Σφάλματος

   
   

   always @(posedge clk)
     begin
       if (Reset) //Ασυγχρονο σήμα Reset
         state=IDLE;
       else
         state=nextstate;
     end


   always @(*)
     begin
    case (state)        
            IDLE:	        begin
                            if (Enter==1'b1&&Open==1'b0&Reset==1'b0)			                                nextstate = BUTTON_PRESSED_1;                                                    
                            else                                                                                nextstate = IDLE;
            end
			BUTTON_PRESSED_1: begin
                            if (Enter==1'b1&&Open==1'b0&Reset==1'b0)			                                nextstate = BUTTON_PRESSED_2;                                                    
                            else                                                                                nextstate = BUTTON_PRESSED_1;
            end
            BUTTON_PRESSED_2: begin
                            if (Enter==1'b1&&Open==1'b0&Reset==1'b0)			                                nextstate = BUTTON_PRESSED_3;                                                    
                            else                                                                                nextstate = BUTTON_PRESSED_2;
            end
            BUTTON_PRESSED_3: begin
                            if (Enter==1'b1&&Open==1'b0&Reset==1'b0)			                                nextstate = BUTTON_PRESSED_4;                                                    
                            else                                                                                nextstate = BUTTON_PRESSED_3;
            end
            BUTTON_PRESSED_4: begin
                            if (Enter==1'b0&&Open==1'b0&Reset==1'b0&&lockcomp==1'b1)			                nextstate = UNLOCK_DOOR;                                                    
                            else if(Enter==1'b0&&Open==1'b0&&lockcomp==1'b0)                                    nextstate = ERROR_STATE;
            end
			ERROR_STATE:	begin
                            if (Reset==1'b1&&Open==1'b0)							                    nextstate = IDLE;
					                  else                                                                      nextstate = ERROR_STATE;
            end
			UNLOCK_DOOR:    begin
                            nextstate = DOOR_IS_OPEN;
            end
            DOOR_IS_OPEN:	begin
                            if (Reset==1'b1&&Open==1'b1)						                            nextstate = IDLE;
					                  else                                                                      nextstate = DOOR_IS_OPEN;
            end
			default:								                                                            nextstate = ERROR_STATE;

   
    endcase // case (state)
     end // always @ (state,next_state)


   always @(state)
 begin
   case (state)
      IDLE:	begin
            lock <= 1'b0;
            Error <= 1'b0;
            counter <= 2'b00;
            Full_Input <= 16'h0000;
            end
			BUTTON_PRESSED_1: 	begin
            lock <= 1'b0;
            Error <= 1'b0;
            counter <= 2'b00;
            Full_Input <= Full_Input|{SW16,12'b000000000000};
            end
            BUTTON_PRESSED_2: 	begin
            lock <= 1'b0;
            Error <= 1'b0;
            counter <= 2'b01;
            Full_Input <= Full_Input|{4'b0000,SW16,8'b00000000};
           end
            BUTTON_PRESSED_3: 	begin
            lock <= 1'b0;
            Error <= 1'b0;
            counter <= 2'b10;
            Full_Input <= Full_Input|{8'b00000000,SW16,4'b0000};
            end
            BUTTON_PRESSED_4: 	begin
            lock <= 1'b0;
            Error <= 1'b0;
            counter <= 2'b11;
            Full_Input <= Full_Input|{12'b000000000000,SW16};
            end
			ERROR_STATE:	begin
            lock <= 1'b0;
            Error <= 1'b1;
            counter <= 2'b00;
            Full_Input <= 16'h0000;    
            end
			UNLOCK_DOOR:    begin
            lock <= 1'b1;
            Error <= 1'b0;
            counter <= 2'b00;
            Full_Input <= 16'h0000;
            end
            DOOR_IS_OPEN:	begin
            lock <= 1'b0;
            Error <= 1'b0;
            counter <= 2'b00;
            Full_Input <= 16'h0000;
            end
			default:
            begin
            lock <= 1'b0;
            Error <= 1'b1;
            counter <= 2'b00;
            Full_Input <= 16'h0000;
            end
   endcase // case (state)
 end
 
endmodule
