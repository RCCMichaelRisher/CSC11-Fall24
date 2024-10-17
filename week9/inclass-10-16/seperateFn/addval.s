.global addval

.func addval

/*
ASSUMPTIONS
1. fns should not make assumptions about the contents cspr
2. fns can free modify register r0, r1, r2, r3
3. fns cannot assume anything about the contents of r0, r1, r2, r3
4. fns can free modify the lr register but the value upon entering will be needed when leaving the function
5. fns can modifiy all the remaining register as long as their values are restored, includes the sp, r4-r11
 */

.text
addval: //int addval( int num1, int num2 );
// r0, r1, r2, r3 we have been using as parameters into the function
	push {lr}
	add	r0, r0, r1		// return num1 + num2;
	pop {pc}

//return value is r0

//compile the source to an object
//as -o addval.o addval.s
