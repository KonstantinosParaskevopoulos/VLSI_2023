#include<iostream>
#include<fstream>
#include<math.h>
#define FILE_SIZE 16

using namespace std;

struct alu{
	int A;
	int B;
	int Y;
	int OpCode;
	int Status;	
};

void ReadValuesfromFile(ifstream &fin, struct alu ALUArray[]){
	int i=0;
	if (fin.good()){
	
	while(fin >> ALUArray[i].A >> ALUArray[i].B >> ALUArray[i].Y >> ALUArray[i].OpCode >> ALUArray[i].Status){
		//cout <<"Date: "<< StocksArray[i].Date <<" Open: "<< StocksArray[i].Open <<" High: "<< StocksArray[i].High <<" Low: "<< StocksArray[i].Low <<" Close: "<< StocksArray[i].Close <<" Volume: "<< StocksArray[i].Volume <<" OpenInt: "<< StocksArray[i].OpenInt<<endl;
		//emfanish sto terminal olwn twn periexomenwn tou kathe pinaka
		//cout << "A: "<< ALUArray[i].A <<"\tB: "<< ALUArray[i].B <<"\tY: "<< ALUArray[i].Y <<"\tOpCode: "<< ALUArray[i].OpCode <<"\tStatus: "<< ALUArray[i].Status <<endl;
		
		
		switch(ALUArray[i].OpCode) {
  		case 0:    	
		if(ALUArray[i].Y==ALUArray[i].A-ALUArray[i].B){
			cout<<"Success Opcode: "<<ALUArray[i].OpCode<<endl;
		}
		else{
			cout<<"Error for Opcode: "<<ALUArray[i].OpCode<<endl;
		}
		break;
		
		case 1:    	
		if(ALUArray[i].Y==ALUArray[i].A+ALUArray[i].B){
			cout<<"Success Opcode: "<<ALUArray[i].OpCode<<endl;
		}
		else{
			cout<<"Error for Opcode: "<<ALUArray[i].OpCode<<endl;
		}
		break;
		
		case 2:    	
		if(ALUArray[i].Y==ALUArray[i].A-1){
			cout<<"Success Opcode: "<<ALUArray[i].OpCode<<endl;
		}
		else{
			cout<<"Error for Opcode: "<<ALUArray[i].OpCode<<endl;
		}
		break;
		
		case 3:    	
		if(ALUArray[i].Y==ALUArray[i].A+1){
			cout<<"Success Opcode: "<<ALUArray[i].OpCode<<endl;
		}
		else{
			cout<<"Error for Opcode: "<<ALUArray[i].OpCode<<endl;
		}
		break;
		
		case 4:    	
		if(ALUArray[i].Y==abs(ALUArray[i].A)){
			cout<<"Success Opcode: "<<ALUArray[i].OpCode<<endl;
		}
		else{
			cout<<"Error for Opcode: "<<ALUArray[i].OpCode<<endl;
		}
		break;
		
		case 5:    	
		if(ALUArray[i].Y==~ALUArray[i].A){
			cout<<"Success Opcode: "<<ALUArray[i].OpCode<<endl;
		}
		else{
			cout<<"Error for Opcode: "<<ALUArray[i].OpCode<<endl;
		}
		break;
		
		case 6:    	
		if(ALUArray[i].Y==ALUArray[i].A&ALUArray[i].B){
			cout<<"Success Opcode: "<<ALUArray[i].OpCode<<endl;
		}
		else{
			cout<<"Error for Opcode: "<<ALUArray[i].OpCode<<endl;
		}
		break;
		
		case 7:    	
		if(ALUArray[i].Y==ALUArray[i].A|ALUArray[i].B){
			cout<<"Success Opcode: "<<ALUArray[i].OpCode<<endl;
		}
		else{
			cout<<"Error for Opcode: "<<ALUArray[i].OpCode<<endl;
		}
		break;
		
		case 8:    	
		if(ALUArray[i].Y==ALUArray[i].A^ALUArray[i].B){
			cout<<"Success Opcode: "<<ALUArray[i].OpCode<<endl;
		}
		else{
			cout<<"Error for Opcode: "<<ALUArray[i].OpCode<<endl;
		}
		break;
		
		case 9:    	
			cout<<"Success Opcode: "<<ALUArray[i].OpCode<<endl;
		
		break;
		
		case 10:    
		
			cout<<"Success Opcode: "<<ALUArray[i].OpCode<<endl;
		
		break;
		
		case 11:    
		if(ALUArray[i].Y==(ALUArray[i].A >> ALUArray[i].B)){
			cout<<"Success Opcode: "<<ALUArray[i].OpCode<<endl;
		}
		else{
			cout<<"Error for Opcode: "<<ALUArray[i].OpCode<<endl;
		}
		break;
		
		case 12:    
			cout<<"Success Opcode: "<<ALUArray[i].OpCode<<endl;
		
		break;
		
		case 13:    
		
			cout<<"Success Opcode: "<<ALUArray[i].OpCode<<endl;
	
		break;
		
		case 14:    
		if(ALUArray[i].Y==0){
			cout<<"Success Opcode: "<<ALUArray[i].OpCode<<endl;
		}
		else{
			cout<<"Error for Opcode: "<<ALUArray[i].OpCode<<endl;
		}
		break;
		
		case 15:    
		if(ALUArray[i].Y==1){
			cout<<"Success Opcode: "<<ALUArray[i].OpCode<<endl;
		}
		else{
			cout<<"Error for Opcode: "<<ALUArray[i].OpCode<<endl;
		}
		break;
		
i++;
  		
}
		
		}
		
		//cout<<"\n\nLast input: "<<i;   
		//Ean thelete na deite to megethos twn pinakwn vgalte apo ta sxolia thn grammh kwdika apo panw
		
	fin.close();
	}
	else{
		cout<<"File Corrupted or doesn't Exist!"<<endl;
	}
}

int main()
{
    ifstream infile("ALU_simple.txt");
	struct alu ALU[FILE_SIZE];
    ReadValuesfromFile(infile, ALU);
	int n = sizeof(ALU) / sizeof(ALU[0]);
	
	
	
    return 0;
}
