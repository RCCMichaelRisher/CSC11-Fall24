.global main
main:
	mov r0, #2
	mov r1, #22
	mov r2, #17
	
	stmdb sp!, {r0,r1,r2}	//store multiple descending before
	//because like pre-index we sub 4 before accessing the memory


	ldmia sp!, {r3,r4,r5} //load multiple increasing after 
	//because like post-index we add 4 after accessed the memory
	
