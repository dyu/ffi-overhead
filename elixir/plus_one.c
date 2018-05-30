#include <stdio.h>
#include <stdlib.h>
#include <erl_nif.h>
#include <stdint.h>
#include <stddef.h>
#include "../newplus/plus.h"

static ERL_NIF_TERM
plus_one(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {
  int x;
  if (!enif_get_int(env, argv[0], &x)) {
    return enif_make_badarg(env);
  }
  return enif_make_int(env, plusone(x));
}

static ErlNifFunc nif_funcs[] = {
    {"plus_one", 1, plus_one},
};

ERL_NIF_INIT(Elixir.S, nif_funcs, NULL, NULL, NULL, NULL)
