package main

// #cgo CFLAGS: -Wall -O2 -fPIC 
// #cgo linux CFLAGS: -DLINUX=1
// #cgo LDFLAGS: -lnewplus
// #include "newplus/plus.h"
import "C"
import "fmt"

// should be LDFLAGS: -Wl,-rpath,'$ORIGIN/$(DIR1)' -L$(DIR1) %f -o %o -l$(N1)

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
