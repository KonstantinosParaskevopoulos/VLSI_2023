module mac_tb;

  // ορισμος παραμετρων
  parameter iwidth = 4;
  parameter swidth = 10;  
  
  //ορισμος των εισόδων του κυκλωματος
  // και της εξοδου sum_o, που ειναι και εισοδος τύπου wire στο MAC
  
  reg clk; //ρολοι
  reg rstn; //reset σημα για τoν accumulator-καταχωρητη
  reg [iwidth-1:0] a_i;
  reg [iwidth-1:0] b_i;
	wire [swidth-1:0] sum_o;    
  
  // ορισμός του module mac προς τεσταρισμα
	mac #(.iwidth(iwidth), .swidth(swidth)) DUT (
    .clk(clk),
    .rstn(rstn),
    .a_i(a_i),
    .b_i(b_i),
    .sum_o(sum_o)
  );
	
	always #5 clk = ~clk; // καθε 5 χρονικες στιγμες γινεται αλλαζει ο παλμος του ρολογιου
    integer i,j;
    integer temp;
    initial begin //εναρξη τεσταρισματος
    clk = 0;
    rstn = 0; // ο καταχωρητης ειναι αρνητικης λογικης, αρα αυτη η τιμη 1 δεν τον γεμιζει με μηδενικα 
    a_i = 4'b0000; // αρχικα η εισοδος a_i παιρνει τιμη 0
    b_i = 4'b0000; // το ιδιο και η b_i
    #10 rstn = 1;
	/*  #10 rstn = 0; // τη στιγμη 10 ο καταχωρητης γεμιζει μηδενικα (παρολο που και ηδη ειχε μηδενικα γτ απ το mac βγηκε τιμη α*β=0000 μετα τον πρωτο παλμο του ρολογιου
    #20 rstn = 1; // ο καταχωρητης πλεον μπορει να παρει τιμες απο την εξοδο του mac, που θα ειναι το αποτελεσμα της προσθεσης α*β+dsum_reg
    
    // Test 1: πολλαπλασιασμός a*b = 1*2
    a_i = 4'b0001;
    b_i = 4'b0010;
    #50;
    $display("Test 1: a_i = %d, b_i = %d, sum_o = %d", a_i, b_i, sum_o);
		if (sum_o != 8'b0000100) $error("Test 1 apotyxia ara to mac de doyleyei swsta");// εαν το sum_reg δεν ειναι 4 τοτε λαθος
    
    // Test 2: πολλαπλασιασμος 2*3
    a_i = 4'b0010;
    b_i = 4'b0011;
    #50;
    $display("Test 2: a_i = %d, b_i = %d, sum_o = %d", a_i, b_i, sum_o);
    if (sum_o != 8'b00001100) $error("Test 2 apotyxia ara to mac de doyleyei swsta"); // εαν το sum_reg δεν ειναι 12 τοτε λαθος
    
    // Test 3: πολλαπλασιασμος 3*6
    a_i = 4'b0011;
    b_i = 4'b0110;
    #50;
    $display("Test 3: a_i = %d, b_i = %d, sum_o = %d", a_i, b_i, sum_o);
    if (sum_o != 8'b00010100) $error("Test 3 apotyxia ara to mac de doyleyei swsta"); // εαν το sum_reg δεν ειναι 3*6+18=36 τοτε λαθος

    //$display("ama de bghke sfalma test passed, tote ola ok");
    */
    
    for (i = 0; i < 16; i = i + 1) begin
        a_i = i;
      for (j = 0; j < 16; j = j + 1) begin
        b_i = j;
        temp = sum_o;
        #10 $display("a_i = %d, b_i = %d, sum_o = %d", a_i, b_i, sum_o);
        if(sum_o==a_i*b_i+temp)begin 
            $display("OK");
        end
      end
    end

    $finish;
    
  end
  
  
endmodule