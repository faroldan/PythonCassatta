from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, create_engine, MetaData, Table, select
from config_vars import BBDD_CONNECTION

Base = declarative_base()


class Productos(Base):
    __tablename__ = "productos"
    print("entering parameters config")
    engine = create_engine(BBDD_CONNECTION)
    metadata = MetaData()
    prod = Table("productos", metadata, autoload=True, autoload_with=engine, schema='cassatta')
    id_not_in_db = Column(Integer, primary_key=True)
    print("finished config for parameters")
    
    @classmethod
    def productos_id(cls, *, idproductos):
        """
        producto por id
        """
        query = select([cls.prod]).where(cls.prod.c.idproductos == idproductos)
        return query
     
    @classmethod
    def allproductos(cls):
        """
        todos los productos
        """
        query = select([cls.prod])
        return query

    @classmethod
    def condition_productos(cls, *, idproductos):
        """
        Productos con precio mayor a 10000
        """
        query = select([cls.prod]).where(cls.prod.c.precio_unit>10000)
        return query