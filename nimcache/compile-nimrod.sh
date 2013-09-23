#!/bin/sh

nimrod c -d:release --cincludes:.. --noLinking --parallelBuild:1 -d:useMalloc --gc:none -d:noSignalHandler ../hello.nim && tup upd


