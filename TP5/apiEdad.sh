#!/bin/bash

# Solicitar al usuario que ingrese un nombre
echo "Por favor, ingresa un nombre:"
read nombre

# Hacer una solicitud a la API
respuesta=$(curl -s "https://api.agify.io/?name=$nombre")

# Extraer el género de la respuesta usando jq
genero=$(echo $respuesta | grep -o '"age":[^,]*' | grep -o '[0-9]\+')

# Verificar si se encontró el género
if [ -n "$genero" ]; then
  echo "La edad estimada para el nombre $nombre es: $genero"
else
  echo "No se encontró información sobre la edad estimada del nombre $nombre."
fi
