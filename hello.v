import os
import strconv

#flag -I.
#include "newplus/plus.c"

fn C.plusone(int) int
fn C.current_timestamp() i64

fn run(count int) i64 {
  mut x := 0
  start := C.current_timestamp()

  for x < count {
    x = C.plusone(x)
  }

  return C.current_timestamp() - start
}

fn main() {
  if os.args.len == 0 {
    println("First arg (0 - 2000000000) is required.")
    return
  }

  count := strconv.atoi(os.args[1]) or {
    println("Must be a positive number not exceeding 2 billion.")
    return
  }

  println(run(count))
}
