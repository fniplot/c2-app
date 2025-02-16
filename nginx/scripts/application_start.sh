#!/bin/bash

# デプロイに必要な変数を設定
aws_account=$(aws sts get-caller-identity --output json --query 'Account' | tr -d '"')
ecr=${aws_account}.dkr.ecr.ap-northeast-1.amazonaws.com
web_repository_name=c2-web-server
datadog_repository_name=c2-datadog-agent

# ecr にログイン
aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin ${ecr}

is_exist_web_image=$(docker image ls -q ${ecr}/${web_repository_name})
if [[ -n $is_exist_image ]]; then
    # Web Server のイメージを削除
    docker rmi ${ecr}/${web_repository_name}:latest
fi

is_exist_datadog_image=$(docker image ls -q ${ecr}/${datadog_repository_name})
if [[ -n $is_exist_image ]]; then
    # Datadog Agent のイメージを削除
    docker rmi ${ecr}/${datadog_repository_name}:latest
fi

# Docker イメージをビルド
AWS_ACCOUNT=${aws_account} docker-compose -f ${PWD}/scripts/docker-compose.yml build --no-cache 

# Docker コンテナを起動
# パスを指定しているのは、CodePipeline でデプロイした先で実行するため
AWS_ACCOUNT=${aws_account} docker-compose -f ${PWD}/scripts/docker-compose.yml up -d
