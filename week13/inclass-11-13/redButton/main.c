#include <wiringPi.h> //the gpio library

#define PIN_LED 17 //defined constant
#define PIN_BUTTON 18

#define INPUT 0
#define OUTPUT 1

int main(){
	wiringPiSetupGpio(); //get the gpio ready to use

	//set the pins to in/output
	pinMode( PIN_LED, OUTPUT ); //since its an led we want to set it to output
	pinMode( PIN_BUTTON, INPUT ); //since its an button we want to set it to input


	while( 1 ){
		if( digitalRead( PIN_BUTTON ) == HIGH ){ //if im pushing the button the read will by high
			//write the pin 21 to a high state
			digitalWrite( PIN_LED, HIGH );  //high was included from wiringPi.h
		} else {
			//turn off the 21st pin on the gpio which turn off the led
			digitalWrite( PIN_LED, LOW );

		}

		delay( 250 ); //delay in miliseconds

	}


	return 0;
}