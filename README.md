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
tup init

// begin workaround for go (I've to figure out how to pass rpath to go)
tup upd
cd newplus
sudo ln -s $PWD/libnewplus.so /usr/lib/libnewplus.so
// end

To compile, exec:
./compile-all.sh

To run, exec:
./run-all.sh

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
- nimrod 0.9.3
- java 1.7.0_25
- go 1.1.2


