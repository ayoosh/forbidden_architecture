#define BITS 9

#include <stdio.h>
#include <tgmath.h>
#include <stdlib.h> 
#include <fcntl.h>
#include <string.h>

void main (void) {
    int16_t output;
    int sprint_l, file, coe;
    unsigned long i;
    char buf[10000];
    double input, imin, imax, error, error_accum, input_cpy;

    imin = pow(2.0, -BITS);
    imax = pow(2.0, 33) - imin;

    memset(buf, '\0', 10000);
    unlink("./table");
    unlink("./sigmoid.coe");
    file = open("./table", O_RDWR | O_CREAT, O_SYNC);
    coe = open("./sigmoid.coe", O_RDWR | O_CREAT, O_SYNC);
    sprint_l = sprintf(buf, "memory_initialization_radix=16;\nmemory_initialization_vector=\n");
    write(coe, buf, sprint_l);
    for(input = imin; input <= imax; input += imin) {
        input_cpy = input;
        output = (int16_t) ((tanh(input) * pow(2.0, 7)));
/*        if (output == ((int16_t) (input_cpy * pow(2, BITS)))) {
            continue;
        }
*/
        output = (int16_t) nearbyintf((tanh(input) * pow(2.0, 7)));
//        sprint_l = sprintf(buf, "Input = %f\tOutput = %f\n", input, ((double) output) * pow(2, -7));
 //       write(file, buf, sprint_l);
        sprint_l = sprintf(buf, "Input = 0x%.12lx\tOutput = 0x%.4x\n", ((int64_t) (input * pow(2, 14))), output);
        write(file, buf, sprint_l);
        sprint_l = sprintf(buf, "%.4x,\n", output);
        write(coe, buf, sprint_l);
        if (((double) output) * pow(2, -7) == 1) {
            break;
        }
    }
    close(file);

    imin = pow(2.0, -14);
    imax = pow(2.0, 33) - imin;
    error_accum = 0;

    for(input = imin, i = 1;  ; input += imin, i++) {
        output = (int16_t) nearbyintf((tanh(((double) ((int64_t) (input * pow(2.0, BITS)))) * pow(2.0, -BITS)) * pow(2.0, 7)));
        error = (tanh(input) - (((double) output) * pow(2.0, -7))) / tanh(input);
        error_accum += fabs(error);
        if(output == 0x80) {
            break;
        }
    }
    printf("mean error = %f, over %d values\n", error_accum / i, i);
    return;
}
