extern "C" {
#include <stdio.h>
#include "newplus/plus.h"
}

#include <string>

void run(int count)
{
    long long start = current_timestamp();
    
    int x = 0;
    while (x < count)
        x = plusone(x);
    
    printf("%lld\n", current_timestamp() - start);
}

int main(int argc, char** argv)
{
    if (argc == 1) {
        printf("First arg (0 - 2000000000) is required.\n");
        return 1;
    }
    
    int count = std::stoi(argv[1]);
    if (count <= 0 || count > 2000000000) {
        printf("Must be a positive number not exceeding 2 billion.\n");
        return 1;
    }

    // start immediately
    run(count);

    return 0;
}
