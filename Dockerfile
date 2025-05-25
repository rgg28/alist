FROM ubuntu:latest
WORKDIR /app
COPY alist .
COPY config.json .
RUN chmod +x alist
EXPOSE 5244
CMD ["./alist", "server", "--data", "/app"]