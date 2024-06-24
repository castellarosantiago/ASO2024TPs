#!/bin/bash

# Función para mostrar el tiempo transcurrido en segundos
show_time() {
    end_time=$(date +%s)
    elapsed=$((end_time - start_time))
    echo "Tiempo transcurrido: $elapsed segundos"
}

# Inicialización de variables
start_time=0
running=false

# Menú de opciones
while true; do
    echo "Seleccione una opción:"
    echo "1. Iniciar"
    echo "2. Detener"
    echo "3. Reiniciar"
    echo "4. Salir"
    read -r option

    case $option in
        1)
            if $running; then
                echo "El cronómetro ya está en marcha."
            else
                start_time=$(date +%s)
                running=true
                echo "Cronómetro iniciado."
            fi
            ;;
        2)
            if $running; then
                show_time
                running=false
            else
                echo "El cronómetro no está en marcha."
            fi
            ;;
        3)
            if $running; then
                end_time=$(date +%s)
                elapsed=$((end_time - start_time))
                echo "$elapsed segundos transcurridos, reinicio realizado."
            fi
            start_time=$(date +%s)
            running=true
            echo "Cronómetro reiniciado."
            ;;
        4)
            if $running; then
                show_time
            fi
            echo "Saliendo..."
            break
            ;;
        *)
            echo "Opción no válida. Por favor, seleccione una opción válida."
            ;;
    esac
done

