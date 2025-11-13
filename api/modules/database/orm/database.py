from sqlalchemy.ext.asyncio import AsyncSession, async_sessionmaker, create_async_engine
from sqlalchemy.orm import DeclarativeBase

# 1. Crear el Motor (Engine) una sola vez
async_engine = create_async_engine(
    settings.DATABASE_URL,
    echo=True,  # Log de SQL (útil en desarrollo)
)

# 2. Crear el Creador de Sesiones (SessionMaker)
AsyncSessionLocal = async_sessionmaker(
    bind=async_engine,
    class_=AsyncSession,
    expire_on_commit=False,  # Importante para async
)


# 3. Base declarativa para los modelos
class Base(DeclarativeBase):
    pass
