import std.stdio;
import std.conv;

extern (C) int plusone(int x);
extern (C) long current_timestamp();

void run(int count) {
    auto start = current_timestamp();
    int x = 0;
    while (x < count) {
        x = plusone(x);
    }
    
    writefln("%d", current_timestamp() - start);
}

int main(string[] args) {
    if (args.length == 1) {
        writefln("First arg (0 - 2000000000) is required.");
        return 1;
    }
    
    int count = to!int(args[1]);
    if (count <= 0 || count > 2000000000) {
        writefln("Must be a positive number not exceeding 2 billion.");
        return 1;
    }
    
    // start immediately
    run(count);
    
    return 0;
}
