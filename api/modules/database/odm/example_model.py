from beanie import Document


class ExampleModel(Document):
    """
    Modelo de ejemplo para Beanie.
    Representa un documento en una colección de MongoDB.
    """
    # Beanie usa type hints de Python para definir los campos.
    column1: str
    column2: int

    class Settings:
        # Nombre de la colección en MongoDB
        name = "users"
