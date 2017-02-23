package main

// #cgo CFLAGS: -Wall -O2 -fPIC 
// #cgo linux CFLAGS: -DLINUX=1
// #cgo LDFLAGS: -Lnewplus -lnewplus -Wl,-rpath='$ORIGIN'/newplus
// #include "newplus/plus.h"
import "C"
import "fmt"
import "os"
import "strconv"

func run(count C.int) {
    start := C.current_timestamp()
    
    var x C.int = 0
    for x < count {
        x = C.plusone(x)
    }
    
    fmt.Println(C.current_timestamp() - start)
}

func main() {
    if (len(os.Args) == 1) {
        fmt.Println("First arg (0 - 2000000000) is required.")
        return
    }
    
    count, err := strconv.Atoi(os.Args[1])
    if err != nil || count <= 0 || count > 2000000000 {
        fmt.Println("Must be a positive number not exceeding 2 billion.");
        return
    }
    
    // load
    C.plusone(C.int(C.current_timestamp()))
    
    // start
    run(C.int(count))
}
