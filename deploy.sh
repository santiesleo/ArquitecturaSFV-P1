#!/bin/bash

set -e

IMAGE_NAME="devops-evaluation-app"
CONTAINER_NAME="devops-app-container"
PORT=8080

echo "Verificando Docker..."
if ! command -v docker &> /dev/null; then
    echo "Error: Docker no está instalado"
    exit 1
fi

echo "Limpiando contenedores..."
docker stop ${CONTAINER_NAME} 2>/dev/null || true
docker rm ${CONTAINER_NAME} 2>/dev/null || true

echo "Construyendo imagen..."
docker build -t ${IMAGE_NAME} .

echo "Ejecutando contenedor..."
docker run -d --name ${CONTAINER_NAME} -p ${PORT}:${PORT} -e PORT=${PORT} -e NODE_ENV=production ${IMAGE_NAME}

sleep 5

echo "Probando aplicación..."
curl -f -s http://localhost:${PORT}/health > /dev/null && echo "Health check OK"
curl -f -s http://localhost:${PORT}/ > /dev/null && echo "App OK"

echo "Aplicación disponible en http://localhost:${PORT}" 