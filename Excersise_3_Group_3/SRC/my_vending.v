module vmcoffee(
   input C5,
   input C10,
   input NFC,
   input [4:0] WATER, //4-Bit Input [0-32]
   input BEANS,
   input clk,rst, //Προσθέσαμε επιπλέον κουμπί Reset για την περίπτωση που το κύκλωμα βρεθεί σε απρόβλεπτη κατάσταση 
   output reg COFFEE,
   output reg ERROR   
   );


   reg [1:0]   state;   //4 Καταστάσεις στο FSM άρα 2 Bit για την αναπαράσταση
   reg [1:0]   nextstate;

   parameter [1:0] IDLE=2'b00; //Αρχική κατάσταση-Κατάσταση Αδράνειας
   parameter [1:0] HALF_PRICE=2'b01; //Κατάσταση στην οποία ο χρήστης έχει εισάγει 5 cent και χρειάζονται άλλα 5
   parameter [1:0] MAKE_COFFEE=2'b10; //Κατάσταση στην οποία έχει εισαχθεί το αντίτιμο για τον καφέ και παράγεται ο παλμός για την προετοιμασία του καφέ
   parameter [1:0] ERROR_STATE=2'b11; //Κατάσταση σφάλματος στην οποία φτάνουμε αν υπάρχει έλλειψη υλικών// ή είναι ενεργοποιημένη παραπάνω από μια εισόδους εκ των C5, C10, NFC


   always @(posedge clk)
     begin
       if (rst)
         state=IDLE;
       else
         state=nextstate;
     end


   always @(state,C5,C10,NFC,WATER,BEANS)
     begin
    case (state)        
            IDLE:	        begin
                            if (C5==1'b1 && C10==1'b0 && NFC==1'b0 && WATER > 5'b00001 && BEANS != 0)		nextstate = HALF_PRICE;
                            else if (C5==1'b0 && C10==1'b1 && NFC==1'b0 && WATER > 5'b00001 && BEANS != 0)	nextstate = MAKE_COFFEE;
                            else if (C5==1'b0 && C10==1'b0 && NFC==1'b1 && WATER > 5'b00001 && BEANS != 0)	nextstate = MAKE_COFFEE;
					        else if (WATER == 5'b00000 || BEANS == 1'b0)                                    nextstate = ERROR_STATE;                                                                        
                            else							                                                nextstate = IDLE;
            end
			HALF_PRICE: 	begin
                            if (C5==1'b1 || C10==1'b1 || NFC==1'b0 && WATER > 5'b00001 && BEANS != 0)		nextstate = MAKE_COFFEE;
					        else							                                                nextstate = HALF_PRICE;
            end
			ERROR_STATE:	begin
                            if (WATER > 5'b00001 && BEANS != 1'b0)			                                nextstate = IDLE;
					        else                                                                            nextstate = ERROR_STATE;
            end
			MAKE_COFFEE:    begin
                            if (WATER == 5'b00000 || BEANS == 1'b0)                                         nextstate = ERROR_STATE;
                            else                                                                            nextstate = IDLE;
            end
			default:								                                                        nextstate = IDLE;

   
    endcase // case (state)
     end // always @ (state,next_state)


   always @(state)
 begin
   case (state)
      IDLE          : 
      begin 
        COFFEE <= 1'b0 ;
        ERROR <= 1'b0 ;
      end
      HALF_PRICE    : 
      begin 
        COFFEE <= 1'b0 ;
        ERROR <= 1'b0 ;
      end
      MAKE_COFFEE   : 
      begin 
        COFFEE <= 1'b1 ;
        ERROR <= 1'b0 ;
      end
      ERROR_STATE   : 
      begin 
        COFFEE <= 1'b0 ;
        ERROR <= 1'b1 ;
      end
    default: begin 
        COFFEE <= 1'b0 ;
        ERROR <= 1'b1 ;
      end
   endcase // case (state)
 end
 
endmodule