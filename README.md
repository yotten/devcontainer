# devcontainer

## フォルダ構造
![project_root](https://github.com/yotten/devcontainer/assets/12053257/9f9429d1-a8c2-413e-aa6e-66c16533cfc2)


# 手順
## イメージとコンテナの作成、コンテナの起動
<pre>
docker compose up -d --build
</pre>
-d：バックグラウンドでdockerを起動するオプション
## 確認
<pre>
docker compose ls
</pre>

## 起動中のコンテナに入るｘ
<pre>
docker compose exec devcontainer bash
</pre>
## コンテナの停止と削除
<pre>
docker compose down
</pre>


ｘ
# 参考資料
[2021年お勧め開発環境VSCode＜第4回＞コンテナ活用](https://www.cqpub.co.jp/interface/download/contents2021.htm)
