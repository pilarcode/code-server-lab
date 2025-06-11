# Coder Server

This project create a docker container with code-server


## Setup
```bash
docker build -t ubuntu-code-server .
```

```bash
docker run -it -p 8080:8080 ubuntu-code-server
```

```bash
docker ps 
```

```bash
docker exec -it <container_id> /bin/bash
```
Note: cat /root/.config/code-server/config.yaml

```bash
docker rmi -f <image_id>
```
```bash
docker rm -f <container_id>
```


## Usage
http://localhost:8080/

![Demo](https://github.com/pilarcode/code-server-lab/blob/feature/secret/images/demo2.png)

