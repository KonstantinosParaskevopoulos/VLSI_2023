`timescale 1ns/1ns   // set timescale

module my_vending_tb;
    // Inputs
    reg C5;
    reg C10;
    reg NFC;
    reg [4:0] WATER;
    reg BEANS;
    reg clk;
    reg rst;

    // Outputs
    wire COFFEE;
    wire ERROR;

    // αρχικοποιηση (UUT)
    vmcoffee uut (
        .C5(C5),
        .C10(C10),
        .NFC(NFC),
        .WATER(WATER),
        .BEANS(BEANS),
        .clk(clk),
        .rst(rst),
        .COFFEE(COFFEE),
        .ERROR(ERROR)
    );

    // Initialize inputs
    initial begin
        C5 = 0;
        C10 = 0;
        NFC = 0;
        WATER = 0;
        BEANS = 0;
        clk = 0;
        rst = 1;
        //  περιμενε 10 στιγμες για να σταματηεσι το reset
        #10 rst = 0;
    end

    // Toggle the clock
    always #5 clk = ~clk;
    // Stimulus
    initial begin
        // Test case 1: ζηταει καφε χωρις να εχει αρκετο νερο η μηχανη
        
        WATER <= 4'b0000;
        BEANS <= 1;
        #10 C10 <= 1;
        #8 C10 <= 0;
        while(COFFEE==1'b0||ERROR==1'b0)
        begin
            $monitor("Wait COFFEE: %b, Error: %b\n", COFFEE, ERROR);
        end
        $monitor("Done COFFEE: %b, Error: %b\n", COFFEE, ERROR);
        $finish;
/*
        // Test case 2:  ζηταει καφε χωρις να εχει αρκετους κοκκους καφε η μηχανη
        rst = 1;
        //  περιμενε 10 στιγμες για να σταματηεσι το reset
        #10 rst <= 0;
        #10 WATER <= 3'b101;
        #10 C5 <= 1;
        #10 C5 <= 0;
        #10 C10 <= 1;
        #10 C10 <= 0;
        #10 NFC <= 0;
        #10 BEANS <= 0;
        #10 C5 <= 1;
        #10 C5 <= 0;
        #10 C10 <= 0;
        #10 WATER <= 0;
        #10 BEANS <= 0;

        // Test case 3:  ζηταει καφε με ακριβες ποσό 5+5
        rst <= 1;
        //  περιμενε 10 στιγμες για να σταματησει το reset
        #10 rst <= 0;
        #10 WATER <= 3'b101;
            C5 <= 1;
        #10 C5 <= 0;
        #10 BEANS <= 1;
        #10 C5 <= 0;
        #10 C10 <= 1;
        #10 C10 <= 0;
        #10 WATER <= 0;
        #10 BEANS <= 0;

        */
    end
endmodule
