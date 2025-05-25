FROM ubuntu:22.04
WORKDIR /opt/alist/app # Nuevo WORKDIR para la aplicación (donde estará el ejecutable alist y config.json)
COPY alist .
COPY config.json .
RUN chmod +x alist
EXPOSE 5244
# Asegúrate de que las carpetas de datos existan dentro del volumen persistente
RUN mkdir -p /opt/alist/data/log /opt/alist/data/temp /opt/alist/data/bleve

# Comando para iniciar Alist, indicándole que use /opt/alist/data para sus datos
CMD ["./alist", "server", "--data", "/opt/alist/data"]