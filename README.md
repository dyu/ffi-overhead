ffi-overhead
============

comparing the c ffi overhead on various programming languages

Requirements:
- gcc
- tup
- nim
- java7
- java8
- go
- rust
- d
- luajit
- node
- dart

My environment:
```
- Intel i7-3630QM laptop (4cores, HT) with 16g ram
- Ubuntu 14.04 x64
- gcc/g++ 5.4.1
- tup 0.7.4
- nim 0.14.3
- java 1.7.0_72 and 1.8.0_91
- go 1.8.0
- rust 1.17.0-nightly (c0b7112ba 2017-03-02)
- d 2.0.71.1 (dmd)
# dynamic languages 
- luajit 2.0.4
- node 6.9.0 (at /opt/node)
- dart 1.22.0 (at /usr/lib/dart)
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

##Results (500M calls)
```
./run-all.sh 500000000
The results are elapsed time in milliseconds
============================================

luajit:
891
905

c:
1182
1182

cpp:
1182
1183

nim:
1330
1330

rust:
1193
1196

d:
1330
1330

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

```

