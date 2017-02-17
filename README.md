ffi-overhead
============

comparing the c ffi overhead on various programming languages


Build requirements:
- gcc
- tup

Requirements on the exec path:
- nimrod
- javac, java
- go
- rustc
- luajit

To initialize, exec:
- tup init

To compile, exec:
- ./compile-all.sh

Compile opts:
- -O2 (gcc - applies to c/jni/nim)
- -C opt-level=2 (rust)

To run, exec:
- ./run-all.sh

My environment:
```
- Intel i7-3630QM laptop (4cores, HT) with 16g ram
- Ubuntu 14.04 x64
- gcc 5.4.1
- nim 0.14.3
- java 1.7.0_72 and 1.8.0_91
- go 1.8,0
- rust 1.0.11
- luajit 2.0.4
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
PENDING

```

For enhancements, pull requests are welcome.

