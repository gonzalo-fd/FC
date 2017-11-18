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
HE COMENTADO LA PARTE DE CASA Y HE HECHO AMBAS MODIFICACIONES JUNTAS
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
/*
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
*/
/*
#define N 10

int A[N]={25,-3,25,4,75,2,1,0,7,-13};

int B[N/2];

int C[N/2];

int max, ind;

for(j=N/2; j>0; j--){

    max=0;

    for(i=0; i<N; i=i+2){

        if(A[i]>max){

            max=A[i];

            ind=i;

        }

    }

    B[j-1]=A[ind];

    A[ind]=0;

}

}
*/
.EQU 	N, 10
.EQU	M, N/2
.global start

.data
A: 		.word 25,-3,25,4,75,2,1,0,7,-13
.bss
B: 		.space M*4
C:		.space M*4
max: 	.space 4
ind: 	.space 4

.text
start:

		mov r0, #0
		ldr r1, =max
		str r0, [r1] @ 0 en max
		str r0, [r1, #+4]@ indice
		ldr r3, =A
		ldr r12, =C
		mov r4, #M @ J
		ldr r8, =B

for1: 	cmp r4, #0
		ble fin_for1
		str r0, [r1] @ 0 en max
		mov r2, #0
		mov r11, #1

for2:	cmp r2, #N
		bge fin_for2

if:		ldr r5,[r3,r2,lsl#2]	@elemento i del vector a, A[i]
		ldr	r6, [r1] 			@MAX
		cmp r5, r6
		ble fin_if
		mov r6, r5
		str r6, [r1]  @max
		str r2, [r1, #+4]

fin_if: add r2, r2, #2 @i+2
			b for2

for3: 	cmp r11, #N
		bge fin_for3

if2:	ldr r5,[r3,r11,lsl#2]
		cmp r5, #0
		bge fin_if2
		sub r5, r0, r5

fin_if2: str r5 ,[r12,r6,lsl#2]
		add r11, r11, #2
		add r6, r6, #1
		b for3

fin_for2:
		ldr r7, [r1,#+4] @indice
		ldr r5, [r3, r7, lsl#2] @ en r5 guardas lo que indica el indice(max)
		sub r9, r4, #1			@j-1
		str r5, [r8,r9,lsl#2]	@ guardas el maximo en el array B[j-1]
		str r0, [r3,r7,lsl#2]	@ borras el maximo del array A
		sub r4, r4, #1		@J--
		mov r6, #0
	    b for3

fin_for3: b for1

fin_for1: b .
.end





