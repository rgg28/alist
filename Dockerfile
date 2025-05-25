FROM ubuntu:22.04
WORKDIR /app
COPY alist .
COPY config.json /root/.alist/config.json
RUN chmod +x alist
EXPOSE 5244
CMD ["./alist", "server", "--data", "/app"]