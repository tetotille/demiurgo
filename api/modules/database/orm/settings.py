from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    """Carga la configuración de la aplicación."""

    model_config = SettingsConfigDict(env_file=".env")

    # URL de conexión de SQLAlchemy
    DATABASE_URL: str = "sqlite:///./sql_app.db"


settings = Settings()
