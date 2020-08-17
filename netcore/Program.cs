using System;
using System.Runtime.InteropServices;


class Program
{
    [DllImport("newplus/libnewplus.so")]
    public static extern long current_timestamp();
    [DllImport("newplus/libnewplus.so")]
    public static extern int plusone(int x);

    static void Main(string[] args)
    {
        if (args.Length < 1)
        throw new ArgumentException("First arg (0 - 2000000000) is required.");

        int iterations;
        if (int.TryParse(args[0], out iterations))
        {
            if (iterations > 2000000000 || iterations < 0) 
                throw new ArgumentException("Must be a positive number not exceeding 2 billion.");
        }
        else 
        {
            throw new ArgumentException("Not a number.");
        }

        var start = current_timestamp();
        var x = 0;
        while (x < iterations) x = plusone(x);
        var end = current_timestamp();
        Console.WriteLine(end - start);
    }
}
