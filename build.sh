rm sensu-redis* -r
mkdir sensu-redis-simple-test
docker run --rm -v "${PWD}:/src" six8/pyinstaller-alpine:alpine-3.6-pyinstaller-v3.4 --noconfirm --onefile --log-level DEBUG --clean check_redis.py
mv dist bin
mv bin sensu-redis-simple-test/
rm build -r
rm *.spec
chmod +x sensu-redis-simple-test/bin/*
tar -C sensu-redis-simple-test -cvzf sensu-redis-simple-test-0.0.4.tar.gz .
sha512sum  sensu-redis-simple-test-0.0.4.tar.gz | tee sha512-checksums.txt
