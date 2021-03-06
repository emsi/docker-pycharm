FROM debian

RUN apt-get update && apt-get install --no-install-recommends -y \
  python python-dev python-setuptools python-pip \
  python3 python3-dev python3-setuptools python3-pip \
  gcc git openssh-client vim \
  libxtst-dev libxext-dev libxrender-dev libfreetype6-dev \
  libfontconfig1 \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /opt/pycharm
WORKDIR /opt/pycharm

ARG pycharm_source=https://download-cf.jetbrains.com/python/pycharm-professional-2018.2.3.tar.gz
ADD $pycharm_source /opt/pycharm/installer.tgz

RUN tar --strip-components=1 -xzf installer.tgz && rm installer.tgz

RUN /usr/bin/python2 /opt/pycharm/helpers/pydev/setup_cython.py build_ext --inplace
RUN /usr/bin/python3 /opt/pycharm/helpers/pydev/setup_cython.py build_ext --inplace

RUN useradd -ms /bin/bash developer
USER developer
ENV HOME /home/developer

ARG pycharm_pro_local_dir=.PyCharm2018.2
RUN mkdir /home/developer/.PyCharm \
  && ln -sf /home/developer/.PyCharm /home/developer/$pycharm_pro_local_dir


# Set shell to bash
ENV SHELL /bin/bash

# Set locale
ENV LANG "C.UTF-8"
ENV LC_COLLATE "C.UTF-8"


CMD [ "/opt/pycharm/bin/pycharm.sh" ]

