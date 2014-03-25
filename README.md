# Lambda-Shelf on Docker
Lambda-Shelf inside a container.

# Installation

Build it
```
sudo docker build -rm -t <username>/lambda-shelf .
```

Install and run [klaemo/couchdb](https://index.docker.io/u/klaemo/couchdb/ "klaemo/couchdb")
```
sudo docker pull klaemo/couchdb
sudo docker run -d -p 5984:5984 -name couchdb klaemo/couchdb
```

Run it
```
docker run -t -i -link couchdb:db -name shelf -p 8080:8080 <username>/lambda-shelf
```
