from tortoise import fields, models


class ExampleModel(models.Model):
    """
    Modelo de ejemplo para Tortoise ORM.
    """
    id = fields.IntField(pk=True)
    column1 = fields.CharField(max_length=100, unique=True, index=True)
    column2 = fields.TextField()

    def __str__(self):
        return self.column1
