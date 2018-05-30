import core.stdc.stdio;
import core.stdc.stdlib;

extern (C) int plusone(int x);
extern (C) long current_timestamp();

void run(int count) {
    auto start = current_timestamp();
    int x = 0;
    while (x < count) {
        x = plusone(x);
    }
    
    printf("%d", current_timestamp() - start);
}

extern (C) int main(int argc, char** argv) {
    if (argc == 1) {
        printf("First arg (0 - 2000000000) is required.\n");
        return 1;
    }
    
    int count = atoi(argv[1]);
    if (count <= 0 || count > 2000000000) {
        printf("Must be a positive number not exceeding 2 billion.\n");
        return 1;
    }
    
    // start immediately
    run(count);
    
    return 0;
}
