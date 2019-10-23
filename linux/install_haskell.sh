#!/bin/bash

GIT_URL=https://raw.githubusercontent.com/thxan/config/master

curl -sSL https://get.haskellstack.org/ | sh

HASKELL_URL=$GIT_URL/common/haskell/stack/config.yaml
HASKELL_CONFIG=~/.stack/config.yaml
HASKELL_CONFIG_BAK=/.stack/config.yaml.bak

# 使用备份的文件加后缀到当前文件
if [ ! -f "$SOURCE_CONFIG_BAK" ]; then
    cp $HASKELL_CONFIG $HASKELL_CONFIG_BAK
fi

curl $HASKELL_URL >$HASKELL_CONFIG

stack ghci
