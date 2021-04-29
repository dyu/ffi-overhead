#!/bin/sh

[ $# -gt 0 ] || { echo "First arg (0 - 2000000000) is required."; exit 1; }

[ "$1" -eq "$1" ] 2>/dev/null || { echo "Must be a positive number not exceeding 2 billion."; exit 1; }

echo "The results are elapsed time in milliseconds"
echo "============================================"

if [ "$2" = "scoped" ]; then
    echo "\nnode scoped:"
    node hello.js $@ && \
    node hello.js $@

    echo "\ndart scoped:"
    dart hello.dart $@ && \
    dart hello.dart $@

    exit 0
fi

echo "\nluajit:"
luajit hello.lua $@ && \
luajit hello.lua $@

echo "\nc:"
./c_hello $@ && \
./c_hello $@

echo "\ncpp:"
./cpp_hello $@ && \
./cpp_hello $@

echo "\nzig:"
./zig_hello $@ && \
./zig_hello $@

echo "\nnim:"
./nim_hello $@ && \
./nim_hello $@

echo "\nv:"
./v_hello $@ && \
./v_hello $@

echo "\nrust:"
./rust_hello $@ && \
./rust_hello $@

echo "\nd:"
./d_hello $@ && \
./d_hello $@

echo "\nd ldc2:"
./d_ldc2_hello $@ && \
./d_ldc2_hello $@

echo "\nhaskell:"
./ghc_hello $@ && \
./ghc_hello $@

echo "\nocamlopt:"
./ocaml/test.nat $@ && \
./ocaml/test.nat $@

echo "\nocamlc:"
./ocaml/test.bc $@ && \
./ocaml/test.bc $@

# TODO: CoreCLR and natively running on Windows
echo "\ncsharp mono:"
mono ./csharp_hello.exe $@ && \
mono ./csharp_hello.exe $@

echo "\njava7:"
/usr/lib/jvm/java-7-oracle/bin/java -cp . jhello.Hello $@ && \
/usr/lib/jvm/java-7-oracle/bin/java -cp . jhello.Hello $@

echo "\njava8:"
/usr/lib/jvm/java-8-oracle/bin/java -cp . jhello.Hello $@ && \
/usr/lib/jvm/java-8-oracle/bin/java -cp . jhello.Hello $@

echo "\nnode:"
node hello.js $@ && \
node hello.js $@

echo "\ngo:"
./go_hello $@ && \
./go_hello $@

echo "\ndart:"
dart hello.dart $@ && \
dart hello.dart $@

echo "\nwren:"
./wren_hello hello.wren $@ && \
./wren_hello hello.wren $@

echo "\nelixir:"
elixir -r hello.ex -e "S.start" $@ && \
elixir -r hello.ex -e "S.start" $@

echo "\njulia:"
julia hello.jl $@ && \
julia hello.jl $@

