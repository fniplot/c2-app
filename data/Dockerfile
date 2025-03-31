# 他のイメージから SSL 証明書を
# 参照されるための Docker イメージ
FROM busybox:latest 
ARG ENV

RUN mkdir -p /etc/nginx/ssl

COPY ./$ENV/nginx/ssl/nginx.crt /etc/nginx/ssl/nginx.crt
COPY ./$ENV/nginx/ssl/nginx.key /etc/nginx/ssl/nginx.key

VOLUME /etc/nginx/ssl
