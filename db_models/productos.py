from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, create_engine, MetaData, Table, select
from config_vars import BBDD_CONNECTION

Base = declarative_base()


class Productos(Base):
    __tablename__ = "productos"
    print("entering prod config")
    engine = create_engine(BBDD_CONNECTION)
    metadata = MetaData()
    prod = Table("productos", metadata, autoload=True, autoload_with=engine, schema='cassatta')
    id_not_in_db = Column(Integer, primary_key=True)
    print("finished config for products")
    
    @classmethod
    def productos_by_id(cls, *, idproductos):
        """
        Cuáles son los prod
        """
        query = select([cls.ins]).where(cls.prod.c.idproductos == idproductos)
        return query
    
       @classmethod
        def productos_all(cls, *, idproductos):
            """
            todos los productos
            """
            query = select([cls.ins])
            return query
        
