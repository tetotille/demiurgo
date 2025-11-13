from sqlalchemy import Column, Integer, String


class ExampleModel(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True)
    column1 = Column(String(100), unique=True, index=True)
    column2 = Column(String(255))
