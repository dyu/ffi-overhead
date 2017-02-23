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
- rust 1.0.11
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
896
890

c:
1188
1185

cpp:
1185
1187

nim:
1334
1335

rust:
1186
1185

d:
1334
1334

java7:
4477
4474

java8:
4487
4502

node:
9418
9432

node scoped:
15528
15225

go:
38145
38133

dart:
31477
31391

dart scoped:
70066
71389

```

