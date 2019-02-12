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

#gsoap Installation
cd /Source/
unzip gsoap_2.8.2.zip
cd /Source/gsoap-2.8/
./configure  --prefix=/usr/local
make && make install

cd gsoap/mod_gsoap/mod_gsoap-0.6/apache_20/
/usr/local/bin/apxs -a -i -c -I/usr/local/include mod_gsoap.c

#mod_fastcgi Installation
cd /Source/
tar xzf mod_fastcgi-current.tar.gz
cd /Source/mod_fastcgi-2.4.6
patch -p1 < byte-compile-against-apache24.diff
cp Makefile.AP2 Makefile
make top_dir=/usr/local && make top_dir=/usr/local install

#Fastcgi Installation
cd /Source
cp fastcgi.conf /usr/local/conf/extra/
tar xzf fcgi.tar.gz
cd fcgi-2.4.1-SNAP-0311112127
./configure --prefix=/usr/local
make && make install

#Protobuf Installation
cd /Source
tar xzf protobuf-3.0.0.tar.gz
cd protobuf-3.0.0
./autogen.sh
./configure  --prefix=/usr/local
make && make install
	
#Confuse Installation
cd /Source
tar xzf confuse-2.7.tar.gz
cd confuse-2.7
./configure  --prefix=/usr/local
make && make install

#Python Installation
cd /Source
tar xf Python-2.7.5.tar.xz
cd Python-2.7.5
./configure  --prefix=/usr/local
make && make install

export PY_PREFIX=/usr/local/

#Boost 1_48 Installation 
cd /Source
tar xzf boost_1_48_0.tar.gz
cd boost_1_48_0
sh bootstrap.sh --prefix=/usr/local
./b2 --prefix=/usr/local
./bjam install

#Boost 1_65 Installation
cd /Source
tar xzf boost_1_65_1.tar.gz
cd boost_1_65_1
sh bootstrap.sh --prefix=/usr/local
./b2 --prefix=/usr/local
./bjam install
	
#Boost 1_64 Installation
cd /Source
tar xzf boost_1_64_0.tar.gz
cd boost_1_64_0
sh bootstrap.sh --prefix=/usr/local
./b2 --prefix=/usr/local
./bjam install

#Thrift Installation
cd /Source
tar xzf thrift-0.8.0.tar.gz
cd thrift-0.8.0
./configure  --prefix=/usr/local --with-python --with-boost=/usr/local
make && make install

#Cmake Installation
cd /Source
tar xzf cmake-3.2.1.tar.gz
cd cmake-3.2.1
./configure  --prefix=/usr/local
make && make install

#Libuv Installation
cd /Source
unzip libuv-1.x.zip
cd libuv-1.x
./autogen.sh
./configure --prefix=/usr/local
make && make install

#cpp-driver Installation
cd /Source
tar xzf cpp-driver-2.2.2.tar.gz
cd cpp-driver-2.2.2
cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr/local .
make && make install

#Libavrocpp Installation ; boost 1.64 dependenant
cd /Source
tar xzf avro-cpp-1.8.2.tar.gz
cd avro-cpp-1.8.2
mkdir build
cd build
cmake ../ -G "Unix Makefiles" -DBOOST_INCLUDEDIR=/usr/local/include -DBOOST_ROOT=/usr/local
#sed -i 's/CMAKE_INSTALL_PREFIX:PATH=\/usr\/local/CMAKE_INSTALL_PREFIX:PATH=\/data1\/apps-install/g' CMakeCache.txt
make 
make install 
	 	
#librd-KAFKA Installation
cd /Source
unzip librdkafka-master.zip
cd librdkafka-master/
./configure --prefix=/usr/local
make
make install

#cpprestsdk-2.9.0 Installation
cd /Source
tar xzf cpprestsdk-2.9.0.tar.gz
cd cpprestsdk-2.9.0
mkdir Release/build.release
export CC=/usr/bin/gcc
export CXX=/usr/bin/g++
cd /Source/cpprestsdk-2.9.0/Release/build.release
cmake ../ -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local -DWERROR=OFF
make
make install

#GRPC Installation
cd /Source
tar xzf grpc-1.1.0-pre1.tar.gz
tar xzf protobuf-3.0.0.tar.gz
mv protobuf-3.0.0 protobuf
cp -r protobuf grpc-1.1.0-pre1/third_party/

#Installing protobuf as its required by grpc
cd /Source/grpc-1.1.0-pre1/third_party/protobuf
sh autogen.sh
cd ../../
sed -i "s/CPPFLAGS_opt = -O2/CPPFLAGS_opt = -O0/g" Makefile
cd /Source/grpc-1.1.0-pre1/third_party/protobuf
./configure --prefix=/usr/local
make
make install 
cd ../../
make prefix=/usr/local
make install prefix=/usr/local

#hdf5 Installation
cd /Source
tar xzf hdf5-1.10.1.tar.gz
cd hdf5-1.10.1
./configure --prefix=/usr/local --enable-fortran --enable-cxx --enable-java --enable-shared --enable-static --with-szlib=/usr/local/include --with-zlib
make
make install

#szip Installation
cd /Source
tar xzf szip-2.1.1.tar.gz
cd szip-2.1.1
./configure --prefix=/usr/local
make
make install

#Installing libopc-43456.zip
cd /Source
mkdir libopc
cp -r libopc-43456.zip libopc
cd libopc
unzip libopc-43456.zip
rm -f  libopc-43456.zip
chmod -R 777 ../libopc/*

#Installing zlib as its required by libopc
cd /Source/libopc/third_party/zlib-1.2.5/
./configure --prefix=/usr/local
make
make install

#Installing libxml as its required by libopc
cd /Source/libopc/third_party/libxml2-2.7.7
./configure --prefix=/usr/local  --enable-shared --with-zlib=/usr/local
make
make install

#Installing plib as its required by libopc
cd /Source/libopc/plib
./configure --prefix=/usr/local

cd /Source/libopc/
./configure --with-zlib=yes --with-zlib-ldflags=/usr/local/lib/libz.so --with-libxml=yes --with-libxml-cppflags="-I/usr/local/include/libxml2" --with-libxml-ldflags=/usr/local/lib/libxml2.so
make DESTDIR=//usr/local
make DESTDIR=//usr/local install

echo "INSTALLATION COMPLETED"
