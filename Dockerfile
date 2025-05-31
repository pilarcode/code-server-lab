FROM codercom/code-server:latest

# Set environment variables
USER root
RUN apt-get update && apt-get install -y git python3

# Create config directory with correct permissions
RUN mkdir -p /home/coder/.config && \
    chown -R coder:coder /home/coder/.config

# Clona el repositorio
ENV GIT_REPO_URL="https://github.com/pilarcode/multiagents-agno-lab.git"

# Clone the repository
RUN git clone $GIT_REPO_URL /home/coder/project && \
    chown -R coder:coder /home/coder/project

WORKDIR /home/coder/project
