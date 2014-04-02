#define BITS 8
#include <stdio.h>
#include <tgmath.h>
#include <stdlib.h> 
#include <fcntl.h>
#include <string.h>

void main (void) {
    int16_t output, last_output = 0;
    int sprint_l, file;
    unsigned long i;
    char buf[10000];
    double input, imin, imax, error, error_sq_accum;

    imin = pow(2.0, -BITS);
    imax = pow(2.0, 33) - imin;

    memset(buf, '\0', 10000);
    unlink("./table");
    file = open("./table", O_RDWR | O_CREAT, O_SYNC);

    for(input = imin; input <= imax; input += imin) {
        output = (int16_t) nearbyintf((tanh(input) * pow(2.0, BITS)));
        output &= 0xffff;
        //sprint_l = sprintf(buf, "Input = %f\ttanh(Input) = %f\n", input, ((double) output) * pow(2, -7));
        sprint_l = sprintf(buf, "Input = 0x%.12lx\ttanh(Input) = 0x%.4x\n", ((int64_t) (input * pow(2, BITS))) << 14 - BITS, output);
        if (output > (last_output + 1)) {
            printf("Output value skipped\n");
        }
        last_output = output;
        write(file, buf, sprint_l);
        if (output == 0x80) {
            break;
        }
    }
    close(file);


    imin = pow(2.0, -14);
    imax = pow(2.0, 33) - imin;
    error_sq_accum = 0;

    for(input = imin, i = 1;  ; input += imin, i++) {
        output = (int16_t) nearbyintf((tanh(((double) ((int64_t) (input * pow(2.0, BITS)))) * pow(2.0, -BITS)) * pow(2.0, BITS)));
        error = (tanh(input) - (((double) output) * pow(2.0, -BITS))) / tanh(input);
        error_sq_accum += fabs(error);
        if(output == 0x80) {
            break;
        }
    }
    printf("mean error = %f, over %d values\n", error_sq_accum / i, i);
    return;
}
