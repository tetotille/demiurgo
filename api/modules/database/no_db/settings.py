from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    """
    Carga la configuración de la aplicación.
    Versión base sin configuración de base de datos.
    """
    model_config = SettingsConfigDict(env_file=".env")

    # Configuraciones generales de la aplicación
    APP_NAME: str = "My FastAPI App"
    DEBUG: bool = False


settings = Settings()
