#!/bin/sh
# author: amoblin <amoblin@gmail.com>
# file name: start_proxy.sh
# description: TODO
# create date: 2014-12-18 11:14:42
# This file is created from $MARBOO_HOME/media/starts/default.sh
# 本文件由 $MARBOO_HOME/media/starts/default.sh　复制而来

ssh -NL 0.0.0.0:3124:localhost:3123 123.123.123.123&
