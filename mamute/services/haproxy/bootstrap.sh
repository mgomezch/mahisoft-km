#!/usr/bin/env bash

for i in {1..10}
do
  echo "Attempt ${i} to generate certificates"
  /certs.sh && break
  sleep 3
done

exec supervisord -n
