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
void contarUnos(int mat[], int vector[], int nfilas, int ncols) {
    int i,j;

    for (i=0;i<nfilas;i++) {
        vector[i]=0;
        for (j=0; j<ncols; j++) {
            if ( mat[i*ncols+j] == 1) vector[i]++;
        }
    }
}
*/
contarUnos:
  		push {r4, r5, r6, r7, r8, lr}

	mov r4, #0 @i

	for1: cmp r4, r2
		bge fin
		mov r6, #0
		str r6, [r1, r4, lsl#2]
		mov r5, #0 @j

	for2: cmp r5, r3
		  bge fin_for
		  mul r7, r4, r3 @i*ncols
		  add r7, r7, r5 @i*ncols+j
		  ldr r8, [r0, r7, lsl#2]
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


