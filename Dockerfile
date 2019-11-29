FROM ubuntu:18.04

WORKDIR /home/developer

# INSTALL dosbox
RUN apt update
RUN apt install -y sudo x11-apps wget unzip dosbox

# CONFIG APP
COPY runner.sh /home/developer/runner.sh
COPY dosbox-install.conf /home/developer/.dosbox/dosbox-install.conf
COPY dosbox-update.conf /home/developer/.dosbox/dosbox-update.conf
COPY dosbox-run.conf /home/developer/.dosbox/dosbox-run.conf

RUN chmod +x /home/developer/runner.sh

RUN wget https://cdnstatic.bethsoft.com/elderscrolls.com/assets/files/tes/extras/DFInstall.zip
RUN unzip DFInstall.zip

RUN touch /home/developer/install && chmod -R 777 /home/developer

CMD ["/home/developer/runner.sh"]