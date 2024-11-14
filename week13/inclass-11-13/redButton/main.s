.global main

//external function calls
.extern wiringPiSetupGpio
.extern pinMode
.extern digitalWrite
.extern digitalRead
.extern delay

//defined constants
//.equ == #define
.equ PIN_LED, 17 //defined constant
.equ PIN_BUTTON, 18
.equ INPUT, 0
.equ OUTPUT, 1
.equ LOW, 0
.equ HIGH, 1

.text
main: 						@ int main(){
	push {lr}
	bl wiringPiSetupGpio	@ wiringPiSetupGpio(); //get the gpio ready to use

	//set the pins to in/output
	mov r0, #PIN_LED //loads the constant 21 into r0
	mov r1, #OUTPUT 	//loads the constant 1 into r1
	bl pinMode 				@ pinMode( PIN_LED, OUTPUT ); //since its an led we want to set it to output

	//set the input for the button
	//set the pins to in/output
	mov r0, #PIN_BUTTON //loads the constant 21 into r0
	mov r1, #INPUT 	//loads the constant 1 into r1
	bl pinMode 				@ pinMode( PIN_LED, OUTPUT ); //since its an led we want to set it to output

loop: 						@ while( 1 ){
	//get the button value first
	mov r0, #PIN_BUTTON
	bl digitalRead			@ digitalRead( PIN_BUTTON ) //returns an int r0
	cmp r0, #HIGH
	beq onTrue
	bne onFalse
	onTrue:
		@ //write the pin 21 to a high state
		mov r0, #PIN_LED
		mov r1, #HIGH
		bl digitalWrite 	@ digitalWrite( PIN_LED, HIGH );  //high was included from wiringPi.h
		b afterIf
	onFalse:   				@ } else {
		@ //turn off the 21st pin on the gpio which turn off the led
		mov r0, #PIN_LED
		mov r1, #LOW
		bl digitalWrite 	@ digitalWrite( PIN_LED, LOW );
		b afterIf
	@ }
	afterIf:
		mov r0, #10 		//load the value 10 for the delay
		bl delay 			@ delay( 10 ); //delay in miliseconds
	bal loop
@ }


	mov r0, #0 		@ return 0;
	pop {pc} 		@ }