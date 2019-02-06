#/bin/bash

#Pen Installation
cd /Source/
tar xzf pen-0.18.0.tar.gz
cd pen-0.18.0
./configure --prefix=/usr/local && make && make install

sleep 5

#DB Installation for OpenLDAP
cd /Source/
tar xzf db-4.7.25.tar.gz
cd /Source/db-4.7.25/build_unix/
../dist/configure --prefix=/usr/local
make && make install

sleep 5

#OpenLDAP Installation
cd /Source/
tar xzf openldap-2.4.35.gz
export CPPFLAGS="-I/usr/include"
export LDFLAGS="-L/usr/lib"
cd openldap-2.4.35
./configure --prefix=/usr/local && make && make install
