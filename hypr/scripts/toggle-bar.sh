#!/usr/bin/env sh

p=$(pidof waybar)

if [ -z ${p} ]; then
  echo "unset"
  waybar&
else
  kill $p
fi
