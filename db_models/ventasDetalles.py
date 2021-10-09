from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, create_engine, MetaData, Table, select
from config_vars import BBDD_CONNECTION

Base = declarative_base()


class VentasDetalles(Base):
    __tablename__ = "ventas_detalles"
    print("Ingresando parametros de config")
    engine = create_engine(BBDD_CONNECTION)
    metadata = MetaData()
    venDet = Table("ventas_detalles", metadata, autoload=True, autoload_with=engine, schema='cassatta')
    id_not_in_db = Column(Integer, primary_key=True)
    print("Finalizando config")
    
    @classmethod
    def parameters_by_id(cls, *, idventa):
        """
        Cuáles son los parámetros
        """
        query = select([cls.venDet]).where(cls.venDet.c.idventa == idventa)
        return query
        
