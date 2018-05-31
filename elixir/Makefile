CFLAGS= -std=c11 -O2 -Wall -Wextra -Wno-unused-parameter
ERLANG_PATH = $(shell erl -eval 'io:format("~s", [lists:concat([code:root_dir(), "/erts-", erlang:system_info(version), "/include"])])' -s init stop -noshell)
CFLAGS += -I$(ERLANG_PATH)

plus_one.so: plus_one.c
	cc $(CFLAGS) -shared -fPIC plus_one.c ../newplus/plus.c -o plus_one.so
