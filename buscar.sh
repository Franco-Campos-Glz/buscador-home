#!/bin/bash
if [ $# -gt 1 ]; then
  echo "Error: solo escribe un argumento (la carpeta donde buscar)."
  exit 1
fi
carpeta=${1:-.}
if [ ! -d "$carpeta" ]; then
  echo "Error: la carpeta \"$carpeta\" no existe."
  exit 2
fi
palabra="home"
echo "Buscando \"$palabra\" en: $carpeta"
grep -rl "$palabra" "$carpeta" 2>/dev/null
