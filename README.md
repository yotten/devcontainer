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

## mysql
<pre>
docker exec -it devcontainer-db-1 bash
bash-4.2# mysql -udbuser -pdbpass
mysql> show databases;
+---------------------+
| Database            |
+---------------------+
| information_schema  |
| rpi_vending_machine |
+---------------------+
2 rows in set (0.00 sec)

mysql> use rpi_vending_machine
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+-------------------------------+
| Tables_in_rpi_vending_machine |
+-------------------------------+
| t_products                    |
| t_sales                       |
| t_temperatures                |
+-------------------------------+
3 rows in set (0.00 sec)

mysql> desc t_products
    -> ;
+------------+--------------+------+-----+-------------------+-------+
| Field      | Type         | Null | Key | Default           | Extra |
+------------+--------------+------+-----+-------------------+-------+
| id         | int(11)      | NO   | PRI | NULL              |       |
| name       | varchar(256) | NO   |     | NULL              |       |
| created_at | timestamp    | NO   |     | CURRENT_TIMESTAMP |       |
+------------+--------------+------+-----+-------------------+-------+
3 rows in set (0.01 sec)

mysql> select * from t_products
    -> ;
+-----+---------------------------+---------------------+
| id  | name                      | created_at          |
+-----+---------------------------+---------------------+
| 101 | ドリンク:(1)              | 2023-07-02 11:02:18 |
| 102 | ドリンク:(2)              | 2023-07-02 11:02:18 |
| 103 | ドリンク:(3)              | 2023-07-02 11:02:18 |
| 104 | ドリンク:(4)              | 2023-07-02 11:02:18 |
| 105 | ドリンク:(5)              | 2023-07-02 11:02:18 |
| 106 | ドリンク:(6)              | 2023-07-02 11:02:18 |
| 107 | ドリンク:(7)              | 2023-07-02 11:02:18 |
| 108 | ドリンク:(8)              | 2023-07-02 11:02:18 |
| 201 | ホットドリンク:(1)        | 2023-07-02 11:02:18 |
| 202 | ホットドリンク:(2)        | 2023-07-02 11:02:18 |
| 203 | ホットドリンク:(3)        | 2023-07-02 11:02:18 |
| 204 | ホットドリンク:(4)        | 2023-07-02 11:02:18 |
+-----+---------------------------+---------------------+
12 rows in set (0.01 sec)

mysql>
</pre>
## poetry
PoetryはPythonのパッケージを管理するツール。
Poetryを使ってパッケージをインストールしたりアップデートした際は
* pyproject.toml
* poetry.lock 

に記載される。


# 参考資料
[2021年お勧め開発環境VSCode＜第4回＞コンテナ活用](https://www.cqpub.co.jp/interface/download/contents2021.htm)
