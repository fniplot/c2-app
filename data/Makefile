# export を設定することでデフォルト値を変更することができます。
# デフォルト値は dev です。
# 例
# makefile
# 	run: 
# 		@echo "$(STAGE)"
# $ make run
# $ dev
# $ STAGE=test make run
# $ dev
# $ STAGE=prd make run
# $ prd
export 
ifeq ($(STAGE), prd)
	STAGE := prd
else
	STAGE := dev
endif

# コマンドツール
PHONY: build run

build:
	@docker build --build-arg ENV=$(STAGE) -t c2-data .

run:
	@docker run --rm -it c2-data /bin/ash

# docker run --rm -it -v ./local:/cert c2-data

# docker run --rm -d -it --name data c2-data /bin/ash

# $ DATA_CONTAINER_ID=$(docker run -itd --name data c2-data /bin/ash)

# $ WEB1_CONTAINER_ID=$(docker run -itd --name app1 --volumes-from data c2-web /bin/ash)

# $ docker attach ${WEB1_CONTAINER_ID}

# $ docker rm ${DATA_CONTAINER_ID} ${WEB1_CONTAINER_ID} -f 
