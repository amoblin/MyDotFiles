#!/bin/sh
# author: amoblin <amoblin@gmail.com>
# file name: prepare-commit-msg.sh
# create date: 2014-06-13 08:25:40
# This file is created from $MARBOO_HOME/media/starts/default.sh
# 本文件由 $MARBOO_HOME/media/starts/default.sh　复制而来

name="Marboo"
infoFile=`pwd`/${name}/${name}-Info.plist
version=`defaults read ${infoFile} CFBundleShortVersionString`
revision=`defaults read ${infoFile} CFBundleVersion`
APP_INFO=v${version}\(r${revision}\)
# echo "$APP_INFO" >> "$1"
(echo "\n${APP_INFO}"; cat "$1") > file.new
mv file.new "$1"
