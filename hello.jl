function run(count::Int32)
    start = time()
    x = zero(Int32)
    while x < count
        x = ccall((:plusone, "./newplus/libnewplus.so"), Int32, (Cint,), x)
    end
    return round(Int32, (time() - start) * 1000)
end

function start()
    if isempty(ARGS)
        println("First arg (0 - 2000000000) is required.")
        return nothing
    end
    count = parse(Int32, ARGS[1])
    if count <= 0 || count > 2*10^9
        println("Must be a positive number not exceeding 2 billion.")
        return nothing
    end
    duration = run(count)
    println(duration)
end

start()
