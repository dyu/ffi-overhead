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

Workaround for go (I've to figure out how to pass rpath to go)
- tup upd
- cd newplus
- sudo ln -s $PWD/libnewplus.so /usr/lib/libnewplus.so

To compile, exec:
- ./compile-all.sh

Compile opts:
- -O2 (gcc - applies to c/jni)
- --opt-level=2 (rust)

To run, exec:
- ./run-all.sh

The main files:
- newplus/plus.c
- hello.c
- hello.nim
- jhello/Hello.java
- hello.go
- hello.rs
- hello.lua

My environment:
- Intel i7-3630QM laptop (4cores, HT) with 16g ram
- Ubuntu 13.04 x64
- gcc 4.7.3
- tup 0.6.5-2
- nimrod 0.9.3
- java 1.7.0_25
- go 1.1.2
- rust 0.8
- luajit 2.0.2

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
c:
4839
4822

luajit:
3612
3616

nimrod:
4218
4222

rust:
5436
5427

java:
18111
18131

go:
95536
95556

```

For enhancements, pull requests are welcome.

