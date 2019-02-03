FROM centos:7 
 
ENV ANSIBLE_VERSION 2.4.2.0

ENV BUILD_PACKAGES \
  bash \
  curl \
  tar \
  openssh-clients.x86_64 \
  sshpass \
  epel-release \
  git \
  python \
  python-boto \
  python-dateutil \
  python-httplib2 \
  python-jinja2 \
  python-paramiko \
  python-yaml \
  ca-certificates

RUN set -x && \
    \
    echo "==> Adding build-dependencies..."  && \
    yum -y install \
      gcc \
      musl-dev \
      libffi-dev \
      openssl-dev \
      python-dev && \
    \
    echo "==> Upgrading yum and system..."  && \
    yum -y update && yum -y upgrade && \
    \
    echo "==> Adding Python runtime..."  && \
    yum install -y ${BUILD_PACKAGES} && \
    yum install -y python2-pip.noarch && \
    pip install --upgrade pip && \
    \
    echo "==> Installing Ansible..."  && \
    pip install ansible==${ANSIBLE_VERSION} && \
    \
    echo "==> Cleaning up..."  && \
    yum remove -y build-dependencies && \
    rm -rf /var/cache/yum/* && \
    \
    echo "==> Adding hosts for convenience..."  && \
    mkdir -p /etc/ansible /ansible && \
    echo "[local]" >> /etc/ansible/hosts && \
    echo "localhost" >> /etc/ansible/hosts
 
ENV ANSIBLE_GATHERING smart
ENV ANSIBLE_HOST_KEY_CHECKING false
ENV ANSIBLE_RETRY_FILES_ENABLED false
ENV ANSIBLE_ROLES_PATH /ansible/playbooks/roles
ENV ANSIBLE_SSH_PIPELINING True
ENV PYTHONPATH /ansible/lib
ENV PATH /ansible/bin:$PATH
ENV ANSIBLE_LIBRARY /ansible/library
 
WORKDIR /ansible/playbooks
 
ENTRYPOINT ["ansible-playbook"]
