#!/bin/sh
# author: amoblin <amoblin@gmail.com>
# file name: start_proxy.sh
# description: TODO
# create date: 2014-12-18 11:14:42
# This file is created from $MARBOO_HOME/media/starts/default.sh
# 本文件由 $MARBOO_HOME/media/starts/default.sh　复制而来

autossh -M 50000 -f -NR 3123:localhost:3000 123.123.123.123
