.global main

.extern wiringPiSetupGpio
.extern pinMode
.extern digitalRead
.extern delay
.extern digitalWrite

.section .rodata
out: .asciz "color: %d\n"


.equ PIN_R, 5
.equ PIN_G, 6
.equ PIN_B, 21
.equ PIN_BUTTON, 12
.equ OUTPUT, 1
.equ INPUT, 0
.equ HIGH, 1
.equ LOW, 0

.text
main:
	push {lr}
	bl wiringPiSetupGpio					@ wiringPiSetupGpio();

	//set the pin modes
	mov r0, #PIN_R
	mov r1, #OUTPUT
	bl pinMode								@ pinMode( PIN_R, OUTPUT );

	mov r0, #PIN_G
	mov r1, #OUTPUT
	bl pinMode								@ pinMode( PIN_G, OUTPUT);

	mov r0, #PIN_B
	mov r1, #OUTPUT
	bl pinMode								@ pinMode( PIN_B, OUTPUT);

	mov r0, #PIN_BUTTON
	mov r1, #INPUT
	bl pinMode								@ pinMode( PIN_BUTTON, INPUT);

	mov r5, #0 								@ bool on = false;
	mov r4, #0 								@ int color = 0b000; //all off to begin with

while: @ while( 1 ){
	//no cmp because infinite
	mov r0, #PIN_BUTTON
	bl digitalRead 						//returned into r0
	cmp r0, #HIGH 						@ if( digitalRead( PIN_BUTTON ) == HIGH ) { //if my button is being pressed do on = true
	movne r5, #1  						@ on = true;
	moveq r5, #0						@ on = false;

	cmp r5, #0
	beq skip 							@ if( on ){

@ //if on lets the colors
		mov r0, r4			@ //set the color with that binary value
		bl rbg							@ rbg( color );
		@ printf( "color: %d\n", color );
		@ //this just loops my number from 0 to 7 over and over
		add r4, r4, #1
		and r4, r4, #0b111 				@ color = (color + 1) & 0b111;
@ }
	skip:
	mov r0, #1000
	bl delay 							@ delay( 1000 );
	bal while
endWhile: 									@ }
@ return 0;
	mov r0, #0
	pop {pc}

rbg:
	push {lr}
	mov r4, r0
	bl clear 							@ clear();
	@ // 100 red is on
	@ // 010 green on
	@ // 001 blue on
	@ //so when we and with the red on state we either a 0 or nonzero value
	@ // where 0 would be false and anything else is true
	
	
	tst r4, #0b100
	movne r0, #PIN_R
	movne r1, #HIGH
	bl digitalWrite					@ if( n & 0b100 ) digitalWrite( PIN_R, HIGH );

	tst r4, #0b010
	movne r0, #PIN_G
	movne r1, #HIGH
	bl digitalWrite					@ if( n & 0b010 ) digitalWrite( PIN_G, HIGH );

	tst r4, #0b001
	movne r0, #PIN_B
	movne r1, #HIGH
	bl digitalWrite					@ if( n & 0b001 ) digitalWrite( PIN_B, HIGH );
@ return;
	pop {pc}


clear:
	push {lr}
	mov r0, #PIN_R
	mov r1, #LOW
	bl digitalWrite 	@ digitalWrite( PIN_R, LOW );
	mov r0, #PIN_G
	mov r1, #LOW
	bl digitalWrite 	@ digitalWrite( PIN_G, LOW );
	mov r0, #PIN_B
	mov r1, #LOW
	bl digitalWrite 	@ digitalWrite( PIN_B, LOW );
	pop {pc}