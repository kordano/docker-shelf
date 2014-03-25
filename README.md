# Lambda-Shelf on Docker
Lambda-Shelf inside a container.

# Installation

Build it
```
sudo docker build -rm -t <username>/lambda-shelf .
```

Install and run couchdb
```
sudo docker pull klaemo/couchdb
sudo docker run -p 5984:5984 klaemo/couchdb
```

Run it
```
docker run -t -i -link couchdb:db -name shelf -p 8080:8080 kordano/lambda-shelf
```
