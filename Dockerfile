FROM python:3.8-buster as base
RUN pip install poetry
RUN pip install --upgrade pip
ENV POETRY_VERSION=1.0.0
ENV PATH="/root/.poetry/bin:$PATH"
RUN curl -sSL https://install.python-poetry.org | python -
RUN poetry config virtualenvs.create false

WORKDIR /work
EXPOSE 8080