from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, create_engine, select, join, MetaData, Table


from . import clientes
from config_vars import BBDD_CONNECTION

Base = declarative_base()


class Ventas(Base):
    __tablename__ = "ventas"

    print("entering ventas config")
    engine = create_engine(BBDD_CONNECTION)
    metadata = MetaData()
    ventas = Table("ventas", metadata, autoload=True, autoload_with=engine, schema='cassatta')
    id_not_in_db = Column(Integer, primary_key=True)
    print("finished config for ventas")

    @classmethod
    def all_ventas(cls):
        """
            Cuáles son las fechas de las ventas
        """
        query = select([cls.ventas])
        return query

    @classmethod
    def venta_especifica(cls, *, idventa):
        """
            Cual es la venta con id = idventa
        """
        query = select([cls.venta]).where(cls.venta.c.idventa == idventa)
        return query

    '''@classmethod
    def doctors_by_headquarters(cls, *, heq_id, single_mode, doc_id):
        if not single_mode:
            """
                Cuáles son los médicos que atienden en la sucursal heq_id?
            """
            j = join(
                cls.doc,
                healthrelations.HealthRelations.hre,
                cls.doc.c.doc_id == healthrelations.HealthRelations.hre.c.doc_id,
            )
            query = (
                select([cls.doc])
                .select_from(j)
                .where(healthrelations.HealthRelations.hre.c.heq_id == heq_id)
            )
        else:
            """
                Cuál es el médico doc_id de la sede heq_id
            """
            j = join(
                cls.doc,
                healthrelations.HealthRelations.hre,
                cls.doc.c.doc_id == healthrelations.HealthRelations.hre.c.doc_id,
            )
            query = (
                select([cls.doc])
                .select_from(j)
                .where(cls.doc.c.doc_id == doc_id)
                .where(healthrelations.HealthRelations.hre.c.heq_id == heq_id)
            )

        return query

    @classmethod
    def doctors_by_hospital(cls, *, hos_id, single_mode, doc_id):
        """
            Cuáles son los médicos que atienden en el hospital hos_id?
        """
        if not single_mode:
            j = join(
                cls.doc,
                specialities.Specialities.msp,
                cls.doc.c.msp_id == specialities.Specialities.msp.c.msp_id,
            )
            query = (
                select([cls.doc])
                .select_from(j)
                .where(specialities.Specialities.msp.c.hos_id == hos_id)
            )
        else:
            """
                Cuál es el médico doc_id del hospital hos_id
            """
            j = join(
                cls.doc,
                specialities.Specialities.msp,
                cls.doc.c.msp_id == specialities.Specialities.msp.c.msp_id,
            )
            query = (
                select([cls.doc])
                .select_from(j)
                .where(cls.doc.c.doc_id == doc_id)
                .where(specialities.Specialities.msp.c.hos_id == hos_id)
            )
        return query

    @classmethod
    def doctors_by_speciality(cls, *, msp_id, single_mode, doc_id):
        if not single_mode:
            """
                 Cuáles son los médicos de la especialidad msp_id
            """
            query = select([cls.doc]).where(cls.doc.c.msp_id == msp_id)
        else:
            """
                 Cuál es el médico de doc_id de la especialidad msp_id
            """
            query = (
                select([cls.doc])
                .where(cls.doc.c.doc_id == doc_id)
                .where(cls.doc.c.msp_id == msp_id)
            )
        return query

    @classmethod
    def doctors_by_speciality_in_headquarters(
        cls, *, msp_id, heq_id, single_mode, doc_id
    ):
        if not single_mode:
            """
                 Cuáles son los médicos que atienden en la sede heq_id y de la especialidad msp_id?
            """
            j = join(
                cls.doc,
                healthrelations.HealthRelations.hre,
                cls.doc.c.doc_id == healthrelations.HealthRelations.hre.c.doc_id,
            ).join(
                headquarters.Headquarters.heq,
                headquarters.Headquarters.heq.c.heq_id
                == healthrelations.HealthRelations.hre.c.heq_id,
            )
            query = (
                select([cls.doc])
                .distinct()
                .select_from(j)
                .where(cls.doc.c.msp_id == msp_id)
                .where(healthrelations.HealthRelations.hre.c.heq_id == heq_id)
            )
        else:
            """
                Cuál es el médico doc_id de la sede heq_id
            """
            j = join(
                cls.doc,
                healthrelations.HealthRelations.hre,
                cls.doc.c.doc_id == healthrelations.HealthRelations.hre.c.doc_id,
            )
            query = (
                select([cls.doc])
                .select_from(j)
                .where(cls.doc.c.doc_id == doc_id)
                .where(healthrelations.HealthRelations.hre.c.heq_id == heq_id)
            )

        return query

    @classmethod
    def doctors_by_speciality_in_hospital(cls, *, msp_id, doc_id, single_mode, hos_id):
        if not single_mode:
            """
                Cuáles son los médicos disponibles de la especialidad msp_id del hospital hos_id
            """
            j = join(
                cls.doc,
                specialities.Specialities.msp,
                cls.doc.c.msp_id == specialities.Specialities.msp.c.msp_id,
            )
            query = (
                select([cls.doc])
                .select_from(j)
                .where(cls.doc.c.msp_id == msp_id)
                .where(specialities.Specialities.msp.c.hos_id == hos_id)
            )
        else:
            """
                Cuál es el médico doc_id de la especialidad msp_id
            """
            j = join(cls.doc, healthrelations.HealthRelations.hre, cls.doc.c.doc_id == healthrelations.HealthRelations.hre.c.doc_id).join(
                headquarters.Headquarters.heq, healthrelations.HealthRelations.hre.c.heq_id == headquarters.Headquarters.heq.c.heq_id
            )
            query = (
                select([cls.doc])
                .distinct()
                .select_from(j)
                .where(cls.doc.c.doc_id == doc_id)
                .where(headquarters.Headquarters.heq.c.hos_id == hos_id)
                .where(cls.doc.c.msp_id == msp_id)
            )

        return query'''
