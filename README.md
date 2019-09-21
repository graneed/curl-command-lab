# curl-command-lab

技術書典7で頒布した『curlコマンド完全に理解する』に対応したラボ環境です。


## サーバ環境

### 動作環境
Ubuntu 19.04で確認していますが、下記の必要なソフトウェアをインストールしていれば、他のLinux環境でも動作すると思います。
実行するOSユーザはrootを想定しています。

### 必要なソフトウェア
- Docker
- Docker-Compose
- OpenSSH

### 手順

インストール手順は次のとおりです。
`setup.sh`では、100MBのダミーファイルの生成、HTTPS用の証明書ファイルの生成、SSH用の鍵ファイルの生成を行います。
```
# git clone https://github.com/graneed/curl-command-lab.git

# cd ./curl-command-lab/server

# ./setup.sh
```

起動手順は次のとおりです。うまく動作しないときなど、必要に応じてログを確認してください。
```
# docker-compose -f ./docker-compose.yml up -d

# docker-compose logs -f
```

停止手順は次のとおりです。
```
# docker-compose -f ./docker-compose.yml down
```

`setup.sh`で生成したファイル、書籍のコマンド例を実行してHTTP・FTPでアップロードしたファイル、送信したメールデータを削除してやり直したい場合は、`cleanup.sh`を使用してください。

### 補足
使用しているポートやサービスは書籍の「1.2 サーバ環境」にまとめていますが、補足を下記します。

#### HTML
htmlディレクトリ配下にApache httpdとnginxのイメージの構成ファイルがあります。
[server/http/httpd/html](./server/http/httpd/html)と[server/http/nginx/html](./server/http/nginx/html)にコンテンツを配備可能です。

#### FTP
ftpディレクトリ配下にvsftpdとtftpとscp(openssh利用)のイメージの構成ファイルがあります。
FTPの公開ディレクトリは共通で[server/ftp/file](./server/ftp/file)です。

#### メール
PostfixとDovecotを包含したフルスタックのメールサーバ―のコンテナイメージである[docker-mailserver](https://hub.docker.com/r/tvial/docker-mailserver/)を利用しています。
コンテナ起動時に`openssl dhparam`コマンドを実行しているようで、時間がかかることがありますので気長に待ってください。

[server/mail/setup.sh](./server/mail/setup.sh)で、メールアカウントの作成等ができます。
あらかじめ`receiver@curl.test/password`と`sender@curl.test:password`の2アカウントは作成済みです。

#### プロキシ
proxyディレクトリ配下にsquidとdanteのイメージの構成ファイルがあります。
squidはデフォルトで接続元IPアドレスの制限がありますが、localnet（10.0.0.0/8、172.16.0.0/12、192.168.0.0/16、fc00::/7、fe80::/10）からの接続を許可するように変更しています。


## クライアント環境
curlコマンドのオプションで指定して参照するファイルを[client](./client)に格納しており、ダウンロードすればそのまま使用可能です。
書籍では、OSユーザのホームディレクトリ配下に`curl-command-lab/client`ディレクトリがあることを前提としたコマンドの実行例になっています。
コピー＆ペーストして実行したい場合は、合わせた方がよいでしょう。

なお、SFTPで公開鍵認証方式を使用するコマンドの実行例を試したい場合は、サーバ環境の`setup.sh`で生成した[server/credential](./server/credential)配下のファイルを[client/credential](./client/credential)ディレクトリ配下にコピーして持ってきてください。

