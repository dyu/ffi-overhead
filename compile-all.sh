#!/bin/sh

tup upd && ./compile-nimrod.sh && ./compile-java.sh && go build hello.go


