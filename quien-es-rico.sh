#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Leer nombre (no vacío) usando -r -p
while true; do
  read -r -p "Ingrese su nombre: " nombre
  if [ -n "${nombre-}" ]; then
    break
  fi
  echo "El nombre no puede estar vacío. Intente de nuevo."
done

# Leer edad usando -r -p y validar que sea un entero entre 0 y 150
while true; do
  read -r -p "Ingrese su edad (años): " edad
  if [[ "$edad" =~ ^[0-9]+$ ]]; then
    if (( edad >= 0 && edad <= 150 )); then
      break
    else
      echo "Ingrese una edad entre 0 y 150."
    fi
  else
    echo "Edad inválida. Introduzca un número entero (por ejemplo: 30)."
  fi
done

# Mostrar valores capturados
echo
echo "Hola, $nombre tu tienes $edad años y eres rico"
