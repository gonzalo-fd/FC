/*-----------------------------------------------------------------
**
**  Fichero:
**    pract2b.asm  10/6/2014
**
**    Fundamentos de Computadores
**    Dpto. de Arquitectura de Computadores y Automática
**    Facultad de Informática. Universidad Complutense de Madrid
**
**  Propósito:
**    Ordena de mayor a menor un vector de enteros positivos
**
**  Notas de diseño:
**
**---------------------------------------------------------------*/
/*
#define N 8
int A[N]={7,3,25,4,75,2,1,1};
int B[N];
int max, ind;
for(j=0; j<N; j++){
max=0;
for(i=0; i<N; i++){
if(A[i]>max){
max=A[i];
ind=i;
}
}
B[j]=A[ind];
A[ind]=0;
}
*/

.EQU 	N, 8

.global start

.data
A: 		.word 7,3,25,4,75,2,1,1

.bss
B: 		.space N*4
max: 	.space 4
ind: 	.space 4

.text
start:

		mov r0, #0
		ldr r1, =max
		str r0, [r1] @ 0 en max
		str r0, [r1, #+4]@ indice
		ldr r3, =A
		mov r4, #0 @ J

		ldr r8, =B

for1: 	cmp r4, #N
		bge fin_for1
		str r0, [r1] @ 0 en max
		mov r2, #0

for2:	cmp r2, #N
		bge fin_for2

if:		ldr r5,[r3,r2,lsl#2]	@elemento i del vector a, A[i]
		ldr	r6, [r1] 			@MAX
		cmp r5, r6
		ble fin_if
		mov r6, r5
		str r6, [r1]  @max
		str r2, [r1, #+4]

	fin_if: add r2, r2, #1 @i++
			b for2

fin_for2:
		ldr r7, [r1,#+4] @indice
		ldr r5, [r3, r7, lsl#2] @ en r5 guardas lo que indica el indice(max)
		str r5, [r8,r4,lsl#2]	@ guardas el maximo en el array B
		str r0, [r3,r7,lsl#2]	@ borras el maximo del array A
		add r4, r4, #1		@J++
	    b for1

fin_for1: b .
.end







