# Usamos una imagen oficial de Ubuntu
FROM ubuntu:latest

# Actualizamos paquetes e instalamos dependencias esenciales
RUN apt-get update && \
    apt-get install -y \
        ca-certificates \
        curl && \
    rm -rf /var/lib/apt/lists/*

# Directorio de trabajo donde vivirá Alist
WORKDIR /alist

# Descargamos e instalamos la última versión de Alist
RUN curl -sL https://github.com/alist-org/alist/releases/latest/download/alist-linux-amd64.tar.gz  | tar -xz

# Exponemos el puerto predeterminado de Alist
EXPOSE 5244

# Comando para iniciar Alist
CMD ["./alist", "server"]