## Docker のビルド

```
$ docker build -t c2-project .
$
```

## Docker コンテナにアクセス

```
$ docker run --rm -it -v $PWD:/home/node --user node -w /home/node c2-project /bin/ash
$
```
