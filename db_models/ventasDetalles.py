from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, create_engine, MetaData, Table, select
from config_vars import BBDD_CONNECTION

Base = declarative_base()


class VentasDetalles(Base):
    __tablename__ = "ventas_detalles"
    print("entering parameters config")
    engine = create_engine(BBDD_CONNECTION)
    metadata = MetaData()
    hos = Table("hospitals", metadata, autoload=True, autoload_with=engine, schema='hca')
    id_not_in_db = Column(Integer, primary_key=True)
    print("finished config for parameters")
    
    @classmethod
    def parameters_by_id(cls, *, hos_id):
        """
        Cuáles son los parámetros
        """
        query = select([cls.hos]).where(cls.hos.c.hos_id == hos_id)
        return query
        
