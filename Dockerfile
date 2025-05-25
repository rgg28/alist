FROM ubuntu:22.04
WORKDIR /app
COPY alist .
# COPIA config.json A LA MISMA CARPETA DE TRABAJO DEL CONTENEDOR
COPY config.json . 
# AÑADE ESTA LÍNEA para copiar la base de datos
COPY data.db . 
RUN chmod +x alist
EXPOSE 5244
CMD ["./alist", "server", "--data", "/app"]