# Coder Server

This project create a docker container with code-server , python 3.12 and a repo.


## Setup
```bash
docker build -t code-server-repo .
```

```bash
docker run -it -p 8080:8080  code-server-repo
```

```bash
docker ps 
```

```bash
docker exec -it <container_id> /bin/bash
```

```bash
docker rmi -f <image_id>
```
```bash
docker rm -f <container_id>
```


## Usage
http://localhost:8080/

