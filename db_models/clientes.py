from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import create_engine, select, join, MetaData, Table, Column, Integer
from config_vars import BBDD_CONNECTION

Base = declarative_base()


class Clientes(Base):
    __tablename__ = "clientes"
    print("entering clientes config")
    engine = create_engine(BBDD_CONNECTION)
    metadata = MetaData()
    cli = Table("clientes", metadata, autoload=True, autoload_with=engine, schema='cassatta')
    id_not_in_db = Column(Integer, primary_key=True)
    print("finished config for clientes")

    @classmethod
    def clientes_id(cls, *, idclientes):
        """
        Cuáles son los clientes por id
        """
        query = select([cls.cli]).where(cls.cli.c.idclientes == idclientes)
        return query

    @classmethod
    def allclientes(cls):
        """
        Cuáles son las sedes de la sede heq_id
        """
        query = select([cls.cli])
        return query
