# Docker_Baseimage : CentOS 7

This Docker base image is in CentOS 7 with custom library's source compiled with the help of Ansible YAML code. At no point of time, no rules were added to use a Dockerfile. The image is fully built with passing arguments through Ansible and its docker modules.

## Image and Container details:
- Image Size: 470 MB

## Details of ansible docker modules:
 - https://docs.ansible.com/ansible/latest/plugins/connection/docker.html?highlight=docker
 - https://docs.ansible.com/ansible/latest/modules/docker_container_module.html?highlight=docker
 - https://docs.ansible.com/ansible/latest/modules/docker_image_module.html?highlight=docker
 - https://docs.ansible.com/ansible/latest/modules/docker_image_facts_module.html?highlight=docker
 - https://docs.ansible.com/ansible/latest/modules/docker_login_module.html?highlight=docker
 - https://docs.ansible.com/ansible/latest/modules/docker_network_module.html?highlight=docker
 - https://docs.ansible.com/ansible/latest/modules/docker_secret_module.html?highlight=docker
 - https://docs.ansible.com/ansible/latest/modules/docker_service_module.html?highlight=docker
 - https://docs.ansible.com/ansible/latest/modules/docker_swarm_service_module.html?highlight=docker
 - https://docs.ansible.com/ansible/latest/modules/docker_volume_module.html?highlight=docker


## During this image creation, we have used 3 different scripts which serves purpose for:
 - yum installation of libs
   
 - rpm installation of libs
   
 - Custom source compilation script

which are:
- https://github.com/akhilsambasivan/Docker_Baseimage/blob/master/Source/yum_install.sh
- https://github.com/akhilsambasivan/Docker_Baseimage/blob/master/Source/rpm_install.sh
- https://github.com/akhilsambasivan/Docker_Baseimage/blob/master/Source/source_compile.sh

respectively.

If required, by using additional Ansible docker modules, the new image can be pushed to a repository.

## Final image with the custom compiled modules available at the below dockerhub repository:
- https://hub.docker.com/r/akhilsambasivan/docker_baseimage

## Prerequisites for this build (on host that executes module)
- python >= 2.6 or higher
- docker-py >= 1.10.0 or higher
- The docker server >= 1.9.0 or higher

## PIP install docker-compose module will help to install the supported Ansible docker modules correctly on the host machine which executes the modules:
- sudo pip install --trusted-host pypi.python.org --trusted-host pypi.org --trusted-host files.pythonhosted.org docker-compose
