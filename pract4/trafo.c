
#include "trafo.h"
#include "types.h"



void RGB2GrayMatrix(pixelRGB orig[], int dest[], int nfilas, int ncols) {
    int i,j;
    
    for (i=0;i<nfilas;i++)
        for (j=0; j<ncols; j++)
            dest[i*ncols+j] =  rgb2gray(orig[i*ncols+j]);
    
}

void Gray2BinaryMatrix(int orig[], int dest[], int nfilas, int ncols) {
    int i,j;
    int umbral = 127;
    
    for (i=0;i<nfilas;i++)
        for (j=0; j<ncols; j++)
            if (orig[i*ncols+j] > umbral)
                dest[i*ncols+j]=1;
            else
                 dest[i*ncols+j]=0;
    
}


int rgb2gray(pixelRGB pixel) {
    return  ( (2126*pixel.R + 7152*pixel.G + 722*pixel.B) /10000);
}

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

void masmas(int vector[], int i){
	vector[i] = vector[i] + 1;
}
