/*
 * jmeint.c
 *
 *  Created on: Apr 23, 2012
 *      Author: Hadi Esmaeilzadeh <hadi@cc.gatech.edu>
 */

#include <stdio.h>
#include <stdlib.h>

#include "tritri.h"

int main(int argc, char* argv[]) {
	int i;
	int j;
	int n;

	if (argc < 2) {
		n = 10000;
	} else {
		n = atoi(argv[1]);
	}
	printf("Number of iterations: %d\n", n);

	float* xyz = (float*)malloc(n * 6 * 3 * sizeof (float));
	int* y = (int*)malloc(n * sizeof (int));

	if(xyz == NULL) {
		printf("Cannot allocate memory for the triangle coordinates!");
		return -1;
	}

	for (i = 0; i < n * 6 * 3; ++i) {
		xyz[i] = ((float)rand())/RAND_MAX;
	}

	for (i = 0, j = 0; i < (n * 6 * 3); i += 6 * 3, j++) {
		y[j] = tri_tri_intersect(
			xyz + i + 0 * 3, xyz + i + 1 * 3, xyz + i + 2 * 3,
			xyz + i + 3 * 3, xyz + i + 4 * 3, xyz + i + 5 * 3
		);
	}

	for (j = 0; j < n; j++) {
		putchar('0' + (char)y[j]);
	}
	putchar('\n');

	free(xyz);
	xyz = NULL;

	return 0;
}

