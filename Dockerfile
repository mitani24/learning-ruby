# 最新の Ruby イメージをベースにする
FROM ruby:latest

# 必要なパッケージをインストールする
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# ワークディレクトリを設定する
WORKDIR /app

# ホストの Gemfile と Gemfile.lock をコンテナにコピーする
COPY Gemfile* /app/

# Bundler を使って依存関係をインストールする
RUN bundle install

# 環境変数を設定する
ENV LANG=ja_JP.UTF-8
ENV TZ=Asia/Tokyo
