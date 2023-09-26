#include <iostream>
#include <fstream>
#include <math.h>
#define FILE_SIZE 100

using namespace std;

struct Artificial_Neuron{
	int activation_input[4];
	int weight[4];
	int bias;
	int res;
};

void ReadValuesfromFile(ifstream &fin, struct Artificial_Neuron ANArray[])
{
	int i = 0;
	
	if (fin.good())
    {
	
	while(fin >> ANArray[i].activation_input[0] >> ANArray[i].activation_input[1] >> ANArray[i].activation_input[2] >> ANArray[i].activation_input[3] >> ANArray[i].weight[0] >> ANArray[i].weight[1] >> ANArray[i].weight[2] >> ANArray[i].weight[3] >> ANArray[i].bias >> ANArray[i].res)
    {
    	int predicted = 0;
		//emfanish sto terminal olwn twn periexomenwn tou kathe pinaka
		//cout << "Activation: "<< ANArray[i].activation_input <<"\tWeight: "<< ANArray[i].weight <<"\tBias: "<< ANArray[i].bias <<"\tResult: "<< ANArray[i].res <<endl;
		
		for(int j = 0; j<=3; j++){
			predicted = predicted + (ANArray[i].activation_input[j]*ANArray[i].weight[j]);
		}
		predicted = predicted + ANArray[i].bias;
		
		if(predicted>0)
		{
			if(ANArray[i].res==predicted)
			{
				cout<<"Success for positive numbers Res: "<<ANArray[i].res<< "\tPredicted: "<<predicted<<" Iteration: "<< i+1<< " out of " <<FILE_SIZE<<endl;
			}
			else
			{
				cout<<"Failure for positive numbers Res: "<<ANArray[i].res<< "\tPredicted: "<<predicted<<" Iteration: "<< i+1<< " out of " <<FILE_SIZE<<endl;
			}
		}
		else
		{
			if(ANArray[i].res==0)
			{
				cout<<"Success for negative numbers Res: "<<ANArray[i].res<< "\tPredicted: "<<predicted<<" Iteration: "<< i+1<< " out of " <<FILE_SIZE<<endl;
			}
			else
			{
				cout<<"Failure for negative numbers Res: "<<ANArray[i].res<< "\tPredicted: "<<predicted<<" Iteration: "<< i+1<< " out of " <<FILE_SIZE<<endl;
			}
		}
		
i++;

		
    }
		//cout<<"\n\nLast input: "<<i;   
		//Ean thelete na deite to megethos twn pinakwn vgalte apo ta sxolia thn grammh kwdika apo panw
		
	fin.close();
	}
	else
	{
		cout<<"File Corrupted or doesn't Exist!"<<endl;
	}
}

int main()
{
    ifstream infile("Artificial_Neuron.txt");
	struct Artificial_Neuron Artificial_Neuron[FILE_SIZE];
    ReadValuesfromFile(infile, Artificial_Neuron);
	int n = sizeof(Artificial_Neuron) / sizeof(Artificial_Neuron[0]);
	
	
	
    return 0;
}
