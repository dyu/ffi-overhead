#!/bin/sh

echo "The results are elapsed time in milliseconds"
echo "============================================"

echo "c:"
./c_hello

echo "\nnimrod:"
./nimcache/nim_hello

echo "\njava:"
java -d64 -cp . jhello.Hello

echo "\ngo:"
./hello
