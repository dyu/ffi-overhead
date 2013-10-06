#!/bin/sh

nimrod c -d:release --parallelBuild:1 -d:useMalloc --gc:none -d:noSignalHandler --out:nim_hello ../hello.nim


