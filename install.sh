#!/bin/bash
curl -LO https://dl.google.com/go/go1.13.5.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.13.5.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
mkdir /root/go
export GOPATH=/root/go
export GOBIN=/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin
export GO111MODULE=on
go env GOPATH

#curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

mkdir -p /root/src
cd /root/src
git clone https://github.com/agilesolutions/keycloak-operator.git
cd keycloak-operator
make setup/mod
make setup/operator-sdk
make code/gen
