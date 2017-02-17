package main

// #cgo CFLAGS: -Wall -O2 -fPIC 
// #cgo linux CFLAGS: -DLINUX=1
// #cgo LDFLAGS: -Lnewplus -lnewplus -Wl,-rpath='$ORIGIN'/newplus
// #include "newplus/plus.h"
import "C"
import "fmt"

func main() {
    // load
    ts := C.current_timestamp()
    C.plusone(C.int(ts))
    
    // start
    start := C.current_timestamp()
    
    var x C.int = 0
    for x < 2000000000 {
        x = C.plusone(x)
    }
    
    end := C.current_timestamp()
    elapsed := end - start
    
    fmt.Println(elapsed)
}
