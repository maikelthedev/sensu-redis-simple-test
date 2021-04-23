rm sensu-redis* -r
mkdir sensu-redis-simple-test
mkdir sensu-redis-simple-test/bin
PYTHONOPTIMIZE=2 pyinstaller check_redis.py --clean -F --noconfirm --distpath sensu-redis-simple-test/bin
rm build -r
rm __pycache__ -r
rm check.spec
chmod +x sensu-redis-simple-test/bin/*
tar -C sensu-redis-simple-test -cvzf sensu-redis-simple-test-0.0.3.tar.gz .
sha512sum  sensu-redis-simple-test-0.0.3.tar.gz | tee sensu-redis-simple-test-0.0.3-sha512-checksums.txt
