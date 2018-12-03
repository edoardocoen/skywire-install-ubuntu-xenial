#!/bin/sh

echo "GO installation and configuration"

cd ~
curl -L https://dl.google.com/go/go1.10.2.linux-arm64.tar.gz -o go1.10.2.linux-arm64.tar.gz 
cd /usr/local/
tar xzvf /root/go1.10.2.linux-arm64.tar.gz
rm /root/go1.10.2.linux-arm64.tar.gz
ln -s /usr/local/go/bin/go /usr/local/bin/go
ln -s /usr/local/go/bin/godoc /usr/local/bin/godoc
ln -s /usr/local/go/bin/gofmt /usr/local/bin/gofmt
mkdir -p $HOME/go
mkdir -p $HOME/go/bin
mkdir -p $HOME/go/src
mkdir -p $HOME/go/pkg
cd ~
echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
echo 'export GOPATH=$HOME/go' >> ~/.bashrc
echo 'export GOBIN=$GOPATH/bin' >> ~/.bashrc
echo 'export PATH=$PATH:$GOBIN' >> ~/.bashrc
. ~/.bashrc

echo "GO succesfully installed!"

echo "Skywire installation"

mkdir -p $GOPATH/src/github.com/skycoin
cd $GOPATH/src/github.com/skycoin
git clone https://github.com/skycoin/skywire.git
cd $GOPATH/src/github.com/skycoin/skywire/cmd
go install ./...

echo "Skywire succesfully installed!"

echo "Installing services"

sh /services.sh
