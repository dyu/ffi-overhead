use std::libc::*;

#[link_args = "-lnewplus"]
extern
{
    fn plus(x: c_int, y: c_int) -> c_int;
    fn plusone(x: c_int) -> c_int;
    fn current_timestamp() -> c_long;
}

#[fixed_stack_segment]
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
