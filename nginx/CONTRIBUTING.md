## Nginx をビルド

### 開発用の Docker をビルド

```
$ docker build -t c2-web .
$
```

### Docker コンテナにアクセス

```
$ docker run --rm -it c2-web /bin/ash
$
```

## ECR 用の Docker をビルド

ビルドする環境は、Amazon Linux 2023 AMI 64 ビット(Arm)の EC2 内で実施してください。認証トークンを取得し、レジストリに対して Docker クライアントを認証します。AWS CLI を使用してください:

```
$ aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin ${account_id}.dkr.ecr.ap-northeast-1.amazonaws.com
$
```

最新の Nginx Alpine Linux 版 を取得

```
$ docker pull nginx:stable-alpine
$
```

リポジトリにイメージをプッシュできるように、イメージにタグを付けます。

```
$ docker tag nginx:stable-alpine ${account_id}.dkr.ecr.ap-northeast-1.amazonaws.com/c2-nginx-stable-alpine:latest
$ docker tag nginx:stable-alpine ${account_id}.dkr.ecr.ap-northeast-1.amazonaws.com/c2-nginx-stable-alpine:$(date +"%Y%m%d")
$
```

コマンドを実行して、新しく作成した AWS リポジトリにこのイメージをプッシュします:

```
$ docker push ${account_id}.dkr.ecr.ap-northeast-1.amazonaws.com/c2-nginx-stable-alpine:latest
$ docker push ${account_id}.dkr.ecr.ap-northeast-1.amazonaws.com/c2-nginx-stable-alpine:$(date +"%Y%m%d")
$
```

## Datadog 用の Docker をビルド

ビルドする環境は、Amazon Linux 2023 AMI 64 ビット(Arm)の EC2 内で実施してください。認証トークンを取得し、レジストリに対して Docker クライアントを認証します。AWS CLI を使用してください:

```
$ aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin ${account_id}.dkr.ecr.ap-northeast-1.amazonaws.com
$
```

最新の Datadog Agent を取得

```
$ docker pull datadog/agent:latest
$
```

リポジトリにイメージをプッシュできるように、イメージにタグを付けます。

```
$ docker tag datadog/agent:latest ${account_id}.dkr.ecr.ap-northeast-1.amazonaws.com/c2-datadog-agent:latest
$ docker tag datadog/agent:latest ${account_id}.dkr.ecr.ap-northeast-1.amazonaws.com/c2-datadog-agent:$(date +"%Y%m%d")
$
```

コマンドを実行して、新しく作成した AWS リポジトリにこのイメージをプッシュします:

```
$ docker push ${account_id}.dkr.ecr.ap-northeast-1.amazonaws.com/c2-datadog-agent:latest
$ docker push ${account_id}.dkr.ecr.ap-northeast-1.amazonaws.com/c2-datadog-agent:$(date +"%Y%m%d")
$
```
