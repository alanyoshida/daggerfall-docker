FROM ubuntu:18.04

ARG uid
ARG gid

RUN if [ -z "$uid" ]; then echo -e "\n\033[0;31mERROR argument uid not passed\033[0m\n"; exit 1; fi
RUN if [ -z "$gid" ]; then echo -e "\n\033[0;31mERROR argument gid not passed\033[0m\n"; exit 1; fi

# INSTALL dosbox
RUN apt update
RUN apt install -y sudo x11-apps wget unzip dosbox

# CONFIG APP
COPY runner.sh /home/developer/runner.sh
COPY dosbox-install.conf /home/developer/.dosbox/dosbox-install.conf
COPY dosbox-update.conf /home/developer/.dosbox/dosbox-update.conf
COPY dosbox-run.conf /home/developer/.dosbox/dosbox-run.conf

RUN chmod +x /home/developer/runner.sh

# PERMISSIONS
RUN mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer
USER developer
ENV HOME /home/developer
WORKDIR /home/developer


RUN wget https://cdnstatic.bethsoft.com/elderscrolls.com/assets/files/tes/extras/DFInstall.zip
RUN unzip DFInstall.zip

RUN touch /home/developer/install

CMD ["/home/developer/runner.sh"]