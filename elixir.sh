#!/bin/sh

command -v elixir > /dev/null 2>&1 \
  && make -C elixir -s run \
  || echo "skipping elixir"

