# skywire-install-ubuntu-xenial
easy script to install skywire on ubuntu xenial

# How to install:
login as root user and than type:
```
cd /root
wget https://raw.githubusercontent.com/edoardocoen/skywire-install-ubuntu-xenial/master/services.sh
wget https://raw.githubusercontent.com/edoardocoen/skywire-install-ubuntu-xenial/master/install.sh
sh install.sh
```

# Services:
Follow the instruction for installing the serveces. When it asks, if you are installing into the manager node type "y", remember this node IP address. For the others nodes type "n". Type the manager IP when it asks. If you install services wrong (wrong manager IP inserted, or installed manager service inside a not-manager node) just type the following code to reinstall them correctly:
```
sh install.sh
```
