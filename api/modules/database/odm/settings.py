from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    """Carga la configuración de la aplicación."""

    model_config = SettingsConfigDict(env_file=".env")

    # URL de conexión de MongoDB
    DATABASE_URL: str = "mongodb://localhost:27017"
    # Nombre de la base de datos
    DATABASE_NAME: str = "my_app_db"


settings = Settings()
