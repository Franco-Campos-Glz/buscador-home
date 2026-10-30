#!/bin/bash

# Verificar que se reciban dos argumentos
if [ $# -ne 2 ]; then
  echo "Error: debes escribir una palabra o frase y una carpeta."
  echo 'Uso: ./buscar.sh "palabra o frase" carpeta'
  exit 1
fi

# Guardar los argumentos
palabra="$1"
carpeta="$2"

# Verificar que la carpeta exista
if [ ! -d "$carpeta" ]; then
  echo "Error: la carpeta \"$carpeta\" no existe."
  exit 2
fi

# Verificar que la búsqueda no esté vacía
if [ -z "$palabra" ]; then
  echo "Error: la palabra o frase no puede estar vacía."
  exit 3
fi

echo "Buscando \"$palabra\" en: $carpeta"
echo "----------------------------------------"

total=0
archivos=0

# Buscar en la carpeta y sus subcarpetas
while IFS= read -r -d '' archivo; do

  # Verificar que sea un archivo de texto
  if LC_ALL=C grep -Iq . "$archivo"; then

    # Contar las apariciones de la palabra o frase
    cantidad=$(grep -oF "$palabra" "$archivo" | wc -l | tr -d ' ')

    if [ "$cantidad" -gt 0 ]; then
      echo "Archivo: $archivo"
      echo "Apariciones: $cantidad"
      echo "----------------------------------------"

      archivos=$((archivos + 1))
      total=$((total + cantidad))
    fi
  fi

done < <(find "$carpeta" -type f -print0)

# Mostrar el resumen
if [ "$archivos" -eq 0 ]; then
  echo "No se encontró \"$palabra\" en ningún archivo."
  exit 4
fi

echo "Total de archivos encontrados: $archivos"
echo "Total de apariciones: $total"

exit 0
