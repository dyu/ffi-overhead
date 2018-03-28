const Builder = @import("std").build.Builder;

pub fn build(b: &Builder) void {
    const mode = b.standardReleaseOptions();
    const exe = b.addExecutable("zig_hello", "hello.zig");
    exe.setBuildMode(mode);
    exe.addIncludeDir(".");
    exe.addLibPath("newplus");
    exe.linkSystemLibrary("c");
    exe.linkSystemLibrary("newplus");
    exe.setOutputPath("zig_hello");
    
    b.addRPath("$ORIGIN/newplus");
    
    b.default_step.dependOn(&exe.step);
    b.installArtifact(exe);
}
