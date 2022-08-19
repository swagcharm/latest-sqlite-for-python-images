#   export DOCKER_DEFAULT_PLATFORM := linux/amd64

build:
	echo "Building... using $(SSH_KEY)"
	docker build --rm -f Dockerfile -t swagcharm/sqlite3 .

run-shell:
	docker run -it --user="root" swagcharm/sqlite3 /bin/sh

down:
	docker stop $$(docker ps -a -q --filter "ancestor=swagcharm/sqlite3") && docker rm $$(docker ps -a -q --filter "ancestor=swagcharm/sqlite3")

attach:
	docker exec -it $$(docker ps -a -q --filter "ancestor=swagcharm/sqlite3") /bin/sh

compile:
	docker run -v "$$PWD":/compiled-libs swagcharm/sqlite3 /bin/sh -c "cp /usr/lib/libsqlite3.so /compiled-libs; exit"

sqlite-version:
	docker run swagcharm/sqlite3 /bin/sh -c "sqlite3 --version; exit"
