#!/usr/bin/env bash

inotifywait -e close_write,modify,create,delete -m -r Game | while read -r directory events filename; do
  if [[ ! -z "$pid" ]]; then
    kill -9 $pid
    pid=""
  fi
  echo "$filename changed"
  lake build &
  pid=$!
done
