#define SCALE 1
#define I_FRAC_BITS 7

#include <stdio.h>
#include <tgmath.h>
#include <stdlib.h> 
#include <fcntl.h>
#include <string.h>

void main (void) {
    int16_t output, last_output = 0;
    int sprint_l, file;
    char buf[10000];
    double input, imin, imax;

    imin = pow(2.0, -I_FRAC_BITS);
    imax = pow(2.0, 33) - imin;

    memset(buf, '\0', 10000);
    unlink("./table");
    file = open("./table", O_RDWR | O_CREAT, O_SYNC);

    for(input = imin; input <= imax; input += (SCALE * imin)) {
        output = (int16_t) (tanh(input) * pow(2.0, 7));
        output &= 0xffff;
        //sprint_l = sprintf(buf, "Input = %f\ttanh(Input) = %f\n", input, ((double) output) * pow(2, -7));
        sprint_l = sprintf(buf, "Input = 0x%.12lx\ttanh(Input) = 0x%.4x\n", ((int64_t) (input * pow(2, I_FRAC_BITS))) <<(14 - I_FRAC_BITS), output);
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
    return;
}
