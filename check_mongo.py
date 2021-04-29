import os
import sys
from pymongo import MongoClient
from pymongo.errors import OperationFailure

MONGO_USER=os.getenv('MONGO_USER')
MONGO_PASS=os.getenv('MONGO_PASS')
MONGO_HOST=os.getenv('MONGO_HOST')
MONGO_PORT=os.environ.get('MONGO_PORT',27017)
MONGO_AUTH_SOURCE=os.environ.get('MONGO_AUTH_SOURCE','admin')
MONGO_AUTH_MECHANISM=os.environ.get('MONGO_AUTH_MECHANISM','SCRAM-SHA-256')


client = MongoClient(host=MONGO_HOST,
                        username=MONGO_USER,
                        port=MONGO_PORT,
                        password=MONGO_PASS,
                        authSource=MONGO_AUTH_SOURCE,
                        authMechanism=MONGO_AUTH_MECHANISM)
try:
    names = client.list_database_names()
    print('Mongo is up and running with databases: '+ str(names))
    sys.exit(0)
except OperationFailure as err:
    print(f"Data Base Connection failed. Error: {err}")
    sys.exit(2)

sys.exit(0)