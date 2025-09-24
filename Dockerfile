# Dockerfile
FROM python:3.11-slim

# Instalar dependencias necesarias
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Carpeta de trabajo
WORKDIR /app

# Copiar requerimientos e instalarlos
COPY requerimientos.txt .
RUN pip install --no-cache-dir -r requerimientos.txt

# Copiar todo el proyecto
COPY . /app

# Hacer visible la carpeta /app como módulo
ENV PYTHONPATH=/app

# Instalar pytest para ejecutar tests
RUN pip install --no-cache-dir pytest

# Comando por defecto (puedes sobreescribirlo con docker run)
CMD ["pytest", "-v"]
