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
        
        if(jhello.exists())
            file = jhello;
        
        String currentDir = file.getCanonicalPath();
    
        System.load(currentDir + "/libjhello.so");
    }

    public static void main(String[] args) throws Exception
    {
        // load
        loadNative();
        final long ts = current_timestamp();
        plusone((int)ts);
        
        // start
        final long start = current_timestamp();

        int x = 0;
        while (x < 2000000000)
            x = plusone(x);

        final long end = current_timestamp(), elapsed = end - start;

        System.out.println(elapsed);
    }
}
