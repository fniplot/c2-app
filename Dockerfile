FROM node:lts-alpine

# Next プロジェクトの生成に必要なパッケージをインストール
RUN apk update \
    && apk --update add python3 make g++ \
    && apk cache clean \
    && rm -rf /var/cache/apk/*
