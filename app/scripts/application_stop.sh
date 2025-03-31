#!/bin/bash

# デプロイに必要な変数を設定
aws_account=$(aws sts get-caller-identity --output json --query 'Account' | tr -d '"')

# Docker コンテナを停止
is_exist_web=$(docker ps -f "name=c2_app" -q)
if [[ -n $is_exist_web ]]; then
    # Docker が起動中であれば停止
    AWS_ACCOUNT=${aws_account} docker-compose -f ${PWD}/scripts/docker-compose.yml down
fi