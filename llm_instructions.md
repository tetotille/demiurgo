# Guía para LLMs: "API Frameworks Generator"

## 1. Visión General del Proyecto

Este proyecto es una herramienta de interfaz de línea de comandos (CLI), escrita en **Fish shell**, diseñada para **generar la estructura inicial (scaffold) de nuevos proyectos de API en Python**. Su objetivo principal es automatizar la configuración inicial de una API basada en Python, guiando al usuario a través de una serie de preguntas y generando una estructura de proyecto completa basada en sus respuestas y un conjunto de plantillas predefinidas.

El script principal de entrada y la lógica reside en `create_api.fish`.

## 2. Conceptos Clave

-   **Interacción con el Usuario**: La herramienta es interactiva. Utiliza comandos `read` de Fish shell para recopilar la entrada del usuario, como el nombre del proyecto, el autor, el gestor de dependencias (Poetry o pip), el tamaño de la API (small, medium, large) y los subtipos de API pequeña.
-   **Generación Basada en Plantillas**: La creación de proyectos se realiza a partir de plantillas. Las plantillas y las lógicas específicas para cada tamaño de API se encuentran dentro de sus respectivos directorios en `api/`.
-   **Modularidad y Extensibilidad**:
    -   Las APIs se organizan por tamaño (`small`, `medium`, `large`).
    -   Dentro de cada tamaño (especialmente `small`), existen subtipos (ej. "Prototype or POC", "Lightweight Microservice") que definen diferentes estructuras de archivos iniciales.
    -   La estructura está diseñada para ser fácilmente extensible, permitiendo añadir nuevos componentes (autenticación, bases de datos) o nuevos tamaños de API.
-   **Gestión de Dependencias**: El generador soporta la configuración inicial con `Poetry` (instalando Poetry e inicializando el proyecto) o `pip` (creando un `requirements.txt`).

## 3. Estructura de Directorios del Proyecto

```
/frameworks-api/
├── create_api.fish     # El script principal del generador.
├── package.fish        # Script con la lógica para seleccionar y configurar Poetry o pip.
├── api/                # Contiene la lógica de generación y las plantillas.
│   ├── small/          # Lógica específica para APIs pequeñas.
│   │   ├── small.fish  # Script que define los subtipos de APIs pequeñas y su estructura.
│   │   └── templates/  # Plantillas base y de componentes para APIs pequeñas (ej. prototype/app.py).
│   ├── medium/         # Lógica específica para APIs medianas.
│   │   └── templates/  # Plantillas para APIs medianas.
│   └── large/          # Lógica específica para APIs grandes.
│       └── templates/  # Plantillas para APIs grandes.
├── project/            # Directorio temporal donde se genera el nuevo proyecto de API.
├── readme.md           # Documentación pública para usuarios humanos (en español).
├── gemini.md           # Guía original para LLMs (este archivo es una versión mejorada).
└── llm_instructions.md # Este archivo: Guía detallada para LLMs sobre el proyecto.
```

## 4. Archivos Clave y Sus Roles

-   **`create_api.fish`**: El punto de entrada principal. Se encarga de:
    1.  Mostrar prompts al usuario.
    2.  Leer la entrada del usuario.
    3.  Validar la entrada (básico).
    4.  Crear el directorio del proyecto (`project/`).
    5.  Delegar a `package.fish` para la gestión de dependencias.
    6.  Delegar a los scripts de tamaño de API (ej. `api/small/small.fish`) para la generación de la estructura específica.
-   **`package.fish`**: Contiene la función `select_package` que instala Poetry e inicializa un proyecto Poetry, o crea un `requirements.txt` para pip, basándose en la elección del usuario.
-   **`api/[tamaño]/[tamaño].fish` (ej. `api/small/small.fish`)**: Define la lógica para generar un proyecto de un tamaño específico. Por ejemplo, `small.fish` presenta los diferentes subtipos de API pequeña y sus correspondientes estructuras de archivos.
-   **`api/[tamaño]/templates/[subtipo]/...`**: Contienen los archivos de plantilla que se copian al nuevo proyecto. Estos archivos son texto plano y forman la base del proyecto generado.

## 5. Flujo de Trabajo para LLMs

Cuando se te solicite realizar una tarea o añadir una característica:

1.  **Entiende la Solicitud**: Clarifica qué se necesita. ¿Es un nuevo prompt? ¿Un nuevo componente de plantilla? ¿Un cambio en la lógica del script?
2.  **Identifica Archivos Relevantes**:
    -   Para el proceso interactivo o la lógica principal: `create_api.fish`.
    -   Para la selección de gestores de dependencias: `package.fish`.
    -   Para la lógica de tipos de API y su estructura: `api/[tamaño]/[tamaño].fish`.
    -   Para el código que se genera: `api/[tamaño]/templates/...`.
3.  **Modifica `create_api.fish` (o scripts relacionados)**:
    -   Añade nuevas funciones para prompts si es necesario.
    -   Usa `read` con flags adecuados (ej. `-P` para prompt, `-l` para ámbito local) para obtener la entrada del usuario.
    -   Implementa lógica (`if/else`, `switch`) para manejar las elecciones.
    -   Utiliza comandos de Fish shell como `mkdir`, `cd`, `cp -r` para crear directorios y copiar plantillas.
    -   Considera si se debe ejecutar `poetry add` para añadir dependencias específicas (ej. `sqlalchemy[asyncio]`, `asyncpg`) en el `pyproject.toml` del proyecto generado, si se usa Poetry.
4.  **Añade/Modifica Plantillas**:
    -   Crea nuevos archivos o directorios bajo la ruta `api/[tamaño]/templates/[subtipo]/` adecuada.
    -   Asegúrate de que las plantillas sean texto plano.
5.  **Validación Conceptual**: Antes de confirmar un cambio, revisa mentalmente la ejecución del script para asegurar que la nueva lógica se integra correctamente y que los archivos se copiarán a los lugares esperados. Comunica claramente los cambios realizados al usuario.

## 6. Estado Actual del Proyecto

-   El generador puede recopilar información básica (nombre, autor, email).
-   Puede configurar Poetry o crear un `requirements.txt` vacío.
-   La lógica para APIs `small` está implementada, ofreciendo cuatro subtipos, incluyendo un prototipo FastAPI con un `healthcheck`.
-   Las lógicas para `medium` y `large` están presentes pero con mínima implementación aún.
-   Se han identificado archivos de base de datos asíncronos (`database.py`, `dependency.py`) que requerirán que `SQLAlchemy[asyncio]` y un controlador de base de datos estén instalados en el entorno donde se ejecute el código generado.

## 7. Consideraciones Especiales

-   **Fish Shell**: Todos los scripts de generación están escritos en Fish shell. Presta atención a la sintaxis y los comandos específicos de Fish.
-   **Rutas Relativas**: Ten cuidado al manejar rutas relativas dentro de los scripts, ya que el directorio de trabajo puede cambiar (ej. `cd project`).