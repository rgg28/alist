# Usamos una imagen oficial de Ubuntu
FROM ubuntu:latest

# Actualizamos paquetes y aseguramos tener los certificados CA e instalamos curl
RUN apt-get update && \
    apt-get install -y \
        ca-certificates \  # Certificados raíz necesarios para TLS
        curl \              # Para descargar Alist
        tzdata \            # Opcional, si quieres configurar zona horaria
        && \
    rm -rf /var/lib/apt/lists/*

# Creamos el directorio donde vivirá Alist
WORKDIR /alist

# Descargamos la última versión de Alist para Linux x64
RUN curl -sL https://github.com/alist-org/alist/releases/latest/download/alist-linux-amd64.tar.gz  | tar -xz

# Exponemos el puerto predeterminado de Alist
EXPOSE 5244

# Iniciamos Alist
CMD ["./alist", "server"]