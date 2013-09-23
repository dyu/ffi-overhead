
proc plus*(x: int32, y:int32): int32 {.importc, header: "newplus/plus.h".}
proc plusone*(x: int32): int32 {.importc, header: "newplus/plus.h".}
proc current_timestamp*(): int64 {.importc, header: "newplus/plus.h".}
  

when isMainModule:
  # start immediately
  let start = current_timestamp()
  
  var x:int32 = 0
  while x < 2_000_000_000:
    x = plusone(x)
  
  let
    endts = current_timestamp()
    elapsed = endts - start
  
  echo elapsed

