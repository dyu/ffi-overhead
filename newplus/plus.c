#include <stdio.h>
#include <sys/time.h>
#include "plus.h"

int plus(int x, int y)
{
    return x + y;
}

int plusone(int x)
{
    return x + 1;
}

long long current_timestamp()
{
    struct timeval te; 
    gettimeofday(&te, NULL); // get current time
    long long milliseconds = te.tv_sec*1000LL + te.tv_usec/1000; // caculate milliseconds
    
    return milliseconds;
}
