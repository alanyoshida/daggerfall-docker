#!/bin/bash

if [ -z "$uid" ]; then echo -e "\n\033[0;31mERROR argument uid not passed\033[0m\n"; exit 1; fi
if [ -z "$gid" ]; then echo -e "\n\033[0;31mERROR argument gid not passed\033[0m\n"; exit 1; fi

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
