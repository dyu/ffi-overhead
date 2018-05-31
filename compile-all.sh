#!/bin/sh

nim c --noLinking -d:release --parallelBuild:1 hello.nim && \
    zig build -Drelease-fast=true && \
    make -C ocaml && \
    make -C elixir && \
    tup upd

