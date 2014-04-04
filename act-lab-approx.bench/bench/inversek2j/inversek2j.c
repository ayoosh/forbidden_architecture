/*
 * inversek2j.c
 *
 *  Created on: Dec 6, 2011
 *      Author: Hadi Esmaeilzadeh <hadi@cc.gatech.edu>
 */

#define VANILLA_RUN
#include <stdio.h>
#include <stdlib.h>

#include "kinematics.h"

#define PI 3.14159265

int main (int argc, const char* argv[]) {
	int i;
	int x;
	int n;

	if (argc < 2) {
		n = 10000;
	} else {
		n = atoi(argv[1]);
	}
	printf("Number of iterations: %d\n", n);

	float* t1t2xy = (float*)malloc(n * 2 * 2 * sizeof (float));

	if(t1t2xy == NULL) {
		printf("Cannot allocate memory for the coordinates an angles!");
		return -1;
	}

	for (i = 0; i < n * 2 * 2; i += 2 * 2) {
		x = rand();
		t1t2xy[i] = (((float)x)/RAND_MAX) * PI / 2;
		x = rand();
		t1t2xy[i + 1] = (((float)x)/RAND_MAX) *  PI / 2;
#ifdef VANILLA_RUN
		t1t2xy[i + 2] = 0;
		t1t2xy[i + 3] = 0;
		printf("####################################################################\n");
		printf("(t1 = %0.4f, t2 = %0.4f) =========> (x = %0.4f, y = %0.4f)\n", t1t2xy[i] * 180 / PI, t1t2xy[i + 1] * 180 / PI, t1t2xy[i + 2], t1t2xy[i + 3]);
#endif //VANILLA_RUN
		forwardk2j(t1t2xy[i + 0], t1t2xy[i + 1], t1t2xy + (i + 2), t1t2xy + (i + 3));
#ifdef VANILLA_RUN
		printf("(t1 = %0.4f, t2 = %0.4f) =========> (x = %0.4f, y = %0.4f)\n", t1t2xy[i] * 180 / PI, t1t2xy[i + 1] * 180 / PI, t1t2xy[i + 2], t1t2xy[i + 3]);
#endif //VANILLA_RUN
	}
#ifdef VANILLA_RUN
	printf("####################################################################\n");
#endif //VANILLA_RUN
	

	for (i = 0; i < n * 2 * 2; i += 2 * 2) {
#ifdef VANILLA_RUN
		printf("####################################################################\n");
		printf("(t1 = %0.4f, t2 = %0.4f) =========> (x = %0.4f, y = %0.4f)\n", t1t2xy[i] * 180 / PI, t1t2xy[i + 1] * 180 / PI, t1t2xy[i + 2], t1t2xy[i + 3]);
#endif //VANILLA_RUN
		inversek2j(t1t2xy[i + 2], t1t2xy[i + 3], t1t2xy + (i + 0), t1t2xy + (i + 1));
#ifdef VANILLA_RUN
		forwardk2j(t1t2xy[i + 0], t1t2xy[i + 1], t1t2xy + (i + 2), t1t2xy + (i + 3));
		printf("(t1 = %0.4f, t2 = %0.4f) =========> (x = %0.4f, y = %0.4f)\n", t1t2xy[i] * 180 / PI, t1t2xy[i + 1] * 180 / PI, t1t2xy[i + 2], t1t2xy[i + 3]);
#endif //VANILLA_RUN
	}
#ifdef VANILLA_RUN
	printf("####################################################################\n");
#endif //VANILLA_RUN


	free(t1t2xy);
	t1t2xy = NULL;

    return 0;
}

