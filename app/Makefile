# コマンドツール
PHONY: build

build:
	@docker build -t c2-app .

install:
	@docker run --rm -v ${PWD}:/home/node --user node -w /home/node c2-app yarn install --frozen-lockfile

run:
	@docker run --rm -it c2-app /bin/ash
