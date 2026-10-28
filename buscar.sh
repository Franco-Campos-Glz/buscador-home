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
resultados=$(grep -rl "$palabra" "$carpeta" 2>/dev/null)
if [ -z "$resultados" ]; then
  echo "No se encontró \"$palabra\" en ningún archivo."
  exit 3
fi
echo "$resultados"
total=$(echo "$resultados" | wc -l | tr -d ' ')
echo "Total de archivos encontrados: $total"
echo "$resultados" > resultados.txt
echo "Resultados guardados en resultados.txt"
exit 0
