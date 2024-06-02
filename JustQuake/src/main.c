#include <stdio.h>

int main(int argc, char **argv[]) {
    int sum = 0;
    for (int n = 1; n <= 100; ++n) {
        sum += n;
        printf("n=%d, sum=%d\n", n, sum);
    }
    printf("sum=%d\n", sum);
    return 0;
}
