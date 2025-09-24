# Dockerfile
FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Carpeta de trabajo dentro del contenedor
WORKDIR /app

# Copiar solo requerimientos.txt 
COPY requerimientos.txt .

# Instalar todas las dependencias del proyecto
RUN pip install --no-cache-dir -r requerimientos.txt

# Copiar todo el proyecto al contenedor
COPY . /app

# Instalar pytest si quieres ejecutar tests
RUN pip install --no-cache-dir pytest
