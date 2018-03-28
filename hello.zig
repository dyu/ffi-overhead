const std = @import("std");
const os = std.os;
const io = std.io;
//const allocator = std.debug.global_allocator;
const allocator = std.heap.c_allocator;
const c = @cImport({
    // See https://github.com/zig-lang/zig/issues/515
    @cDefine("_NO_CRT_STDIO_INLINE", "1");
    @cInclude("stdio.h");
    @cInclude("newplus/plus.h");
});

pub fn main() !void {
    
    var stdout_file = try io.getStdOut();
    var stdout_file_stream = io.FileOutStream.init(&stdout_file);
    const stdout = &stdout_file_stream.stream;
    
    const args = try os.argsAlloc(allocator);
    defer os.argsFree(allocator, args);
    
    if (args.len == 1) {
        try stdout.print("First arg (0 - 2000000000) is required.\n");
        return;
    }
    
    const count = try std.fmt.parseInt(i32, args[1], 10);
    if (count <= 0 or count > 2000000000) {
        try stdout.print("Must be a positive number not exceeding 2 billion.\n");
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
    _ = c.printf(c"%lld\n", elapsed);
}
