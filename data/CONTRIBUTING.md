## 秘密鍵を作成

- genrsa: RSA 形式の秘密鍵を作成する
- -aes128: 128 ビットの AES 形式で暗号化
- 2048: 2048 バイト長の鍵を作成

```shell
$ openssl genrsa 2048 > ./nginx.key
$
```

## 公開鍵＋認証局での署名に必要な情報を作成

- req: CSR ファイルを作成する際に指定
- -new: CSR を新規作成
- -key: 秘密鍵ファイルを指定

```shell
$ openssl req -new -key nginx.key > nginx.csr
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
$
---

Country Name (2 letter code) [AU]:JP
State or Province Name (full name) [Some-State]:
Locality Name (eg, city) []:
Organization Name (eg, company) [Internet Widgits Pty Ltd]:
Organizational Unit Name (eg, section) []:
Common Name (e.g. server FQDN or YOUR name) []: example.com
Email Address []:

Please enter the following 'extra' attributes
to be sent with your certificate request
A challenge password []:
An optional company name []:
$
```

## サーバー証明書を作成

- x509: X.509 形式の証明書を発行
- -in server.csr: CSR ファイルを指定
- -days 365: 証明書の有効期限を指定
- -req: 入力ファイルが CSR ファイルであることを示す
- -signkey server.key: 秘密鍵ファイルを指定

```shell
$ openssl x509 -in nginx.csr -days 365 -req -signkey nginx.key > nginx.crt
$
```
