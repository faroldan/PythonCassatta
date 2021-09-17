from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, create_engine, select, join, MetaData, Table
from config_vars import BBDD_CONNECTION

Base = declarative_base()


class Envasados(Base):
    __tablename__ = "envasados"

    print("entering healthrelations config")
    engine = create_engine(BBDD_CONNECTION)
    metadata = MetaData()
    env = Table("envasados", metadata, autoload=True, autoload_with=engine, schema='Cassatta')
    id_not_in_db = Column(Integer, primary_key=True)
    print("finished config for healthrealations")

    @classmethod
    def all_envasados(cls):
        """
            todos envasados
        """
        query = select([cls.env])
        return query

    @classmethod
    def envasados_id(cls, *, idenvasados):
        """
        """
        query = select([cls.env]).where(cls.cli.c.idenvasados == idenvasados)
        return query