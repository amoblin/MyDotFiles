#!/bin/sh
# author: amoblin <amoblin@gmail.com>
# file name: pre-commit.sh
# create date: 2014-06-13 08:25:44
# This file is created from $MARBOO_HOME/media/starts/default.sh
# 本文件由 $MARBOO_HOME/media/starts/default.sh　复制而来

name="Marboo"
infoFile=`pwd`/${name}/${name}-Info.plist
revision=`git log --pretty=oneline | wc -l`
revision=$[ ${revision} + 1 ]
defaults write ${infoFile} CFBundleVersion ${revision}
git add -u
