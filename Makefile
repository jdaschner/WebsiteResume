.PHONY: build run dev clean

build: clean
	@ docker build -t notafrog-web .

run: build
	@ docker run -p 80:80 notafrog-web

dev:
	@ python manage.py runserver 8080

clean:
	- docker rm -f $(shell docker ps -a -q --filter ancestor=notafrog-web) 2>NUL
	- docker rmi -f $(shell docker images -q notafrog-web) 2>NUL
	- del db.sqlite3 2>NUL


