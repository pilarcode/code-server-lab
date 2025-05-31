FROM codercom/code-server:latest

USER root
RUN apt-get update && apt-get install -y git python3

# Create config directory with correct permissions
RUN mkdir -p /home/coder/.config && \
    chown -R coder:coder /home/coder/.config

# Set password
ENV PASSWORD="admin_pilar"

WORKDIR /home/coder/project
USER coder