## 開発環境を構築

アプリケーションの環境を構築するために、Docker コンテナをビルドし、パッケージをインストールします。

```
$ maek build
$
```

パッケージをインストールします。

```
$ docker install
$
```

## 技術 メモ

```
$ docker run --rm -it --user node c2-app /bin/ash
$
```

```
$ docker run --rm -it -v $PWD:/home/node --user node -w /home/node c2-app /bin/ash
$
```

```
$ docker run --rm -p 80:3000 -it -v $PWD:/home/node --user node -w /home/node c2-app /bin/ash
$
```
