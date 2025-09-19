#!/usr/bin/env bash

if [ "$(uname)" = "Darwin" ]; then
  exec /bin/bash -l
else
  exec /usr/bin/bash -l   # or just "bash -l"
fi
