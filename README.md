## Docker 環境構築手順

### イメージのビルド
初回実行時、または `Dockerfile` を変更した場合に以下のコマンドを実行してください。

```bash
docker-compose build
```

### コンテナの起動
以下のコマンドでコンテナを起動します。

```bash
docker-compose up
```

バックグラウンドで起動したい場合は `-d` オプションを付けて実行してください。

```bash
docker-compose up -d
```

### DBのセットアップ
以下のコマンドでデータベースを作成・マイグレーションを実行します。

```bash
docker-compose exec web rails db:create db:migrate
