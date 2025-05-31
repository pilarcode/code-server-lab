# Coder Server

This project create a docker container with visual studio code, git and python.
Besides, it clones a repository to work with visual studio code directly.


## Setup
```bash
docker build -t vscode-python .
```

```bash
docker run -it -p 8080:8080 vscode-python
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

