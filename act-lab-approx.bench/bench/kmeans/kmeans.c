/*
 * kmeans.c
 *
 *  Created on: May 6, 2012
 *      Author: Hadi Esmaeilzadeh <hadi@cc.gatech.edu>
 */

#include <stdio.h>

#include "rgbimage.h"
#include "segmentation.h"

int main (int argc, const char* argv[]) {
	char inputFileName[64], outputFileName[64];
	int nClusters;
	RgbImage srcImage;
	Clusters clusters;

	if (argc < 4) {
		printf("Error: Oops! Too few parameters!\n");
		printf("Usage: %s <INPUT_RGB_FILE> <N_CLUSTERS> <OUTPUT_RGB_FILE>\n", argv[0]);

		return -1;
	}

	strcpy(inputFileName, argv[1]);
	nClusters = atoi(argv[2]);
	strcpy(outputFileName, argv[3]);

	RgbImage srcImage;
	initRgbImage(&srcImage);
	if (loadRgbImage(inputFileName, &srcImage, 256) == 0) {
		printf("Error! Oops: Cannot load the input image: %s!\n", inputFileName);

		return -1;
	}

	initClusters(&clusters, nClusters, 1);
	segmentImage(&srcImage, &clusters, 1);

	saveRgbImage(&srcImage, outputFileName, 255);

	freeRgbImage(&srcImage);
	freeClusters(&clusters);

	return 0;
}

