#ifndef _TRAFO_H
#define _TRAFO_H

#include "types.h"


void RGB2GrayMatrix(pixelRGB orig[], int dest[], int nfilas, int ncols);

void Gray2BinaryMatrix(int orig[], int dest[], int nfilas, int ncols);

int rgb2gray(pixelRGB pixel);

//void contarUnos(int mat[], int vector[], int nfilas, int ncols);

void masmas(int vector[], int i);
#endif
