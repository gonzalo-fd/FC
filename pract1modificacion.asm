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
//MODIFICACION PRACTICA 1B
.global start

.data
A: .word 5
B: .word 0
C: .word 0

.text
start:
LDR R4, =A
LDR R5, =B
LDR R6, =C
LDR R1, [R4] @ A
LDR R2, [R5] @ B
LDR R3, [R6] @ C

divisor_neg: cmp R1, #0
blt fin_negativo
dividendo_neg_0: cmp R2,#0
ble fin_negativo
for: cmp R1, R2
blt fin_for

SUB R1, R1, R2
ADD R3, R3, #1
b for
fin_for:
STR R3, [R6]
fin_negativo:
mov R3, #-1
STR R3, [R6]
b .
.end
