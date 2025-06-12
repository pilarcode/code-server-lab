FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y curl && \
    curl -fsSL https://code-server.dev/install.sh | sh && \
    useradd -m coder

USER coder
WORKDIR /home/coder


EXPOSE 8080

CMD ["code-server", "--bind-addr", "0.0.0.0:8080", "--auth", "none", "--disable-telemetry", "--disable-workspace-trust"]
