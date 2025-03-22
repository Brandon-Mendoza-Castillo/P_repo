#!/bin/bash

# Fechas de inicio y fin
START_DATE="2025-01-01"
END_DATE="2025-03-22"

# Generar una cantidad fija de commits diarios para mantener el color uniforme
current_date="$START_DATE"
while [[ "$current_date" < "$END_DATE" || "$current_date" == "$END_DATE" ]]; do
    for ((i = 1; i <= 20; i++)); do  # Ajusta este número para cambiar la intensidad
        echo "Commit del $current_date - $i" >> contribuciones.txt
        git add contribuciones.txt
        GIT_COMMITTER_DATE="$current_date 12:00:00" \
        GIT_AUTHOR_DATE="$current_date 12:00:00" \
        git commit -m "Commit uniforme para $current_date - $i"
    done
    current_date=$(date -I -d "$current_date + 1 day")
done

# Subir los cambios
git push origin main

