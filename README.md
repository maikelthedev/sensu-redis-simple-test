# Redis

This is a very simple Redis check of connectivity written in Python. 

To make it a single executable I used Pyinstaller. 

To install:

sensuctl asset add maikeldotuk/sensu-redis-simple-test

To use:

Pass the next environment variables in your check config:

REDIS_HOST
REDIS_PORT (defaults to )
REDIS_PASS 

