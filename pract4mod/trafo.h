#ifndef _TRAFO_H
#define _TRAFO_H

#include "types.h"


void RGB2GrayMatrix(pixelRGB orig[], int dest[], int nfilas, int ncols);

void Gray2BinaryMatrix(int orig[], unsigned char dest[N][M], int nfilas, int ncols);

int rgb2gray(pixelRGB pixel);

//void contarUnos(unsigned char mat[N][M], int vector[N], int nfilas, int ncols);
void masmas(int vector[], int i);
#endif
