import os
import strutils

proc plus*(x: int32, y: int32): int32 {.importc, cdecl.}
proc plusone*(x: int32): int32 {.importc, cdecl.}
proc current_timestamp*(): int64 {.importc, cdecl.}

proc run(count: int32) =
  # start immediately
  let start = current_timestamp()
  
  var x:int32 = 0
  while x < count:
    x = plusone(x)
  
  let
    endts = current_timestamp()
    elapsed = endts - start
  
  echo elapsed

proc start =
  if os.paramCount() == 0:
    echo "First arg (0 - 2000000000) is required."
    return
  
  let count = strutils.parseInt(os.paramStr(1))
  if count <= 0 or count > 2000000000:
    echo "Must be a positive number not exceeding 2 billion."
    return
  
  run(count.int32)

when isMainModule:
  start()

