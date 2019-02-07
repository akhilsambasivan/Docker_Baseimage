#/bin/bash

#Pen-0.18.0 Installation
cd /Source/
tar xzf pen-0.18.0.tar.gz
cd pen-0.18.0
./configure --prefix=/usr/local && make && make install

#DB-4.7.25 Installation for OpenLDAP
cd /Source/
tar xzf db-4.7.25.tar.gz
cd /Source/db-4.7.25/build_unix/
../dist/configure --prefix=/usr/local
make && make install

#ldconfig to load libs
ldconfig

#OpenLDAP-2.4.35 Installation
cd /Source/
tar xzf openldap-2.4.35.gz
export CPPFLAGS="-I/usr/local/include"
export LDFLAGS="-L/usr/local/lib"
cd /Source/openldap-2.4.35
./configure --prefix=/usr/local 
make && make install

#Libtool 2.4.6 Installation
cd /Source/
tar xzf libtool-2.4.6.tar.gz
cd /Source/libtool-2.4.6/
./configure --prefix=/usr/local
make && make install

#Autoconf-2.69 Installation
cd /Source/
tar xf autoconf-2.69.tar.xz
cd /Source/autoconf-2.69/
./configure --prefix=/usr/local
make && make install

#Automake-1.15 Installation
cd /Source/
tar xzf automake-1.15.tar.gz
cd /Source/automake-1.15/
./configure --prefix=/usr/local
make && make install

#Pcre-8.33 Installation
cd /Source/
unzip pcre-8.33.zip
cd /Source/pcre-8.33/
./configure --prefix=/usr/local
make && make install

#Perl-5.24.0 Installation
cd /Source/
tar xzf perl-5.24.0.tar.gz
cd /Source/perl-5.24.0
./Configure -des -Dprefix=/usr
make && make install

#Texinfo-6.4 Installation
#cd /Source/
#tar xzf texinfo-6.4.tar.gz
#cd /Source/texinfo-6.4/
#./configure --prefix=/usr/local --disable-static PERL=/usr/bin/perl
#./configure --prefix=/usr/local PERL=/usr/bin/perl
#make TEXMF=/usr/local/share/texmf  install-tex
#make && make install

#Help2man-1.47.5 Installation
cd /Source/
tar xf help2man-1.47.5.tar.xz
cd /Source/help2man-1.47.5/
./configure --prefix=/usr/local
make && make install

#Httpd-2.4.37 Installation
cd /Source/
bzip2 -d httpd-2.4.37.tar.bz2
tar xf httpd-2.4.37.tar.bz2

#Apr-1.6.5 Installation
cd /Source/
bzip2 -d apr-1.6.5.tar.bz2
tar xf apr-1.6.5.tar.bz2

#Apr-util-1.6.1 Installation
cd /Source/
bzip2 -d apr-util-1.6.1.tar.bz2
tar xf apr-util-1.6.1.tar.bz2 

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
