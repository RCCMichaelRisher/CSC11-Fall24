.global main

.equ PIN_LED, 18
.equ PIN_BUTTON, 16
.equ OUTPUT, 0
.equ INPUT, 1
.equ HIGH, 1
.equ LOW, 0

.text
main:
	push {lr}
	bl wiringPiSetupGpio 			@ wiringPiSetupGpio();

	@ //set the pin modes
	mov r0, #PIN_LED
	mov r1, #OUTPUT
	bl pinMode	@ pinMode( PIN_LED, OUTPUT );
	
	mov r0, #PIN_BUTTON
	mov r1, #INPUT
	bl pinMode						@ pinMode( PIN_BUTTON, INPUT );

	mov r4, #0						@ int ledState = 0; //led state 0 is off and 1 is on
	mov r5, #0 						@ int prevBtnState = 0; //previous button state is off

loop: @ while( 1 ){
	mov r0, #PIN_BUTTON
	bl digitalRead					@ int currBtn = digitalRead( PIN_BUTTON );
	mov r6, r0						//move my read of button to r6 so i don't lose it

	cmp r6, #HIGH
	bne skip

	cmp r5, 0 						@ if( currBtn == HIGH && prevBtnState == 0 ){
	bne skip
	//not doing for time @ printf( "pressed \n" );

	eor r4, r4, #1					//exclusive or to toggle 0 and 1. 
									@ ledState = !ledState;  //flip the state from 0 to 1 and vice versa depending on the current value of ledState

	//write to led
	mov r0, #PIN_LED
	mov r1, r4
	bl digitalWrite 				@ digitalWrite( PIN_LED, ledState );  //write the current led state to the gpio =
@ }
skip:
	mov r0, #50						//50 ms as a param
	bl delay 						@ delay( 50 ); //delay 50 miliseconds

	b loop
@ }
	mov r0, #0
	pop {pc} 						@ return 0;
