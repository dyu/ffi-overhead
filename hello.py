import ctypes
import sys
from datetime import datetime


libplus = ctypes.CDLL('./newplus/libnewplus.so')


def run(count: int):
    start = datetime.now()

    i = 0
    while i < count:
        i = libplus.plusone(i)

    dur = datetime.now() - start
    print(int(dur.total_seconds() * 1000))



if __name__ == "__main__":
    args = sys.argv[1:]
    if not args:
        print("First arg (0 - 2000000000) is required.")
        sys.exit(1)

    ct = int(args[0])
    if not ct or ct > 2000000000:
        print('Must be a positive number not exceeding 2 billion.')
        sys.exit(1)

    run(ct)
