FROM ruby:3.1.2

# 必要なLinuxパッケージをインストール（Node.js, Yarnの前提）
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  curl \
  git

# Node.jsをインストール（公式推奨のLTSバージョン）
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - \
  && apt-get install -y nodejs

# Yarnをインストール（Yarn公式の推奨手順）
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update && apt-get install -y yarn

WORKDIR /service

# GemfileとGemfile.lockをコピーしてbundle install
COPY Gemfile* /service/
RUN bundle install

# その他のソースコードをコピー（bundle installのキャッシュを活かすため遅延コピー）
COPY . /service

# ポート3000を開放
EXPOSE 3000

# Railsサーバーを起動
CMD ["rails", "server", "-b", "0.0.0.0"]
