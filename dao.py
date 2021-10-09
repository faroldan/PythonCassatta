#from sqlalchemy import create_engine, select, join, MetaData, Table
import sys
import os
dirname = os.path.dirname(__file__)
 
sys.path.append(dirname)
sys.path.append(dirname+"/db_models/")
from sqlalchemy import create_engine, select, join, MetaData, Table


from db_models.productos import Productos
from db_models.ventas import Ventas
from db_models.ventasDetalles import VentasDetalles
from db_models.clientes import Clientes
from db_models.envasados import Envasados
from db_models.envios import Envios
from config_vars import BBDD_CONNECTION


class VentaDAO:
    print("starting")
    engine = create_engine(BBDD_CONNECTION)
    connection = engine.connect()
    print("finished connection")
    metadata = MetaData()

    def get_ventas_detalles(self,*, idproductos=None):
        if idproductos is not None:
            query = Productos.productos_id(idproductos= idproductos)
            return self.connection.execute(query).fetchone()
        elif idproductos is None:
            query = Productos.allproductos()
            return self.connection.execute(query).fetchall()

    def catalogo_productos(self ,*, idproductos=None):
        query = Productos.allproductos()
        return self.connection.execute(query).fetchall()
        
'''    def get_health_insurance(self,*, hos_id=None):
        if hos_id is not None:
            query = HealthInsurances.insurances_by_id(hos_id=hos_id)
            return self.connection.execute(query).fetchall()

       def get_headquarters(self, *, hos_id=None, heq_id=None):
        if heq_id:
            query = Headquarters.single_headquarters(heq_id=heq_id)
        elif hos_id:
            query = Headquarters.headquarters_by_hospital_id(hos_id=hos_id)
        else:
            query = Headquarters.all_headquarters()
        return self.connection.execute(query).fetchall()

    

    def get_calendar_id(self, *, heq_id=None, doc_id=None):
        if doc_id and heq_id:
            query = HealthRelations.calendars_by_doctor_in_headquarters(
                doc_id=doc_id, heq_id=heq_id
            )
        elif heq_id and not doc_id:
            query = HealthRelations.calendars_by_headquarters(heq_id=heq_id)
        elif doc_id and not heq_id:
            query = HealthRelations.calendars_by_doctor(doc_id=doc_id)
        else:
            query = HealthRelations.all_calendars()
        return self.connection.execute(query).fetchall() '''
