#!/bin/sh

nim c --noLinking -d:release --parallelBuild:1 hello.nim && \
    zig build -Drelease-fast=true && \
    make -C ocaml &&
    tup upd

make -C elixir
