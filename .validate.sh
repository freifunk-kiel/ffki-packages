#!/bin/bash
set -uo pipefail

P="$(pwd)"
echo "####### check if lua5.1 is installed ..."
which lua5.1 
if [ "$?" == 1 ]; then
  echo lua5.1 not present!
  echo install with sudo apt install lua5.1
  exit 1
fi

echo "####### Lua linter check for all package feeds ..."
find . -name '*.lua'|while read f; do
  ~/.luarocks/bin/luacheck "$f"
done
