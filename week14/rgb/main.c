#include <stdio.h>
#include <wiringPi.h>
#include <stdbool.h>

#define PIN_R 5
#define PIN_G 6
#define PIN_B 21
#define PIN_BUTTON 12



int main(){
	wiringPiSetupGpio();

	//set the pin modes
	pinMode( PIN_R, OUTPUT );
	pinMode( PIN_G, OUTPUT);
	pinMode( PIN_B, OUTPUT);
	pinMode( PIN_BUTTON, INPUT);


	bool on = false;
	int color = 0b000; //all off to begin with

	while( 1 ){
		//inifite loop

		if( digitalRead( PIN_BUTTON ) == HIGH ) { //if my button is being pressed do on = true
			on = true;
		} else {
			on = false;
		}

		//if on lets the colors
		if( on ){
			//set the color with that binary value
			rbg( color );
			printf( "color: %d\n", color );
			//this just loops my number from 0 to 7 over and over
			color = (color + 1) & 0b111;
		}

		delay( 1000 );
	}

	return 0;
}
//turns everything off so you write the voltages
void clear(){
	digitalWrite( PIN_R, LOW );
	digitalWrite( PIN_G, LOW );
	digitalWrite( PIN_B, LOW );
	return;
}

void rbg( int n ){
	clear();
	// 100 red is on
	// 010 green on
	// 001 blue on
	//so when we and with the red on state we either a 0 or nonzero value
	// where 0 would be false and anything else is true
	if( n & 0b100 ) digitalWrite( PIN_R, HIGH );
	if( n & 0b010 ) digitalWrite( PIN_G, HIGH );
	if( n & 0b001 ) digitalWrite( PIN_B, HIGH );
	return;
}
