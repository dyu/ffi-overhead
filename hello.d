import std.stdio;

extern (C) int plusone(int x);
extern (C) long current_timestamp();

void main() {
    auto start = current_timestamp();
    int x = 0;
    while (x < 2000000000) {
        x = plusone(x);
    }
    auto end = current_timestamp();
    auto elapsed = end - start;
    writefln("%d", elapsed);
}
