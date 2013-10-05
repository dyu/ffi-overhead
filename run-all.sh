#!/bin/sh

echo "The results are elapsed time in milliseconds"
echo "============================================"

echo "c:"
./c_hello
./c_hello

echo "\nluajit:"
luajit hello.lua
luajit hello.lua

echo "\nnimrod:"
./nimcache/nim_hello
./nimcache/nim_hello

echo "\nrust:"
./rust_hello
./rust_hello

echo "\njava:"
java -d64 -cp . jhello.Hello
java -d64 -cp . jhello.Hello

echo "\ngo:"
./hello
./hello
