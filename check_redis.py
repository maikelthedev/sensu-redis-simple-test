import os
import redis
import sys

REDIS_PASS=os.getenv('REDIS_PASS')
REDIS_HOST=os.getenv('REDIS_HOST')
REDIS_PORT=os.environ.get('REDIS_PORT',6379)

try: 
    r = redis.Redis(host=REDIS_HOST, port=REDIS_PORT, password=REDIS_PASS, db=0)
    status = r.ping()
    if status == True:
        print('Connected sucesfully to REDIS server on {}'.format(REDIS_HOST))
        sys.exit(0)
    else:
        print('Unknown error')
        sys.exit(1)
except redis.ConnectionError as e:
    print(e)
    sys.exit(2)
except redis.ResponseError as e: #As this is mostly a configuration error of the password
    print(e)
    sys.exit(1)

