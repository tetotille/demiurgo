import motor.motor_asyncio
from beanie import init_beanie

# El script de Fish se encargará de añadir las importaciones necesarias aquí, como:
# from core.settings import settings
# from infrastructure.persistence.odm_models.example_model import ExampleModel


async def init_db():
    """
    Inicializa la conexión a la base de datos y Beanie.
    Esta función debe ser llamada durante el evento de startup de FastAPI.
    """
    # Crea el cliente de Motor para conectar con MongoDB
    client = motor.motor_asyncio.AsyncIOMotorClient(settings.DATABASE_URL)
    database = client[settings.DATABASE_NAME]

    # Inicializa Beanie con la base de datos y los modelos (documentos)
    await init_beanie(
        database=database,
        document_models=[
            ExampleModel,
            # Añade aquí otros modelos que vayas creando
        ]
    )
