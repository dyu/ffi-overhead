ffi-overhead
============

comparing the c ffi overhead on various programming languages

Build requirements:
- gcc
- tup

Requirements on the exec path:
- nim
- javac, java
- go
- rustc

My environment:
```
- Intel i7-3630QM laptop (4cores, HT) with 16g ram
- Ubuntu 14.04 x64
- gcc/g++ 5.4.1
- nim 0.14.3
- java 1.7.0_72 and 1.8.0_91
- go 1.8.0
- rust 1.0.11
- dart 1.0.21
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
./run-all.sh
```

Measurement:
- call the c function "plusone" 2 billion times and print out the elapsed time in millis.
 ```c
int x = 0;
while (x < 2000000000) x = plusone(x);
 ```

- 2 samples/runs

##Results
```
The results are elapsed time in milliseconds
============================================
c:
4778
4750

cpp:
4753
4758

nim:
4746
4774

rust:
5331
5339

java7:
17922
17913

java8:
17992
17932

go:
130105
132824

dart:
194080
192081
```

For enhancements, pull requests are welcome.

