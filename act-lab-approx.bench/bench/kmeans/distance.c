/*
 * distance.c
 *
 *  Created on: May 7, 2012
 *      Author: Hadi Esmaeilzadeh <hadianeh@cs.washington.edu>
 */

#include "distance.h"
#include <math.h>

#include "npu.h"

float euclideanDistance(RgbPixel* p, Centroid* c1) {
	float r;

	r = 0;
	r += (p->r - c1->r) * (p->r - c1->r);
	r += (p->g - c1->g) * (p->g - c1->g);
	r += (p->b - c1->b) * (p->b - c1->b);

	return sqrt(r);
}

int pickCluster(RgbPixel* p, Centroid* c1) {
	float d1;

	d1 = euclideanDistance(p, c1);

	if (p->distance <= d1)
		return 0;

	return 1;
}

void assignCluster(RgbPixel* p, Clusters* clusters) {
	int i;
#if 0
	int pick;
#endif //0
	float d;

	NPU_Q_INST(p->r);
	NPU_Q_INST(p->r);
	NPU_Q_INST(p->r);
	NPU_Q_INST(p->r);
	NPU_Q_INST(p->r);
	NPU_Q_INST(p->r);

	MAGIC_INST;
	d = euclideanDistance(p, &clusters->centroids[i]);
	MAGIC_INST;

	NPU_Q_INST(d);

	p->distance = d;

	for(i = 1; i < clusters->k; ++i) {
		NPU_Q_INST(p->r);
		NPU_Q_INST(p->r);
		NPU_Q_INST(p->r);
		NPU_Q_INST(p->r);
		NPU_Q_INST(p->r);
		NPU_Q_INST(p->r);

		MAGIC_INST;
		d = euclideanDistance(p, &clusters->centroids[i]);
		MAGIC_INST;

		NPU_Q_INST(d);

		if (d < p->distance) {
			p->cluster = i;
			p->distance = d;
		}
#if 0
		pick = pickCluster(p, &clusters->centroids[i]);
		if (pick == 1) {
			p->cluster = i;
			p->distance = euclideanDistance(p, &clusters->centroids[i]);
		}
#endif //0
	}
}

