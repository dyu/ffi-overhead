extern "C" {
#include <stdio.h>
#include "newplus/plus.h"
}

int main(void)
{
    // start immediately
    long long start = current_timestamp();
    long long end, elapsed;
    
    int x = 0;
    while (x < 2000000000)
        x = plusone(x);
    
    end = current_timestamp(), elapsed = end - start;

    printf("%lld\n", elapsed);

    return 0;
}
