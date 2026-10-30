# buscador-home

Programa en bash que busca una palabra o frase en los archivos de una carpeta (incluyendo subcarpetas). Muestra la ubicación de cada archivo y el número de veces que aparece, y guarda los resultados en resultados.txt.

## Uso

```
./buscar.sh "palabra o frase" carpeta
```

## Ejemplo

```
./buscar.sh "estudio de mercado" pruebas2
```

## Prompt utilizado

Se usó ChatGPT con el programa de la actividad "Manejo de versiones con git" y este prompt:

"Modifícalo para que: 1) reciba la palabra o frase a buscar como primer argumento y la carpeta como segundo argumento, 2) busque en todos los archivos de texto de esa carpeta y sus subcarpetas, 3) muestre la ubicación de cada archivo donde aparece la palabra y el número de veces que aparece en ese archivo, 4) funcione en macOS con bash."
