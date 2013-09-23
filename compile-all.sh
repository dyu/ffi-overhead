#!/bin/sh

tup upd && cd nimcache && ./compile-nimrod.sh && cd ../jhello && ./compile-java.sh && cd .. && go build hello.go


