external current_timestamp : unit -> int = "ml_current_timestamp"
  [@@noalloc]

external plusone_32_noalloc : (int32 [@unboxed]) -> (int32 [@unboxed]) =
  "ml_plusone_bc" "plusone" [@@noalloc]

external plusone_32_alloc : (int32 [@unboxed]) -> (int32 [@unboxed]) =
  "ml_plusone_bc" "plusone"

external plusone_32_boxed : int32 -> int32 = "ml_plusone_bc"

external plusone_int_noalloc : int -> int = "ml_plusone" [@@noalloc]

external plusone_int_alloc : int -> int = "ml_plusone"

external plusone_int_untagged : (int [@untagged]) -> (int [@untagged]) =
  "ml_plusone" "ml_plusone_untagged" [@@noalloc]

let backend =
  match Sys.backend_type with
  | Sys.Native -> "native"
  | Sys.Bytecode -> "bytecode"
  | Sys.Other x -> x

let run_32_noalloc limit =
  let limit = Int32.of_int limit in
  let start_at = current_timestamp () in
  let x = ref Int32.zero in
  while !x < limit do
    x := plusone_32_noalloc !x
  done;
  let finish_at = current_timestamp () in
  prerr_endline ("ocaml(int32,noalloc," ^ backend ^ ") = " ^ string_of_int (finish_at - start_at))

let run_32_alloc limit =
  let limit = Int32.of_int limit in
  let start_at = current_timestamp () in
  let x = ref Int32.zero in
  while !x < limit do
    x := plusone_32_alloc !x
  done;
  let finish_at = current_timestamp () in
  prerr_endline ("ocaml(int32,alloc," ^ backend ^ ") = " ^ string_of_int (finish_at - start_at))

let run_32_boxed limit =
  let limit = Int32.of_int limit in
  let start_at = current_timestamp () in
  let x = ref Int32.zero in
  while !x < limit do
    x := plusone_32_boxed !x
  done;
  let finish_at = current_timestamp () in
  prerr_endline ("ocaml(int32,boxed," ^ backend ^ ") = " ^ string_of_int (finish_at - start_at))

let run_int_noalloc limit =
  let start_at = current_timestamp () in
  let x = ref 0 in
  while !x < limit do
    x := plusone_int_noalloc !x
  done;
  let finish_at = current_timestamp () in
  prerr_endline ("ocaml(int,noalloc," ^ backend ^ ") = " ^ string_of_int (finish_at - start_at))

let run_int_alloc limit =
  let start_at = current_timestamp () in
  let x = ref 0 in
  while !x < limit do
    x := plusone_int_alloc !x
  done;
  let finish_at = current_timestamp () in
  prerr_endline ("ocaml(int,alloc," ^ backend ^ ") = " ^ string_of_int (finish_at - start_at))

let run_int_untagged limit =
  let start_at = current_timestamp () in
  let x = ref 0 in
  while !x < limit do
    x := plusone_int_untagged !x
  done;
  let finish_at = current_timestamp () in
  prerr_endline ("ocaml(int,untagged," ^ backend ^ ") = " ^ string_of_int (finish_at - start_at))

let run_int_alloc limit =
  let start_at = current_timestamp () in
  let x = ref 0 in
  while !x < limit do
    x := plusone_int_alloc !x
  done;
  let finish_at = current_timestamp () in
  prerr_endline ("ocaml(int,alloc," ^ backend ^ ") = " ^ string_of_int (finish_at - start_at))

(*let run_int_untagged limit = *)
let run_default limit =
  let start_at = current_timestamp () in
  let x = ref 0 in
  while !x < limit do
    x := plusone_int_untagged !x
  done;
  let finish_at = current_timestamp () in
  prerr_endline (string_of_int (finish_at - start_at))

let () =
  let limit = int_of_string Sys.argv.(1) in
  run_default limit;
  (*
  run_int_noalloc limit;
  run_int_alloc limit;
  run_int_untagged limit;
  run_32_noalloc limit;
  run_32_alloc limit;
  run_32_boxed limit;
  *)
