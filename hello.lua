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

-- start
local start = newplus.current_timestamp()

local x = 0
while x < 2000000000 do
    x = newplus.plusone(x)
end

local endts = newplus.current_timestamp()
local elapsed = endts - start

ffi.C.printf("%lld\n", elapsed);
