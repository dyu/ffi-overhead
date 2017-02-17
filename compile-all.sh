#!/bin/sh

nim c -c -d:release --parallelBuild:1 hello.nim && \
    gcc -O2 -o nim_hello nimcache/stdlib_system.o nimcache/hello.o -Lnewplus -lnewplus -Wl,-rpath='$ORIGIN'/newplus && \
    javac -d . jhello/Hello.java && tup upd && \
    go build hello.go && \
    rustc -C opt-level=2 -C link-args="-Lnewplus -lnewplus -Wl,-rpath=\$ORIGIN/newplus" -o rust_hello hello.rs


