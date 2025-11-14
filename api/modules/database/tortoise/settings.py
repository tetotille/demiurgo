from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    """Carga la configuración de la aplicación."""

    model_config = SettingsConfigDict(env_file=".env")

    # URL de conexión para Tortoise-ORM.
    # Para SQLite, es relativo al directorio del proyecto.
    DATABASE_URL: str = "sqlite://db.sqlite3"


settings = Settings()
