#!/bin/sh

tup upd && cd nimcache && ./compile-nimrod.sh && cd ../jhello && ./compile-java.sh && cd .. && go build hello.go && rustc --opt-level=2 -o rust_hello hello.rs


