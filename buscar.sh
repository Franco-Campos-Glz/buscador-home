#!/bin/bash
if [ $# -eq 0 ]; then
  echo "Error: no escribiste la palabra a buscar."
  echo "Uso: ./buscar.sh palabra [carpeta]"
  exit 1
elif [ $# -gt 2 ]; then
  echo "Error: escribiste $# argumentos. Máximo son 2 (palabra y carpeta)."
  echo "Uso: ./buscar.sh palabra [carpeta]"
  exit 2
fi
palabra=$1
carpeta=${2:-/}
if [ ! -d "$carpeta" ]; then
  echo "Error: la carpeta \"$carpeta\" no existe."
  exit 3
fi
echo "Buscando \"$palabra\" en: $carpeta"
resultados=$(grep -rlI -D skip "$palabra" "$carpeta" 2>/dev/null)
if [ -z "$resultados" ]; then
  echo "No se encontró \"$palabra\" en ningún archivo."
  exit 4
fi
echo "$resultados"
total=$(echo "$resultados" | wc -l | tr -d ' ')
echo "Total de archivos encontrados: $total"
echo "$resultados" > resultados.txt
echo "Resultados guardados en resultados.txt"
exit 0
# Colaboración de Alejandro
