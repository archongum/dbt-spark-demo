#!/bin/sh
pip install black

apt-get update
apt-get -y install gcc libsasl2-modules libsasl2-dev libsasl2-modules-gssapi-heimdal

docker-compose up -d

cd my-dagster-project
pip install -e ".[dev]"
