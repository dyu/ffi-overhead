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

To initialize, exec:
- tup init

Workaround for go (I've to figure out how to pass rpath to go)
- tup upd
- cd newplus
- sudo ln -s $PWD/libnewplus.so /usr/lib/libnewplus.so

To compile, exec:
- ./compile-all.sh

To run, exec:
- ./run-all.sh

The main files:
- newplus/plus.c
- hello.c
- hello.nim
- jhello/Hello.java
- hello.go

My environment:
- Intel i7-3630QM laptop (4cores, HT) with 16g ram
- Ubuntu 13.04 x64
- gcc 4.7.3
- tup 0.6.5-2
- nimrod 0.9.3
- java 1.7.0_25
- go 1.1.2

Measurement:
- call the c function "plusone" 2 billion times and print out the elapsed time in millis.

 ```c
int x = 0;
while (x < 2000000000)
    x = plusone(x);
 ```

Results:
```
The results are elapsed time in milliseconds
============================================
c:
5363

nimrod:
5368

java:
19115

go:
94461
```

For enhancements, pull requests are welcome.

