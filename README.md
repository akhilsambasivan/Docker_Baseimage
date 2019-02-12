# Docker_Baseimage : CentOS 7

Creating Docker base image [CentOS 7] with custom library's source compiled with the help of Ansible YAML code. At no point of time, no rules were added to use a Dockerfile. The image is fully built with Ansible and its docker modules alone.

## During this image creation, we have used 3 different scripts which serves purpose in 
- yum installation of libs
- rpm installation of libs
- Custom source compilation script

which are:
- https://github.com/akhilsambasivan/Docker_Baseimage/blob/master/Source/yum_install.sh
- https://github.com/akhilsambasivan/Docker_Baseimage/blob/master/Source/rpm_install.sh
- https://github.com/akhilsambasivan/Docker_Baseimage/blob/master/Source/source_compile.sh

respectively.
