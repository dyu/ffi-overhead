class FFI {
    foreign static plusone(x)
    foreign static count()
    foreign static start()
    foreign static stop()
}
var x = 0
var count = FFI.count()
// try call
FFI.plusone(x)

FFI.start()
while (x < count) {
    x = FFI.plusone(x)
}
FFI.stop()
