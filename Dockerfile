FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git python3 curl sudo \
        ca-certificates \
        build-essential \
        libssl-dev zlib1g-dev \
        libncurses5-dev libreadline-dev \
        libsqlite3-dev libffi-dev \
        wget xz-utils && \
    update-ca-certificates && \
    curl -fsSL https://code-server.dev/install.sh | sh && \
    useradd -m coder && usermod -aG sudo coder && \
    wget https://www.python.org/ftp/python/3.12.3/Python-3.12.3.tgz && \
    tar -xf Python-3.12.3.tgz && \
    cd Python-3.12.3 && \
    ./configure --enable-optimizations && \
    make -j$(nproc) && \
    make altinstall && \
    cd .. && rm -rf Python-3.12.3* && \
    apt-get remove -y wget build-essential && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN update-alternatives --install /usr/bin/python3 python3 /usr/local/bin/python3.12 1

USER coder
WORKDIR /home/coder

ENV PUBLIC_REPO_URL="https://github.com/pilarcode/multiagents-agno-lab.git"

# Clona solo el repo público en build
RUN git clone $PUBLIC_REPO_URL /home/coder/project-public && \
    chown -R coder:coder /home/coder/project-public

EXPOSE 8080

CMD ["code-server", "--bind-addr", "0.0.0.0:8080", "--auth", "none", "--disable-telemetry", "--disable-workspace-trust"]