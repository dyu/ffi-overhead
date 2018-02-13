class FFI {
    foreign static plusone(x)
    foreign static count()
    foreign static start()
    foreign static stop()
}
var x = 0
var y = FFI.count()

FFI.start()
while (x < y) {
    x = FFI.plusone(x)
}
FFI.stop()
