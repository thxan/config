#!/bin/bash

GIT_URL=https://gitee.com/thxan/config/raw/master/

# ssh path
SOURCE_URL=$GIT_URL/linux/apt/sources.list.18
SOURCE_LIST=/etc/apt/sources.list
SOURCE_LIST_BAK=/etc/apt/sources.list.bak
# 使用备份的文件加后缀到当前文件
if [ ! -f "$SOURCE_LIST_BAK" ]; then
    cp $SOURCE_LIST $SOURCE_LIST_BAK
fi

curl $SOURCE_URL >$SOURCE_LIST

apt update

apt -y upgrade

apt install -y openssh-server

apt install -y vim

apt install -y git

# ssh path
SSHD_URL=$GIT_URL/common/ssh-server/sshd_config
SSHD=/etc/ssh/sshd_config
SSHD_BAK=/etc/ssh/sshd_config.bak

# 使用备份的文件加后缀到当前文件
if [ ! -f "$SSHD_BAK" ]; then
    cp $SSHD $SSHD_BAK
fi

cat $SSHD_BAK >$SSHD
curl $SSHD_URL >>$SSHD

service ssh start

