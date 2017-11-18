/*-----------------------------------------------------------------
**
**  Fichero:
**    pract1b.asm  10/6/2014
**
**    Fundamentos de Computadores
**    Dpto. de Arquitectura de Computadores y Automática
**    Facultad de Informática. Universidad Complutense de Madrid
**
**  Propósito:
**    Divide 2 números mediante el algoritmo de restas parciales
**
**  Notas de diseño:
**
**---------------------------------------------------------------*/
/*
C = 0
while( A >= B ) {
A = A - B
C = C + 1
}
*/
.global start

.data
A: .word 12
B: .word 3
C: .word 0

.text
start:
LDR R4, =A
LDR R5, =B
LDR R6, =C
LDR R1, [R4] @ A
LDR R2, [R5] @ B
LDR R3, [R6] @ C

for: cmp R1, R2
blt fin_for

SUB R1, R1, R2
ADD R3, R3, #1
b for
fin_for:
STR R3, [R6]
b .
.end
