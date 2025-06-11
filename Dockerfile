FROM ubuntu:22.04

# Instala dependencias necesarias
RUN apt-get update && \
    apt-get install -y git curl

# Clona el repositorio de code-server (opcional, para tener el código fuente)
RUN git clone https://github.com/coder/code-server.git /opt/code-server

# Instala code-server usando el script oficial
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Crea un usuario para code-server
RUN useradd -m coder

# Establece el directorio de trabajo
WORKDIR /home/coder

# Expone el puerto por defecto de code-server
EXPOSE 8080

# Variable de entorno para la contraseña (puedes cambiarl
ENV PASSWORD=admin

# Ejecuta code-server al iniciar el contenedor
CMD ["code-server", "--bind-addr", "0.0.0.0:8080", "--auth", "none"]
