FROM ubuntu:latest

# Instalar dependencias
RUN apt-get update && \
    apt-get install -y curl ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Directorio de trabajo
WORKDIR /opt/alist

# Crear carpetas necesarias
RUN mkdir -p /opt/alist/data/temp /opt/alist/data/bleve /opt/alist/data/log

# Copiar archivos personalizados
COPY config.json /opt/alist/data/config.json
COPY data/data.db /opt/alist/data/data.db

# Descargar e instalar Alist
RUN curl -sL https://github.com/alist-org/alist/releases/latest/download/alist-linux-amd64.tar.gz  | tar -xz

# Exponer puerto HTTP
EXPOSE 5244

# Iniciar Alist
CMD ["./alist", "server"]