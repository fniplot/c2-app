# コマンドツール

ACCOUNT_ID = $(shell aws sts get-caller-identity --output json --query 'Account' | tr -d '"')
USER_ID = $(shell id -u)
GROUP_ID = $(shell id -g)

PHONY: up down web app web_logs 

build:
	@USER_ID=${USER_ID} GROUP_ID=${GROUP_ID} ACCOUNT_ID=${ACCOUNT_ID} docker-compose build

up:
	@USER_ID=${USER_ID} GROUP_ID=${GROUP_ID} ACCOUNT_ID=${ACCOUNT_ID} docker-compose up -d

down: 
	@USER_ID=${USER_ID} GROUP_ID=${GROUP_ID} ACCOUNT_ID=${ACCOUNT_ID} docker-compose down

nginx:
	@USER_ID=${USER_ID} GROUP_ID=${GROUP_ID} ACCOUNT_ID=${ACCOUNT_ID} docker-compose exec web /bin/ash

nextjs:
	@USER_ID=${USER_ID} GROUP_ID=${GROUP_ID} ACCOUNT_ID=${ACCOUNT_ID} docker-compose exec app /bin/ash

ssl:
	@USER_ID=${USER_ID} GROUP_ID=${GROUP_ID} ACCOUNT_ID=${ACCOUNT_ID} docker-compose exec data /bin/ash

web_logs:
	@USER_ID=${USER_ID} GROUP_ID=${GROUP_ID} ACCOUNT_ID=${ACCOUNT_ID} docker-compose logs web

app_logs:
	@USER_ID=${USER_ID} GROUP_ID=${GROUP_ID} ACCOUNT_ID=${ACCOUNT_ID} docker-compose logs app