rm sensu-databases-check -r
mkdir sensu-databases-check
docker run --rm -v "${PWD}:/src" six8/pyinstaller-alpine:alpine-3.6-pyinstaller-v3.4 --noconfirm --onefile --log-level DEBUG --clean check_redis.py
docker run --rm -v "${PWD}:/src" six8/pyinstaller-alpine:alpine-3.6-pyinstaller-v3.4 --noconfirm --onefile --log-level DEBUG --clean check_mongo.py
mv dist bin
mv bin sensu-databases-check/
rm build -r
rm *.spec
chmod +x sensu-databases-check/bin/*
tar -C sensu-databases-check -cvzf sensu-databases-check-0.0.6.tar.gz .
sha512sum  sensu-databases-check-0.0.6.tar.gz | tee sha512-checksums.txt
