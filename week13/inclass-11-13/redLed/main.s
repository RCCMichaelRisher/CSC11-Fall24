.global main

//external function calls
.extern wiringPiSetupGpio
.extern pinMode
.extern digitalWrite
.extern delay

//defined constants
//.equ == #define
.equ PIN_LED, 21 //defined constant
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

	mov r4, #0				@ int on = 0;

loop: 						@ while( 1 ){
	@ cmp r3, #123 //normally i would need this but since i am doing an infinite i can just put bal at the end
	cmp r4, #1 				@ if( on ){ 
	beq onTrue
	bne onFalse
	onTrue:
		@ //write the pin 21 to a high state
		mov r0, #PIN_LED
		mov r1, #HIGH
		bl digitalWrite 	@ digitalWrite( PIN_LED, HIGH );  //high was included from wiringPi.h
		mov r4, #0 			@ on = 0;
		b afterIf
	onFalse:   				@ } else {
		@ //turn off the 21st pin on the gpio which turn off the led
		mov r0, #PIN_LED
		mov r1, #LOW
		bl digitalWrite 	@ digitalWrite( PIN_LED, LOW );
		mov r4, #1 			@ on = 1;
		b afterIf
	@ }
	afterIf:
		mov r0, #250 		//load the value 250 for the delay
		bl delay 			@ delay( 250 ); //delay in miliseconds
	bal loop
@ }


	mov r0, #0 		@ return 0;
	pop {pc} 		@ }