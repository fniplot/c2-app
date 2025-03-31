# AWS ECR に登録した Nginx を使います。
ARG ACCOUNT_ID
ARG LATEST

# Nginx が安定した Alpine Linux 版を使用
FROM $ACCOUNT_ID.dkr.ecr.ap-northeast-1.amazonaws.com/c2-nginx-stable-alpine:$LATEST

COPY ./nginx.conf /etc/nginx/nginx.conf

# Datadog にアクセス、エラーログを送信するためにシンボリックリンクを解除し、
# ファイルを生成します。
RUN unlink /var/log/nginx/access.log; \
    unlink /var/log/nginx/error.log; \
    touch /var/log/nginx/access.log /var/log/nginx/error.log; \
    chmod 777 /var/log/nginx/

EXPOSE 80

VOLUME /var/log/nginx

CMD ["nginx", "-g", "daemon off;"]

# 参考サイト
# ・Docker上にNext.js+nginxサーバーを構築し、httpsでアクセスできるようにする
#   ・https://qiita.com/t_reiya/items/d73bcb63f99e082602c1
