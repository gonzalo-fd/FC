/*-----------------------------------------------------------------
**
**  Fichero:
**    pract2a.asm  10/6/2014
**
**    Fundamentos de Computadores
**    Dpto. de Arquitectura de Computadores y Autom�tica
**    Facultad de Inform�tica. Universidad Complutense de Madrid
**
**  Prop�sito:
**    Busca el valor m�ximo de un vector de enteros positivos
**
**  Notas de dise�o:
**
**---------------------------------------------------------------*/
/*#define N 8
int A[N]={7,3,25,4,75,2,1,1};
int max;
max=0;
for(i=0; i<N; i++){
if(A[i]>max)
max=A[i];
}
*/




.global start

.EQU 	N, 8

.data
A: 		.word 7,3,25,4,75,2,1,1

.bss
max: 	.space 4

.text
start:
		mov r0, #0 @max
		ldr r4, =max
		str r0, [r4]
		ldr r1,=A		@ Leo la dir. de A
		mov r2, #0 @i
for:    cmp r2, #N
		bge fin_for
		ldr r3,[r1,r2,lsl#2]
		add r2, r2, #1
		cmp r3, r0
if:     ble for
		mov r0, r3
		str r0, [r4]
		b for
fin_for:	b .
.end









