ffi-overhead
============

comparing the c ffi overhead on various programming languages

Requirements:
- gcc
- tup
- zig
- nim
- v
- java7
- java8
- go
- rust
- d (dmd and ldc2)
- haskell (ghc)
- ocaml
- csharp (mono)
- luajit
- julia
- node
- dart
- wren
- elixir

My environment:
```
- Intel i7-3630QM laptop (4cores, HT) with 16g ram
- Ubuntu 14.04 x64
- gcc/g++ 5.4.1
- tup 0.7.4
- zig 0.2.0
- nim 0.14.3
- v 0.2.2 aebb551
- java 1.7.0_72 and 1.8.0_91
- go 1.8.0
- rust 1.17.0-nightly (c0b7112ba 2017-03-02)
- dmd 2.0.71.1
- ldc2 1.9.0
- ghc 7.10.3 (at /opt/ghc)
- ocaml 4.06.1
- mono 5.12.0.226
# dynamic languages 
- luajit 2.0.4
- julia 0.6.3
- node 6.9.0 (at /opt/node)
- dart 1.22.0 (at /usr/lib/dart)
- wren 0.1.0
- elixir 1.6.5 (Erlang/OTP 20)
```

### Initialize
```sh
tup init
```

### Compile
```sh
./compile-all.sh
```

Compile opts:
- -O2 (gcc - applies to c/jni/nim)
- -C opt-level=2 (rust)

### Run
```sh
./run-all.sh 1000000
```

Measurement:
- call the c function "plusone" x number of times and print out the elapsed time in millis.
 ```c
int x = 0;
while (x < count) x = plusone(x);
 ```

- 2 samples/runs

## Results (500M calls)
```
./run-all.sh 500000000
The results are elapsed time in milliseconds
============================================

luajit:
891
905

julia:
894
889

c:
1182
1182

cpp:
1182
1183

zig:
1191
1190

nim:
1330
1330

v:
1779
1781

rust:
1193
1196

d:
1330
1330

d ldc2:
1191
1189

haskell:
1197
1198

ocamlopt:
1634
1634

ocamlc:
4299
4302

csharp mono:
2697
2690

java7:
4469
4472

java8:
4505
4472

node:
9163
9194

node scoped:
15425
15409

go:
37975
37879

dart:
31265
31282

dart scoped:
61906
69043

wren:
14519
14514

elixir:
23852
23752
```

