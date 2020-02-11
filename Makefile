#!/usr/bin/env make -f
# -*- coding: utf-8 -*-
# File Name: Makefile
# Author: amoblin <amoblin@gmail.com>
# Created Time: 2020-02-11 Tue 07:37

.PHONY: *

start:
	launchctl load -w ~/Library/LaunchAgents/Emacs.plist

stop:
	launchctl unload -w ~/Library/LaunchAgents/Emacs.plist

restart:
	make stop
	make start
