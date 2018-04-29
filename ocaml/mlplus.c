#include <caml/mlvalues.h>
#include <caml/alloc.h>
#include "../newplus/plus.h"

CAMLprim value ml_plusone(value x)
{
  return Val_long(plusone(Long_val(x)));
}

CAMLprim intnat ml_plusone_untagged(intnat x)
{
  return plusone(x);
}

CAMLprim value ml_plusone_bc(value x)
{
  return caml_copy_int32(plusone(Int32_val(x)));
}

CAMLprim value ml_current_timestamp(value unit)
{
  return Val_long(current_timestamp());
}
