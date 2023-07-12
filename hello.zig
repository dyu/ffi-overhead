const std = @import("std");
const os = std.os;
const io = std.io;
const allocator = std.heap.c_allocator;
const c = @cImport({
    // See https://github.com/zig-lang/zig/issues/515
    @cDefine("_NO_CRT_STDIO_INLINE", "1");
    @cInclude("stdio.h");
    @cInclude("newplus/plus.h");
});

pub fn main() anyerror!void {
    var stdout_file = io.getStdOut();
    const stdout = stdout_file;

    const args = try std.process.argsAlloc(allocator);

    if (args.len == 1) {
        try stdout.writeAll("First arg (0 - 2000000000) is required.\n");
        return;
    }

    const count = try std.fmt.parseInt(i32, args[1], 10);
    if (count <= 0 or count > 2000000000) {
        try stdout.writeAll("Must be a positive number not exceeding 2 billion.\n");
        return;
    }

    run(count);
}

fn run(count: i32) void {
    const start = c.current_timestamp();

    var x: i32 = 0;
    while (x < count) {
        x = c.plusone(x);
    }

    const elapsed = c.current_timestamp() - start;
    _ = c.printf("%lld\n", elapsed);
}
