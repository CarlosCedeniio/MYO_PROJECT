// Copyright (C) 2013-2014 Thalmic Labs Inc.
// Distributed under the Myo SDK license agreement. See LICENSE.txt for details.

// This sample illustrates how to use EMG data. EMG streaming is only supported for one Myo at a time.

#include <array>
#include <iostream>
#include <sstream>
#include <stdexcept>
#include <string>

#include <myo/myo.hpp>
#include <string>

#include <stdio.h>
#include <stdlib.h>ll

#include "SerialPort.h"


class DataCollector : public myo::DeviceListener {
public:
    DataCollector()
    : emgSamples()
    {
    }

    // onUnpair() is called whenever the Myo is disconnected from Myo Connect by the user.
    void onUnpair(myo::Myo* myo, uint64_t timestamp)
    {
        // We've lost a Myo.
        // Let's clean up some leftover state.
        emgSamples.fill(0);
    }

    // onEmgData() is called whenever a paired Myo has provided new EMG data, and EMG streaming is enabled.
    void onEmgData(myo::Myo* myo, uint64_t timestamp, const int8_t* emg)
    {
        for (int i = 0; i < 8; i++) {
            emgSamples[i] = emg[i];
        }
    }

    // There are other virtual functions in DeviceListener that we could override here, like onAccelerometerData().
    // For this example, the functions overridden above are sufficient.

    // We define this function to print the current values that were updated by the on...() functions above.
    void print(int *count, int c, float *emg1, float *emg2, float *emg3, float *emg4, float *emg5, float *emg6, float *emg7, float *emg8,SerialPort *arduino)
    {
        // Clear the current line
        std::cout << '\r';
		//int  emg3=0, emg4, emg5, emg6, emg7, emg8;

        // Print out the EMG data.
		int t = 0;
        for (size_t i = 0; i < emgSamples.size(); i++) {
            std::ostringstream oss;
            oss << static_cast<float>(emgSamples[i]);
            std::string emgString = oss.str();
			//std::cout << emgSamples._Elems<<"\n";

           // std::cout << '[' << emgString << std::string(4 - emgString.size(), ' ') << ']';
			float temp = 0;
			temp = ((std::stof(emgString)) * (std::stof(emgString)));
			//std::cout << temp << " ";
			switch (t)
			{
			case 0 : 
				//std::cout << temp;
				*emg1 = *emg1 + temp;
				break;
				
			case 1:
				//std::cout << temp;
				*emg2 = *emg2 + temp;
				break;
				//std::cout << temp;
			case 2:
				//std::cout << temp;
				*emg3 = *emg3 + temp;
				break;
				//std::cout << temp;
			case 3:
				//std::cout << temp;
				*emg4 = *emg4 + temp;
				break;
				//std::cout << temp;
			case 4:
				//std::cout << temp;
				*emg5 = *emg5 + temp ;
				break;
				//std::cout << temp;
			case 5:
				//std::cout << temp;
				*emg6 = *emg6 + temp; 
				break;
				//std::cout << temp;
			case 6:
				//std::cout << temp;
				*emg7 = *emg7 + temp ;
				break;
				//std::cout << temp;
			case 7:
				//std::cout << temp;
				*emg8 = *emg8 + temp ;
				break;
				//std::cout << temp;
			
			default:
				break;
			}
			t++;
			
        }
		//std::cout << "\n";
		
		//std::cout << "Al Fin"<< c << "  "<< *count<< "   " << "\n";
		
		if (*count == 300) {
			*emg1 = sqrt(*emg1/300);
			*emg2 = sqrt(*emg2/300);
			*emg3 = sqrt(*emg3/300);
			*emg4 = sqrt(*emg4/300);
			*emg5 = sqrt(*emg5/300);
			*emg6 = sqrt(*emg6/300);
			*emg7 = sqrt(*emg7/300);
			*emg8 = sqrt(*emg8/300);
			std::string  mensaje = "..";
			mensaje.append(std::to_string(*emg1));
			mensaje.append(",");
			mensaje.append(std::to_string(*emg2));
			mensaje.append(",");
			mensaje.append(std::to_string(*emg3));
			mensaje.append(",");
			mensaje.append(std::to_string(*emg4));
			mensaje.append(",");
			mensaje.append(std::to_string(*emg5));
			mensaje.append(",");
			mensaje.append(std::to_string(*emg6));
			mensaje.append(",");
			mensaje.append(std::to_string(*emg7));
			mensaje.append(",");
			mensaje.append(std::to_string(*emg8));
			mensaje.append(",                 ");
			mensaje.append("z");

			for (int x = 0; x < mensaje.size(); x++) {
				std::string c2 = mensaje.substr(x, 1);
				char *c_string2 = new char[1];
				std::copy(c2.begin(), c2.end(), c_string2);
				(*arduino).writeSerialPort(c_string2, 1);
				Sleep(1);
			}
			
			//std::cout << "3 seg \n\n\n\n\n";
			std::cout << *emg1 << ",";
			std::cout << *emg2 << ",";
			std::cout << *emg3 << ",";
			std::cout << *emg4 << ",";
			std::cout << *emg5 << ",";
			std::cout << *emg6 << ",";
			std::cout << *emg7 << ",";
			std::cout << *emg8 << ",";	
			std::cout <<  "\n";
			////////////////////////////////
			*emg1 = 0;
			*emg2 = 0;
			*emg3 = 0;
			*emg4 = 0;
			*emg5 = 0;
			*emg6 = 0;
			*emg7 = 0;
			*emg8 = 0;
			*count = 0;

		}
		
		*count = *count + 1;
        std::cout << std::flush;
    }

    // The values of this array is set by onEmgData() above.
    std::array<int8_t, 8> emgSamples;
};


/////////////////////////////
//String for getting the output from arduino
char output[MAX_DATA_LENGTH];

/*Portname must contain these backslashes, and remember to
replace the following com port 10*/
char *port_name = "\\\\.\\COM10"; 


//String for incoming data
//char incomingData[MAX_DATA_LENGTH];
/////////////////////////////

int main(int argc, char** argv)
{

	///////////////////////////////
	SerialPort arduino(port_name);
	if (arduino.isConnected()) std::cout << "Conexion con puerto OK" << std::endl;
	else std::cout << "Falla de COM";



	//std::string cadena = "\t";
	//char *c_string = new char[cadena.size()];
	//std::copy(cadena.begin(), cadena.end(), c_string);
	//for (int x = 0; x < 10; x++) {
	//	arduino.writeSerialPort( c_string, 1);
	//	Sleep(1);
	//}string 
	
	
	
	std::string cadena = "22,23,25,564234589734598734598734589349587349587345897345897345897345979837578678678678678678678678374598z";
	//std::string cadena = "24,28,27,69z";
	
	for (int x = 0; x < cadena.size(); x++) {
		std::string c = cadena.substr(x, 1);
		char *c_string = new char[1];
		std::copy(c.begin(), c.end(), c_string);
		arduino.writeSerialPort(c_string, 1);
		Sleep(1);
	}
	

	//std::string cadena = "22,23,25,564234589734598734598734589349587349587345897345897345897345979837578678678678678678678678374598z";
	Sleep(10);
	/*while (1) {
		std::string cadena2 = "..24,28,27,69z\n";

		for (int x = 0; x < cadena2.size(); x++) {
			std::string c2 = cadena2.substr(x, 1);
			char *c_string2 = new char[1];
			std::copy(c2.begin(), c2.end(), c_string2);
			arduino.writeSerialPort(c_string2, 1);
			Sleep(1);
		}

	}*/
	
	
	
	//////////////////////////////




    // We catch any exceptions that might occur below -- see the catch statement for more details.
    try {

    // First, we create a Hub with our application identifier. Be sure not to use the com.example namespace when
    // publishing your application. The Hub provides access to one or more Myos.
    myo::Hub hub("com.example.emg-data-sample");

    std::cout << "Attempting to find a Myo..." << std::endl;

    // Next, we attempt to find a Myo to use. If a Myo is already paired in Myo Connect, this will return that Myo
    // immediately.
    // waitForMyo() takes a timeout value in milliseconds. In this case we will try to find a Myo for 10 seconds, and
    // if that fails, the function will return a null pointer.
    myo::Myo* myo = hub.waitForMyo(10000);

    // If waitForMyo() returned a null pointer, we failed to find a Myo, so exit with an error message.
    if (!myo) {
        throw std::runtime_error("Unable to find a Myo!");
    }

    // We've found a Myo.
    std::cout << "Connected to a Myo armband!" << std::endl << std::endl;

    // Next we enable EMG streaming on the found Myo.
    myo->setStreamEmg(myo::Myo::streamEmgEnabled);

    // Next we construct an instance of our DeviceListener, so that we can register it with the Hub.
    DataCollector collector;

    // Hub::addListener() takes the address of any object whose class inherits from DeviceListener, and will cause
    // Hub::run() to send events to all registered device listeners.
    hub.addListener(&collector);

    // Finally we enter our main loop.
	int c = 0;
	int i = 0;
	int count = 1;
	float emg1 = 0, emg2 = 0, emg3 = 0, emg4 = 0, emg5 = 0, emg6 = 0, emg7 = 0, emg8 = 0;
	while (1) {
        // In each iteration of our main loop, we run the Myo event loop for a set number of milliseconds.
        // In this case, we wish to update our display 50 times a second, so we run for 1000/20 milliseconds.
        hub.run(5);
        // After processing events, we call the print() member function we defined above to print out the values we've
        // obtained from any events that have occurred.
		c++;
			
        collector.print(&count,c,&emg1,&emg2, &emg3, &emg4,&emg5,&emg6, &emg7, &emg8,&arduino);

    }

    // If a standard exception occurred, we print out its message and exit.
    } catch (const std::exception& e) {
        std::cerr << "Error: " << e.what() << std::endl;
        std::cerr << "Press enter to continue.";
        std::cin.ignore();
        return 1;
    }
}
