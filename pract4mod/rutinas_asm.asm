/*-----------------------------------------------------------------
**
**  Fichero:
**    rutinas_asm.asm  10/6/2014
**
**    Fundamentos de Computadores
**    Dpto. de Arquitectura de Computadores y Automática
**    Facultad de Informática. Universidad Complutense de Madrid
**
**
**
**  Notas de diseño:
**
**---------------------------------------------------------------*/

.global contarUnos
.extern masmas

.text

/*
void contarUnos(unsigned char mat[N][M], int vector[N], int nfilas, int ncols) {
    int i,j;

    for (i=0;i<ncols;i++) {
        vector[i]=0;
        for (j=0; j<nfilas; j++) {
            if ( mat[i][j] == 1) vector[i]++;
        }
    }
}

*/

contarUnos:
  		push {r4, r5, r6, r7, r8, lr}

	mov r4, #0 @i

	for1: cmp r4, r3
		bge fin
		mov r6, #0
		str r6, [r1, r4, lsl#2]
		mov r5, #0 @j

	for2: cmp r5, r2
		  bge fin_for
		  mul r7, r4, r2 @i*ncols
		  add r7, r7, r5 @i*ncols+j
		  ldrb r8, [r0, +r7]
	if:   cmp r8, #1
		  bne fin_for2
		 push {r0, r1, r2, r3}
		  mov r0, r1
		  mov r1, r4
		  bl masmas
		  pop {r0, r1, r2, r3}
		  b fin_for2

	fin_for:   add r4, r4, #1
			  b for1
	fin_for2: add r5, r5, #1
			  b for2
fin:
pop {r4, r5, r6, r7, r8, lr}
mov pc, lr
  		//bx lr

