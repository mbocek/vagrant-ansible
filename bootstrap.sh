#!/usr/bin/env bash
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://$(dig +short dockerip):2376"
export DOCKER_CERT_PATH=~/host-machine/.docker/machine/machines/default/
