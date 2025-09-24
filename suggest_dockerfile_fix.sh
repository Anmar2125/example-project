#!/bin/bash
# Este script revisa el Dockerfile y sugiere correcciones

DOCKERFILE="Dockerfile"
errors_found=false

echo "Analizando Dockerfile para errores comunes..."

# Detectar uso de "python" en lugar de "python3"
if grep -q "\bpython\b" "$DOCKERFILE"; then
    echo "Posible error: se encontró 'python'. Se sugiere usar 'python3'."
    errors_found=true
fi

# Detectar uso de ':latest' en imagen base
if grep -q "^FROM .*:latest" "$DOCKERFILE"; then
    echo "  Se está usando ':latest' en la imagen base. Considera usar una versión específica."
    errors_found=true
fi

# Detectar falta de usuario (security)
if ! grep -q "^USER " "$DOCKERFILE"; then
    echo " No se ha definido un usuario. Considera usar USER para seguridad."
    errors_found=true
fi

if [ "$errors_found" = true ]; then
    echo "Se encontraron posibles problemas. Revísalos antes de fusionar."
    exit 1  # Workflow falla, bloqueando merge
else
    echo "Dockerfile sin errores comunes detectados."
fi
