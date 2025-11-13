from typing import AsyncGenerator

from sqlalchemy.ext.asyncio import AsyncSession


async def get_db_session() -> AsyncGenerator[AsyncSession, None]:
    """
    Dependencia de FastAPI que gestiona el ciclo de vida de la
    sesión de SQLAlchemy (abrir y cerrar).
    """
    async with AsyncSessionLocal() as session:
        try:
            yield session
        finally:
            # Asegura que la sesión se cierre, incluso si hay un error
            await session.close()
