# Docker_Baseimage : CentOS 7

Creating Docker base image [CentOS 7] with custom library's source compiled with the help of Ansible YAML code. At no point of time, no rules were added to use a Dockerfile. The image is fully built with Ansible and its docker modules alone.

Details of ansible docker modules used:
==
https://docs.ansible.com/ansible/latest/plugins/connection/docker.html?highlight=docker
https://docs.ansible.com/ansible/latest/modules/docker_container_module.html?highlight=docker
https://docs.ansible.com/ansible/latest/modules/docker_image_module.html?highlight=docker
https://docs.ansible.com/ansible/latest/modules/docker_image_facts_module.html?highlight=docker
https://docs.ansible.com/ansible/latest/modules/docker_login_module.html?highlight=docker
https://docs.ansible.com/ansible/latest/modules/docker_network_module.html?highlight=docker
https://docs.ansible.com/ansible/latest/modules/docker_secret_module.html?highlight=docker
https://docs.ansible.com/ansible/latest/modules/docker_service_module.html?highlight=docker
https://docs.ansible.com/ansible/latest/modules/docker_swarm_service_module.html?highlight=docker
https://docs.ansible.com/ansible/latest/modules/docker_volume_module.html?highlight=docker
==

During this image creation, we have used 3 different scripts which serves purpose in 
- yum installation of libs
- rpm installation of libs
- Custom source compilation script

which are:
- https://github.com/akhilsambasivan/Docker_Baseimage/blob/master/Source/yum_install.sh
- https://github.com/akhilsambasivan/Docker_Baseimage/blob/master/Source/rpm_install.sh
- https://github.com/akhilsambasivan/Docker_Baseimage/blob/master/Source/source_compile.sh

respectively.
