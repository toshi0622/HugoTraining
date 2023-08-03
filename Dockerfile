# ベースイメージの指定
FROM alpine:latest

# 必要なパッケージのインストール
RUN apk add --no-cache hugo

# 作業ディレクトリの指定
WORKDIR /app

# Hugoサイトのソースコードをコンテナにコピー
COPY . /app/

# Hugoコマンドの実行
RUN hugo

# NginxなどのWebサーバを起動するベースイメージを使用する場合は以下のように設定する
# FROM nginx:latest
# COPY --from=0 /app/public /usr/share/nginx/html

# ポートの公開（例: Hugoサイトが80ポートを使用する場合）
# EXPOSE 80

# サイトの公開用フォルダを指定（例: Hugoサイトが/publicフォルダにコンテンツを生成する場合）
# VOLUME /app/public

# サイトを動かすコマンド（例: Nginxを使用する場合は不要）
# CMD ["hugo", "server", "--bind", "0.0.0.0"]

# または、Nginxを使用して公開する場合のコマンド（例）
# CMD ["nginx", "-g", "daemon off;"]
