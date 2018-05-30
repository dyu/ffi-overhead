local ffi = require("ffi")

ffi.cdef[[
int plus(int x, int y);
int plusone(int x);
long long current_timestamp();

int printf(const char *fmt, ...);
]]

-- load
local newplus = ffi.load("./newplus/libnewplus.so")
newplus.current_timestamp()
newplus.plusone(0)

local function run(count)
    local start = newplus.current_timestamp()

    local x = 0
    while x < count do
        x = newplus.plusone(x)
    end
    
    ffi.C.printf("%lld\n", newplus.current_timestamp() - start)
end

local function start()
    if #arg == 0 then
        print("First arg (0 - 2000000000) is required.")
        return
    end

    local count = tonumber(arg[1])
    if count <= 0 or count > 2000000000 then
        print("Must be a positive number not exceeding 2 billion.")
        return
    end
    
    run(count)
end

start()

