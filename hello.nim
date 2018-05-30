import os, strutils

proc plus*(x, y: cint): cint {.importc, cdecl.}
proc plusone*(x: cint): cint {.importc, cdecl.}
proc current_timestamp*(): clonglong {.importc, cdecl.}

proc run(count: cint) =
  # start immediately
  let start = current_timestamp()
  
  var x: cint = 0
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
  
  let count = parseInt(os.paramStr(1))
  if count notin 1..2000000000:
    echo "Must be a positive number not exceeding 2 billion."
    return
  
  run(count.cint)

when isMainModule:
  start()
