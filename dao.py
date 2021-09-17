#from sqlalchemy import create_engine, select, join, MetaData, Table
import sys
import os
import pymysql
dirname = os.path.dirname(__file__)
 
sys.path.append(dirname)
sys.path.append(dirname+"/db_models/")
from sqlalchemy import create_engine, select, join, MetaData, Table


from db_models.productos import Productos
#from db_models.ventas import Ventas
#from db_models.ventas_detalles import VentasDetalles
#from db_models.clientes import Clientes
#from db_models.envasados import Envasados
#from db_models.envios import envios
from config_vars import BBDD_CONNECTION


class VentaDAO:
    print("starting")
    engine = create_engine(BBDD_CONNECTION)
    connection = engine.connect()
    print("finished connection")
    metadata = MetaData()

    def get_prods(self,*, idproductos=None):
        if idproductos is not None:
            query = Productos.productos_by_id(idproductos=idproductos)
            
        if idproductos is None
            query = Productos.productos_all()
        
        return self.connection.execute(query).fetchone()

    