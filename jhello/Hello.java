package jhello;

public final class Hello
{
    public static native int plus(int x, int y);
    public static native int plusone(int x);
    public static native long current_timestamp();

    private static void loadNative() throws Exception
    {
        java.io.File file = new java.io.File("."), 
            jhello = new java.io.File(file, "jhello");
        
        if (jhello.exists())
            file = jhello;
        
        String currentDir = file.getCanonicalPath();
    
        System.load(currentDir + "/libjhello.so");
    }
    
    static void run(int count)
    {
        final long start = current_timestamp();

        int x = 0;
        while (x < count)
            x = plusone(x);

        System.out.println(current_timestamp() - start);
    }

    public static void main(String[] args) throws Exception
    {
        if (args.length == 0)
        {
            System.err.println("First arg (0 - 2000000000) is required.");
            return;
        }
        
        int count = Integer.parseInt(args[0]);
        if (count <= 0 || count > 2000000000)
        {
            System.err.println("Must be a positive number not exceeding 2 billion.");
            return;
        }
        
        // load
        loadNative();
        plusone((int)current_timestamp());
        
        // start
        run(count);
    }
}
