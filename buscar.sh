#!/bin/bash
carpeta=${1:-.}
palabra="home"
echo "Buscando \"$palabra\" en: $carpeta"
grep -rl "$palabra" "$carpeta" 2>/dev/null
