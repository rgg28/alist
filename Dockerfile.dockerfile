# Usa una imagen base ligera de Linux
FROM alpine:latest

# Establece el directorio de trabajo
WORKDIR /app

# Copia el ejecutable de Alist
COPY alist .

# Copia el archivo de configuración
COPY config.json .

# Haz que el ejecutable sea ejecutable
RUN chmod +x alist

# Expone el puerto por defecto de Alist
EXPOSE 5244

# Comando para ejecutar Alist
CMD ["./alist", "server", "--data", "/app"]