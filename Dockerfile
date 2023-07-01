# buster : Debian 10で処理系とかいっぱいインストール済み
FROM python:3.8-buster as base
RUN pip install poetry
RUN pip install --upgrade pip
ENV POETRY_VERSION=1.0.0
ENV PATH="/root/.poetry/bin:$PATH"
RUN curl -sSL https://install.python-poetry.org | python -

# Poetry の仮想環境の無効化
RUN poetry config virtualenvs.create false

WORKDIR /workspace/backend

ADD backend/pyproject.toml .
ADD backend/poetry.lock    .

# --no-devフラグは、Poetryでパッケージをインストールするときに開発用の依存関係を除外するために使用されます。 
# 開発用の依存関係は、開発やテストの目的でのみ必要なパッケージであり、本番で実行するために必要ではありません。
# --no-devフラグを使用することで、本番で必要なパッケージのみをインストールできます。
RUN poetry install --no-dev

## ここから開発用コンテナの設定.
FROM base as devcontainer
RUN apt update
# bash -はパイプで渡されたデータを実行するためのコマンド
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt install -y nodejs
WORKDIR /workspace/frontend

# "npm install -g @vue/cli"は、Vue.jsの開発に必要なツールであるVue CLIをインストールするためのコマンド。
# npm installは、Node.jsのパッケージマネージャであるnpmを使用してパッケージをインストールするためのコマンド。
# -gフラグは、パッケージをグローバルにインストールするために使用されます。
# @vue/cliは、Vue CLIのパッケージ名です。 
# Vue CLIは、Vue.jsの開発環境を簡単に構築するためのコマンドラインツールです。
# Vue CLIを使用すると、プロジェクトのテンプレートの作成、複数のJavaScriptファイルを1つにまとめる、
# .vueファイルを.jsに変換する、JavaScriptの構文チェック、テストツールの導入などができます。
RUN npm install -g @vue/cli
WORKDIR /workspace/backend
RUN poetry install
EXPOSE 8080 8082

FROM python:3.8-buster as app
EXPOSE 8080
WORKDIR /workspace/backend
COPY --from=base /usr/local/lib/python3.8/site-packages /usr/local/lib/python3.8/site-packages

COPY backend/ .
ENV FLASK_APP /workspace/backend/app.py
CMD ["python", "app.py"]