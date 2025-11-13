# Generador de Frameworks de API

Una herramienta CLI (interfaz de línea de comandos) sencilla, potente y extensible para generar la estructura inicial de nuevos proyectos de API.

Este generador te ayuda a poner en marcha tu próxima API basada en Python en segundos, creando una estructura de proyecto completa basada en tus elecciones.

## Características

-   **Configuración Interactiva**: Un asistente fácil de usar te guía a través del proceso de configuración.
-   **Múltiples Tamaños de API**: Elige entre plantillas de API `small` (pequeña), `medium` (mediana) o `large` (grande), adaptadas a diferentes escalas de proyecto.
    *   **Tipos de API Pequeñas**: Para APIs `small`, puedes elegir entre:
        *   **Prototipo o Prueba de Concepto (POC)**: Ideal para pruebas rápidas y APIs muy simples (actualmente implementa una API FastAPI con un `healthcheck`).
        *   **Microservicio Ligero**: Para servicios con una funcionalidad limitada.
        *   **Aplicación con algunos Endpoints**: Una aplicación con una cantidad moderada de rutas.
        *   **Herramientas Internas**: Para utilidades y herramientas de uso interno.
-   **Componentes Personalizables**: Selecciona componentes opcionales para incluir, como:
    *   Gestión de Dependencias (`Poetry`, `pip`)
    *   Autenticación (`Basic Auth`, `JWT`, `OAuth2`) - *Funcionalidad planificada*
    *   ORMs de Base de Datos (`SQLAlchemy`, `Tortoise ORM`) - *Funcionalidad planificada*
-   **Construido con Fish Shell**: El script principal está escrito en la moderna y fácil de usar [Fish shell](https://fishshell.com/).

## Empezando

### Prerrequisitos

-   [Fish Shell](https://fishshell.com/) instalado en tu sistema.
-   `pip` instalado para gestionar paquetes de Python (necesario para instalar Poetry si se selecciona).
-   `poetry` si eliges este gestor de dependencias (el generador puede instalarlo por ti).

### Uso

1.  Haz el script ejecutable:
    ```fish
    chmod +x create_api.fish
    ```

2.  Ejecuta el script:
    ```fish
    ./create_api.fish
    ```

3.  Sigue las indicaciones en pantalla para configurar y generar tu nuevo proyecto de API. El proyecto se creará en un nuevo directorio en tu ubicación actual.

## Estructura del Proyecto

El generador utiliza un sistema de plantillas modular. Las lógicas de generación y las plantillas para cada tamaño de API se encuentran dentro del directorio `api/`.

```
/
├── create_api.fish     # El script principal del generador.
├── api/                # Contiene la lógica y las plantillas para cada tamaño de API.
│   ├── small/          # Lógica específica para APIs pequeñas.
│   │   └── templates/  # Plantillas base y de componentes para APIs pequeñas (ej. prototype/app.py).
│   ├── medium/         # Lógica específica para APIs medianas.
│   │   └── templates/  # Plantillas para APIs medianas.
│   └── large/          # Lógica específica para APIs grandes.
│       └── templates/  # Plantillas para APIs grandes.
└── project/            # Directorio donde se genera el nuevo proyecto de API.
```

## Contribución

¡Las contribuciones son bienvenidas! Si tienes una idea para una nueva característica o una mejora de plantilla, no dudes en abrir un issue o enviar un pull request.