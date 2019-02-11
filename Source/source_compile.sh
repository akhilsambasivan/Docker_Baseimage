#/bin/bash

#Pen Installation
cd /Source/
tar xzf pen-0.18.0.tar.gz
cd pen-0.18.0
./configure --prefix=/usr/local
make && make install

#DB Installation for OpenLDAP
cd /Source/
tar xzf db-4.7.25.tar.gz
cd /Source/db-4.7.25/build_unix/
../dist/configure --prefix=/usr/local
make && make install

#Run ldconfig command
ldconfig

#OpenLDAP Installation
cd /Source/
tar xzf openldap-2.4.35.gz
export CPPFLAGS="-I/usr/local/include"
export LDFLAGS="-L/usr/local/lib"
cd openldap-2.4.35
./configure --prefix=/usr/local
make && make install

#Libtool Installation
cd /Source/
tar xzf libtool-2.4.6.tar.gz
cd libtool-2.4.6
./configure --prefix=/usr/local
make && make install

#Autoconf Installation
cd /Source/
tar xf autoconf-2.69.tar.xz
cd autoconf-2.69
./configure --prefix=/usr/local
make && make install

#PCRE Installation
cd /Source/
unzip pcre-8.33.zip
cd pcre-8.33
./configure --prefix=/usr/local
make && make install

#Texinfo Installation
cd /Source/
tar xzf texinfo-6.4.tar.gz
cd texinfo-6.4
./configure --prefix=/usr/local
make && make install

#Help2man Installation
cd /Source/
tar xf help2man-1.47.5.tar.xz
cd help2man-1.47.5
./configure --prefix=/usr/local
make && make install

#Httpd-2.4.37 Installation
cd /Source/
bzip2 -d httpd-2.4.37.tar.bz2
tar xf httpd-2.4.37.tar

#Apr-1.6.5 Installation
cd /Source/
bzip2 -d apr-1.6.5.tar.bz2
tar xf apr-1.6.5.tar

#Apr-util-1.6.1 Installation
cd /Source/
bzip2 -d apr-util-1.6.1.tar.bz2
tar xf apr-util-1.6.1.tar

#Copy Apr Apr-util Package inside Apache Installation dir
cp -r /Source/apr-1.6.5 /Source/httpd-2.4.37/srclib/apr
cp -r /Source/apr-util-1.6.1 /Source/httpd-2.4.37/srclib/apr-util

#Compile Apr package
cd /Source/httpd-2.4.37/srclib/apr/
./configure --prefix=/usr/local
make && make install

#Configure Apr-util package
cd /Source/httpd-2.4.37/srclib/apr-util
./configure --prefix=/usr/local --with-ldap --with-apr=/usr/local --with-ldap-include=/usr/local/include --with-ldap-lib=/usr/local/lib
make && make install

#Configure Apache package
cd /Source/httpd-2.4.37
./configure  --prefix=/usr/local  --enable-dav=shared  --enable-dav  --with-pcre=/usr/local --enable-ldap --enable-authnz-ldap --disable-userdir --with-apr-util=/usr/local --with-apr=/usr/local --enable-so  --enable-rewrite --enable-cgi --enable-ssl --enable-modules=all --enable-mods-shared=all --with-ldap --with-mpm=prefork --with-included-apr --with-ldap-include=/usr/local/include  --with-ldap-lib=/usr/local/lib
make && make install
