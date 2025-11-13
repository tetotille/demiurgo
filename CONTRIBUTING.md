# Guía de Contribución para el Generador de Frameworks de API

¡Estamos encantados de que estés interesado en contribuir al "Generador de Frameworks de API"! Tu ayuda es invaluable para mejorar esta herramienta. Siguiendo estas directrices, podemos asegurar una experiencia de colaboración fluida y efectiva para todos.

## Tabla de Contenidos

1.  [Código de Conducta](#1-código-de-conducta)
2.  [Cómo Contribuir](#2-cómo-contribuir)
    *   [Reportar Errores](#reportar-errores)
    *   [Sugerir Mejoras](#sugerir-mejoras)
    *   [Contribuir con Código](#contribuir-con-código)
3.  [Configuración del Entorno de Desarrollo](#3-configuración-del-entorno-de-desarrollo)
4.  [Estructura del Proyecto](#4-estructura-del-proyecto)
5.  [Proceso de Pull Request](#5-proceso-de-pull-request)
6.  [Licencia](#6-licencia)

---

## 1. Código de Conducta

Este proyecto y su comunidad se rigen por el [Código de Conducta](CODE_OF_CONDUCT.md). Al participar, se espera que mantengas este código. Por favor, sé respetuoso y abierto a diferentes puntos de vista.

## 2. Cómo Contribuir

Hay muchas maneras de contribuir a este proyecto, incluso si no escribes código.

### Reportar Errores

Si encuentras un error en el generador, en el código generado o en la documentación:

1.  **Busca en Issues**: Antes de abrir uno nuevo, revisa si el error ya ha sido reportado.
2.  **Abre un Issue**: Si no existe, abre un nuevo issue con la etiqueta "bug".
3.  **Proporciona Detalles**:
    *   Una descripción clara y concisa del error.
    *   Pasos para reproducir el error.
    *   El comportamiento esperado y el comportamiento real.
    *   Tu sistema operativo, versión de Fish shell, y cualquier otra información relevante del entorno.

### Sugerir Mejoras

¿Tienes una idea para una nueva característica, un nuevo tamaño de API, un componente personalizable, o una mejora en el flujo de trabajo?

1.  **Busca en Issues**: Revisa si la sugerencia ya existe.
2.  **Abre un Issue**: Si no existe, abre un nuevo issue con la etiqueta "feature" o "enhancement".
3.  **Describe tu Idea**: Explica claramente la mejora, por qué crees que es útil y, si es posible, cómo podría implementarse.

### Contribuir con Código

¡Nos encantan las contribuciones de código! Si deseas implementar una nueva característica o corregir un error:

1.  **Discute Primero**: Para características grandes o cambios significativos, es recomendable abrir un issue primero para discutir la idea y asegurarse de que se alinee con la dirección del proyecto.
2.  **Fork el Repositorio**: Crea un fork del repositorio principal en tu cuenta de GitHub.
3.  **Crea una Rama**: Crea una nueva rama para tu trabajo (`git checkout -b feature/nombre-de-la-caracteristica` o `bugfix/descripcion-del-bug`).
4.  **Desarrolla tu Solución**: Implementa tu código, siguiendo las convenciones de estilo existentes.
5.  **Añade Pruebas (si aplica)**: Si es relevante, añade pruebas para tu nueva funcionalidad o corrección.
6.  **Actualiza la Documentación**: Si tu cambio afecta el comportamiento o la configuración, actualiza `readme.md` y `llm_instructions.md` si es necesario.
7.  **Realiza Commits Atómicos**: Haz commits pequeños y bien definidos con mensajes claros que describan cada cambio.
8.  **Envía un Pull Request (PR)**: Cuando tu trabajo esté listo, envía un PR a la rama `main` del repositorio original.

## 3. Configuración del Entorno de Desarrollo

Para trabajar en el generador:

1.  **Clona tu Fork**: `git clone https://github.com/tu-usuario/frameworks-api.git`
2.  **Instala Fish Shell**: Asegúrate de tener [Fish Shell](https://fishshell.com/) instalado.
3.  **Haz el Script Ejecutable**: `chmod +x create_api.fish`
4.  **Prueba el Generador**: Ejecuta `./create_api.fish` para familiarizarte con su funcionamiento.
5.  **Python y Poetry/pip**: Si estás trabajando en plantillas Python, asegúrate de tener un entorno Python configurado. Si planeas que el generador instale Poetry, puedes probar esa funcionalidad localmente.

## 4. Estructura del Proyecto

Familiarízate con la [Estructura del Proyecto](#estructura-del-proyecto) en `readme.md` y `llm_instructions.md`. Los archivos clave son:

*   `create_api.fish`: Lógica principal del generador.
*   `package.fish`: Gestión de dependencias (Poetry/pip).
*   `api/`: Contiene la lógica y las plantillas para cada tamaño de API (`small`, `medium`, `large`).
    *   `api/[tamaño]/[tamaño].fish`: Lógica de generación específica por tamaño y subtipo.
    *   `api/[tamaño]/templates/`: Contiene los archivos de plantilla que se copian.

## 5. Proceso de Pull Request

1.  Asegúrate de que tu rama esté actualizada con `main`.
2.  Envía el PR a la rama `main`.
3.  Describe claramente los cambios, el problema que resuelve o la característica que implementa.
4.  Incluye capturas de pantalla o GIFs si son útiles para demostrar la funcionalidad visual.
5.  Sé receptivo a los comentarios y sugerencias del revisor.

## 6. Licencia

Al contribuir a este proyecto, aceptas que tus contribuciones se licenciarán bajo la [Licencia MIT](LICENSE) del proyecto.

---

¡Gracias por tu tiempo y esfuerzo!