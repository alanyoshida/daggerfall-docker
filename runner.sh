#!/bin/bash

# State management, first install them update them run
if [ -f install ]; then
  rm -rf install
  touch update
  /usr/bin/dosbox -conf /home/developer/.dosbox/dosbox-install.conf
elif [ -f update ]; then
  rm -rf update
  /usr/bin/dosbox -conf /home/developer/.dosbox/dosbox-update.conf
else
  /usr/bin/dosbox -conf /home/developer/.dosbox/dosbox-run.conf
fi
