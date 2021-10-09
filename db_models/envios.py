from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, create_engine, select, join, MetaData, Table


from config_vars import BBDD_CONNECTION

Base = declarative_base()


class Envios(Base):
    __tablename__ = "envios"

    print("entering envios config")
    engine = create_engine(BBDD_CONNECTION)
    metadata = MetaData()
    envi = Table("envios", metadata, autoload=True, autoload_with=engine, schema='cassatta')
    id_not_in_db = Column(Integer, primary_key=True)
    print("finished config for envios")

    @classmethod
    def all_envios(cls):
        """
        """
        query = select([cls.envi])
        return query

    @classmethod
    def envios_id(cls, *, idenvios):
        """
        """
        query = select([cls.envi]).where(cls.envi.c.idenvios == idenvios)
        return query
