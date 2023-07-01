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

RUN poetry install --no-dev

EXPOSE 8080