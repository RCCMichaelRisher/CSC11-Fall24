#include <stdio.h>
#include <wiringPi.h>

#define PIN_LED 18
#define PIN_BUTTON 16

int main(){
	wiringPiSetupGpio();

	//set the pin modes
	pinMode( PIN_LED, OUTPUT );
	pinMode( PIN_BUTTON, INPUT );

	int ledState = 0; //led state 0 is off and 1 is on
	int prevBtnState = 0; //previous button state is off

	while( 1 ){
		int currBtn = digitalRead( PIN_BUTTON );

		if( currBtn == HIGH && prevBtnState == 0 ){
			printf( "pressed \n" );
			ledState = !ledState;  //flip the state from 0 to 1 and vice versa depending on the current value of ledState
			digitalWrite( PIN_LED, ledState );  //write the current led state to the gpio =
		}

		delay( 50 ); //delay 50 miliseconds
	}

	return 0;
}