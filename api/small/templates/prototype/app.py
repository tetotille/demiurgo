from fastapi import FastAPI
from fastapi.responses import JSONResponse

# Crea una instancia de la aplicación FastAPI
app = FastAPI(
    title="API Sencilla",
    description="Una api de ejemplo",
    version="0.1.0",
)


@app.get("/health", summary="Verifica el estado de la aplicación")
async def healthcheck():
    """
    Endpoint para verificar la salud de la aplicación.
    Retorna un mensaje de estado "OK" si la aplicación está funcionando.
    """
    return JSONResponse(content={"status": "OK"}, status_code=200)
