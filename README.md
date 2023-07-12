# dbt-spark-demo

Use GitHub Codespaces

Or

Local setup steps:
1. Install requirements (Linux)
2. Deploy spark server
3. Run dagster web ui

## Requirement

Debian

```sh
apt-get update
# For thrift
apt-get -y install gcc libsasl2-modules libsasl2-dev libsasl2-modules-gssapi-heimdal
```

## Spark Server

services

- minio
- spark thrift server (STS)


```sh
docker-compose up -d
```

## Dagster + DBT

```sh
cd my-dagster-project
pip install -e ".[dev]"
dagster dev
```

Open Web UI: http://127.0.0.1:3000
