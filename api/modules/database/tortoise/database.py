from tortoise import Tortoise

# El script de Fish se encargará de añadir la importación de 'settings'

# Ruta de importación de Python donde se encuentran los modelos.
# El script de Fish se asegurará de que esta ruta sea correcta.
MODELS_PATH = "infrastructure.persistence.orm_models"

# Configuración principal para Tortoise-ORM
TORTOISE_ORM_CONFIG = {
    "connections": {"default": settings.DATABASE_URL},
    "apps": {
        "models": {
            # Lista de modelos a registrar.
            # 'aerich.models' es necesario para que las migraciones funcionen.
            "models": [f"{MODELS_PATH}.example_model", "aerich.models"],
            "default_connection": "default",
        },
    },
}


async def init_db():
    """
    Inicializa Tortoise ORM.
    Debe ser llamada en el evento de startup de FastAPI.
    """
    await Tortoise.init(
        config=TORTOISE_ORM_CONFIG
    )
    # Genera las tablas en la base de datos si no existen
    await Tortoise.generate_schemas()
