#![feature(libc)]

extern crate libc;

extern
{
    //fn plus(x: libc::c_int, y: libc::c_int) -> libc::c_int;
    fn plusone(x: libc::c_int) -> libc::c_int;
    fn current_timestamp() -> libc::c_long;
}

fn main()
{
    unsafe
    {
        // start immediately
        let start = current_timestamp();
        
        let mut x = 0;
        while x < 2000000000 {
            x = plusone(x);
        }
        
        let end = current_timestamp();
        let elapsed = end - start;
        
        println!("{}", elapsed);
    }
}
