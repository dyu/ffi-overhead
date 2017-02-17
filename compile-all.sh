#!/bin/sh

nim c --noLinking -d:release --parallelBuild:1 hello.nim && \
    tup upd

make -C elixir
