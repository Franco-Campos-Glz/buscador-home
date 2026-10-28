#!/bin/bash
palabra=$1
carpeta=${2:-/}
echo "Buscando \"$palabra\" en: $carpeta"
grep -rlI -D skip "$palabra" "$carpeta" 2>/dev/null
