const Builder = @import("std").build.Builder;

pub fn build(b: *Builder) void {
    const mode = b.standardReleaseOptions();
    const exe = b.addExecutable("zig_hello", "hello.zig");
    exe.setBuildMode(mode);
    exe.addIncludeDir(".");
    exe.linkLibC();
    exe.addIncludeDir(b.pathFromRoot("."));
    exe.addCSourceFiles(&.{
        b.pathFromRoot("newplus/plus.c"),
    }, &.{});
    exe.setOutputDir("zig_hello");

    exe.addRPath("$ORIGIN/newplus");

    b.default_step.dependOn(&exe.step);
    b.installArtifact(exe);
}
