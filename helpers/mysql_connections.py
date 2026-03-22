

import sys
import os

sys.path.append(os.path.abspath('..'))

from sqlalchemy import create_engine


def create_mysql_engine():
    engine = create_engine(
        "mysql+pymysql://admin_gophish:Resident2026+@gophish-server.mysql.database.azure.com:3306/gophish",
        connect_args={
            "ssl": {
                "ca": "../Cert/DigiCertGlobalRootG2.crt.pem"
            }
        }
    )
    
    return engine

