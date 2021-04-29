#include <stdio.h>
#include <sys/time.h>

#include "jhello_Hello.h"
#include "../newplus/plus.h"

// The current impl has 25% overhead (extra function calls + compiled with no-inline forced) 
// compared to the ones commented out below.
// In fairness to go, it is commented out.

JNIEXPORT jint JNICALL Java_jhello_Hello_plus
  (JNIEnv *env, jclass clazz, jint x, jint y)
{
    return plus(x, y);
    //return x + y;
}

JNIEXPORT jint JNICALL Java_jhello_Hello_plusone
  (JNIEnv *env, jclass clazz, jint x)
{
    return plusone(x);
    //return x + 1;
}

JNIEXPORT jlong JNICALL Java_jhello_Hello_current_1timestamp
  (JNIEnv *env, jclass clazz)
{
    return current_timestamp();
    /*struct timeval te; 
    gettimeofday(&te, NULL); // get current time
    jlong milliseconds = te.tv_sec*1000LL + te.tv_usec/1000; // calculate milliseconds
    
    return milliseconds;*/
}
