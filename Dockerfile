# Usamos una imagen oficial de Ubuntu
FROM ubuntu:latest

# Actualizamos paquetes e instalamos dependencias esenciales
RUN apt-get update && \
    apt-get install -y \
        ca-certificates \
        curl \
        tzdata && \
    rm -rf /var/lib/apt/lists/*

# Configurar zona horaria (opcional)
ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Directorio de trabajo donde vivirá Alist
WORKDIR /opt/alist

# Crear carpetas necesarias
RUN mkdir -p /opt/alist/data/temp /opt/alist/data/bleve /opt/alist/data/log

# Copiar archivos personalizados
COPY config.json /opt/alist/config.json
COPY data/data.db /opt/alist/data/data.db

# Descargamos e instalamos la última versión de Alist
RUN curl -sL https://github.com/alist-org/alist/releases/latest/download/alist-linux-amd64.tar.gz  | tar -xz

# Exponemos el puerto predeterminado de Alist
EXPOSE 5244

# Comando para iniciar Alist
CMD ["./alist", "server"]