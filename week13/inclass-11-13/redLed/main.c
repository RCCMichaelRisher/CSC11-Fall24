#include <wiringPi.h> //the gpio library

#define PIN_LED 21 //defined constant

#define INPUT 0
#define OUTPUT 1

int main(){
	wiringPiSetupGpio(); //get the gpio ready to use

	//set the pins to in/output
	pinMode( PIN_LED, OUTPUT ); //since its an led we want to set it to output

	int on = 0;

	while( 1 ){
		if( on ){ 
			//write the pin 21 to a high state
			digitalWrite( PIN_LED, HIGH );  //high was included from wiringPi.h
			on = 0;
		} else {
			//turn off the 21st pin on the gpio which turn off the led
			digitalWrite( PIN_LED, LOW );
			on = 1;
		}

		delay( 250 ); //delay in miliseconds

	}


	return 0;
}