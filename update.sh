#!/bin/bash
TMP_FOLDER=$(mktemp -d)
CONFIG_FILE='allmn.conf'
CONFIGFOLDER='/root/.allmn/'
COIN_DAEMON='/usr/local/bin/allmnd'
COIN_CLI='/usr/local/bin/allmn-cli'
COIN_REPO='https://github.com/All-Mn/AllMNv2/releases/download/v2.0.2.3/AllMN-Daemon.Ubuntu.v2.0.2.3.tar.gz'
COIN_NAME='allmn'
COIN_PORT=20500
RPC_PORT=30600


NODEIP=$(curl -s4 icanhazip.com)


RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

function stop_node() {
  systemctl stop $COIN_NAME.service
  allmn-cli stop
}

function compile_node() {
  echo -e "Prepare to download $COIN_NAME"
  cd $TMP_FOLDER
  wget -q $COIN_REPO
  COIN_ZIP=$(echo $COIN_REPO | awk -F'/' '{print $NF}')
  tar xvzf $COIN_ZIP >/dev/null 2>&1
  cp allmn* /usr/local/bin
  strip $COIN_DAEMON $COIN_CLI
  cd - >/dev/null 2>&1
  rm -rf $TMP_FOLDER >/dev/null 2>&1
  systemctl start $COIN_NAME.service
  clear
}


##### Main #####
clear

stop_node
compile_node
