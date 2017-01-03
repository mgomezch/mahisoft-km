#!/bin/bash
set -e

if [ "$1" = 'mamute' ]; then
  shift
  PORT=${MAMUTE_PORT} exec 'run.sh' "$@"
fi

exec "$@"
