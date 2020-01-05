#!/bin/bash
curl -LO https://dl.google.com/go/go1.13.5.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.13.5.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
mkdir /root/go
export GOPATH=/root/go
export GOBIN=/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin
go env GOPATH

#curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

mkdir -p $GOPATH/src/github.com/keycloak/keycloak-operator
cd $GOPATH/src/github.com/keycloak
git clone https://github.com/keycloak/keycloak-operator.git
cd keycloak-operator
make setup/mod
make setup/operator-sdk
make code/compile