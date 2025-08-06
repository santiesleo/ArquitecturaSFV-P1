# ArquitecturaSFV-P1

# Evaluación Práctica - Ingeniería de Software V

## Información del Estudiante
- **Nombre:** Santiago Escobar León
- **Código:** A00382203
- **Fecha:** Miércoles 6 Agosto

## Resumen de la Solución

Implementación de una aplicación Node.js contenerizada con Docker. Incluye un script de automatización para el despliegue y documentación completa del proceso.

La aplicación expone endpoints básicos para verificar su estado y proporcionar información del sistema.

## Dockerfile

### Decisiones Técnicas:

- Imagen base Alpine Linux para tamaño reducido
- Variables de entorno configuradas
- Optimización de capas de Docker
- Instalación simple de dependencias

### Estructura del Dockerfile:
```dockerfile
FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 8080
ENV NODE_ENV=production
ENV PORT=8080
CMD ["npm", "start"]
```

## Script de Automatización

### Funcionalidades:

- Verificación de Docker
- Limpieza de contenedores existentes
- Construcción automática de imagen
- Despliegue del contenedor
- Pruebas de conectividad
- Manejo de errores
- Información de estado

## Principios DevOps Aplicados

1. **Infraestructura como Código**: Dockerfile y script definen la infraestructura
2. **Automatización**: Script automatiza el proceso de despliegue
3. **Integración Continua**: Proceso ejecutable de forma repetible
4. **Monitoreo**: Endpoints de salud y logs incluidos
5. **Seguridad**: Imagen minimalista y optimizada
6. **Versionado**: Código versionado en Git

## Captura de Pantalla

image.png

## Mejoras Futuras

1. **Docker Compose**: Para manejar múltiples servicios
2. **CI/CD Pipeline**: Automatizar despliegue con GitHub Actions
3. **Monitoreo**: Implementar Prometheus y Grafana
4. **Tests**: Agregar tests unitarios e integración
5. **Configuración**: Variables de entorno externalizadas
6. **Logging**: Sistema de logs centralizado
7. **Escalabilidad**: Load balancer y múltiples instancias
8. **Backup**: Estrategias de backup y recuperación

## Instrucciones para Ejecutar

### Prerrequisitos:
- Docker instalado y ejecutándose
- Git para clonar el repositorio
- curl (opcional, para pruebas de conectividad)

### Pasos de Ejecución:

1. **Clonar el repositorio:**
   ```bash
   git clone [URL_DEL_REPOSITORIO]
   cd ArquitecturaSFV-P1
   ```

2. **Ejecutar el script de automatización:**
   ```bash
   ./deploy.sh
   ```

3. **Verificar que la aplicación funciona:**
   - Abrir http://localhost:8080 en el navegador
   - Verificar el endpoint de salud: http://localhost:8080/health

### Comandos Manuales (Alternativa):

Si prefieres ejecutar los comandos manualmente:

```bash
# Construir la imagen
docker build -t devops-evaluation-app .

# Ejecutar el contenedor
docker run -d --name devops-app-container \
  -p 8080:8080 \
  -e PORT=8080 \
  -e NODE_ENV=production \
  devops-evaluation-app

# Verificar logs
docker logs devops-app-container

# Probar la aplicación
curl http://localhost:8080/
curl http://localhost:8080/health
```

### Comandos de Limpieza:

```bash
# Detener y eliminar el contenedor
docker stop devops-app-container
docker rm devops-app-container

# Eliminar la imagen
docker rmi devops-evaluation-app
```

## Estructura del Proyecto

```
ArquitecturaSFV-P1/
├── app.js                 # Aplicación Node.js principal
├── package.json           # Dependencias y scripts
├── Dockerfile            # Configuración de contenerización
├── deploy.sh             # Script de automatización
├── README.md             # Documentación completa
└── rubrica.md            # Criterios de evaluación
```

## Tecnologías Utilizadas

- **Node.js**: Runtime de JavaScript
- **Express.js**: Framework web
- **Docker**: Contenerización
- **Bash**: Scripting de automatización
- **Alpine Linux**: Imagen base minimalista
